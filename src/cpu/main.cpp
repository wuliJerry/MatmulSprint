#include <cassert>
#include <string>

void matrixMultiply(int *mat1, int *mat2, int *matRst, size_t M, size_t K, size_t N);

int main(int argc, char **argv) {
    assert(argc == 4);

    size_t M = std::stol(argv[1]), 
           K = std::stol(argv[2]), 
           N = std::stol(argv[3]); 

    int *mat1 = new int[M * K];
    int *mat2 = new int[K * N];
    int *matRst = new int[M * N];

	// Iniliaze mat1 and mat2 with random value
	for (size_t i = 0; i < M * K; i++) {
		mat1[i] = rand() % 100;
	}
	for (size_t i = 0; i < K * N; i++) {
		mat2[i] = rand() % 100;
	}

	matrixMultiply(mat1, mat2, matRst, M, K, N);

    delete [] mat1;
    delete [] mat2;
	delete [] matRst;

    return 0;
}