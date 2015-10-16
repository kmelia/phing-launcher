#!/bin/sh

echo "[start] Test file mode ..."

chmod -x $phingWithComposer

sh phing.sh -logger phing.listener.DefaultLogger >> $traceLogFile 2>> $errorLogFile

if [ ! -x $phingWithComposer ]
then
    echo "Unable to use $phingWithComposer without executable mode"
    exitOnFail
fi

echo "[end] OK"
