#!/bin/bash -f

# This script assumes we are in the install directory

# Install pip
  wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py -O - | ${PREFIX}/bin/python

  # Install setuptools
  ${PREFIX}/bin/python ${PREFIX}/bin/pip install --upgrade --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org setuptools

  # Upgrade pip
  ${PREFIX}/bin/python ${PREFIX}/bin/pip install --upgrade --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org pip

  PIPOPTS="--no-clean --global-option=build_ext --global-option=-I$${PREFIX}/include --global-option=-L${PREFIX}/lib"

  # Install yolk
  ${PREFIX}/bin/python ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org yolk


  # Install gitterpy
  ${PREFIX}/bin/python ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --trusted-host github.com https://github.com/graycatlabs/gitterpy/zipball/master

  # Install mpi4py
  #./install/bin/python setup.py build --mpicc=cc --mpicxx=CC --mpif95=ftn

  # Install numpy
#export CC=cc
#export CXX=CC
#export FC=ftn

  # Install requirements
  ${PREFIX}/bin/python ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org -r requirements.txt
  # Force reinstall
  #${PREFIX}/bin/python ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --no-deps --force-reinstall --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org -r requirements.txt
  # Install notebook
  ${PREFIX}/bin/python ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org -r notebook-requirements.txt

  ${PREFIX}/bin/python ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --index-url=http://pypi.python.org/simple/ --trusted-host pypi.python.org jupyter

  # If CUDA present install pycuda
  #if [ -f "$CUDA_COMPILER" ]; then
  #  install/bin/python install/bin/pip install ${PIPOPTS} pycuda
  #  #  Need to copy CUDA libraries into lib - this is permitted under the NVIDIA CUDA EULA
  #  cp -r "$( dirname "$CUDA_COMPILER" )"/../lib64/* install/lib
  #fi

  # Need to fix up scripts in bin that use python
  P_SCRIPTS=`grep python ${PREFIX}/bin/* | grep '#!' | cut -d : -f 1`
  for P in $P_SCRIPTS; do
    echo "Fixing python path in $P"
    sed -i.tmp -e "s/\#\!\/.*/\#\!\/usr\/bin\/env python/" $P
    rm -f "${P}.tmp"
  done

  # Note this needs to be done after fixing up the scripts above so that
  # the shebang in jupyter-nbextension is short enough to be valid
  #
  # Configure jupyter
  PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python ${PREFIX}/bin/jupyter  nbextension enable --py --sys-prefix widgetsnbextension
