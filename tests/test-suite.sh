#!/usr/bin/env sh

# paths
testsDirectory=$(dirname $0)
vendorComposer=vendor
phingWithComposer=$vendorComposer/composer/my_bin-directory/phing
phingWithPhar=phing.phar

# log message
traceLogFile=$testsDirectory/trace.log
errorLogFile=$testsDirectory/error.log

# get the functions
. $testsDirectory/functions.sh

# testsuites
launchTestSuite install "Installing and downloading Phing"
launchTestSuite invalid-phar-file "Reseting Phing phar"
launchTestSuite file-mode "File mode"
launchTestSuite environment-variable "Environment variables"

exit 0
