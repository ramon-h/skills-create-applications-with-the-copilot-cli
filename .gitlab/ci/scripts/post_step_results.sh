#!/bin/bash
# post_step_results.sh
# Builds a step-results table comment and posts it to the exercise issue.
# Called after check jobs complete to report pass/fail status.
#
# Usage: post_step_results.sh <issue_iid> <step_number> <check_name_1> <passed_1> [<check_name_2> <passed_2> ...]
#
# Example:
#   post_step_results.sh 3 2 "Issue has Calculator in title" "true" "Issue has body" "false"

set -euo pipefail

ISSUE_IID="${1:?issue_iid required}"
STEP_NUMBER="${2:?step_number required}"
shift 2

API_URL="${CI_API_V4_URL:-https://gitlab.com/api/v4}"

# Build results table in markdown
TABLE="## Step ${STEP_NUMBER} Results\n\n| Check | Status |\n|-------|--------|\n"
ALL_PASSED=true

while [ "$#" -ge 2 ]; do
  CHECK_NAME="$1"
  PASSED="$2"
  shift 2
  if [ "${PASSED}" = "true" ]; then
    STATUS="✅ Passed"
  else
    STATUS="❌ Failed"
    ALL_PASSED=false
  fi
  TABLE="${TABLE}| ${CHECK_NAME} | ${STATUS} |\n"
done

if [ "${ALL_PASSED}" = "true" ]; then
  TABLE="${TABLE}\n🎉 All checks passed! Great work!"
else
  TABLE="${TABLE}\n⚠️ Some checks did not pass. Please review the activity instructions and try again."
fi

# Post the results table as an issue note
curl -sf \
  --request POST \
  --header "PRIVATE-TOKEN: ${GITLAB_TOKEN}" \
  --header "Content-Type: application/json" \
  --data "$(jq -n --arg body "$(printf "${TABLE}")" '{"body": $body}')" \
  "${API_URL}/projects/${CI_PROJECT_ID}/issues/${ISSUE_IID}/notes" > /dev/null

echo "Posted step ${STEP_NUMBER} results to issue #${ISSUE_IID}"

# Exit non-zero if not all passed, so the pipeline stage shows as failed
if [ "${ALL_PASSED}" != "true" ]; then
  exit 1
fi
