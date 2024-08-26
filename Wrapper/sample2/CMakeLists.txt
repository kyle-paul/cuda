cmake_minimum_required(VERSION 3.4)

project(pybind_wrapper)
add_subdirectory(pybind11)
pybind11_add_module(
    addition 
    src/main.cpp
    src/vectorAddition.cpp
)