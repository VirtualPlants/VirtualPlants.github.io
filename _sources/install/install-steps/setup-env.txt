If not yet done, edit your .bashrc file (generally in /home/user/.bashrc) and add the following lines (if not yet in the file):

.. code-block:: bash

  cd
  gedit .bashrc
  source ~/.openalea.sh
  export PATH=$PATH:$HOME/.local/bin/
  export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH

Save and close your .bashrc file. Open a new shell prompt and go to the directory where you want install programs.

