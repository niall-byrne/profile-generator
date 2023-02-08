#!/bin/bash

# .github/scripts/apply.sh
# Applies a profile to a CI machine with Mac Maker.

# RELEASE_VERSION:   The Version of Mac Maker to use.
# PLATFORM_VERSION:  The platform to use (ie. x86_64)
# OS_VERSION:        The Mac OS version to use (ie. 10.15)

# CI only script.

# shellcheck disable=SC2129

set -eo pipefail

RELEASE_URL="https://github.com/${USERNAME}/mac_maker/releases/download/${RELEASE_VERSION}/mac_maker_${OS_VERSION}_${PLATFORM_VERSION}_${RELEASE_VERSION}.tar.gz"
RELEASE_FOLDER="mac_maker_${OS_VERSION}_${PLATFORM_VERSION}_${RELEASE_VERSION}"

apply() {

  ANSIBLE_BECOME_PASSWORD="not needed"
  USER="$(id -un)"
  HOME="/Users/${USER}"

  pushd "${RELEASE_FOLDER}" || exit 127
    export ANSIBLE_BECOME_PASSWORD USER HOME
    ./mac_maker apply github "https://github.com/${USERNAME}/${TEMPLATED_NAME}"
  popd

}

fetch() {

  echo "Downloading: ${RELEASE_URL}"
  curl -L "${RELEASE_URL}" > binary.tar.gz
  tar xvzf binary.tar.gz

}

main() {

  fetch
  apply

}

main
