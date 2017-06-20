# This maintains the links for all sources used by this superbuild.
# Simply update this file to change the revision.
# One can use different revision on different platforms.
# e.g.
# if (UNIX)
#   ..
# else (APPLE)
#   ..
# endif()

include(CMakeDependentOption)

add_revision(bzip2
  URL "http://www.paraview.org/files/dependencies/bzip2-1.0.6.tar.gz"
  URL_MD5 00b516f4704d4a7cb50a1d97e6e8e15b)
# NOTE: if updating bzip2 version, fix patch in bzip2.cmake

add_revision(libsodium
    URL "https://github.com/jedisct1/libsodium/releases/download/1.0.12/libsodium-1.0.12.tar.gz"
    URL_MD5 c308e3faa724b630b86cc0aaf887a5d4)

add_revision(zlib
  URL "http://zlib.net/zlib-1.2.11.tar.gz"
  URL_MD5 1c9f62f0778697a09d36121ead88e08e)
# NOTE: if updating zlib version, fix patch in zlib.cmake


add_revision(png
  URL "http://download.sourceforge.net/libpng/libpng-1.6.29.tar.gz"
  URL_MD5 68553080685f812d1dd7a6b8215c37d8)

add_revision(freetype
  URL "https://download.savannah.gnu.org/releases/freetype/freetype-2.8.tar.gz"
  URL_MD5 c89c00767f939bff559d5dad326c1355)

add_revision(szip
  URL "http://paraview.org/files/dependencies/szip-2.1.tar.gz"
  URL_MD5 902f831bcefb69c6b635374424acbead)

add_revision(hdf5
  URL "https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-1.8.19.tar.bz2"
  URL_MD5 6f0353ee33e99089c110a1c8d2dd1b22)

#  URL "https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.0-patch1/src/hdf5-1.10.0-patch1.tar.bz2"
#  URL_MD5 f6d980febe2c35c11670a9b34fa3b487)

add_revision(openssl
  URL "https://www.openssl.org/source/openssl-1.1.0e.tar.gz"
  URL_MD5 51c42d152122e474754aea96f66928c6)

add_revision(silo
  URL "http://paraview.org/files/dependencies/silo-4.9.1-bsd.tar.gz"
  URL_MD5 465d2a0a8958b088cde83fb2a5a7eeef)

add_revision(cgns
  URL "http://www.paraview.org/files/dependencies/cgnslib_3.1.3-4.tar.gz"
  URL_MD5 442bba32b576f3429cbd086af43fd4ae)

add_revision(ccmio
  URL "http://packages.zenotech.com/libccmio-2.6.1.tar.gz"
  URL_MD5 fa363a5f9c297dd1ddfa67c86cbfe09a)

add_revision(ffmpeg
  URL "http://paraview.org/files/dependencies/ffmpeg-2.3.3.tar.bz2"
  URL_MD5 72361d3b8717b6db3ad2b9da8df7af5e)

add_revision(libxml2
  URL "http://paraview.org/files/dependencies/libxml2-2.7.8.tar.gz"
  URL_MD5 8127a65e8c3b08856093099b52599c86)

add_revision(fontconfig
  URL "https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.1.tar.gz"
  URL_MD5 ce55e525c37147eee14cc2de6cc09f6c)

add_revision(qt4
  URL "http://download.qt.io/archive/qt/4.8/4.8.6/qt-everywhere-opensource-src-4.8.6.tar.gz"
  URL_MD5 2edbe4d6c2eff33ef91732602f3518eb)

if (WIN32)
  add_revision(qt5
    URL "http://download.qt.io/official_releases/qt/5.4/5.4.1/single/qt-everywhere-opensource-src-5.4.1.zip"
    URL_MD5 57b25c68982237abb9e18b347034e005)
else ()
  add_revision(qt5
    URL "http://download.qt.io/official_releases/qt/5.4/5.4.1/single/qt-everywhere-opensource-src-5.4.1.tar.gz"
    URL_MD5 90f3fbce38ed16e5dc2cd0909ae86ca4)
endif ()

if (WIN32)
  if (64bit_build)
    add_revision(python
      URL "http://www.paraview.org/files/dependencies/python+deps.tar.bz2"
      URL_MD5 "4318b8f771eda5606d9ce7f0be9f82e1")
  else ()
    add_revision(python
      URL "http://www.paraview.org/files/dependencies/python+deps-x32.tar.bz2"
      URL_MD5 "6ba441784a672e08379d23ddd61146f0")
  endif ()
elseif (CROSS_BUILD_STAGE STREQUAL "CROSS")
  add_revision(python
    URL "http://www.paraview.org/files/dependencies/Python-2.7.3.tgz"
    URL_MD5 "2cf641732ac23b18d139be077bd906cd")
else()
  add_revision(python
    URL "https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz"
    URL_MD5 "17add4bf0ad0ec2f08e0cae6d205c700")

endif()

add_revision(numpy
  URL "https://pypi.python.org/packages/source/n/numpy/numpy-1.9.1.tar.gz"
  URL_MD5 78842b73560ec378142665e712ae4ad9)
#  URL "http://paraview.org/files/dependencies/numpy-1.8.1+cmake+static.tar.bz2"
#  URL_MD5 1974dbb4bfa1509e492791a8cd225774)

add_revision(matplotlib
  URL "http://paraview.org/files/dependencies/matplotlib-1.1.1_notests.tar.gz"
  URL_MD5 30ee59119599331bf1f3b6e838fee9a8)

add_revision(mpi4py
  URL "https://pypi.python.org/packages/source/m/mpi4py/mpi4py-1.3.1.tar.gz"
  URL_MD5 dbe9d22bdc8ed965c23a7ceb6f32fc3c)

add_revision(colorama
  URL "https://pypi.python.org/packages/source/c/colorama/colorama-0.3.2.tar.gz"
  URL_MD5 2949d760dfe510a74f5bf4287d474f33)

add_revision(pycuda
  URL "https://pypi.python.org/packages/source/p/pycuda/pycuda-2014.1.tar.gz"
  URL_MD5 fdc2f59e57ab7256a7e0df0d9d943022)

add_revision(pyyaml
  URL "https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.11.tar.gz"
  URL_MD5 f50e08ef0fe55178479d3a618efe21db)

add_revision(codepy
  URL "https://pypi.python.org/packages/source/c/codepy/codepy-2013.1.2.tar.gz"
  URL_MD5 257e0c14a4bdd60cb58f8b775c2db395)

add_revision(jinja2
  URL "https://pypi.python.org/packages/source/J/Jinja2/Jinja2-2.7.3.tar.gz"
  URL_MD5 b9dffd2f3b43d673802fe857c8445b1a)

add_revision(cgen
  URL "https://pypi.python.org/packages/source/c/cgen/cgen-2014.1.tar.gz"
  URL_MD5 dd43dff8afe4c6354412ddd1bd6d4f28)

add_revision(snakemq
  URL "https://pypi.python.org/packages/source/s/snakeMQ/snakeMQ-1.2.tar.gz"
  URL_MD5 1bf0c94dfc85dfc44428157b80780595)

if (POWER8)
  add_revision(boost
    URL "http://packages.zenotech.com/boost_1_55_0-power8.tar.gz"
    URL_MD5 b18d3c174ecd9df0cc1e4ff62018622e)
else()
  add_revision(boost
      URL "https://downloads.sourceforge.net/project/boost/boost/1.64.0/boost_1_64_0.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fboost%2Ffiles%2Fboost%2F1.64.0%2F&ts=1495103162"
    URL_MD5 319c6ffbbeccc366f14bb68767a6db79)
endif()
#  URL "http://www.paraview.org/files/dependencies/boost_1_50_0.tar.gz"
#  URL_MD5 dbc07ab0254df3dda6300fd737b3f264)
#add_revision(boost
#  URL "http://sourceforge.net/projects/boost/files/boost/1.56.0/boost_1_56_0.tar.gz/download"
#  URL_MD5 8c54705c424513fa2be0042696a3a162)

add_revision(gcc
     URL "http://packages.zenotech.com/gcc-4.9.2.tar.bz2"
     URL_MD5 881344fd1febfd0641e7d648830678d1)

add_revision(manta
  URL "http://paraview.org/files/dependencies/manta-r2439.tar.gz"
  URL_MD5 fbf4107fe2f6d7e8a5ae3dda71805bdc)

if (UNIX)
  if(POWER8)
      add_revision(mpi
    URL "http://packages.zenotech.com/openmpi-1.6.5-power8.tar.gz"
    URL_MD5 5eb18cf7a26d6e7048016cf9a8489b2e)
  else()
  # Added zCFD mpi
  if( NOT USE_SYSTEM_mpi)
    set(MPI_VENDOR "OPENMPI-1.6")
  endif()
  add_revision(mpi
    URL "http://packages.zenotech.com/openmpi-1.6.5.tar.bz2"
    URL_MD5 03aed2a4aa4d0b27196962a2a65fc475)

#  if( NOT USE_SYSTEM_mpi)
#    set(MPI_VENDOR "OPENMPI-1.10")
#   endif()
#    add_revision(mpi URL "http://packages.zenotech.com/openmpi-1.10.1.tar.bz2"
#    URL_MD5 f0fcd77ed345b7eafb431968124ba16e)
#  if( NOT USE_SYSTEM_mpi)
#    set(MPI_VENDOR "OPENMPI-2.0")
#   endif()
# add_revision(mpi URL "https://www.open-mpi.org/software/ompi/v2.x/downloads/openmpi-2.0.0rc1.tar.bz2"
# URL_MD5 5e79c74aba55726db23ae9134aa55657)

  #add_revision(mpi
  #  URL "http://paraview.org/files/dependencies/mpich2-1.4.1p1.tar.gz"
  #  URL_MD5 b470666749bcb4a0449a072a18e2c204)
  endif()
elseif (WIN32)
  add_revision(mpi
    URL "http://www.paraview.org/files/dependencies/openmpi-1.4.4.tar.gz"
    URL_MD5 7253c2a43445fbce2bf4f1dfbac113ad)
endif()

add_revision(osmesa
    URL "https://mesa.freedesktop.org/archive/mesa-17.0.6.tar.gz"
    URL_MD5 05a111fad5297025e5e47c1d6f8ab79f)


# ----------------------------------------------------------------------------
# You choose to download ParaView source form GIT or other URL/FILE tarball
option(ParaView_FROM_GIT "If enabled then the repository is fetched from git" ON)
cmake_dependent_option(ParaView_FROM_SOURCE_DIR "Enable to use existing ParaView source." OFF
  "NOT ParaView_FROM_GIT" OFF)

if (ParaView_FROM_GIT)
  # Download PV from GIT
  add_revision(paraview
    GIT_REPOSITORY https://github.com/zenotech/ParaView.git
    GIT_TAG "pv44")
else()
  if (ParaView_FROM_SOURCE_DIR)
    add_customizable_revision(paraview
      SOURCE_DIR "ParaViewSource")
  else()
    # Variables to hold the URL and MD5 (optional)
    add_customizable_revision(paraview
      URL "http://www.paraview.org/files/v4.4/ParaView-v4.4.0-source.tar.gz"
      URL_MD5 "fa1569857dd680ebb4d7ff89c2227378")
  endif()
endif()

#------------------------------------------------------------------------------
# Optional Plugins. Doesn't affect ParaView binaries at all even if missing
# or disabled.
#------------------------------------------------------------------------------

if (USE_NONFREE_COMPONENTS)
  add_revision(qhull
    GIT_REPOSITORY https://github.com/mathstuf/qhull.git
    GIT_TAG next)

  add_revision(genericio
    GIT_REPOSITORY https://kwgitlab.kitware.com/paraview/genericio.git
    GIT_TAG master)

  # Add an option to not use diy from SVN. On Debian-Etch the SVN is too old
  # to work with invalid SVN certificates.
  option(DIY_SKIP_SVN "If enabled, we simply download diy from a source tar" OFF)
  if(DIY_SKIP_SVN)
    add_revision(diy
      URL "http://paraview.org/files/dependencies/diy-src.r178.tar.gz"
      URL_MD5 4fba13aae93927d0f32dd6db0599ffcd)
  else()
    add_revision(diy
      GIT_REPOSITORY https://gitlab.kitware.com/paraview/diy.git
      GIT_TAG f5c00a034279d20cf040705d78a6b7bdb4beae43) # r178
  endif()

  add_revision(cosmotools
    GIT_REPOSITORY git://public.kitware.com/cosmotools.git
    GIT_TAG v0.13)

  add_revision(acusolve
    GIT_REPOSITORY https://kwgitlab.kitware.com/paraview/acusolvereaderplugin.git
    GIT_TAG master)

  add_revision(vistrails
    GIT_REPOSITORY https://kwgitlab.kitware.com/paraview/vistrails.git
    GIT_TAG master)
endif ()

#add_customizable_revision(vortexfinder2
#  GIT_REPOSITORY https://github.com/hguo/vortexfinder2.git
#  GIT_TAG 2bdae9bfc0f36e1013a4b41c5d25c9e6ebbf1701)
add_customizable_revision(vortexfinder2
  GIT_REPOSITORY https://github.com/tj-corona/vortexfinder2.git
  GIT_TAG paraview-superbuild)

#add_revision(mili_plugin
# URL ${CMAKE_CURRENT_SOURCE_DIR}/Externals/mili)

add_revision(portfwd
  URL "http://www.paraview.org/files/dependencies/portfwd-0.29.tar.gz"
  URL_MD5 93161c91e12b0d67ca52dc13708a2f2f)

add_revision(lapack
  URL "http://paraview.org/files/dependencies/lapack-3.4.2.tgz"
  URL_MD5 61bf1a8a4469d4bdb7604f5897179478)

add_revision(netcdf
  URL http://www.paraview.org/files/dependencies/netcdf-4.3.2.modified.tar.gz
  URL_MD5 1841196c2bfcf10246966eecf92ad0ec)

add_revision(mxml
  URL http://www.paraview.org/files/dependencies/mxml-2.9.tar.gz
  URL_MD5 e21cad0f7aacd18f942aa0568a8dee19
)

add_revision(adios
  URL http://www.paraview.org/files/dependencies/adios-1.8-439f0fb6.tar.bz2
  URL_MD5 a88701c77a7ead5daadd8d8aff70556a
)

# zCFD specfic projects

add_revision(parmetis
  URL "http://packages.zenotech.com/parmetis-4.0.2.tar.gz"
  URL_MD5 d07c8c40a4f48fc1585f6fdeb0acce65)

add_revision(trilinos
  URL "http://packages.zenotech.com/trilinos-11.4.1-Source.tar.bz2"
  URL_MD5 150110384be0c92f38f91ec2c599f7f1)

add_revision(scotch
  URL "http://packages.zenotech.com/scotch_5.1.12b.tar.gz"
  URL_MD5 5d912599c2521b1ecbcd8d12b68eef9c)

add_revision(threadworker
  GIT_REPOSITORY https://github.com/zenotech/ThreadWorker.git
  GIT_TAG master)

add_revision(highorder
    GIT_REPOSITORY https://github.com/zenotech/PV-HighOrder.git
    GIT_TAG master)

