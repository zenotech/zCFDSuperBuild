set (extra_commands)

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  #set the platform to be clang if on apple and not gcc
  set(extra_commands --with-toolset=clang)
endif()

if(BOOST_INTEL_TOOLSET)
  set(extra_commands --with-toolset=intel-linux)
endif()

add_external_project(boost
  DEPENDS zlib bzip2 python
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND
    <SOURCE_DIR>/bootstrap.sh --prefix=<INSTALL_DIR>
                              --with-python=<INSTALL_DIR>/bin/python
                              ${extra_commands}
  BUILD_COMMAND <SOURCE_DIR>/bjam -j${MAKE_PARALLEL}
  INSTALL_COMMAND <SOURCE_DIR>/bjam --prefix=<INSTALL_DIR> install
)
unset(extra_commands)
