#!/bin/bash

initialize_git() {
  git init
  git checkout -b master
  git stage .
  git commit -m "build(COOKIECUTTER): initial generation"
  git symbolic-ref HEAD refs/heads/master
  git tag 0.0.0
  git checkout -b production
  git checkout master
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
  sed -i.bak 's/ansible-workbench\//https:\/\/github.com\/Shared-Vision-Solutions\/ansible-workbench.git/' .cookiecutter/cookiecutter.json
  rm .cookiecutter/cookiecutter.json.bak
}

main() {
  update_template_values
  initialize_git
  initialize_poetry
  initialize_precommit
}

main
