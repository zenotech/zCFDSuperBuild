
add_external_project(
  libxsmm
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND sed -i -e "s/cp\\\\ -v/cp\\\\ -uv/g" <SOURCE_DIR>/Makefile
  BUILD_COMMAND make STATIC=0 PREFIX=<INSTALL_DIR> -j${PV_MAKE_NCPUS}
  INSTALL_COMMAND make STATIC=0 PREFIX=<INSTALL_DIR> -j${PV_MAKE_NCPUS} install
)

