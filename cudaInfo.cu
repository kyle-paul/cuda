#include <iostream>
#include <cuda_runtime.h>

int main() {
    int device_count;
    cudaGetDeviceCount(&device_count);

    for (int device=0; device<device_count; device++) {
        cudaDeviceProp device_prop;
        cudaGetDeviceProperties(&device_prop, device);
        
        std::cout << "Device: " << device << ": " << device_prop.name << std::endl;
        std::cout << "  Max threads per block: " << device_prop.maxThreadsPerBlock << std::endl;
        std::cout << "  Max blocks per dimension: " << device_prop.maxGridSize[0] << ", "
                  << device_prop.maxGridSize[1] << ", " << device_prop.maxGridSize[2] << std::endl;
        std::cout << "  Max threads per dimension: " << device_prop.maxThreadsDim[0] << ", "
                  << device_prop.maxThreadsDim[1] << ", " << device_prop.maxThreadsDim[2] << std::endl;
    }
    return 0;
}