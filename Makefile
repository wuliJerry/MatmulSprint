SRC_CPU = src/cpu
SRC_GPU = src/gpu
BIN_CPU = bin/cpu
BIN_GPU = bin/gpu

.PHONY: all cpu gpu clean

all: cpu gpu

$(BIN_CPU):
	mkdir -p $(BIN_CPU)

$(BIN_GPU):
	mkdir -p $(BIN_GPU)

cpu: $(BIN_CPU)
	$(MAKE) -C $(SRC_CPU)

gpu: $(BIN_GPU)
	$(MAKE) -C $(SRC_GPU)

clean:
	$(MAKE) -C $(SRC_CPU) clean
	$(MAKE) -C $(SRC_GPU) clean