#!/bin/bash
# find_exercise_issue.sh
# Finds the open exercise issue and writes its IID to variables.env for downstream jobs.
# Looks for an issue with the label "education" or whose title contains "Copilot CLI".
# Exports: ISSUE_IID, ISSUE_URL

set -euo pipefail

API_URL="${CI_API_V4_URL:-https://gitlab.com/api/v4}"

# Search open issues; prefer one labelled "education", fall back to first open issue
ISSUE_JSON=$(curl -sf \
  --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
  "${API_URL}/projects/${CI_PROJECT_ID}/issues?state=opened&labels=education&per_page=5")

ISSUE_IID=$(echo "${ISSUE_JSON}" | jq -r '.[0].iid // empty')

# Fallback: search by title keyword if label not found
if [ -z "${ISSUE_IID}" ]; then
  ISSUE_JSON=$(curl -sf \
    --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
    "${API_URL}/projects/${CI_PROJECT_ID}/issues?state=opened&search=Copilot+CLI&in=title&per_page=5")
  ISSUE_IID=$(echo "${ISSUE_JSON}" | jq -r '.[0].iid // empty')
fi

if [ -z "${ISSUE_IID}" ]; then
  echo "ERROR: Could not find the exercise issue. Make sure the exercise was started (Step 0 pipeline ran successfully)."
  exit 1
fi

ISSUE_URL=$(echo "${ISSUE_JSON}" | jq -r '.[0].web_url')
echo "Found exercise issue: #${ISSUE_IID} → ${ISSUE_URL}"

# Export for downstream jobs via dotenv artifact
echo "ISSUE_IID=${ISSUE_IID}" >> variables.env
echo "ISSUE_URL=${ISSUE_URL}" >> variables.env
