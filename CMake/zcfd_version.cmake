# We hardcode the version numbers since we cannot determine versions during
# configure stage.
set (zcfd_version_major 0)
set (zcfd_version_minor 2)
set (zcfd_version_patch 0)
set (zcfd_version_suffix)
set (zcfd_version "${zcfd_version_major}.${zcfd_version_minor}")
set (zcfd_git_tag "poly")
if (zcfd_version_suffix)
  set (zcfd_version_long "${zcfd_version}.${zcfd_version_patch}-${zcfd_version_suffix}")
else()
  set (zcfd_version_long "${zcfd_version}.${zcfd_version_patch}")
endif()