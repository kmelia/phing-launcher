#!/usr/bin/env sh

# log message
traceLogFile=$(dirname $0)/trace.log
errorLogFile=$(dirname $0)/error.log

# paths
phingWithComposer=./my_composer_bin-directory/phing
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
    message=$1
    
    echo "[failed] $message"
    echo 
    
    if [ -s $traceLogFile ]
    then
        echo "[stdout] the trace log is shown below:"
        echo "--------------------------------------"
        cat $traceLogFile
        echo 
    fi
    
    if [ -s $errorLogFile ]
    then
        echo "[stderr] the error log is shown below:"
        echo "--------------------------------------"
        cat $errorLogFile
        echo 
    fi
    
    exit 1
}

echo "Launch test suite:"

cleanupLogFile
. $(dirname $0)/phing-launcher/test-install.sh
cleanupLogFile
. $(dirname $0)/phing-launcher/test-file-mode.sh
cleanupLogFile
. $(dirname $0)/phing-launcher/test-environment-variable.sh

exit 0
