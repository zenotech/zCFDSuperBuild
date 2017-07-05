
add_external_project(
  pythonrequirements 
  DEPENDS  python mpi

  DOWNLOAD_COMMAND ""
  SOURCE_DIR "../zCFDSuperBuild/python-requirements"
  CONFIGURE_COMMAND ""
  BUILD_COMMAND cd <SOURCE_DIR> && export prefix=<INSTALL_DIR> && bash install.sh
)
