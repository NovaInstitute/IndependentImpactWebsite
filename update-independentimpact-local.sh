#!/usr/bin/env bash
# update-independentimpact-local.sh
# Sync the local repo, build the Hugo site and serve it on localhost.
# Designed for macOS (or other Unix-like dev machines).

set -euo pipefail

log() { printf "[%s] %s\n" "$(date -u +'%Y-%m-%dT%H:%M:%SZ')" "$*"; }

need() {
  command -v "$1" >/dev/null 2>&1 || { echo "Missing required command: $1" >&2; exit 1; }
}

abort_if_dirty() {
  if ! git -C "$REPO_DIR" diff --quiet || ! git -C "$REPO_DIR" diff --cached --quiet; then
    echo "Working tree has uncommitted changes. Commit/stash before updating or export ALLOW_DIRTY=true." >&2
    exit 1
  fi
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="${REPO_DIR:-$SCRIPT_DIR}"
BRANCH="${BRANCH:-main}"
HUGO_ENVIRONMENT="${HUGO_ENVIRONMENT:-development}"
RUN_MINIFY="${RUN_MINIFY:-false}"
ALLOW_DIRTY="${ALLOW_DIRTY:-false}"
RUN_SERVER="${RUN_SERVER:-true}"
SERVER_PORT="${SERVER_PORT:-1313}"
HTTP_SERVER_BIND="${HTTP_SERVER_BIND:-127.0.0.1}"

need git
need hugo
need npm
need npx

log "Repository directory: $REPO_DIR"
[[ -d "$REPO_DIR/.git" ]] || { echo "Not a git repository: $REPO_DIR" >&2; exit 1; }

if [[ "$ALLOW_DIRTY" != "true" ]]; then
  abort_if_dirty
fi

log "Fetching latest changes"
git -C "$REPO_DIR" fetch --prune --tags
CURRENT_BRANCH="$(git -C "$REPO_DIR" rev-parse --abbrev-ref HEAD)"
if [[ "$CURRENT_BRANCH" != "$BRANCH" ]]; then
  log "Checking out branch $BRANCH (was $CURRENT_BRANCH)"
  git -C "$REPO_DIR" checkout "$BRANCH"
fi
git -C "$REPO_DIR" pull --rebase --autostash --stat

if [[ -f "$REPO_DIR/.gitmodules" ]]; then
  log "Updating submodules"
  git -C "$REPO_DIR" submodule update --init --recursive --jobs 4
  git -C "$REPO_DIR" submodule foreach --recursive 'git fetch --all || true'
fi

log "Installing Node dependencies (npm install)"
(cd "$REPO_DIR" && npm install --no-audit --no-fund)

log "Building Tailwind CSS assets"
TAILWIND_ARGS=( -i assets/css/main.css -o static/css/style.css )
[[ "$RUN_MINIFY" == "true" ]] && TAILWIND_ARGS+=( --minify )
(cd "$REPO_DIR" && npx tailwindcss "${TAILWIND_ARGS[@]}")

log "Building Hugo site"
HUGO_ARGS=( )
[[ "$RUN_MINIFY" == "true" ]] && HUGO_ARGS+=( --minify )
if ((${#HUGO_ARGS[@]})); then
  (cd "$REPO_DIR" && HUGO_ENV="$HUGO_ENVIRONMENT" hugo "${HUGO_ARGS[@]}")
else
  (cd "$REPO_DIR" && HUGO_ENV="$HUGO_ENVIRONMENT" hugo)
fi

[[ -s "$REPO_DIR/public/index.html" ]] || { echo "Build missing public/index.html" >&2; exit 1; }

if [[ "$RUN_SERVER" == "true" ]]; then
  log "Starting Hugo server at http://$HTTP_SERVER_BIND:$SERVER_PORT"
  log "Press Ctrl+C to stop."

  HUGO_SERVER_ARGS=( server --bind "$HTTP_SERVER_BIND" --port "$SERVER_PORT" )
  HUGO_SERVER_ARGS+=( --baseURL "http://$HTTP_SERVER_BIND:$SERVER_PORT/" )
  HUGO_SERVER_ARGS+=( --renderStaticToDisk )
  [[ "$RUN_MINIFY" == "true" ]] && HUGO_SERVER_ARGS+=( --minify )

  (cd "$REPO_DIR" && HUGO_ENV="$HUGO_ENVIRONMENT" hugo "${HUGO_SERVER_ARGS[@]}")
else
  log "Skipping local server (RUN_SERVER=false)."
fi
