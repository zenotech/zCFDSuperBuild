set (extra_commands)
set(bjam_extra_commands)

if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  #set the platform to be clang if on apple and not gcc
  set(extra_commands --with-toolset=clang)
  set(bjam_extra_commands toolset=clang linkflags="-Wl,-rpath,${install_location}/lib")
endif()

if(BOOST_INTEL_TOOLSET)
  if(APPLE)
    set(extra_commands --with-toolset=intel-darwin)
    set(bjam_extra_commands toolset=intel-darwin)
    set(extra_commands --with-toolset=clang)
    set(bjam_extra_commands toolset=clang linkflags="-Wl,-rpath,${install_location}/lib")
  else()
    set(extra_commands --with-toolset=intel-linux)
    set(bjam_extra_commands toolset=intel-linux)
  endif()
endif()

if(BUILD_SHARED_LIBS)
  list(APPEND bjam_extra_commands link=shared)
else()
  list(APPEND bjam_extra_commands link=static)
endif()

add_external_project_or_use_system(boost
  DEPENDS zlib bzip2 python
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND
    <SOURCE_DIR>/bootstrap.sh --prefix=<INSTALL_DIR>
                              --with-python=<INSTALL_DIR>/bin/python
  #                            --with-libraries=date_time,thread,system
                              ${extra_commands}
  BUILD_COMMAND <SOURCE_DIR>/bjam -j${PV_MAKE_NCPUS} ${bjam_extra_commands}
  INSTALL_COMMAND <SOURCE_DIR>/bjam --prefix=<INSTALL_DIR> install
)
unset(extra_commands)
