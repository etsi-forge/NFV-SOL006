#!/bin/bash

echo "Testing"

set -e

source /opt/confd/confdrc
cd src

CONFD_OPTS="--fail-on-warnings"
CONFD_OPTS=""

echo "Testing compilations of pkg."
confdc -c $CONFD_OPTS -o /opt/confd/etc/confd/etsi-nfv-vnfd.fxs etsi-nfv-vnfd.yang
echo "Testing compilations of descriptors."
confdc -c $CONFD_OPTS -o /opt/confd/etc/confd/etsi-nfv-descriptors.fxs etsi-nfv-descriptors.yang

echo "Starting ConfD"
confd

echo "Loading Data for pkg"
confd_load -l -m nfv-vnfd.xml

echo "Loading Data for descriptors"
confd_load -l -m nfv.xml


# Don't do this in the actual test, just waste of cycles
# echo "Stopping ConfD"
# confd --stop
