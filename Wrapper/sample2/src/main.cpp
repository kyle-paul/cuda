#include <pybind11/pybind11.h>
#include "vectorAddition.h"

namespace py = pybind11;

float compute(float a, float b) {
    return a + b;
}

void looping() {
    int temp = 0;
    for (int i=0; i<4096; i++) {
        for (int j=0; j<4096; j++) {
            temp = 10;
        }
    }
}

PYBIND11_MODULE(addition, handle) {
    handle.doc() = "This is the module docs.";
    handle.def("py_compute", &compute);
    handle.def("py_looping", &looping);
    py::class_<vectorAddition>(handle, "py_vector_addition")
        .def(py::init<>())
        .def("multiply", &vectorAddition::multiply);
}