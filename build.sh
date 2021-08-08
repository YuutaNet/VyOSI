#!/bin/sh
set -x
cd vyos-build
docker run \
	--rm \
	-t \
	--privileged \
	-v $(pwd):/vyos \
	-w /vyos \
	vyos/vyos-build:current \
	bash -c "./configure --build-by ci@yuuta.network --build-type release --architecture amd64; sudo make iso"
