#!/bin/bash

# Install conda
# http://conda.pydata.org/docs/travis.html#the-travis-yml-file
echo ls -la $HOME/miniconda
ls -la $HOME/miniconda
if [ ! "$(ls -A $HOME/miniconda)" ]; then
  # Control will enter here if $HOME/miniconda is empty.
  rm -r $HOME/miniconda
  wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
  bash miniconda.sh -b -p $HOME/miniconda
fi


export PATH="$HOME/miniconda/bin:$PATH"
which conda
hash -r
which conda


# Install common Python dependencies
source "$( dirname "${BASH_SOURCE[0]}" )"/setup_dependencies_common.sh

if [[ $SETUP_XVFB == True ]]; then
    export DISPLAY=:99.0
    sh -e /etc/init.d/xvfb start
fi
