#include <algorithm>
#include <vector>
#include <cassert>
#include <cstdlib>
#include <iostream>

// 1D convolution kernel
__global__ void convolution_1D(int *array, int *conv, int *res, int n, int m) {
    
    // Global threadid calculation
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate radius of the mask
    int radius = m / 2;

    // Calculate the starting point for the element;
    int start = tid - radius;

    // Temp value for calculation
    int temp = 0;

    // temp value for the calculation
    for (int j=0; j < m; j++) {
        if ((start + j >= 0) && (start + j < n)) {
            // accumulate result
            temp += array[start + j] * conv[j];
        }
    }
    res[tid] = temp;    
}

void verify_results(int *array, int *conv, int *res, int n, int m) {
    int radius = m / 2;
    int temp;
    int start;

    for (int i=0; i < n; i++) {
        start = i - radius;
        temp = 0;
        for (int j=0; j < m; j++) {
            if ((start + j >= 0) && (start + j < n)) 
                temp += array[start + j] * conv[j];
        }
        assert(temp == res[i]);
    }
}


int main() {
    
    // Number of elements in result array
    int n = 1 << 3;

    // Size of the array in bytes
    int bytes = n * sizeof(int);

    // Number of elements in convolution mask
    int conv = 3;

    // Size of mask in bytes
    int bytes_conv = conv *  sizeof(int);

    // Allocate the array
    std::vector<int> array(n);
    std::vector<int> conv1D(conv);

    // Assign value for the array
    std::generate(begin(array), end(array), []() { return rand() % 10; });

    // Assign value for the array conv
    std::generate(begin(conv1D), end(conv1D), []() { return rand() % 10; });

    // for (auto x:array) std::cout << x << " "; std::cout << "\n";
    // for (auto x:conv1D) std::cout << x << " "; std::cout << "\n";
    
    // Allocate space for the result
    std::vector<int> res(n);

    // Allocate space on the GPU device
    int *gpu_array, *gpu_conv, *gpu_res;
    cudaMalloc(&gpu_array, bytes);
    cudaMalloc(&gpu_conv, bytes_conv);
    cudaMalloc(&gpu_res, bytes);

    // Copy the data to the device
    cudaMemcpy(gpu_array, array.data(), bytes, cudaMemcpyHostToDevice);
    cudaMemcpy(gpu_conv, conv1D.data(), bytes_conv, cudaMemcpyHostToDevice);

    // Call the kernel
    int THREADS = 1 << 10;
    int NUM_BLOCKS = (n + THREADS - 1) / THREADS;
    convolution_1D<<<NUM_BLOCKS, THREADS>>>(gpu_array, gpu_conv, gpu_res, n, conv);

    // Copy back to cpu
    cudaMemcpy(res.data(), gpu_res, bytes, cudaMemcpyDeviceToHost);

    // for (auto x:res) std::cout << x << " "; std::cout << "\n";

    // Verify the result
    verify_results(array.data(), conv1D.data(), res.data(), n, conv);
    std::cout << "COMPLETE SUCCESSFULLY\n";

    cudaFree(gpu_array);
    cudaFree(gpu_conv);
    cudaFree(gpu_res);
}