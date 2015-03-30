add_external_project_or_use_system(mpi
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --enable-shared
                    --disable-static
                    --enable-mpi-thread-multiple
                    --with-sge
                    --disable-mpi-interface-warning
                    --enable-mpirun-prefix-by-default
                    #--with-openib
                    #--with-verbs
                    #--with-hcoll=/opt/mellanox/hcoll 
                    #--with-fca=/opt/mellanox/fca  
                    #--with-mxm=/opt/mellanox/mxm  
                    #--with-knem=$(find /opt -maxdepth 1 -type d -name "knem*" -print0)


  # PVExternalProject_Add sets up an parallel build, by default.
  # that doesn't work for the version of MPICH2 we're using.
  #BUILD_COMMAND ${CMAKE_MAKE_PROGRAM}
  BUILD_IN_SOURCE 1
)
