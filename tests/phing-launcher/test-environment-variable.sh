#!/usr/bin/env sh

echo "[start] Test environment variable ..."

if [ ! -z "$COMPOSER_BIN_DIR" ]
then
    exitOnFail "Unable to test if COMPOSER_BIN_DIR  is already exported."
fi

if [ -s $phingWithPhar ]
then
    exitOnFail "Unable to test if $phingWithPhar is already here."
fi

export COMPOSER_BIN_DIR=invalid_environment_bin-directory

if [ -z "$COMPOSER_BIN_DIR" ]
then
    exitOnFail "Unable to export COMPOSER_BIN_DIR."
fi

./phing.sh -logger phing.listener.DefaultLogger >> $traceLogFile 2>> $errorLogFile

if [ ! -s $phingWithPhar ]
then
    exitOnFail "Unable to get $phingWithPhar on curl download."
fi

echo "[end] OK"
