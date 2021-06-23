#!/bin/bash

# shellcheck disable=SC2129

set -eo pipefail

RELEASE_URL="https://github.com/${USERNAME}/mac_maker/releases/download/${RELEASE_VERSION}/mac_maker_${OS_VERSION}_${PLATFORM_VERSION}.tar.gz"
RELEASE_FOLDER="mac_maker_${OS_VERSION}_${PLATFORM_VERSION}"

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

  curl -L "${RELEASE_URL}" > binary.tar.gz
  tar xvzf binary.tar.gz

}

main() {

  fetch
  apply

}

main
