#include <iostream>

void matrixMultiply(int *mat1, int *mat2, int *matRst, size_t M, size_t K, size_t N) {
    for (int m = 0; m < M; m ++) {
        for (int k = 0; k < K; k ++) {
            for (int n = 0; n < N; n++) {
                matRst[m * N + n] += mat1[m * K + k] * mat2[k * N + n];
            }
        }
    }
}