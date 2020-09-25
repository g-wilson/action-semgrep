#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] ; then
  cd "${GITHUB_WORKSPACE}/." || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

semgrep --config="${INPUT_SEMGREP_CONFIG}" --json ${INPUT_SEMGREP_TARGET} \
  | jq -r '.results[] | "\(.extra.severity[0:1]):\(.path):\(.start.line) \(.extra.message)"' \
  | reviewdog \
      -efm="%t:%f:%l %m" \
      -name="${INPUT_TOOL_NAME}" \
      -reporter="${INPUT_REPORTER:-github-pr-check}" \
      -filter-mode="${INPUT_FILTER_MODE}" \
      -fail-on-error="${INPUT_FAIL_ON_ERROR}" \
      -level="${INPUT_LEVEL}" \
      ${INPUT_REVIEWDOG_FLAGS}
