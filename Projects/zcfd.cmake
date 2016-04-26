
IF(ZCFD_FAST)

add_external_project(
  zcfd 
  # DEPENDS  mpi parmetis boost hdf5 threadworker trilinos python #paraview paraviewsdk

  #UPDATE_COMMAND git pull

  CMAKE_ARGS
	#-DBUILD_CUDA:BOOL=OFF 
	-DBoost_NO_SYSTEM_PATHS:BOOL=ON 
	-DHDF5_DIR:FILEPATH=<INSTALL_DIR>/share/cmake/hdf5
	-DMPI_VENDOR:STRING=${MPI_VENDOR}  
	${ZCFD_EXTRA_CMAKE_ARGS}
)

ELSE()	

add_external_project(
  zcfd 
  DEPENDS  mpi parmetis boost hdf5 threadworker trilinos python paraview paraviewsdk highorder cgns ccmio

  #UPDATE_COMMAND git pull

  CMAKE_ARGS
	#-DBUILD_CUDA:BOOL=OFF 
	-DBoost_NO_SYSTEM_PATHS:BOOL=ON 
	-DHDF5_DIR:FILEPATH=<INSTALL_DIR>/share/cmake/hdf5
	-DMPI_VENDOR:STRING=${MPI_VENDOR} 
	${ZCFD_EXTRA_CMAKE_ARGS}
)

ENDIF()