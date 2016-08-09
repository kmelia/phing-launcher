#!/usr/bin/env sh

runPhingLauncher composer.install

export COMPOSER_BIN_DIR=$vendorComposer/composer/my_bin-directory

runPhingLauncher

if [ -f $phingWithPhar ]
then
    exitOnFail "Unable to set a valid directory from COMPOSER_BIN_DIR."
fi

export COMPOSER_BIN_DIR=$vendorComposer/invalid_environment_bin-directory

runPhingLauncher

if [ ! -f $phingWithPhar ]
then
    exitOnFail "Unable to detect an invalid directory from COMPOSER_BIN_DIR."
fi
