#!/usr/bin/env bash
# update-independentimpact.sh
# Pull latest Hugo site and atomically deploy to web root.
# Source:  /var/www/IndependentImpactWebsite
# Target:  /var/www/independentimpact.org

set -euo pipefail

##### CONFIG ##########################################################
SRC_DIR="/var/www/IndependentImpactWebsite"
DEST_DIR="/var/www/independentimpact.org"
BRANCH="main"                 # change if your default branch differs
HUGO_ENVIRONMENT="production" # use "development" for test builds
RUN_MINIFY="false"            # set "true" to pass --minify
OWNER="root"
GROUP="www-data"
SET_SELINUX_CONTEXT="false"   # set true on SELinux systems (CentOS/RHEL)
NGINX_RELOAD="false"          # set true if you want to reload after deploy
APACHE_RELOAD="false"         # set true if you want to reload after deploy
#######################################################################

log() { printf "[%s] %s\n" "$(date -u +'%Y-%m-%dT%H:%M:%SZ')" "$*"; }

need() {
  command -v "$1" >/dev/null 2>&1 || { echo "Missing required command: $1" >&2; exit 1; }
}

abort_if_dirty() {
  if ! git -C "$SRC_DIR" diff --quiet || ! git -C "$SRC_DIR" diff --cached --quiet; then
    echo "Working tree has uncommitted changes. Commit/stash before deploying." >&2
    exit 1
  fi
}

main() {
  need git
  need hugo
  need rsync

  [[ -d "$SRC_DIR/.git" ]] || { echo "Not a git repo: $SRC_DIR" >&2; exit 1; }
  [[ -d "$DEST_DIR" ]] || { sudo mkdir -p "$DEST_DIR"; }

  log "Updating repository in $SRC_DIR"
  abort_if_dirty
  git -C "$SRC_DIR" fetch --prune --tags
  # Ensure the correct branch; remove the checkout if you always stay on one branch
  CURRENT_BRANCH="$(git -C "$SRC_DIR" rev-parse --abbrev-ref HEAD)"
  if [[ "$CURRENT_BRANCH" != "$BRANCH" ]]; then
    log "Checking out branch $BRANCH (was $CURRENT_BRANCH)"
    git -C "$SRC_DIR" checkout "$BRANCH"
  fi
  git -C "$SRC_DIR" pull --rebase --autostash --stat

  # Submodules (if your theme or assets are submodules)
  if [[ -f "$SRC_DIR/.gitmodules" ]]; then
    log "Updating submodules"
    git -C "$SRC_DIR" submodule update --init --recursive --jobs 4
    git -C "$SRC_DIR" submodule foreach --recursive 'git fetch --all || true'
  fi

  # If you use PostCSS/Sass via Node, install in a controlled way.
  if [[ -f "$SRC_DIR/package.json" ]]; then
    need npm
    log "Installing Node dependencies (npm ci)"
    (cd "$SRC_DIR" && npm ci --no-audit --no-fund)
  fi

  # Build to a temp dir (atomic)
  BUILD_DIR="$(mktemp -d /tmp/hugo-build-XXXXXX)"
  trap 'rm -rf "$BUILD_DIR"' EXIT

  log "Building site with Hugo (env=$HUGO_ENVIRONMENT)"
  HUGO_ARGS=( --cleanDestinationDir -d "$BUILD_DIR" )
  [[ "$RUN_MINIFY" == "true" ]] && HUGO_ARGS+=( --minify )

  (cd "$SRC_DIR" && HUGO_ENV="$HUGO_ENVIRONMENT" hugo "${HUGO_ARGS[@]}")

  # Quick sanity: index.html must exist
  [[ -s "$BUILD_DIR/index.html" ]] || { echo "Build missing index.html" >&2; exit 1; }

  # Deploy with safe perms: read-only to web server (no group write)
  # D2755: dirs rwx for owner, r-x for group, setgid bit so group stays consistent
  # F0644: files rw for owner, r for group
  log "Deploying to $DEST_DIR (rsync)"
  sudo rsync -a --delete \
    --chown="${OWNER}:${GROUP}" \
    --chmod=D2755,F0644 \
    "$BUILD_DIR"/ "$DEST_DIR"/

  # Optionally restore SELinux context
  if [[ "$SET_SELINUX_CONTEXT" == "true" ]]; then
    log "Restoring SELinux context"
    sudo restorecon -R "$DEST_DIR" || true
  fi

  # Optional: reload web server if you changed its config elsewhere
  if [[ "$NGINX_RELOAD" == "true" ]]; then
    log "Reloading nginx"
    sudo nginx -t && sudo systemctl reload nginx
  fi
  if [[ "$APACHE_RELOAD" == "true" ]]; then
    log "Reloading apache"
    sudo apachectl configtest && sudo systemctl reload apache2
  fi

  # Lightweight health checks (local filesystem + optional HTTP)
  log "Post-deploy check"
  find "$DEST_DIR" -maxdepth 1 -type f -name "index.html" -print -quit >/dev/null || {
    echo "No index.html at web root" >&2; exit 1;
  }

  if command -v curl >/dev/null 2>&1; then
    # Replace with your public domain when testing externally
    curl -fsS -I http://localhost/ >/dev/null && log "HTTP 200 from localhost" || \
      log "HTTP check skipped/failed (web server may be bound to another host)"
  fi

  log "Done."
}

main "$@"

