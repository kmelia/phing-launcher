#!/bin/sh

phing=./bin/phing
temporaryPhing=./phing.phar

# if file not exists or file has not a size greater than zero.
if [ ! -s $phing ]
then
    if [ -e $phing ]
    then
        echo ">> remove invalid file $phing (size equals zero)"
        rm $phing
    fi
    
    if [ ! -s $temporaryPhing ]
    then
        echo ">> download $temporaryPhing from origin"
        curl -sS -o $temporaryPhing http://www.phing.info/get/phing-latest.phar
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
