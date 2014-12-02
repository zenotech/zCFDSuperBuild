# zlib supports cmake. the only problem is that we need to remove the zconf.h
# file.
add_external_project_or_use_system(
  bzip2
  )
#-------------------------------------------------------
# bzip2 needs a fix for '--version-script' linker option. The option needs to be
# removed on Macs. The fix to CMakeLists.txt works for all OSs.
add_external_project_step(patch_bzip2_cmakelists
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${SuperBuild_PROJECTS_DIR}/patches/bzip2.CMakeLists.txt"
          "<SOURCE_DIR>/CMakeLists.txt"
DEPENDEES update # do after update
DEPENDERS patch  # do before patch
)
