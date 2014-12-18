#!/bin/sh

phing=./bin/phing
temporaryPhing=./phing.phar

if [ ! -f $phing ]
then
    if [ ! -f $temporaryPhing ]
    then
        echo ">> download $temporaryPhing from origin"
        curl -o $temporaryPhing http://www.phing.info/get/phing-latest.phar
        if [ ! -f $temporaryPhing ]
        then
            echo "[error] Unable to download the file."
            exit 1
        fi
    fi
    
    echo ">> use $temporaryPhing instead of $phing"
    phing="php $temporaryPhing"
    
elif [ -f $temporaryPhing ]
then
    echo ">> remove $temporaryPhing, phing already exists in $phing"
    rm $temporaryPhing
fi

exec $phing "$@"
