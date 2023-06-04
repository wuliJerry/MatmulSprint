# Define the compiler
CC = g++

# Define the output directory for executables
BIN = ../../bin/cpu

# Define the source directory
SRC = .

# Define flags for the compiler
CFLAGS = -Wall -Wextra -O2

# Phony targets
.PHONY: all inner_product outer_product clean

# Default rule
all: inner_product outer_product

$(BIN):
	mkdir -p $(BIN)

inner_product: $(BIN)
	$(CC) $(CFLAGS) $(SRC)/main.cpp $(SRC)/inner.cpp -o $(BIN)/inner_product

outer_product: $(BIN)
	$(CC) $(CFLAGS) $(SRC)/main.cpp $(SRC)/outer.cpp -o $(BIN)/outer_product

# Clean rule
clean:
	rm -f $(BIN)/inner_product $(BIN)/outer_product
