if(WIN32)
 message(FATAL_ERROR "GenericIO is not supported on Windows!")
 return()
endif()

if(BUILD_SHARED_LIBS)
  set(lib_suffix ${CMAKE_SHARED_LIBRARY_SUFFIX})
else()
  set(lib_suffix ${CMAKE_STATIC_LIBRARY_SUFFIX})
endif()

add_external_project(genericio
    DEPENDS mpi
    CMAKE_ARGS
        -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
        -DBUILD_TESTING:BOOL=OFF
        -DBUILD_PROGRAMS:BOOL=OFF
    INSTALL_COMMAND
        ${CMAKE_COMMAND} -E copy <BINARY_DIR>/libGenericIO${lib_suffix} <INSTALL_DIR>/lib
)


# Any project that depends on cosmotools inherits the following cmake args
add_extra_cmake_args(
    -DGENERIC_IO_INCLUDE_DIR:PATH=${SuperBuild_BINARY_DIR}/genericio/src/genericio
    -DGENERIC_IO_LIBRARIES:PATH=${SuperBuild_BINARY_DIR}/genericio/src/genericio-build/libGenericIO${lib_suffix}
)
