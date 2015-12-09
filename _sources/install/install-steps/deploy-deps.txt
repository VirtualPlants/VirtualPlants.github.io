Open a shell prompt and go to the directory where you want to install programs. For example:

.. code-block:: bash

  cd $HOME/development

Then, download OpenAlea dependencies: **deploy** and **sconsx**

.. code-block:: bash

  git clone https://github.com/openalea/deploy.git
  git clone https://github.com/openalea/sconsx.git

These previous commands clone **deploy** and **sconsx** repositories, and must be executed only one time. Then, install OpenAlea dependencies. For these packages:

  - deploy
  - sconsx

.. code-block:: bash

  cd package
  python setup.py COMMAND

where COMMAND can be:
  
  - **develop --user** : to install in developer mode, in your home dir
  - `develop --prefix=$HOME/local` : to install in developer mode in directory of your choice
  - `install` : to do a system installation
  - `install --prefix=...` : to install in directory of your choice

.. warning::

  If you don't know exactly what to do, please use: **develop --user**
