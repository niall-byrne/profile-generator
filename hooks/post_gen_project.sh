#!/bin/bash

# hooks/post_gen_project.sh
# Configures the templated profile for use.

# PROFILE_GENERATOR_BRANCH_NAME_BASE:         Optional alternate base branch name.
# PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT:  Optional alternate development branch name.
# PROFILE_GENERATOR_SKIP_GIT_INIT:            Optionally set to 1 to skip creating branches and initial commit.
# PROFILE_GENERATOR_SKIP_POETRY:              Optionally set to 1 to skip installing dependencies.
# PROFILE_GENERATOR_SKIP_PRECOMMIT:           Optionally set to 1 to skip installing pre-commit hooks.

# cookiecutter only script.

set -eo pipefail

PROFILE_GENERATOR_BRANCH_NAME_BASE=${PROFILE_GENERATOR_BRANCH_NAME_BASE-"{{ cookiecutter._BRANCH_NAME_BASE }}"}
PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT=${PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT-"{{ cookiecutter._BRANCH_NAME_DEVELOPMENT }}"}
PROFILE_GENERATOR_TEMPLATE_URL="https://github.com/osx-provisioner/profile-generator.git"

initialize_git() {

  if [[ "${PROFILE_GENERATOR_SKIP_GIT_INIT}" != "1" ]]; then
    git init
    git checkout -b "${PROFILE_GENERATOR_BRANCH_NAME_BASE}"
    git stage .
    git commit -m "build(COOKIECUTTER): initial generation"
    git symbolic-ref HEAD "refs/heads/${PROFILE_GENERATOR_BRANCH_NAME_BASE}"
    git tag 0.0.0
    git checkout -b "${PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT}"
    mkdir -p files templates
  fi

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

  if ! grep "${PROFILE_GENERATOR_TEMPLATE_URL}" .cookiecutter/cookiecutter.json; then
    # sed compatible with Linux and BSD
    sed -i.bak 's,"_template": ".*","_template": "'"${PROFILE_GENERATOR_TEMPLATE_URL}"'",g' .cookiecutter/cookiecutter.json
    rm .cookiecutter/cookiecutter.json.bak
  fi

}

main() {

  update_template_values
  initialize_git
  initialize_poetry
  initialize_precommit

}

main
