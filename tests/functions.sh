#!/usr/bin/env sh

exitOnFail() {
    message=$1

    echo
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

cleanupLogFile() {
    if [ -f $traceLogFile ]
    then
        rm -f $traceLogFile
    fi

    if [ -f $errorLogFile ]
    then
        rm -f $errorLogFile
    fi
}

cleanupPhing() {
    if [ -f $phingWithPhar ]
    then
        rm -f $phingWithPhar
    fi

    if [ -d $vendorComposer ]
    then
        rm -rf $vendorComposer
    fi
}

launchTestSuite() {
    cleanupLogFile
    cleanupPhing

    printf "[testsuite] $2 ... "
    . $testsDirectory/phing-launcher/test-$1.sh
    echo "OK"

    cleanupLogFile
}

runPhingLauncher() {
    ./phing.sh -logger phing.listener.DefaultLogger $1 >> $traceLogFile 2>> $errorLogFile
}
