Phing Launcher
==============
[![Build Status](https://travis-ci.org/kmelia/phing-launcher.svg)](https://travis-ci.org/kmelia/phing-launcher)

**Provides a [launcher][1] to run [Phing][2] without Phing.** 

Because we want:

- to get and run [composer.phar][3] with a Phing command,
- to install [Phing][2] dependency with Composer.

I explain the magic trick:

- if the Composer shortcut does not exist, the launcher download the latest Phing phar binary,
- and when the Composer shortcut is created, the launcher will remove the phar binary.

The Composer shortcut can be [specified by your configuration][8] or it defaults ``./vendor/bin/phing``. 

Getting started
---------------
**1.** Modify your ``composer.json`` file, to require Phing by [Composer][3]:

- add ``phing/phing`` dependency to the ``require`` section,
```json
"require": {
    "phing/phing": "2.*"
}
```
- set the ``bin-dir`` directory to the ``config`` section, if you have to.
```json
"config": {
    "bin-dir": "path/to/bin/directory"
}
```

**2.** Download the [Phing Launcher script][4] into your project (near ``composer.json``).
```bash
curl -sS -O https://bitbucket.org/kmelia/phing-launcher/raw/master/phing.sh
```

**3.** Run the Phing Launcher script instead of Phing.
```bash
./phing.sh
```

Get the classics
----------------

You can try the several configurations available into the [``phing/``][5] directory, like:

- ``phing/composer.xml`` provides the complete usage of [Composer][3] (including the download),
- ``phing/phpunit.xml`` provides a usage of PHPunit,
- ``phing/symfony.xml`` provides a usage of [Symfony][6] console.

Run the following command to download the classics configurations and the [``build.xml``][7] example file on your project:
```bash
./phing.sh get-the-classics
```

  [1]: https://bitbucket.org/kmelia/phing-launcher
  [2]: http://www.phing.info/
  [3]: https://getcomposer.org/
  [4]: https://bitbucket.org/kmelia/phing-launcher/raw/master/phing.sh
  [5]: https://bitbucket.org/kmelia/phing-launcher/raw/master/phing/
  [6]: https://bitbucket.org/kmelia/fresh-symfony
  [7]: https://bitbucket.org/kmelia/phing-launcher/src/master/build.xml
  [8]: https://getcomposer.org/doc/articles/vendor-binaries.md#can-vendor-binaries-be-installed-somewhere-other-than-vendor-bin-
