#!/usr/bin/env sh

echo "[start] Test file mode ..."

chmod -x $phingWithComposer

./phing.sh -logger phing.listener.DefaultLogger >> $traceLogFile 2>> $errorLogFile

if [ ! -x $phingWithComposer ]
then
    exitOnFail "Unable to use $phingWithComposer without executable mode"
fi

echo "[end] OK"
