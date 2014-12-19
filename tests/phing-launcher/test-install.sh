#!/bin/sh

echo "[start] Test installing and downloading Phing ..."

if [ -f $phingWithPhar ]
then
    echo "Unable to test if $phingWithPhar is already here."
    exitOnFail
fi

if [ -f $phingWithComposer ]
then
    echo "Unable to test if $phingWithComposer is already here."
    exitOnFail
fi

sh phing.sh -logger phing.listener.DefaultLogger composer.install 2>&1 >> $logFile

if [ ! -f $phingWithPhar ]
then
    echo "Unable to get $phingWithPhar on curl download."
    exitOnFail
fi

if [ ! -f $phingWithComposer ]
then
    echo "Unable to get $phingWithComposer on Composer."
    exitOnFail
fi

sh phing.sh -logger phing.listener.DefaultLogger composer.install 2>&1 >> $logFile

if [ -f $phingWithPhar ]
then
    echo "Unable to remove $phingWithPhar after getting $phingWithComposer."
    exitOnFail
fi

echo "[end] OK"
