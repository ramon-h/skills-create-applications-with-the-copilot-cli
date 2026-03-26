#!/bin/bash
# post_issue_comment.sh
# Posts a markdown file as a note (comment) on a GitLab issue.
#
# Usage: post_issue_comment.sh <issue_iid> <markdown_file>
#
# Environment variables used:
#   GITLAB_TOKEN    - Token with api scope
#   CI_PROJECT_ID   - GitLab project ID (set automatically in CI)
#   CI_PROJECT_PATH - e.g. mygroup/myproject (set automatically in CI)
#   GITLAB_USER_LOGIN - The actor login (set automatically in CI)

set -euo pipefail

ISSUE_IID="${1:?Usage: post_issue_comment.sh <issue_iid> <markdown_file>}"
MD_FILE="${2:?Usage: post_issue_comment.sh <issue_iid> <markdown_file>}"
API_URL="${CI_API_V4_URL:-https://gitlab.com/api/v4}"

if [ ! -f "${MD_FILE}" ]; then
  echo "ERROR: Markdown file not found: ${MD_FILE}"
  exit 1
fi

# Substitute template variables in the markdown content
CONTENT=$(cat "${MD_FILE}" \
  | sed "s|{{login}}|${GITLAB_USER_LOGIN:-gitlab-user}|g" \
  | sed "s|{{full_repo_name}}|${CI_PROJECT_PATH}|g" \
  | sed "s|GITLAB_PROJECT_PATH|${CI_PROJECT_PATH}|g")

# Post the note via GitLab Issues API
HTTP_STATUS=$(curl -sf -o /dev/null -w "%{http_code}" \
  --request POST \
  --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
  --header "Content-Type: application/json" \
  --data "$(jq -n --arg body "${CONTENT}" '{"body": $body}')" \
  "${API_URL}/projects/${CI_PROJECT_ID}/issues/${ISSUE_IID}/notes")

echo "Posted comment to issue #${ISSUE_IID} (HTTP ${HTTP_STATUS})"
