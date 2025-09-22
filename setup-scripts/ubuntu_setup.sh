#!/usr/bin/env bash
#
# Standard Ubuntu setup script for Independent Impact development environments.
# This script installs core system dependencies, Hugo Extended, and Node.js tooling
# required to build the site.
set -euo pipefail

if [[ $(id -u) -ne 0 ]]; then
  echo "Please run this script with sudo or as root." >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get upgrade -y

# Core utilities
apt-get install -y \
  build-essential \
  curl \
  git \
  unzip \
  ca-certificates \
  apt-transport-https \
  software-properties-common

# Install Node.js 18 LTS from NodeSource
if ! command -v node >/dev/null 2>&1 || [[ $(node --version | cut -d. -f1 | tr -d 'v') -lt 18 ]]; then
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
  apt-get install -y nodejs
fi

# Install Hugo Extended
HUGO_VERSION="0.124.1"
if ! command -v hugo >/dev/null 2>&1 || [[ $(hugo version 2>/dev/null | awk '{print $5}' | tr -d 'v') != "${HUGO_VERSION}" ]]; then
  TMP_DIR=$(mktemp -d)
  pushd "${TMP_DIR}" >/dev/null
  curl -fsSLO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
  tar -xzf "hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz"
  install -m 0755 hugo /usr/local/bin/hugo
  popd >/dev/null
  rm -rf "${TMP_DIR}"
fi

# Confirm versions
node --version
npm --version
hugo version

cat <<EOT
Ubuntu setup complete. You can now run:
  npm install
  npm start
from the repository root to develop the Independent Impact site.
EOT
