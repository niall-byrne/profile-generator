#!/bin/bash

# .github/scripts/checklist.sh
# Appends a checklist to the changelog content.

# CHANGE_LOG_CONTENT:   The generated changelog content.

# CI only script

set -eo pipefail

main() {

  CHECKLIST_CONTENT=$'\n'
  CHECKLIST_CONTENT+="## Deployment Checklist"$'\n'
  CHECKLIST_CONTENT+="- [ ] Ensure correct version is notated"$'\n'
  CHECKLIST_CONTENT+="- [ ] Ensure documentation is accurate"$'\n'
  CHECKLIST_CONTENT+="- [ ] Ensure git commits are properly formatted"$'\n'
  CHANGE_LOG_CONTENT="${CHANGE_LOG_CONTENT}${CHECKLIST_CONTENT}"

  {
    echo "CHANGE_LOG_CONTENT<<EOF"
    echo "${CHANGE_LOG_CONTENT}"
    echo "EOF"
  } >> "$GITHUB_ENV"

}

main
