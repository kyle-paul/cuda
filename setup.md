# Installation Guideline
## Install CUDA Toolkit

### Install CUDA Toolkit
Add NVIDIA package repositories
```bash
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
```

Update the package list
```
sudo apt-get update
```

Install CUDA Toolkit
```bash
sudo apt-get install -y cuda
```

### Set Up Environment Variables

```bash
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
```

### Verify CUDA Installation
```
nvcc --version
```