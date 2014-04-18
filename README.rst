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

bashrc
~~~~~~

You can add specifics modification by adding $HOME/.bash_spec file.
