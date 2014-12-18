#!/bin/sh

phingWithComposer=./bin/phing
phingWithPhar=./phing.phar
phingLauncher=./phing.sh

echo "Launch test suite:"

. $(dirname $0)/phing-launcher/test-install.sh

exit 0
