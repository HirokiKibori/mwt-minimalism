cmake_minimum_required(VERSION 3.28)
project(c C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(c
        hello.c)
