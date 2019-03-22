#!/bin/bash

echo "Testing"

set -e

source /opt/confd/confdrc
cd src

echo "Testing compilation"
CONFD_OPTS="--fail-on-warnings"
CONFD_OPTS=""
confdc -c $CONFD_OPTS -o /opt/confd/etc/confd/etsi-nfv-descriptors.fxs etsi-nfv-descriptors.yang

echo "Starting ConfD"
confd

echo "Loading Data"
confd_load -l -m nfv.xml

# Don't do this in the actual test, just waste of cycles
# echo "Stopping ConfD"
# confd --stop
