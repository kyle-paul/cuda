CC = gcc

default: libfunction.a

libfunction.a: function.o
	ar rcs $@ $^

function.o: function.c function.h
	$(CC) -c function.c -o function.o

clean:
	rm -f *.o *.a
