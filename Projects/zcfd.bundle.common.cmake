# Consolidates platform independent stub for paraview.bundle.cmake files.

include (paraview_version)
include (zcfd_version)

# Enable CPack packaging.
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY
  "zCFD - Fastest CFD Solver")
set(CPACK_PACKAGE_NAME "zCFD")
set(CPACK_PACKAGE_VENDOR "Zenotech Ltd")
set(CPACK_PACKAGE_VERSION_MAJOR ${zcfd_version_major})
set(CPACK_PACKAGE_VERSION_MINOR ${zcfd_version_minor})
if (zcfd_version_suffix)
  set(CPACK_PACKAGE_VERSION_PATCH ${zcfd_version_patch}-${zcfd_version_suffix})
else()
  set(CPACK_PACKAGE_VERSION_PATCH ${zcfd_version_patch})
endif()

set(CPACK_PACKAGE_FILE_NAME
    "${CPACK_PACKAGE_NAME}-${CPACK_PACKAGE_VERSION_MAJOR}.${CPACK_PACKAGE_VERSION_MINOR}.${CPACK_PACKAGE_VERSION_PATCH}-${package_suffix}")

# Don't import CPack yet, let the platform specific code get another chance at
# changing the variables.
# include(CPack)


