#!/bin/sh

# log message
traceLogFile=$(dirname $0)/trace.log
errorLogFile=$(dirname $0)/error.log

# paths
phingWithComposer=./bin/phing
phingWithPhar=./phing.phar

cleanupLogFile() {
    if [ -f $traceLogFile ]
    then
        rm $traceLogFile
    fi
    
    if [ -f $errorLogFile ]
    then
        rm $errorLogFile
    fi
}

exitOnFail() {
    if [ -f $traceLogFile ]
    then
        echo "[info] the trace log is shown below"
        cat $traceLogFile
    fi
    
    if [ -f $errorLogFile ]
    then
        echo "[failed] the error log is shown below"
        cat $errorLogFile
    fi
    
    exit 1
}

echo "Launch test suite:"

. $(dirname $0)/phing-launcher/test-install.sh
cleanupLogFile
. $(dirname $0)/phing-launcher/test-file-mode.sh

exit 0
