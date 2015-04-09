#message(STATUS "Using system python. Pick correct python based on your deployment target")
#add_external_project_or_use_system(python)
#set(USE_SYSTEM_python TRUE CACHE BOOL "" FORCE)
# FIXME: We automate the picking of the correct python version.

message(STATUS "Building python")

set(libtype "--enable-shared")
if (CROSS_BUILD_STAGE STREQUAL "TOOLS")
  set(libtype "--enable-static --disable-shared")
endif()

append_flags(LDFLAGS "-Wl,-rpath,${install_location}/lib -L${install_location}/lib -L. -lpython2.7" PROJECT_ONLY)

add_external_project_or_use_system(python
  DEPENDS bzip2 zlib
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --enable-unicode
                    ${libtype} CC=/usr/bin/gcc CXX=/usr/bin/g++ AR=/usr/bin/ar
  )
if (NOT CROSS_BUILD_STAGE STREQUAL "CROSS")
  # Pass the -rpath flag when building python to avoid issues running the
  # executable we built.
  append_flags(LDFLAGS "-Wl,-rpath,${install_location}/lib" PROJECT_ONLY)
endif()

set (pv_python_executable "${install_location}/bin/python" CACHE INTERNAL "" FORCE)
