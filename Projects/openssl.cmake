
add_external_project(
  openssl
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND <SOURCE_DIR>/config
                    --prefix=<INSTALL_DIR>
                    --openssldir=<INSTALL_DIR>
  #BUILD_COMMAND make
  #INSTALL_COMMAND make install
)
