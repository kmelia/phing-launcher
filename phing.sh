#!/usr/bin/env sh

# configuration
phing=./vendor/bin/phing
temporaryPhing=./phing.phar
repositoryUrl=https://bitbucket.org/kmelia/phing-launcher
configurationDirectory=phing
phingLauncher=phing.sh

# read the "bin-dir" configuration setting in composer.json
composerBinDirectoryJson=$(cat composer.json | sed 's/[" ]//g' | grep "config:" -A2 | grep "bin-dir:" | cut -d":" -f2)
if [ ! -z "$composerBinDirectoryJson" ]
then
    composerBinDirectory=./$composerBinDirectoryJson
fi

# read the COMPOSER_BIN_DIR environment variable
if [ ! -z "$COMPOSER_BIN_DIR" ]
then
    composerBinDirectory=./$COMPOSER_BIN_DIR
fi

if [ -d "$composerBinDirectory" ]
then
    echo ">> using composer bin directory: $composerBinDirectory instead of $(dirname $phing)"
    phing=$composerBinDirectory/$(basename $phing)
fi

# if file does not exists or file has not a size greater than zero.
if [ ! -s $phing ]
then
    if [ -e $phing ]
    then
        echo ">> removing invalid file $phing (size equals zero)"
        rm $phing
    fi
    
    if [ ! -s $temporaryPhing ]
    then
        echo ">> downloading $temporaryPhing from origin"
        curl -sS -o $temporaryPhing http://www.phing.info/get/phing-latest.phar
        if [ ! -f $temporaryPhing ]
        then
            echo "[error] Unable to download the file."
            exit 1
        fi
    fi
    
    echo ">> using $temporaryPhing instead of $phing"
    phing="php $temporaryPhing"
else
    if [ ! -x $phing ]
    then
        echo ">> adding executable mode to $phing"
        chmod +x $phing
    fi
    
    if [ -f $temporaryPhing ]
    then
        echo ">> removing $temporaryPhing, phing already exists in $phing"
        rm $temporaryPhing
    fi
fi

showTheHelpAndExit() {
    echo ">> enjoy Phing!"
    echo
    echo ">> see the help below:"
    echo
    
    exec $phing
}

if [ "$1" = "get-the-classics" -o "$1" = "gtc" ]
then
    echo ">> getting the classics of Phing Launcher from the repository $repositoryUrl"
    
    if [ ! -d $configurationDirectory ]
    then
        mkdir $configurationDirectory
    fi
    
    curl -sS -O $repositoryUrl/raw/master/build.xml \
        && cd $configurationDirectory \
        && curl -sS -O $repositoryUrl/raw/master/$configurationDirectory/composer.xml \
        && curl -sS -O $repositoryUrl/raw/master/$configurationDirectory/phing.xml \
        && curl -sS -O $repositoryUrl/raw/master/$configurationDirectory/phpunit.xml \
        && curl -sS -O $repositoryUrl/raw/master/$configurationDirectory/symfony.xml \
        && cd - > /dev/null
    
    showTheHelpAndExit
fi

if [ "$1" = "self-update" -o "$1" = "selfupdate" -o "$1" = "su" ]
then
    echo ">> updating the Phing Launcher script from the repository $repositoryUrl"
    
    curl -sS -O $repositoryUrl/raw/master/$phingLauncher
    
    showTheHelpAndExit
fi

exec $phing "$@"
