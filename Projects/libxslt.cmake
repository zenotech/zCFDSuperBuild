if(BUILD_SHARED_LIBS)
  set(shared_args --enable-shared --disable-static)
else()
  set(shared_args --disable-shared --enable-static)
endif()

add_external_project_or_use_system(
  libxslt
  DEPENDS libxml2
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --with-xml-prefix=<INSTALL_DIR>
                    ${shared_args}
  BUILD_IN_SOURCE 1
)

add_external_project_step(patch_xslt_date_c
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${SuperBuild_PROJECTS_DIR}/patches/libxslt.date.c"
          "<SOURCE_DIR>/libexslt/date.c"
DEPENDEES update # do after update
DEPENDERS patch  # do before patch
)
