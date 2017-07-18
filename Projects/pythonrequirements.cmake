
add_external_project(
  pythonrequirements
  DEPENDS  python mpi hdf5 netcdf netcdfcpp libffi libsodium lapack freetype

  DOWNLOAD_COMMAND ""
  SOURCE_DIR "../zCFDSuperBuild/python-requirements"
  CONFIGURE_COMMAND ""
  BUILD_COMMAND "bash -c \"cd <SOURCE_DIR> && export PREFIX=<INSTALL_DIR> && bash install.sh\""
  INSTALL_COMMAND ""
)
