#!/bin/sh

echo -n " > Test installing and downloading Phing: "

if [ -f $phingWithPhar ]
then
    echo "KO"
    echo "Unable to test if $phingWithPhar is already here."
    exit 1
fi

if [ -f $phingWithComposer ]
then
    echo "KO"
    echo "Unable to test if $phingWithComposer is already here."
    exit 1
fi

$phingLauncher composer.install &> /dev/null

if [ ! -f $phingWithPhar ]
then
    echo "KO"
    echo "Unable to get $phingWithPhar on curl download."
    exit 1
fi

if [ ! -f $phingWithComposer ]
then
    echo "KO"
    echo "Unable to get $phingWithComposer on Composer."
    exit 1
fi

$phingLauncher composer.install > /dev/null

if [ -f $phingWithPhar ]
then
    echo "KO"
    echo "Unable to remove $phingWithPhar after getting $phingWithComposer."
    exit 1
fi

echo "OK"

exit 0
