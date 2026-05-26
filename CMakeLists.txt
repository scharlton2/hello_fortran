cmake_minimum_required(VERSION 3.31)
project(hello Fortran)

# check for openmp
option(HELLO_USE_OPENMP "Use OpenMP" OFF)
if (HELLO_USE_OPENMP)
  find_package(OpenMP REQUIRED)
endif()

add_executable(hello hello.f90)

if (HELLO_USE_OPENMP)
  target_link_libraries(hello PRIVATE OpenMP::OpenMP_Fortran)
endif()

enable_testing()
add_test(NAME hello_test
         COMMAND hello)

if (HELLO_USE_OPENMP)
  set_tests_properties(hello_test PROPERTIES
      PASS_REGULAR_EXPRESSION "OpenMP enabled")
else()
  set_tests_properties(hello_test PROPERTIES
      PASS_REGULAR_EXPRESSION "OpenMP not enabled")
endif()