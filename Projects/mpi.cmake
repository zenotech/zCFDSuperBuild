
SET(MPI_EXTRA_CMDS "")
# Check for presense of hcoll and fca
SET(HCOLL_FOUND "FALSE")
execute_process(COMMAND "if [ -d /opt/mellanox/hcoll ]; then echo TRUE; else echo FALSE fi;" OUTPUT_VARIABLE HCOLL_FOUND)
IF( HCOLL_FOUND STREQUAL "TRUE")
  SET(MPI_EXTRA_CMDS "${MPI_EXTRA_CMDS} --with-hcoll=/opt/mellanox/hcoll")
ENDIF()
if(NOT POWER8)
  # Check for presense of hcoll and fca
  SET(FCA_FOUND "FALSE")
  execute_process(COMMAND "if [ -d /opt/mellanox/fca ]; then echo TRUE; else echo FALSE fi;" OUTPUT_VARIABLE FCA_FOUND)
  IF( FCA_FOUND STREQUAL "TRUE")
    SET(MPI_EXTRA_CMDS "${MPI_EXTRA_CMDS} --with-fca=/opt/mellanox/fca")
  ENDIF()
endif()
SET(MXM_FOUND "FALSE")
execute_process(COMMAND "if [ -d /opt/mellanox/mxm ]; then echo TRUE; else echo FALSE fi;" OUTPUT_VARIABLE MXM_FOUND)
IF( MXM_FOUND STREQUAL "TRUE")
  SET(MPI_EXTRA_CMDS "${MPI_EXTRA_CMDS} --with-mxm=/opt/mellanox/mxm")
ENDIF()
#SET(KNEM_FOUND "FALSE")
#execute_process(COMMAND "if [ -d \"$(find /opt -maxdepth 1 -type d -name \"knem*\" -print0)\" ] ; then echo TRUE; else echo FALSE fi;" OUTPUT_VARIABLE KNEM_FOUND)
#IF( KNEM_FOUND STREQUAL "TRUE")
#  SET(MPI_EXTRA_CMDS "${MPI_EXTRA_CMDS} --with-fca=/opt/mellanox/mxm")
#ENDIF()

IF(APPLE)
  add_external_project_or_use_system(mpi
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --enable-shared
                    --disable-static
                    --disable-vt
                    --enable-mpi-thread-multiple
                    --with-sge
                    --disable-mpi-interface-warning
                    --enable-mpirun-prefix-by-default
)

elseif(POWER8)

  add_external_project_or_use_system(mpi
      CONFIGURE_COMMAND <SOURCE_DIR>/configure
                        --prefix=<INSTALL_DIR>
                        --enable-threads=runtime
                        ${MPI_EXTRA_CMDS}
      # PVExternalProject_Add sets up an parallel build, by default.
      # that doesn't work for the version of MPICH2 we're using.
      #BUILD_COMMAND ${CMAKE_MAKE_PROGRAM}
      BUILD_IN_SOURCE 1
  )
  if(NOT USE_SYSTEM_mpi)
    set(MPI_C_COMPILER <INSTALL_DIR>/bin/mpicc)
    set(MPI_CXX_COMPILER <INSTALL_DIR>/bin/mpic++)
  endif()

ELSE()

  if(BUILD_SHARED_LIBS)
    set(shared_args --enable-shared --disable-static)
  else()
    set(shared_args --disable-shared --enable-static)
  endif()

  add_external_project_or_use_system(mpi
    CONFIGURE_COMMAND <SOURCE_DIR>/configure
                      --prefix=<INSTALL_DIR>
                      ${shared_args}
                      --enable-mpi-thread-multiple
                      --with-sge
                      --disable-vt
                      --disable-mpi-interface-warning
                      --enable-mpirun-prefix-by-default
                      --with-openib
                      --with-verbs
                      ${MPI_EXTRA_CMDS}

    # PVExternalProject_Add sets up an parallel build, by default.
    # that doesn't work for the version of MPICH2 we're using.
    #BUILD_COMMAND ${CMAKE_MAKE_PROGRAM}
    BUILD_IN_SOURCE 1
    )

  if(NOT USE_SYSTEM_mpi)
    set(MPI_C_COMPILER <INSTALL_DIR>/bin/mpicc)
    set(MPI_CXX_COMPILER <INSTALL_DIR>/bin/mpic++)
  endif()

ENDIF()
