#!/bin/sh

echo "[start] Test installing and downloading Phing ..."

if [ -s $phingWithPhar ]
then
    exitOnFail "Unable to test if $phingWithPhar is already here."
fi

if [ -s $phingWithComposer ]
then
    exitOnFail "Unable to test if $phingWithComposer is already here."
fi

touch $phingWithPhar

if [ ! -f $phingWithPhar ]
then
    exitOnFail "Unable to create empty $phingWithPhar file."
fi

mkdir $(dirname $phingWithComposer)
touch $phingWithComposer

if [ ! -f $phingWithComposer ]
then
    exitOnFail "Unable to create empty $phingWithComposer file."
fi

sh phing.sh -logger phing.listener.DefaultLogger composer.install >> $traceLogFile 2>> $errorLogFile

if [ ! -s $phingWithPhar ]
then
    exitOnFail "Unable to get $phingWithPhar on curl download."
fi

if [ ! -s $phingWithComposer ]
then
    exitOnFail "Unable to get $phingWithComposer on Composer."
fi

sh phing.sh -logger phing.listener.DefaultLogger composer.install >> $traceLogFile 2>> $errorLogFile

if [ -f $phingWithPhar ]
then
    exitOnFail "Unable to remove $phingWithPhar after getting $phingWithComposer."
fi

echo "[end] OK"
