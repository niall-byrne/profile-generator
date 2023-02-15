#!/bin/bash

# .github/scripts/poetry.sh
# Centralized management of poetry installs.

# CI only script

set -eo pipefail

main () {

  pip install poetry

}

main "$@"
