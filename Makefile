CC = gcc
CXX = g++
CUDA = nvcc
CFLAG = -Wall -Wextra -Werror

# Path: src/
SRC = src/
OBJ = obj/
BIN = bin/

.PHONY: all clean

clean:
	rm -rf $(OBJ)* $(BIN)*