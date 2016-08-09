#!/usr/bin/env sh

touch $phingWithPhar

if [ ! -f $phingWithPhar ]
then
    exitOnFail "Unable to create empty $phingWithPhar file."
fi

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

runPhingLauncher composer.install

if [ -f $phingWithPhar ]
then
    exitOnFail "Unable to remove $phingWithPhar after getting $phingWithComposer."
fi
