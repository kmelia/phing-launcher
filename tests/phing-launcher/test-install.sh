#!/usr/bin/env sh

mkdir -p $(dirname $phingWithComposer)
touch $phingWithComposer

if [ ! -f $phingWithComposer ]
then
    exitOnFail "Unable to create empty $phingWithComposer file."
fi

runPhingLauncher composer.install

if [ ! -s $phingWithPhar ]
then
    exitOnFail "Unable to get $phingWithPhar on curl download."
fi

if [ ! -s $phingWithComposer ]
then
    exitOnFail "Unable to get $phingWithComposer on Composer."
fi

runPhingLauncher

if [ -f $phingWithPhar ]
then
    exitOnFail "Unable to remove $phingWithPhar after getting $phingWithComposer."
fi
