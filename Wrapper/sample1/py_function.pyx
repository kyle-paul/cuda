cdef extern from "function.h":
    void function(const char *name)

def py_function(name: bytes) -> None:
    function(name)