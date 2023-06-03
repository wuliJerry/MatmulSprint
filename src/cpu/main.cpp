#include <cassert>
#include <cstdlib>
#include <iostream>
#include <string>


int main(int argc, char **argv) {
    assert(argc == 4);

    size_t M = std::stol(argv[1]), 
           K = std::stol(argv[2]), 
           N = std::stol(argv[3]); 

    int *mat1 = new int[M * K];
    int *mat2 = new int[K * N];
    int *matRst = new int[M * N];

    delete [] mat1;
    delete [] mat2;

    return 0;
}