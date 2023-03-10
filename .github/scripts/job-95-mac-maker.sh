#!/bin/bash

# .github/scripts/job-95-mac-maker.sh
# Applies a profile to a CI machine with Mac Maker.

# ARCHITECTURE:       The architecture to use (ie. x86_64)
# MAC_MAKER_VERSION:  The Version of Mac Maker to use.
# OS_VERSION:         The Mac OS version to use (ie. 10.15)
# USER_NAME:          The project's owner in GitHub.

# CI only script.

set -eo pipefail

RELEASE_URL="https://github.com/${USER_NAME}/mac_maker/releases/download/v${MAC_MAKER_VERSION}/mac_maker_${OS_VERSION}_${ARCHITECTURE}_v${MAC_MAKER_VERSION}.tar.gz"
RELEASE_FOLDER="mac_maker_${OS_VERSION}_${ARCHITECTURE}_v${MAC_MAKER_VERSION}"

apply() {

  ANSIBLE_BECOME_PASSWORD="not needed"
  USER="$(id -un)"
  HOME="/Users/${USER}"

  export ANSIBLE_BECOME_PASSWORD USER HOME
  ./mac_maker apply github "https://github.com/${USER_NAME}/${TEMPLATED_NAME}"

}

fetch() {

  echo "Downloading: ${RELEASE_URL}"
  curl -L "${RELEASE_URL}" > binary.tar.gz
  tar xvzf binary.tar.gz
  mv "${RELEASE_FOLDER}/mac_maker" .

}

main() {

  fetch "$@"
  apply "$@"

}

main "$@"
