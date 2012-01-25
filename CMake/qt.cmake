add_external_project(
  qt
  DEPENDS zlib png freetype fontconfig
  CONFIGURE_COMMAND <SOURCE_DIR>/configure
                    -prefix <INSTALL_DIR>
                    -confirm-license
                    -no-audio-backend
                    -no-dbus
                    -nomake demos
                    -nomake examples
                    -no-multimedia
                    -no-openssl
                    -no-phonon
                    -no-xinerama
                    -opensource
                    -qt-libjpeg
                    -qt-libtiff
                    -system-libpng
                    -system-zlib
                    -webkit
                    -xmlpatterns
                    -I <INSTALL_DIR>/include
                    -I <INSTALL_DIR>/include/freetype2
                    -I <INSTALL_DIR>/include/fontconfig
                    -L <INSTALL_DIR>/lib
)

# if qt build fails due to missing QtCLucene, then simply restart make with
# LD_LIBRARY_PATH set to include the <BINARY_DIR>/lib.
