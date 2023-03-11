#!/bin/bash

# .github/scripts/workflow-setup-environment.sh
# Configures environment variables for GitHub Actions.

# CI only script.

set -eo pipefail

main() {

  PROJECT_NAME="profile-generator"
  PROFILE_GENERATOR_BRANCH_NAME_BASE="master"
  PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT="dev"
  TEMPLATED_NAME="profile-example"
  USER_NAME="osx-provisioner"

  BRANCH_OR_TAG="$(echo "${GITHUB_REF}" | sed 's/refs\/heads\///g' | sed 's/refs\/tags\///g')"
  WORKFLOW_URL="${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}"

  {
    echo "BRANCH_OR_TAG=${BRANCH_OR_TAG}"
    echo "CACHE_TTL=$(date +%d)"
    echo "NOTIFICATION=${PROJECT_NAME} [<${WORKFLOW_URL}|${BRANCH_OR_TAG}>]"
    echo "PROFILE_GENERATOR_BRANCH_NAME_BASE=${PROFILE_GENERATOR_BRANCH_NAME_BASE}"
    echo "PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT=${PROFILE_GENERATOR_BRANCH_NAME_DEVELOPMENT}"
    echo "PROJECT_NAME=${PROJECT_NAME}"
    echo "TEMPLATED_NAME=${TEMPLATED_NAME}"
    echo "USER_NAME=${USER_NAME}"
    echo "WEBHOOK_URL=${WEBHOOK_URL}"
  } >> "$GITHUB_ENV"

}

main "$@"
