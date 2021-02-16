#!/usr/bin/env bash

set -euo pipefail

NAME="$*"

if [ -z "${NAME}" ]; then
  echo "Please enter the name of the new presentation"
  read -r NAME
fi
if [ -z "${NAME}" ]; then
	echo "The name cannot be empty"
	exit 1
fi

FILENAME=$(echo "${NAME}" | sed 's/\([a-z]\)\([A-Z]\)/\1-\2/g'       \
| sed 's/\([A-Z]\{2,\}\)\([A-Z]\)/\1-\2/g' \
| sed 's/ /-/g' \
| tr '[:upper:]' '[:lower:]') 

echo "Creating new presentation"

cp -r template "${FILENAME}"
find "${FILENAME}" -type f -exec sed -i '' "s/Template presentation/${NAME}/g" {} \;
