#!/bin/bash

# .github/scripts/template.sh
# Perform automated templating.

# 1: Git Username
# 2: Git Email

# CI only script.

set -eo pipefail

NAME=${1:-"Pro Buddy Dev"}
EMAIL=${2:-"somedude@coolstartup.com"}

main() {

  git config --global user.name "${NAME}"
  git config --global user.email "${EMAIL}"
  echo -e '\n\n\n\n\n\n' | cookiecutter template/

}

main "$@"
