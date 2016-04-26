# Consolidates platform independent stub for paraview.bundle.cmake files.

#include (paraview_version)
include (zcfd_version)

# Enable CPack packaging.
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY
  "zCFD - Fastest CFD Solver")
if(NOT DEFINED CPACK_PACKAGE_NAME)
	set(CPACK_PACKAGE_NAME "zCFD")
endif()
set(CPACK_PACKAGE_VENDOR "Zenotech Ltd")
set(CPACK_PACKAGE_VERSION_MAJOR ${zcfd_version_major})
set(CPACK_PACKAGE_VERSION_MINOR ${zcfd_version_minor})
if (zcfd_version_suffix)
  set(CPACK_PACKAGE_VERSION_PATCH ${zcfd_version_patch}-${zcfd_version_suffix})
else()
  set(CPACK_PACKAGE_VERSION_PATCH ${zcfd_version_patch})
endif()

set(CPACK_PACKAGE_FILE_NAME
  "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}-${PACKAGE_SUFFIX}")

# set the license file.
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_LIST_DIR}/paraview.license.txt")

if (CMAKE_CL_64)
  # Change default installation root path for Windows x64
  set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES64")
endif()

# Don't import CPack yet, let the platform specific code get another chance at
# changing the variables.
# include(CPack)


