#!/bin/sh

phing=./bin/phing
temporaryPhing=./phing.phar

if [ ! -f $phing ]
then
    if [ ! -f $temporaryPhing ]
    then
        echo ">> download phing.phar from origin"
        curl http://www.phing.info/get/phing-latest.phar > $temporaryPhing
    fi
    
    echo ">> use $temporaryPhing instead of $phing"
    phing="php $temporaryPhing"
    
elif [ -f $temporaryPhing ]
then
    echo ">> remove $temporaryPhing, phing already exists in $phing"
    rm $temporaryPhing
fi

exec $phing "$@"
