#!/bin/bash
# check_keyphrase.sh
# Checks whether a file contains a given keyphrase (case-insensitive).
#
# Usage: check_keyphrase.sh <file> <keyphrase>
# Exits 0 if found, 1 if not found.

set -euo pipefail

FILE="${1:?Usage: check_keyphrase.sh <file> <keyphrase>}"
KEYPHRASE="${2:?Usage: check_keyphrase.sh <file> <keyphrase>}"

if [ ! -f "${FILE}" ]; then
  echo "ERROR: File not found: ${FILE}"
  exit 1
fi

if grep -qi "${KEYPHRASE}" "${FILE}"; then
  echo "✅ Found keyphrase '${KEYPHRASE}' in ${FILE}"
  exit 0
else
  echo "❌ Keyphrase '${KEYPHRASE}' not found in ${FILE}"
  exit 1
fi
