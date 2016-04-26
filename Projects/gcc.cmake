

add_external_project(
  gcc
  CONFIGURE_COMMAND "<SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --enable-languages=c,c++,fortran

)

