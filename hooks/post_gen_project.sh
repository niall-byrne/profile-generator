#!/bin/bash

set -eo pipefail

PROFILE_GENERATOR_BRANCH_NAME_BASE=${PROFILE_GENERATOR_BRANCH_NAME_BASE-"{{ cookiecutter._BRANCH_NAME_BASE }}"}
PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT=${PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT-"{{ cookiecutter._BRANCH_NAME_DEVELOPMENT }}"}

initialize_git() {
  git init
  git checkout -b "${PROFILE_GENERATOR_BRANCH_NAME_BASE}"
  git stage .
  git commit -m "build(COOKIECUTTER): initial generation"
  git symbolic-ref HEAD "refs/heads/${PROFILE_GENERATOR_BRANCH_NAME_BASE}"
  git tag 0.0.0
  git checkout -b "${PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT}"
  mkdir -p files templates
}

initialize_poetry() {
  if [[ "${PROFILE_GENERATOR_SKIP_POETRY}" != "1" ]]; then
    poetry install
  fi
}

initialize_precommit() {
  if [[ "${PROFILE_GENERATOR_SKIP_PRECOMMIT}" != "1" ]]; then
    poetry run pre-commit install -t pre-commit -t commit-msg
    poetry run ansible-galaxy install --timeout 90 -r profile/requirements.yml
  fi
}

update_template_values() {
  # Compatible with Linux and BSD sed
  sed -i.bak 's/profile-generator\//https:\/\/github.com\/osx-provisioner\/profile-generator.git/' .cookiecutter/cookiecutter.json
  rm .cookiecutter/cookiecutter.json.bak
}

main() {
  update_template_values
  initialize_git
  initialize_poetry
  initialize_precommit
}

main
