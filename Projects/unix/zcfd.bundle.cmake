# script to "bundle" zcfd.


include(zcfd.bundle.common)
include(CPack)

# install all ParaView's shared libraries.
install(DIRECTORY "${install_location}/lib/paraview-${pv_version}"
  DESTINATION "lib"
  USE_SOURCE_PERMISSIONS
  COMPONENT superbuild)

# install python
if (python_ENABLED AND NOT USE_SYSTEM_python)
  install(DIRECTORY "${install_location}/lib/python2.7"
    DESTINATION "lib/paraview-${pv_version}/lib"
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild)
  # install pyconfig.h
  install (DIRECTORY "${install_location}/include/python2.7"
    DESTINATION "lib/paraview-${pv_version}/include"
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild
    PATTERN "pyconfig.h")

  install (DIRECTORY "${install_location}/include/python2.7"
    DESTINATION "include"
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild
    PATTERN "pyconfig.h")

endif()

# install library dependencies for various executables.
# the dependencies are searched only under the <install_location> and hence
# system libraries are not packaged.
set (reference_executable pvserver)
if (python_ENABLED)
  set (reference_executable pvbatch)
endif()


install(CODE
  "execute_process(COMMAND
    ${CMAKE_COMMAND}
      -Dexecutable:PATH=${install_location}/lib/paraview-${pv_version}/${reference_executable}
      -Ddependencies_root:PATH=${install_location}
      -Dtarget_root:PATH=\${CMAKE_INSTALL_PREFIX}/lib/paraview-${pv_version}
      -Dpv_version:STRING=${pv_version}
      -P ${CMAKE_CURRENT_LIST_DIR}/install_dependencies.cmake)"
  COMPONENT superbuild)

# simply other miscellaneous dependencies.

# install executables
set (executables pvserver pvdataserver pvrenderserver)
if (python_ENABLED)
  set (executables ${executables} pvbatch pvpython)
  # we are not building pvblot for now. Disable it.
  # set (executables ${executables} pvblot)
endif()

foreach(executable ${executables})
  install(PROGRAMS "${install_location}/bin/${executable}"
    DESTINATION "bin"
    COMPONENT superbuild)
endforeach()

if (mpi_ENABLED AND NOT USE_SYSTEM_mpi)
#  install(PROGRAMS "${install_location}/bin/mpiexec.hydra"
#    DESTINATION "lib/paraview-${pv_version}"
#    COMPONENT superbuild
#    RENAME "mpiexec")
#  foreach (hydra_exe hydra_nameserver hydra_persist hydra_pmi_proxy)
#    install(PROGRAMS "${install_location}/bin/${hydra_exe}"
#      DESTINATION "lib/paraview-${pv_version}"
#      COMPONENT superbuild)
#  endforeach()

  # install MPI executables (the dlls are already installed by a previous rule).
  install(DIRECTORY "${install_location}/bin/"
        DESTINATION "bin"
        USE_SOURCE_PERMISSIONS
        COMPONENT superbuild
        FILES_MATCHING
          PATTERN "mpiexec"
          PATTERN "mpirun"
          PATTERN "ompi*"
          PATTERN "opal*"
          PATTERN "orte*"
        )
  if(MPIVENDOR MATCHES "^OPENMPI")
    # install the mpi configuration files needed for mpiexec.
    install(DIRECTORY "${install_location}/share/openmpi"
            DESTINATION "share"
            USE_SOURCE_PERMISSIONS
            COMPONENT ParaView)
  endif()
  install(DIRECTORY "${install_location}/etc/"
          DESTINATION "etc"
          USE_SOURCE_PERMISSIONS
          COMPONENT ParaView)
endif()


# Add ParaViewWeb www directory if available
if(python_ENABLED)
  install(DIRECTORY "${install_location}/share/paraview-${pv_version}/www"
    DESTINATION "share/paraview-${pv_version}"
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild)
endif()

# Install etc
install(DIRECTORY "${install_location}/share/"
    DESTINATION "share"
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild)

# Install bin
install(DIRECTORY "${install_location}/bin/"
    DESTINATION "bin"
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild)

# Install lib
install(DIRECTORY "${install_location}/lib/"
    DESTINATION "lib"
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild)

# Install lib
install(DIRECTORY "${install_location}/lib64/"
    DESTINATION "lib"
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild)

# Install intel 
install(DIRECTORY "${install_location}/intel"
    DESTINATION "."
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild)

# Install lic
install(DIRECTORY "${install_location}/lic"
    DESTINATION "."
    USE_SOURCE_PERMISSIONS
    COMPONENT superbuild)


