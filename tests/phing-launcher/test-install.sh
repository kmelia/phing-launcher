#!/bin/sh

echo "[start] Test installing and downloading Phing ..."

if [ -s $phingWithPhar ]
then
    echo "Unable to test if $phingWithPhar is already here."
    exitOnFail
fi

if [ -s $phingWithComposer ]
then
    echo "Unable to test if $phingWithComposer is already here."
    exitOnFail
fi

touch $phingWithPhar

if [ ! -f $phingWithPhar ]
then
    echo "Unable to create empty $phingWithPhar file."
    exitOnFail
fi

mkdir $(dirname $phingWithComposer)
touch $phingWithComposer

if [ ! -f $phingWithComposer ]
then
    echo "Unable to create empty $phingWithComposer file."
    exitOnFail
fi

sh phing.sh -logger phing.listener.DefaultLogger composer.install 2>&1 >> $logFile

if [ ! -s $phingWithPhar ]
then
    echo "Unable to get $phingWithPhar on curl download."
    exitOnFail
fi

if [ ! -s $phingWithComposer ]
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
