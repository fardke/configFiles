Configuration files
===================

You must make link this configuration files and configuration directories in
your home directory.

Supported configuration
-----------------------

* vim
* git
* i3 (status bar with conky)
* Xdefaults (urxvt)
* bashrc

git
~~~

You must add a file $HOME/.gituser.conf which contain your authentification:

.. code-block:: linux-config

   [USER]
        name=Toto
        email=toto@mail.com

i3
~~

You must add file $HOME/.checkMailIdentity.conf which contain your mail
authentification:

.. code-block:: linux-config

   USER=toto
   PASS=password

You must use i3ConfigMerge file at configFiles root to generate appropriate config file
a config.base and config.fix or config.laptop merge.

And each time you want to update i3 config you must modify config.base to update generic
configuration, config.fix to update specific desktop (with 2 monitor) configuration or
config.laptop to update specific laptop configuration.

bashrc
~~~~~~

You can add specifics modification by adding $HOME/.bash_spec file.
