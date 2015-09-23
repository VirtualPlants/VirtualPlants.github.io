#!/bin/bash

# File author: 
#    - Sophie Ribes <sophie.ribes@inria.fr>
# File contributors:
#    - Guillaume Baty <guillaume.baty@inria.fr>
#    - Guillaume Cerutti <guillaume.cerutti@inria.fr>

# USER DEFINED VARIABLES

DEFAULT_REMOTE_NAME=origin
DEFAULT_BRANCH_NAME=master

DeployRemote=${DEFAULT_REMOTE_NAME}
SconxRemote=${DEFAULT_REMOTE_NAME}
OpenaleaComponentsRemote=${DEFAULT_REMOTE_NAME}
OpenaleaRemote=${DEFAULT_REMOTE_NAME}
OalabTissueRemote=${DEFAULT_REMOTE_NAME}
MarsAltRemote=${DEFAULT_REMOTE_NAME}

DeployBranch=${DEFAULT_BRANCH_NAME}
SconxBranch=${DEFAULT_BRANCH_NAME}
OpenaleaComponentsBranch=${DEFAULT_BRANCH_NAME}
OpenaleaBranch=${DEFAULT_BRANCH_NAME}
OalabTissueBranch=${DEFAULT_BRANCH_NAME}
MarsAltBranch=${DEFAULT_BRANCH_NAME}

DeployFolderName="deploy"
SconxFolderName="sconsx"
OpenaleaComponentsFolderName="openalea-components"
OpenaleaFolderName="openalea"
OalabTissueFolderName="oalab-tissue"
MarsAltFolderName="marsalt"

# UPDATE SCRIPT

DeployFolder=$(find ~ -maxdepth 3 -name "${DeployFolderName}" -type d)
SconxFolder=$(find ~ -maxdepth 3 -name "${SconxFolderName}" -type d)
OpenaleaComponentsFolder=$(find ~ -maxdepth 3 -name "${OpenaleaComponentsFolderName}" -type d)
OpenaleaFolder=$(find ~ -maxdepth 3 -name "${OpenaleaFolderName}" -type d)
OalabTissueFolder=$(find ~ -maxdepth 3 -name "${OalabTissueFolderName}" -type d)
MarsAltFolder=$(find ~ -maxdepth 3 -name "${MarsAltFolderName}" -type d)


if [ -n "$1" ]; then
   InstallMode=$1
else
   InstallMode="develop"
fi

echo "***** Update and install package in '${InstallMode}' mode *****"

cwd=`pwd`

tab=($DeployFolder $SconxFolder $OpenaleaComponentsFolder $OpenaleaFolder $OalabTissueFolder $MarsAltFolder)
tab_name=($DeployFolderName $SconxFolderName $OpenaleaComponentsFolderName $OpenaleaFolderName $OalabTissueFolderName $MarsAltFolderName)
branch=($DeployBranch $SconxBranch $OpenaleaComponentsBranch $OpenaleaBranch $OalabTissueBranch $MarsAltBranch)
remote=($DeployRemote $SconxRemote $OpenaleaComponentsRemote $OpenaleaRemote $OalabTissueRemote $MarsAltRemote)


n_tab=${#tab[@]}
n_tab_name=${#tab_name[@]}
n_branch=${#branch[@]}
n_remote=${#remote[@]}

if [[ ( "$n_tab" != "$n_branch" ) || ( "$n_tab" != "$n_branch" ) || ( "$n_tab" != "$n_remote" ) ]]; then
  echo "Error reading directories. Please check all these directory exists and are clean git repositories:"
  for i in ${!tab_name[@]}
  do
    echo " - ${tab_name[i]}"
  done
else

    for i in ${!tab[@]}
    do
        if [ -z "${tab[i]}" ]
        then
            echo "***** folder ${tab[i]} not found *****"
        else
            tab_name=`basename ${tab[i]}`
            cd ${tab[i]}
            echo "***** update: ${tab[i]} *****"
            echo "***** update source: ${remote[i]}/${branch[i]} *****"
            git checkout ${branch[i]}
            git fetch ${remote[i]} && git rebase ${remote[i]}/${branch[i]}
            multisetup=$(find . -maxdepth 1 -name "multisetup.py")
            if [ -z "$multisetup" ]
            then
                python setup.py ${InstallMode} > ${cwd}/log_update_${tab_name}.txt
            else
                python multisetup.py ${InstallMode} > ${cwd}/log_update_${tab_name}.txt
            fi
            echo "  ***** done ! *****"
            cd -
            echo
            source ~/.openalea.sh
        fi
    done

fi




