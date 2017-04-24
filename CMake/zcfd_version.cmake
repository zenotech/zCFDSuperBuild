# We hardcode the version numbers since we cannot determine versions during
# configure stage.
set (zcfd_version_major 2017)
set (zcfd_version_minor 1)
set (zcfd_version_patch 0)
set (zcfd_version_suffix)
set (zcfd_version "${zcfd_version_major}.${zcfd_version_minor}")
set (zcfd_git_tag "v2017.1.0")
if (zcfd_version_suffix)
  set (zcfd_version_long "${zcfd_version}.${zcfd_version_patch}-${zcfd_version_suffix}")
else()
  set (zcfd_version_long "${zcfd_version}.${zcfd_version_patch}")
endif()
