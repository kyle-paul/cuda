#include <pybind11/pybind11.h>
#include "vectorAddition.h"

namespace py = pybind11;

float compute(float a, float b) {
    return a + b;
}

PYBIND11_MODULE(addition, handle) {
    handle.doc() = "This is the module docs.";
    handle.def("py_compute", &compute);
    py::class_<vectorAddition>(handle, "py_vector_addition");
}