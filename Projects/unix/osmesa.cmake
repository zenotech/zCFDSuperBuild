if(BUILD_SHARED_LIBS)
  set(shared_args --enable-shared --disable-static)
  set(OSMESALIB libOSMesa.so)
else()
  set(shared_args --disable-shared --enable-static)
  set(OSMESALIB libOSMesa.a)
endif()
add_external_project_or_use_system(osmesa
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --enable-osmesa
                    --enable-glx=xlib
                    --disable-dri
                    --disable-dri3
                    --disable-driglx-direct
                    # to keep mesa from requiring LLVM
                    --disable-gallium-llvm
                    --disable-llvm
                    --disable-gbm
                    --disable-egl
                    --with-gallium-drivers=swrast
                    ${shared_args}
  BUILD_IN_SOURCE 1
)

add_extra_cmake_args(
  -DOPENGL_INCLUDE_DIR:PATH=
  -DOPENGL_xmesa_INCLUDE_DIR:PATH=
  -DOPENGL_gl_LIBRARY:FILEPATH=
  -DOPENGL_glu_LIBRARY:FILEPATH=
  -DOSMESA_INCLUDE_DIR:PATH=<INSTALL_DIR>/include
  -DOSMESA_LIBRARY:FILEPATH=<INSTALL_DIR>/lib/${OSMESALIB}
)
