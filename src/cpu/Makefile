# Define the compiler
CC = g++

# Define the output directory for executables
BIN = ../../bin/cpu

# Define the source directory
SRC = .

# Define flags for the compiler
CFLAGS = -Wall -Wextra -O2 -fopenmp

# Phony targets
.PHONY: all inner_product outer_product clean

# Default rule
all: inner_product outer_product

inner_product: 
	$(MAKE) -C inner

outer_product: 
	$(CC) $(CFLAGS) $(SRC)/main.cpp $(SRC)/outer.cpp -o $(BIN)/outer_product

# Clean rule
clean:
	rm -f $(BIN)/*
