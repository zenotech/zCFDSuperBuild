set(C_COMP mpicc)
set(CC_COMP mpicxx)
if(DEFINED ENV{CRAYOS_VERSION})
  set(C_COMP cc)
  set(CC_COMP CC)
endif()

add_external_project_or_use_system(
  hdf5
  DEPENDS zlib mpi

  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=Release
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DHDF5_ENABLE_Z_LIB_SUPPORT:BOOL=TRUE
    -DHDF5_ENABLE_SZIP_SUPPORT:BOOL=FALSE
    -DHDF5_ENABLE_SZIP_ENCODING:BOOL=TRUE
    -DHDF5_BUILD_CPP_LIB:BOOL=FALSE
    -DHDF5_BUILD_HL_LIB:BOOL=TRUE
    -DHDF5_BUILD_EXAMPLES:BOOL=FALSE
    -DHDF5_ENABLE_PARALLEL:BOOL=ON
    -DHDF5_BUILD_TOOLS:BOOL=ON
    -DCMAKE_C_COMPILER:STRING=${C_COMP}
    -DCMAKE_CXX_COMPILER:STRING=${CC_COMP}
)

if (MSVC)
  # hdf5 has a bug with MSVC compiler where it doesn't realize its using MSVC
  # compiler when using nmake or ninja generators. This patch fixes that.
  add_external_project_step(patch_fix_msvc
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${SuperBuild_PROJECTS_DIR}/patches/hdf5.config.cmake.ConfigureChecks.cmake
    <SOURCE_DIR>/config/cmake/ConfigureChecks.cmake
    DEPENDEES update # do after update
    DEPENDERS patch  # do before patch
    )
endif()

if (WIN32)
  # On Windows, find_package(HDF5) with cmake 2.8.[8,9] always ends up finding
  # the dlls instead of the libs. So setting the variables explicitly for
  # dependent projects.
  add_extra_cmake_args(
    -DHDF5_C_LIBRARY:FILEPATH=${install_location}/lib/hdf5.lib
    -DHDF5_HL_LIBRARY:FILEPATH=${install_location}/lib/hdf5_hl.lib
    # This variable is for CGNS, since CGNS doesn't use standard find_package()
    # to find hdf5.
    -DHDF5_LIBRARY:FILEPATH=${install_location}/lib/hdf5.lib
    # These variables are for netcdf
    -DHDF5_LIB:FILEPATH=${install_location}/lib/hdf5.lib
    -DHDF5_HL_LIB:FILEPATH=${install_location}/lib/hdf5_hl.lib
    -DHDF5_INCLUDE_DIR:FILEPATH=${install_location}/include
    )

  # On 32-bit Windows, H5public.h ends up redefining ssize_t. This patch ensures
  # that the old definition is undef-ed before redefining it.
  if (NOT 64bit_build)
    add_external_project_step(patch_fix_h5public
     COMMAND ${CMAKE_COMMAND} -E copy_if_different
             ${SuperBuild_PROJECTS_DIR}/patches/hdf5.src.H5public.h
             <SOURCE_DIR>/src/H5public.h
     DEPENDEES update # do after update
     DEPENDERS patch  # do before patch
    )
  endif()
endif()

add_extra_cmake_args(-DVTK_USE_SYSTEM_HDF5:BOOL=ON)
