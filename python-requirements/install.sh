#!/bin/bash -f


# Terminate script on first error
set -e

# This script assumes we are in the install directory

# Install pip
if [[ -n "$CRAYOS_VERSION" ]]; then
  wget --no-check-certificate https://packages.zenotech.com/get-pip.py -O - | ${PREFIX}/bin/python2.7
else
  wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py -O - | ${PREFIX}/bin/python2.7
fi

# Install setuptools
${PREFIX}/bin/python2.7 ${PREFIX}/bin/pip install --upgrade --trusted-host pypi.python.org setuptools

# Upgrade pip
${PREFIX}/bin/python2.7 ${PREFIX}/bin/pip install --upgrade --trusted-host pypi.python.org pip

PIPOPTS="--no-clean --global-option=build_ext --global-option=-I${PREFIX}/include --global-option=-L${PREFIX}/lib --global-option=-L${PREFIX}/lib64"


# Install gitterpy
${PREFIX}/bin/python2.7 ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --trusted-host github.com https://github.com/graycatlabs/gitterpy/zipball/master

# Install mpi4py
#./install/bin/python setup.py build --mpicc=cc --mpicxx=CC --mpif95=ftn

# Install numpy
#export CC=cc
#export CXX=CC
#export FC=ftn

# Ensure LDFLAGS is not set as this causes issues compiling numpy and scipy native code
unset LDFLAGS

export NPY_NUM_BUILD_JOBS=8

# Default location of blas and lapack
export BLAS=${PREFIX}/lib/libblas.so
export LAPACK=${PREFIX}/lib/liblapack.so
export ALTLAS=None

if [[ -n "$CRAYOS_VERSION" ]]; then

  # Note for Cray install of scipy may also need to fixup  numpy/distutils/fcompiler/gnu.py with -shared flag for gfortran
  # Manual install of cblas also required

  cat >> mpi.cfg <<EOF
[cray]
mpicc = cc
mpicxx = CC
extra_link_args = -shared
EOF

  # Note on ARCHER login nodes it is best not to use /tmp as files get deleted aggressively...
  #export TMP=

  export BLAS=${PREFIX}/lib/libcblas.so
  if [ ! -e "$BLAS" ]; then
    echo "Missing cblas library"
    exit
  fi

  export LAPACK=${CRAY_LIBSCI_PREFIX_DIR}/lib/libsci_gnu_mp.so
    # Install requirements
    MPICFG=cray,${PWD}/mpi.cfg ${PREFIX}/bin/python2.7 ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --trusted-host pypi.python.org -r requirements.txt
else
    # Install requirements
    CC="mpicc" ${PREFIX}/bin/python2.7 ${PREFIX}/bin/pip install ${PIPOPTS} --upgrade --trusted-host pypi.python.org -r requirements.txt
fi

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
PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter nbextensions_configurator enable --sys-prefix
PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter contrib nbextension install --sys-prefix --skip-running-check
PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter  nbextension enable --py --sys-prefix widgetsnbextension

PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter nbextension install --py --sys-prefix ipyleaflet
PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter nbextension enable --py --sys-prefix ipyleaflet
PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter nbextension enable --py --sys-prefix bqplot
#PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter nbextension enable --py --sys-prefix ipyvolume
PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter nbextension enable --py --sys-prefix pythreejs
PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter serverextension enable --py jupyterlab --sys-prefix
#PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter labextension install @jupyterlab/google-drive
#PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter labextension install @jupyter-widgets/jupyterlab-manager
#PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter labextension install jupyterlab_bokeh

PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter nbextension install --py --symlink --sys-prefix ipympl
PATH=${PREFIX}/bin/:${PATH} ${PREFIX}/bin/python2.7 ${PREFIX}/bin/jupyter nbextension enable --py --sys-prefix ipympl