#!/bin/sh

set -xeo pipefail

rm *.zip

if [[ "$VERSION" = "" ]]; then
    BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
    TAG_BRANCH=${BRANCH_NAME//\//-}
    TAG_DATE=$(date '+%Y%m%d-%H%M%S')
    VERSION="${TAG_BRANCH}-${TAG_DATE}"
fi

zip $VERSION appspec.yml server start.sh

aws s3 cp $VERSION.zip s3://go-simple-server-deployment