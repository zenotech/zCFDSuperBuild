add_external_project_or_use_system(
  libsodium
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
  BUILD_IN_SOURCE 1
)
