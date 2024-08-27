#include <cassert>
#include <cstdlib>
#include <iostream>

#define MASK_DIM 3
#define MASK_OFFSET (MASK_DIM / 2)

__constant__ int mask[3 * 3];

void init_matrix(int *matrix, int &N) {
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            matrix[i * N + j] = rand() % 10;
        }
    }
}

void print(int *matrix, int &N) {
    for (int i=0; i < N*N; i++) {
        std::cout << matrix[i] << " ";
        if ((i + 1) % N == 0) std::cout << "\n";
    }
}

int main() {
    int N = 10;
    size_t bytes = N * N * sizeof(int);

    int *matrix = new int[N * N];
    int *output = new int[N * N];
    init_matrix(matrix, N);

    
}