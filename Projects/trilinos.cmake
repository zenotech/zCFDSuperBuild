
set (_ext "so")
if(APPLE)
  set (_ext "dylib")

add_external_project(
  trilinos
  DEPENDS  mpi parmetis lapack #scotch

  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=Release
	-DCMAKE_C_COMPILER:FILEPATH=<INSTALL_DIR>/bin/mpicc
	-DCMAKE_CXX_COMPILER:FILEPATH=<INSTALL_DIR>/bin/mpicxx
	-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
	-DBUILD_SHARED_LIBS:BOOL=ON
	-DTPL_ENABLE_MPI:BOOL=ON
	-DTPL_ENABLE_Scotch:BOOL=OFF
	-DTPL_ENABLE_ParMETIS:BOOL=ON
	-DTPL_METIS_LIBRARIES:FILEPATH=<INSTALL_DIR>/lib/libmetis.${_ext}
	-DTPL_METIS_INCLUDE_DIRS:PATH=<INSTALL_DIR>/include
	-DTPL_ParMETIS_LIBRARIES:STRING=${install_location}/lib/libparmetis.${_ext}-+-${install_location}/lib/libmetis.${_ext}
	-DTPL_Scotch_INCLUDE_DIRS:PATH=<INSTALL_DIR>/include
	-DTPL_Scotch_LIBRARIES:STRING=<INSTALL_DIR>/lib/libscotch.a;<INSTALL_DIR>/lib/libscotcherr.a;<INSTALL_DIR>/lib/libptscotch.a;<INSTALL_DIR>/lib/libptscotcherr.a
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
	-DZoltan_ENABLE_ULLONG_IDS:BOOL=ON
        -DEpetraExt_BUILD_GRAPH_REORDERING:BOOL=ON

)

else()

set(_CRAYPE_ROOT "$ENV{CRAYPE_DIR}")
if(NOT _CRAYPE_ROOT)

add_external_project(
  trilinos
  DEPENDS  mpi parmetis lapack #scotch

  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=Release
	-DCMAKE_C_COMPILER:FILEPATH=mpicc
	-DCMAKE_CXX_COMPILER:FILEPATH=mpicxx
	-DBUILD_SHARED_LIBS:BOOL=ON
	-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
	-DTPL_ENABLE_MPI:BOOL=ON
	-DTPL_ENABLE_Scotch:BOOL=OFF
	-DTPL_ENABLE_ParMETIS:BOOL=ON
	-DTPL_METIS_LIBRARIES:FILEPATH=<INSTALL_DIR>/lib/libmetis.${_ext}
	-DTPL_METIS_INCLUDE_DIRS:PATH=<INSTALL_DIR>/include
	-DTPL_ParMETIS_LIBRARIES:STRING=${install_location}/lib/libparmetis.${_ext}-+-${install_location}/lib/libmetis.${_ext}
	-DTPL_Scotch_INCLUDE_DIRS:PATH=<INSTALL_DIR>/include
	-DTPL_Scotch_LIBRARIES:STRING=<INSTALL_DIR>/lib/libscotch.a;<INSTALL_DIR>/lib/libscotcherr.a;<INSTALL_DIR>/lib/libptscotch.a;<INSTALL_DIR>/lib/libptscotcherr.a
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
	-DZoltan_ENABLE_ULLONG_IDS:BOOL=ON
	-DEpetraExt_BUILD_GRAPH_REORDERING:BOOL=ON

)
else()

# Cray
add_external_project(
  trilinos
  DEPENDS  mpi parmetis lapack #scotch

  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=Release
	-DCMAKE_C_COMPILER:FILEPATH=cc
	-DCMAKE_CXX_COMPILER:FILEPATH=CC
	-DBUILD_SHARED_LIBS:BOOL=ON
	-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
	-DTPL_ENABLE_MPI:BOOL=ON
	-DTPL_ENABLE_Scotch:BOOL=OFF
	-DTPL_ENABLE_ParMETIS:BOOL=ON
	-DTPL_METIS_LIBRARIES:FILEPATH=<INSTALL_DIR>/lib/libmetis.${_ext}
	-DTPL_METIS_INCLUDE_DIRS:PATH=<INSTALL_DIR>/include
	-DTPL_ParMETIS_LIBRARIES:STRING=${install_location}/lib/libparmetis.${_ext}-+-${install_location}/lib/libmetis.${_ext}
	-DTPL_Scotch_INCLUDE_DIRS:PATH=<INSTALL_DIR>/include
	-DTPL_Scotch_LIBRARIES:STRING=<INSTALL_DIR>/lib/libscotch.a;<INSTALL_DIR>/lib/libscotcherr.a;<INSTALL_DIR>/lib/libptscotch.a;<INSTALL_DIR>/lib/libptscotcherr.a
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
	-DZoltan_ENABLE_ULLONG_IDS:BOOL=ON
	-DEpetraExt_BUILD_GRAPH_REORDERING:BOOL=ON
    -DTPL_BLAS_LIBRARIES:FILEPATH=${BLAS_LIBRARIES}
    -DBLAS_LIBRARY_DIRS:PATH=${BLAS_LIBRARY_DIRS}
    -DTPL_LAPACK_LIBRARIES:FILEPATH=${LAPACK_LIBRARIES}
    -DLAPACK_LIBRARY_DIRS:PATH=${LAPACK_LIBRARY_DIRS}
)

endif()

endif()
