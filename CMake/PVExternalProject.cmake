# Extends ExternalProject_Add(...) by adding a new option.
#  PROCESS_ENVIRONMENT <environment variables>
# When present the BUILD_COMMAND and CONFIGURE_COMMAND are executed as a
# sub-process (using execute_process()) so that the sepecified environment
# is passed on to the executed command (which does not happen by default).
# This will be deprecated once CMake starts supporting it.

include(ExternalProject)

string(REPLACE ")" "|PROCESS_ENVIRONMENT)"
  _ep_keywords_PVExternalProject_Add "${_ep_keywords_ExternalProject_Add}")

function (PVExternalProject_Add name)
  # process arguments are detect USE_ENVIRONMENT, BUILD_COMMAND and
  # CONFIGURE_COMMAND.

  # just create a temporary target so we can set target properties.
  add_custom_target(pv-${name})
  _ep_parse_arguments(PVExternalProject_Add pv-${name} _EP_ "${ARGN}")

  get_property(has_process_environment TARGET pv-${name}
    PROPERTY _EP_PROCESS_ENVIRONMENT SET)
  if (NOT has_process_environment)
    ExternalProject_Add(${name} ${new_argn})
    return()
  endif()


  # check if we have a BUILD_COMMAND or CONFIGURE_COMMAND. 
  get_property(has_build_command TARGET pv-${name}
    PROPERTY _EP_BUILD_COMMAND SET)
  get_property(has_configure_command TARGET pv-${name}
    PROPERTY _EP_CONFIGURE_COMMAND SET)

  set (new_argn)
  if (has_configure_command)
    set(new_argn ${new_argn}
      CONFIGURE_COMMAND
      ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/pv-${name}-configure.cmake)
  endif()

  if (has_build_command)
    set(new_argn ${new_argn}
      BUILD_COMMAND 
      ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_BINARY_DIR}/pv-${name}-build.cmake)
  endif()

  # now strip PROCESS_ENVIRONMENT from argments.
  set (skip FALSE)
  foreach(arg IN LISTS ARGN)
    if (arg MATCHES "${_ep_keywords_PVExternalProject_Add}")
      if (arg MATCHES "^(PROCESS_ENVIRONMENT|BUILD_COMMAND|CONFIGURE_COMMAND)$")
        set (skip TRUE)
      else()
        set (skip FALSE)
      endif ()
    endif()
    if (NOT skip)
      list(APPEND new_argn ${arg})
    endif()
  endforeach()
  ExternalProject_Add(${name} ${new_argn})

  # configure the scripts after the call ExternalProject_Add() since that sets
  # up the directories correctly.
  get_target_property(process_environment pv-${name}
    _EP_PROCESS_ENVIRONMENT)
  _ep_replace_location_tags(${name} process_environment)

  if (has_configure_command)
    get_target_property(step_command pv-${name} _EP_CONFIGURE_COMMAND)
    _ep_replace_location_tags(${name} step_command)
    configure_file(${CMAKE_CURRENT_LIST_DIR}/pep_configure.cmake.in
      ${CMAKE_CURRENT_BINARY_DIR}/pv-${name}-configure.cmake
      @ONLY)
  endif()

  if (has_build_command)
    get_target_property(step_command pv-${name} _EP_BUILD_COMMAND)
    _ep_replace_location_tags(${name} step_command)
    configure_file(${CMAKE_CURRENT_LIST_DIR}/pep_configure.cmake.in
      ${CMAKE_CURRENT_BINARY_DIR}/pv-${name}-build.cmake
      @ONLY)
  endif()
endfunction()
