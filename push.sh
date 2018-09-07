#!/bin/bash
set -e

cd "$(dirname $0)"

while read dir; do
  docker push andrewajo/vsts-agent:${dir//\//-}
done < <(./dirs.sh)

if [ -n "$(docker images -f reference=andrewajo/vsts-agent:latest -q)" ]; then
  docker push andrewajo/vsts-agent:latest
fi
