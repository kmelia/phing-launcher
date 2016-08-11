#!/usr/bin/env sh

touch $phingWithPhar

if [ ! -f $phingWithPhar ]
then
    exitOnFail "Unable to create $phingWithPhar file."
fi

runPhingLauncher

if [ ! -s $phingWithPhar ]
then
    exitOnFail "Unable to reset $phingWithPhar with empty existing file."
fi

echo 'bad phar content' > $phingWithPhar
runPhingLauncher

if [ ! -s $phingWithPhar ]
then
    exitOnFail "Unable to reset $phingWithPhar with bad phar content existing file."
fi

echo '<?php PHP invalid content' > $phingWithPhar
runPhingLauncher

if [ ! -s $phingWithPhar ]
then
    exitOnFail "Unable to reset $phingWithPhar with PHP invalid content existing file."
fi

if ! head -1 $phingWithPhar | grep php > /dev/null
then
    exitOnFail "Unable to get a valid PHP header."
fi

if ! php $phingWithPhar > /dev/null
then
    exitOnFail "Unable to get a valid PHP phar."
fi
