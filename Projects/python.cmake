if (APPLE)
  message(FATAL_ERROR "ABORT")
endif()

if(BUILD_SHARED_LIBS)
  set(shared_args --enable-shared --disable-static)
else()
  set(shared_args --disable-shared --enable-static)
endif()

# Note always build python with gcc as disutils tries to
# detect the compiler to set appropriate flags for native
# code compilation when installing python packages

add_external_project_or_use_system(python
  DEPENDS bzip2 zlib png openssl
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --enable-unicode
                    CC=gcc CXX=g++ FC=gfortran
                    ${shared_args}
  )
if (NOT CROSS_BUILD_STAGE STREQUAL "CROSS")
  # Pass the -rpath flag when building python to avoid issues running the
  # executable we built.
  append_flags(LDFLAGS "-L${install_location}/lib64 -Wl,-rpath,${install_location}/lib -Wl,-rpath,${install_location}/lib64" PROJECT_ONLY)
  append_flags(CPPFLAGS "-I${install_location}/include -I${install_location}/include/openssl" PROJECT_ONLY)
endif()

set (pv_python_executable "${install_location}/bin/python" CACHE INTERNAL "" FORCE)

add_extra_cmake_args(
  -DVTK_PYTHON_VERSION=2.7
)
