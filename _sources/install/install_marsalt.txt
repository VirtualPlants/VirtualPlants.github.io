
Install & Update Mars-Alt (developers)
======================================

Create an account on `gforge <https://gforge.inria.fr/>`_ and create an account on `github <https://github.com/>`_.

Then, generate and configure your ssh key as explained `here <https://help.github.com/articles/generating-ssh-keys/>`_. Do not forget to add your ssh key to your github account and to your gforge account.


First installation
##################

Install development tools
-------------------------

.. include:: install-steps/dev-tools.rst


Install external dependencies
--------------------

.. include:: install-steps/common-deps.rst


Download and install OpenAlea dependencies
--------------------


.. include:: install-steps/deploy-deps.rst

Setup your environment
----------------------

.. include:: install-steps/setup-env.rst

Download and install OpenAlea core components
-----------------

Download OpenAlea core components: **openalea** and **openalea-components**

.. code-block:: bash

  git clone https://github.com/openalea/openalea.git
  git clone https://github.com/openalea/openalea-components.git

These previous commands clone **openalea** and **openalea-components** repositories, and must be executed only one time. Then, install OpenAlea core components. For these packages:

  - openalea
  - openalea-components

.. code-block:: bash

  cd package
  python multisetup.py COMMAND

where COMMAND can be:
  
  - **develop --user** : to install in developer mode, in your home dir
  - `develop --prefix=$HOME/local` : to install in developer mode in directory of your choice
  - `install` : to do a system installation
  - `install --prefix=...` : to install in directory of your choice

.. warning::

  If you don't know exactly what to do, please use: **develop --user**

Download and install Mars-Alt
-----------------

Mars-Alt is a private repository and is still under development.
To join this project, please contact an administrator.
Then, download **Mars-Alt** repository:    

.. code-block:: bash

  git clone git+ssh://username@scm.gforge.inria.fr//gitroot/marsalt/marsalt.git

This previous command clone **marsalt** repository, and must be executed only one time. Then, install **marsalt**. For this package:

  - mars-alt

.. code-block:: bash

  cd package
  python multisetup.py COMMAND

where COMMAND can be:
  
  - **develop --user** : to install in developer mode, in your home dir
  - `develop --prefix=$HOME/local` : to install in developer mode in directory of your choice
  - `install` : to do a system installation
  - `install --prefix=...` : to install in directory of your choice

.. warning::

  If you don't know exactly what to do, please use: **develop --user**

Run programs
############

.. code-block:: bash

  visualea # to run Visualea to test mars-alt in dataflows

Update packages
###############

.. include:: install-steps/update.rst


During svn to git migration
###########################

.. include:: install-steps/transition-svn-git.rst


Contribute to packages
######################

See :ref:`contribute` and :ref:`git-workflows`.

Troubleshooting
###############

.. include:: install-steps/troubleshooting.rst
