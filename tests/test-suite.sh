#!/bin/sh

# log message
logFile=$(dirname $0)/trace.log
if [ -f $logFile ]
then
    rm $logFile
fi

exitOnFail() {
    echo "[failed] the log trace is shown below"
    cat $logFile
    exit 1
}

# paths
phingWithComposer=./bin/phing
phingWithPhar=./phing.phar

echo "Launch test suite:"

. $(dirname $0)/phing-launcher/test-install.sh

exit 0
