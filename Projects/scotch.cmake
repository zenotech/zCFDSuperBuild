
add_external_project(
  scotch
  DEPENDS  mpi

BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND
    cd src && cp Make.inc/Makefile.inc.x86-64_pc_linux2 ./Makefile.inc

  BUILD_COMMAND cd src && make ptscotch
  INSTALL_COMMAND cd src && export prefix=<INSTALL_DIR> && make install
)
