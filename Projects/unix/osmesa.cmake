
if(POWER8)
add_external_project(osmesa
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --with-driver=osmesa
                    --with-gallium-drivers=
                    --enable-shared
                    --disable-static
                    --build=ppc64le
  BUILD_IN_SOURCE 1
)

# Note 
# osmesa/src/osmesa/src/mapi/mapi/u_execmem.c
# osmesa/src/mesa/main/execmem.c
# Need to add __USE_MISC before sys/mman.h
#define __USE_MISC
#include <sys/mman.h>

# Comment out fpclassify function in 
#osmesa/src/mesa/main/querymatrix.c

else()
add_external_project(osmesa
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    --prefix=<INSTALL_DIR>
                    --with-driver=osmesa
                    --with-gallium-drivers=
                    --enable-shared
                    --disable-static
  BUILD_IN_SOURCE 1
)
endif()

#add_external_project(osmesa
#  CONFIGURE_COMMAND <SOURCE_DIR>/configure
#                    --prefix=<INSTALL_DIR>
#                    --disable-shared
#                    --enable-shared
#                    --disable-static
#                    --enable-osmesa
#                    --without-x
#                    --with-gallium-drivers=
#                    --disable-dri
#                    --disable-glx
#                    --disable-egl
#  BUILD_IN_SOURCE 1
#)

add_extra_cmake_args(
  -DOPENGL_INCLUDE_DIR:PATH=<INSTALL_DIR>/include
  -DOPENGL_gl_LIBRARY:FILEPATH=
  -DOPENGL_glu_LIBRARY:FILEPATH=<INSTALL_DIR>/lib/libGLU.so
  -DVTK_OPENGL_HAS_OSMESA:BOOL=ON
  -DOSMESA_INCLUDE_DIR:PATH=<INSTALL_DIR>/include
  -DOSMESA_LIBRARY:FILEPATH=<INSTALL_DIR>/lib/libOSMesa.so
  -DVTK_USE_X:BOOL=OFF)
