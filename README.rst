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
* mutt

git
~~~

You must add a file $HOME/.gituser.conf which contain your authentification:

.. code-block:: linux-config

   [USER]
        name=Toto
        email=toto@mail.com

.. note:: require git >= 1.7.11

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

mutt
~~~~

You must add $HOME/.mutt/mutt.identity which contains your mail authentification:

.. code-block:: linux-config

        set from = "toto@mail.com"
        set realname = "toto"
        set imap_user = "user"
        set imap_pass = "password"
        set smtp_url = "smtp://user@smtp.mail.com:587/"
        set smtp_pass = "password"
        set folder = "imaps://imap.mail.com:993"

