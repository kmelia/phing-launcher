#!/bin/sh

phing=./bin/phing
temporaryPhing=./phing.phar
arguments="$@"

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

if [ "$1" = "get-the-classics" -o "$1" = "gtc" ]
then
    # configuration
    repositoryUrl=https://bitbucket.org/kmelia/phing-launcher
    configurationDirectory=phing

    echo ">> getting the classics of Phing Launcher from the repository $repositoryUrl"
    
    if [ ! -d $configurationDirectory ]
    then
        mkdir $configurationDirectory
    fi
    
    curl -sS -O $repositoryUrl/raw/master/build.xml \
        && cd $configurationDirectory \
        && curl -sS -O $repositoryUrl/raw/master/$configurationDirectory/composer.xml \
        && curl -sS -O $repositoryUrl/raw/master/$configurationDirectory/phing-launcher.xml \
        && curl -sS -O $repositoryUrl/raw/master/$configurationDirectory/phpunit.xml \
        && cd - > /dev/null
    
    echo ">> enjoy Phing!"
    echo 
    echo ">> see the help below:"
    echo
    
    arguments=""
fi

exec $phing $arguments
