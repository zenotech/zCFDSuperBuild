add_external_project_or_use_system(netcdfcpp
  DEPENDS netcdf

  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR> 

)
