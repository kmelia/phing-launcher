#!/usr/bin/env sh

runPhingLauncher composer.install

chmod -x $phingWithComposer

if [ -x $phingWithComposer ]
then
    exitOnFail "Unable to unset executable mode on $phingWithComposer."
fi

runPhingLauncher

if [ ! -x $phingWithComposer ]
then
    exitOnFail "Unable to set executable mode on $phingWithComposer."
fi
