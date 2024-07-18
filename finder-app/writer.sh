#!/bin/bash
#
# Writes a string to a text file.
#
# Args:
#   $1: Path to a directory on the filesystem.
#   $2: Text string which will be searched within these files.

set -euo pipefail

main() {
  if [ "$#" -ne 2 ]; then
    echo "ERROR: Incorrect number of arguments" 1>&2
    exit 1
  fi

  local writefile
  local writestr
  writefile="${1}"
  writestr="${2}"

  if ! mkdir -p "$(dirname ${writefile})"; then
    echo "ERROR: Failed to create a directory for a file '${writefile}'" 1>&2
    exit 1
  fi

  if ! echo "${writestr}" > "${writefile}"; then
    echo "ERROR: Failed to write a string '${writestr}' to a file '${writefile}'" 1>&2
    exit 1
  fi
}

main "$@"
