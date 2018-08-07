#!/bin/bash
#
# Copyright (c) ETSI 2018
# Realeased under the ETSI Software License
#
# https://forge.etsi.org/etsi-software-license

YANG_MODULES="yang/yang/*"
OUTPUT="etsi-nfv.html"
IMG_NAME="nfv-sol6"
VERSION=1.0
IMG="$IMG_NAME:$VERSION"

docker build --tag "$IMG" .
docker run "$IMG" "/bin/sh" -c "pyang -f jstree $YANG_MODULES" > "$OUTPUT"

exit $([ -f "$OUTPUT" ])

