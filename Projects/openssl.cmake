
add_external_project(
  openssl
  BUILD_IN_SOURCE 1
  CONFIGURE_COMMAND <SOURCE_DIR>/config
                    --prefix=<INSTALL_DIR>
                    --openssldir=<INSTALL_DIR>
                    zlib enable-camellia enable-seed enable-rfc3779
                    enable-cms enable-md2 enable-rc5 enable-ssl3 enable-ssl3-method 
                    no-mdc2 no-ec2m no-gost no-srp 
                    shared
  #BUILD_COMMAND make
  #INSTALL_COMMAND make install
)
