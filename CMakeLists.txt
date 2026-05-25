cmake_minimum_required(VERSION 3.31)
project(hello Fortran)
add_executable(hello hello.f90)

enable_testing()
add_test(NAME hello_test
         COMMAND hello)
set_tests_properties(hello_test PROPERTIES
    PASS_REGULAR_EXPRESSION "Hello, World!")
