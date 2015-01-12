# This maintains the links for all sources used by this superbuild.
# Simply update this file to change the revision.
# One can use different revision on different platforms.
# e.g.
# if (UNIX)
#   ..
# else (APPLE)
#   ..
# endif()

add_revision(bzip2
  URL "http://www.paraview.org/files/dependencies/bzip2-1.0.6.tar.gz"
  URL_MD5 00b516f4704d4a7cb50a1d97e6e8e15b)
# NOTE: if updating bzip2 version, fix patch in bzip2.cmake


add_revision(zlib
  URL "http://www.paraview.org/files/dependencies/zlib-1.2.7.tar.gz"
  URL_MD5 60df6a37c56e7c1366cca812414f7b85)
# NOTE: if updating zlib version, fix patch in zlib.cmake


add_revision(png
  URL "http://paraview.org/files/dependencies/libpng-1.4.8.tar.gz"
  URL_MD5 49c6e05be5fa88ed815945d7ca7d4aa9)

add_revision(freetype
  URL "http://paraview.org/files/dependencies/freetype-2.4.8.tar.gz"
  URL_MD5 "5d82aaa9a4abc0ebbd592783208d9c76")

add_revision(szip
  URL "http://paraview.org/files/dependencies/szip-2.1.tar.gz"
  URL_MD5 902f831bcefb69c6b635374424acbead)

add_revision(hdf5
  URL "http://www.paraview.org/files/dependencies/hdf5-1.8.13.tar.gz"
  URL_MD5 c03426e9e77d7766944654280b467289)

add_revision(silo
  URL "http://paraview.org/files/dependencies/silo-4.9.1-bsd.tar.gz"
  URL_MD5 465d2a0a8958b088cde83fb2a5a7eeef)

add_revision(cgns
  URL "http://www.paraview.org/files/dependencies/cgnslib_3.1.3-4.tar.gz"
  URL_MD5 442bba32b576f3429cbd086af43fd4ae)

add_revision(ffmpeg
  URL "http://paraview.org/files/dependencies/ffmpeg-2.3.3.tar.bz2"
  URL_MD5 72361d3b8717b6db3ad2b9da8df7af5e)

add_revision(libxml2
  URL "http://paraview.org/files/dependencies/libxml2-2.7.8.tar.gz"
  URL_MD5 8127a65e8c3b08856093099b52599c86)

add_revision(fontconfig
  URL "http://paraview.org/files/dependencies/fontconfig-2.8.0.tar.gz"
  URL_MD5 77e15a92006ddc2adbb06f840d591c0e)

add_revision(qt
  URL "http://paraview.org/files/dependencies/qt-everywhere-opensource-src-4.8.6.tar.gz"
  URL_MD5 2edbe4d6c2eff33ef91732602f3518eb)

if (WIN32 OR (CROSS_BUILD_STAGE STREQUAL "CROSS"))
  add_revision(python
    URL "http://www.paraview.org/files/dependencies/Python-2.7.3.tgz"
    URL_MD5 "2cf641732ac23b18d139be077bd906cd")
else()
  add_revision(python
    URL "http://paraview.org/files/dependencies/Python-2.7.2.tgz"
    URL_MD5 "0ddfe265f1b3d0a8c2459f5bf66894c7")
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

if (UBUNTU)
#  add_revision(boost
#    URL "http://packages.zenotech.com/boost_1_55_0.tar.bz2"
#    URL_MD5 d6eef4b4cacb2183f2bf265a5a03a354)
  add_revision(boost
    URL "http://packages.zenotech.com/boost_1_57_0.tar.bz2"
    URL_MD5 1be49befbdd9a5ce9def2983ba3e7b76)
elseif (POWER8)
  add_revision(boost
    URL "http://packages.zenotech.com/boost_1_55_0-power8.tar.gz"
    URL_MD5 b18d3c174ecd9df0cc1e4ff62018622e)
else()
  add_revision(boost
     URL "http://packages.zenotech.com/boost_1_55_0.tar.bz2"
     URL_MD5 d6eef4b4cacb2183f2bf265a5a03a354)
endif()
#  URL "http://www.paraview.org/files/dependencies/boost_1_50_0.tar.gz"
#  URL_MD5 dbc07ab0254df3dda6300fd737b3f264)

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
  add_revision(mpi
    URL "http://packages.zenotech.com/openmpi-1.6.5.tar.bz2"
    URL_MD5 03aed2a4aa4d0b27196962a2a65fc475)
  #add_revision(mpi
  #  URL "http://paraview.org/files/dependencies/mpich2-1.4.1p1.tar.gz"
  #  URL_MD5 b470666749bcb4a0449a072a18e2c204)
  endif()
elseif (WIN32)
  add_revision(mpi
    URL "http://www.paraview.org/files/dependencies/openmpi-1.4.4.tar.gz"
    URL_MD5 7253c2a43445fbce2bf4f1dfbac113ad)
endif()

if (CROSS_BUILD_STAGE STREQUAL "CROSS")
  add_revision(mesa
    URL "http://www.paraview.org/files/dependencies/MesaLib-7.6.1.tar.gz"
    URL_MD5 e80fabad2e3eb7990adae773d6aeacba)
else()
  add_revision(mesa
    URL "http://paraview.org/files/dependencies/MesaLib-7.11.2.tar.gz"
    URL_MD5 b9e84efee3931c0acbccd1bb5a860554)
endif()

# We stick with 7.11.2 for Mesa version for now. Newer mesa doesn't seem to
# build correctly with certain older compilers (e.g. on neser).
add_revision(osmesa
    URL "http://paraview.org/files/dependencies/MesaLib-7.11.2.tar.gz"
    URL_MD5 b9e84efee3931c0acbccd1bb5a860554)


# Add an option to not use diy from SVN. One Debian-Etch the SVN is too old
# to work with invalid SVN certificates.
option(DIY_SKIP_SVN "If enabled, we simply download diy from a source tar" OFF)
if(DIY_SKIP_SVN)
  add_revision(diy
    URL "http://paraview.org/files/dependencies/diy-src.r178.tar.gz"
    URL_MD5 4fba13aae93927d0f32dd6db0599ffcd)
else()
  if (TRUST_SVN_CERTIFICATES_AUTOMATICALLY)
    add_revision(diy
       SVN_REPOSITORY https://svn.mcs.anl.gov/repos/diy/trunk
       SVN_REVISION -r178
       SVN_TRUST_CERT 1)
  else()
    add_revision(diy
       SVN_REPOSITORY https://svn.mcs.anl.gov/repos/diy/trunk
       SVN_REVISION -r178)
  endif()
endif()

# ----------------------------------------------------------------------------
# You choose to download ParaView source form GIT or other URL/FILE tarball
option(ParaView_FROM_GIT "If enabled then the repository is fetched from git" ON)

if (ParaView_FROM_GIT)
  # Download PV from GIT
  add_revision(paraview
    GIT_REPOSITORY git@github.com:zenotech/ParaView.git
    GIT_TAG "master")
else()
  # Variables to hold the URL and MD5 (optional)
  set (ParaView_URL "http://www.paraview.org/files/v4.2/ParaView-v4.2.0-source.tar.gz" CACHE
    STRING "Specify the url for ParaView tarball")
  set (ParaView_URL_MD5 "77cf0e3804eb7bb91d2d94b10bd470f4" CACHE STRING "MD5 of the ParaView tarball")

  # Get the length of the URL specified.
  if("${ParaView_URL}" STREQUAL "")
    # No URL specified raise error.
    message (FATAL_ERROR "ParaView_URL should have a valid URL or FilePath to a ParaView tarball")
  else()
    # Download PV from source specified in URL
    add_revision(paraview
      URL ${ParaView_URL}
      URL_MD5 ${ParaView_URL_MD5})
  endif()
endif()

add_revision(qhull
    GIT_REPOSITORY git://github.com/gzagaris/gxzagas-qhull.git
    GIT_TAG master)

add_revision(genericio
    GIT_REPOSITORY git://kwsource.kitwarein.com/genericio/genericio.git
    GIT_TAG v1.3)

#------------------------------------------------------------------------------
# Optional Plugins. Doesn't affect ParaView binaries at all even if missing
# or disabled.
#------------------------------------------------------------------------------

add_revision(cosmotools
    GIT_REPOSITORY git://public.kitware.com/cosmotools.git
    GIT_TAG v0.13)

add_revision(acusolve
  GIT_REPOSITORY git://kwsource.kitwarein.com/paraview/acusolvereaderplugin.git
  GIT_TAG master)

add_revision(vistrails
  GIT_REPOSITORY git://kwsource.kitwarein.com/paraview/vistrails.git
  GIT_TAG master)

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
  GIT_REPOSITORY git@github.com:jappa/ThreadWorker.git
  GIT_TAG v0.2.0)

option(zCFD_FROM_GIT "If enabled then the repository is fetched from git" ON)

if (zCFD_FROM_GIT)
  add_revision(zcfd
    GIT_REPOSITORY git@github.com:zenotech/zCFD.git
    GIT_TAG "${zcfd_git_tag}")
  #  GIT_TAG ${VERSION})
else()
  # Variables to hold the URL and MD5 (optional)
  set (zCFD_URL "" CACHE
    STRING "Specify the url for zCFD tarball")
  set (zCFD_URL_MD5 "77cf0e3804eb7bb91d2d94b10bd470f4" CACHE STRING "MD5 of the zCFD tarball")

  # Get the length of the URL specified.
  if("${zCFD_URL}" STREQUAL "")
    # No URL specified raise error.
    message (FATAL_ERROR "zCFD_URL should have a valid URL or FilePath to a zCFD tarball")
  else()
    # Download PV from source specified in URL
    add_revision(zcfd
      URL ${zCFD_URL}
      URL_MD5 ${zCFD_URL_MD5})
  endif()
endif()

  
