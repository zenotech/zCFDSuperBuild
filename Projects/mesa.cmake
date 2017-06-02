if(BUILD_SHARED_LIBS)
  set(shared_args --enable-shared --disable-static)
else()
  set(shared_args --disable-shared --enable-static)
endif()

add_external_project(mesa
    CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    ${shared_args}
                    --enable-texture-float
                    --enable-glx=xlib
                    --disable-dri
                    --disable-dri3
                    --disable-driglx-direct
                    # to keep mesa from requiring LLVM
                    --disable-gallium-llvm
                    --with-gallium-drivers=swrast
  BUILD_IN_SOURCE 1
)
