#include <cuda.h>
#include <stdio.h>

#define THREADS_PER_BLOCK 32 // This should match the size of your systolic array

__global__ void systolicMatrixMultiply(int *mat1, int *mat2, int *matRst, size_t M, size_t K, size_t N) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
  
    __shared__ int partialResult[THREADS_PER_BLOCK][THREADS_PER_BLOCK];

    for (int k = 0; k < K; ++k) {
        partialResult[threadIdx.y][threadIdx.x] += mat1[row * K + k] * mat2[k * N + col];
        __syncthreads();
    }

    matRst[row * N + col] = partialResult[threadIdx.y][threadIdx.x];
}

int main() {
    int *h_mat1, *h_mat2, *h_matRst;
    int *d_mat1, *d_mat2, *d_matRst;
    size_t M, K, N;
    M = K = N = 4096; // Example size

    // Allocate host memory
    h_mat1 = (int*)malloc(M * K * sizeof(int));
    h_mat2 = (int*)malloc(K * N * sizeof(int));
    h_matRst = (int*)malloc(M * N * sizeof(int));

    // Allocate device memory
    cudaMalloc(&d_mat1, M * K * sizeof(int));
    cudaMalloc(&d_mat2, K * N * sizeof(int));
    cudaMalloc(&d_matRst, M * N * sizeof(int));

    // Initialize host matrices and copy to device
    for (int i = 0; i < M * K; ++i) h_mat1[i] = 1;
    for (int i = 0; i < K * N; ++i) h_mat2[i] = 1;
    cudaMemcpy(d_mat1, h_mat1, M * K * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_mat2, h_mat2, K * N * sizeof(int), cudaMemcpyHostToDevice);

    // Call the kernel
    dim3 threadsPerBlock(THREADS_PER_BLOCK, THREADS_PER_BLOCK);
    dim3 numBlocks(M / threadsPerBlock.x, N / threadsPerBlock.y);
    systolicMatrixMultiply<<<numBlocks, threadsPerBlock>>>(d_mat1, d_mat2, d_matRst, M, K, N);

    // Copy the result back to the host
    cudaMemcpy(h_matRst, d_matRst, M * N * sizeof(int), cudaMemcpyDeviceToHost);

    // Clean up
    cudaFree(d_mat1);
    cudaFree(d_mat2);
    cudaFree(d_matRst);
    free(h_mat1);
    free(h_mat2);
    free(h_matRst);

    return 0;
}
