LIB_DIR = lib

default: py_function

py_function: setup.py py_function.pyx $(LIB_DIR)/libfunction.a
	python3 setup.py build_ext --inplace && rm -f py_function.c && rm -Rf build

$(LIB_DIR)/libfunction.a:
	make -C $(LIB_DIR) libfunction.a

clean:
	rm *.so