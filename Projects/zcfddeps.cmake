
add_external_project(
  zcfddeps 
  DEPENDS  mpi parmetis boost hdf5 threadworker trilinos python paraview paraviewsdk cgns ccmio qt4

  DOWNLOAD_COMMAND ""
  SOURCE_DIR "../zCFDSuperBuild/zcfddeps"
)
