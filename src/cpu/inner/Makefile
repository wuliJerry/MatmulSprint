# Define the compiler
CC = g++

# Define the output directory for executables
BIN = ../../../bin/cpu

SRCS = $(wildcard *.cpp) # Find all source files
PROGS = $(patsubst %.cpp,%,$(SRCS)) # Get corresponding executable names

.PHONY: all
all: $(PROGS) # Make all executables

%: %.cpp ../main.cpp
	$(CXX) $(CXXFLAGS) $< ../main.cpp -o $(BIN)/$@_product