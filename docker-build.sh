#!/bin/bash -e

export ARTIFACTS=$CIRCLE_ARTIFACTS || ${PWD}/artifacts

if [ -z "${IMG_NAME}" ]; then
	echo "IMG_NAME not set" 1>&2
	exit 1
fi

docker build -t pi-gen-environment .

docker run \
	--privileged \
	-v ${PWD}:/build \
	-v ${ARTIFACTS}:/artifacts \
	-e IMG_NAME="${IMG_NAME}" \
	-e APT_PROXY="${APT_PROXY}" \
	-e MAX_STAGE="${MAX_STAGE}" \
	pi-gen-environment
