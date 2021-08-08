#!/bin/sh
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

cd vyos-build
docker run \
	--rm \
	-it \
	--privileged \
	-v $(pwd):/vyos \
	-w /vyos \
	vyos/vyos-build:current \
	bash -c "./configure --build-by ci@yuuta.network --build-type release --architecture amd64; sudo make iso"