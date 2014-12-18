#!/bin/sh

phingWithComposer=./bin/phing
phingWithPhar=./phing.phar

echo "Launch test suite:"

. $(dirname $0)/phing-launcher/test-install.sh

exit 0
