
add_external_project(
  threadworker

  DEPENDS boost

  CMAKE_ARGS
    -DCMAKE_BUILD_TYPE:STRING=Release ${CMAKE_EXTRA_ARGS}
)

