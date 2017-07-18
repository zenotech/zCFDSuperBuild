add_external_project_or_use_system(
  extrae
  DEPENDS libunwind papi
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --without-mpi --without-dyninst --enable-openmp --enable-posix-clock
                    --with-unwind=<INSTALL_DIR>
                    --with-papi=<INSTALL_DIR>
)
