#include <iostream>

void matrixMultiply(int *mat1, int *mat2, int *matRst, size_t M, size_t K, size_t N) {
    for (int i = 0; i < N; i ++) {
        for (int j = 0; j < M; j ++) {
            for (int k = 0; k < K; k ++) {
                matRst[i * M + j] += mat1[i * K + k] * mat2[k * M + j];
            }
        }
    }
}
