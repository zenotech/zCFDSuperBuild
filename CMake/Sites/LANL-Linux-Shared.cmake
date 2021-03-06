# Tarballs needing to be downloaded:
# boost
# ffmpeg
# matplotlib
# numpy
# osmesa
# paraview
# python
# visitbridge

# General build settings
set(CMAKE_BUILD_TYPE   Release CACHE STRING "")
set(BUILD_SHARED_LIBS  ON CACHE BOOL "")

# Enable the appropriate packages
set(ENABLE_boost       ON CACHE BOOL "")
set(ENABLE_bzip2       ON CACHE BOOL "")
set(ENABLE_ffmpeg      ON CACHE BOOL "")
set(ENABLE_freetype    ON CACHE BOOL "")
set(ENABLE_lapack      ON CACHE BOOL "")
set(ENABLE_libxml2     ON CACHE BOOL "")
set(ENABLE_matplotlib  ON CACHE BOOL "")
set(ENABLE_mpi         ON CACHE BOOL "")
set(ENABLE_numpy       ON CACHE BOOL "")
set(ENABLE_osmesa      ON CACHE BOOL "")
set(ENABLE_paraview    ON CACHE BOOL "")
set(ENABLE_paraviewsdk ON CACHE BOOL "")
set(ENABLE_png         ON CACHE BOOL "")
set(ENABLE_python      ON CACHE BOOL "")
set(ENABLE_visitbridge ON CACHE BOOL "")
set(ENABLE_zlib        ON CACHE BOOL "")

# These will get pulled from the compute node's userland
set(USE_SYSTEM_freetype ON CACHE BOOL "")
set(USE_SYSTEM_libxml2  ON CACHE BOOL "")
set(USE_SYSTEM_png      ON CACHE BOOL "")
set(USE_SYSTEM_zlib     ON CACHE BOOL "")
set(USE_SYSTEM_lapack   ON CACHE BOOL "")
set(USE_SYSTEM_mpi      ON CACHE BOOL "")

# Make sure the final ParaView build uses the whole node
include(ProcessorCount)
ProcessorCount(N)
if(NOT N EQUAL 0)
  set(PV_MAKE_NCPUS ${N} CACHE STRING "")
else()
  set(PV_MAKE_NCPUS 5 CACHE STRING "")
endif()

# Specify where the necessary tarballs have beel downloaded to
set(download_location /usr/projects/packages/hpc_paraview/superbuild/downloads
  CACHE PATH "")

# Paraview details
set(ParaView_FROM_GIT OFF CACHE BOOL "")
