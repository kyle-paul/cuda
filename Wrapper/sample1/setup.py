from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

compute_extension = Extension(
    name="py_function",
    sources=["py_function.pyx"],
    libraries=["function"],
    library_dirs=["lib"],
    include_dirs=["lib"]
)

setup (
    name="py_function",
    ext_modules=cythonize([compute_extension])
)