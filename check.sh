#!/bin/sh

HTTP_URL="http://localhost:${WINDWARD_SERVER_PORT}"

stringContain()
{
  if printf '%s\n' "$1" | grep -Fqe "$2"; then
    return 0
  else
    return 1
  fi
}

echo "Requesting status to ${HTTP_URL}..."
HTTP_RESPONSE=`curl ${HTTP_URL} 2> /dev/null`

if stringContain "${HTTP_RESPONSE}" "${WINDWARD_SERVER_NAME}"; then
  echo "Windward server is running properly."
  exit 0
else
  echo "Windward server response unexpected."
  exit 1
fi