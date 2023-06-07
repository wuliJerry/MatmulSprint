#include <cmath>
#include <omp.h>
#include <iostream>

void matrixMultiply(int *mat1, int *mat2, int *matRst, size_t M, size_t K, size_t N) {
	
    for (size_t k = 0; k < K; k++) {
		#pragma omp parallel for
        for (size_t i = 0; i < M; i++) {
            for (size_t j = 0; j < N; j++) {
                #pragma omp atomic
                matRst[i*N + j] += mat1[i*K + k] * mat2[k*N + j];
            }
        }
    }
}
