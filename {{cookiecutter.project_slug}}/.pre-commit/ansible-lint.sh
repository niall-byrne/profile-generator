#!/bin/bash

# scripts/pre-commit/ansible-lint.sh
# Runs ansible-galaxy to install/update the dependencies if needed, and then runs ansible-lint on profile changes.

# pre-commit script.

set -eo pipefail

main () {

  # shellcheck source=./.pre-commit/.poetry-compatible.sh
  source "$(dirname -- "${BASH_SOURCE[0]}")/.poetry-compatible.sh"

  pushd profile

    if ! git diff --exit-code HEAD -- requirements.yml; then
      run_command ansible-galaxy install --timeout 90 -r requirements.yml
    fi

    run_command ansible-lint

  popd

}

main "$@"
