
add_external_project(
  trilinos
  DEPENDS  mpi parmetis scotch lapack

  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=Release
	-DCMAKE_C_COMPILER:FILEPATH=mpicc
	-DCMAKE_CXX_COMPILER:FILEPATH=mpicxx
	-DBUILD_SHARED_LIBS:BOOL=ON
	-DTPL_ENABLE_MPI:BOOL=ON
	-DTPL_ENABLE_Scotch:BOOL=ON
	-DTPL_ENABLE_ParMETIS:BOOL=ON
	-DTPL_METIS_LIBRARIES:FILEPATH=<INSTALL_DIR>/lib/libmetis.so
	-DTPL_METIS_INCLUDE_DIRS:PATH=<INSTALL_DIR>/include
	-DTPL_ParMETIS_LIBRARIES:FILEPATH="<INSTALL_DIR>/lib/libparmetis.so;<INSTALL_DIR>/lib/libmetis.so"
	-DTPL_Scotch_INCLUDE_DIRS:PATH="<INSTALL_DIR>/include"
	-DTPL_Scotch_LIBRARIES:FILEPATH="<INSTALL_DIR>/lib/libscotch.a;<INSTALL_DIR>/lib/libscotcherr.a;<INSTALL_DIR>/lib/libptscotch.a;<INSTALL_DIR>/lib/libptscotcherr.a"
	-DTPL_BLAS_LIBRARIES:FILEPATH="<INSTALL_DIR>/lib/libblas.so" 
	-DTPL_LAPACK_LIBRARIES:FILEPATH="<INSTALL_DIR>/lib/liblapack.so" 
	-DTrilinos_ENABLE_Zoltan:BOOL=ON 
	-DTrilinos_ENABLE_AztecOO:BOOL=ON 
	-DTrilinos_ENABLE_Epetra:BOOL=ON 
	-DEpetra_ENABLE_Fortran:BOOL=OFF 
	-DTrilinos_ENABLE_Fortran:BOOL=OFF 
	-DTrilinos_ENABLE_Kokkos:BOOL=ON 
	-DTrilinos_ENABLE_Teuchos:BOOL=ON 
	-DTrilinos_ENABLE_Tpetra:BOOL=ON 
	-DTrilinos_ENABLE_Ifpack:BOOL=ON 
	-DTrilinos_ENABLE_Belos:BOOL=ON 
	-DTrilinos_ENABLE_Anasazi:BOOL=ON 
	-DTrilinos_ENABLE_ML:BOOL=ON 
	-DEpetraExt_BUILD_GRAPH_REORDERING:BOOL=ON 

)

