add_external_project_or_use_system(
  extrae
  DEPENDS libunwind mpi papi
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --without-mpi
                    --without-dyninst
                    --enable-openmp
                    --enable-openmp-intel
                    --with-libgomp-version=4.9
                    --enable-posix-clock
                    --with-unwind=<INSTALL_DIR>
                    --with-papi=<INSTALL_DIR>
                    CC=icc CXX=icpc
)
