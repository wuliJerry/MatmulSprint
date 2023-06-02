#include <cassert>
#include <cstdlib>
#include <iostream>
#include <string>
#include <Eigen/Dense>


// Input pattern M, K, N
int main(int argc, char **argv) {
    assert(argc == 4);

    size_t M = std::stol(argv[1]), 
           K = std::stol(argv[2]), 
           N = std::stol(argv[3]); 



    return 0;
}