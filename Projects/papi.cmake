add_external_project_or_use_system(
  papi
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND "bash -c \"cd src && ./configure --prefix=<INSTALL_DIR> CC=gcc\""
  BUILD_COMMAND "bash -c \"cd src && make CC=gcc\""
  INSTALL_COMMAND cd src && export prefix=<INSTALL_DIR> && make install
)
