
add_external_project(
  zcfd 
  DEPENDS  mpi parmetis boost hdf5 threadworker trilinos python paraview paraviewsdk

  #UPDATE_COMMAND git pull

  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=Release 
	#-DBUILD_CUDA:BOOL=OFF 
	-DBoost_NO_SYSTEM_PATHS:BOOL=ON 
	-DHDF5_DIR:FILEPATH=<INSTALL_DIR>/share/cmake/hdf5 
	${ZCFD_EXTRA_CMAKE_ARGS}
)

