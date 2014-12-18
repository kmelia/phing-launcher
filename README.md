Phing Launcher
==============

**Provides a [launcher][1] to run [Phing][2] without Phing.** 

Because we want:

- to get and run [Composer][3] with a Phing command,
- to install [Phing][2] binaries with Composer.

I explain the magic trick:

- if the Composer shortcut ``./bin/phing`` does not exist, the launcher download the latest Phing phar binary,
- and when the Composer shortcut is created, the launcher will remove the phar binary.

Getting started
---------------
**1.** Modify your ``composer.json`` file, to require Phing by [Composer][3] :

- add ``phing/phing`` dependency to the require section,
```json
"require": {
    "phing/phing": "2.*"
}
```
- do not forget to add the bin directory to the configuration section.
```json
"config": {
    "bin-dir": "bin"
}
```

**2.** Download the [Phing Launcher script][4] into your project (near ``composer.json``).
```bash
curl -O https://bitbucket.org/kmelia/phing-launcher/raw/master/phing.sh
```


  [1]: https://bitbucket.org/kmelia/phing-launcher
  [2]: http://www.phing.info/
  [3]: http://getcomposer.org/
  [4]: https://bitbucket.org/kmelia/phing-launcher/raw/master/phing.sh
