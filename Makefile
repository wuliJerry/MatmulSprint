SRC_CPU = src/cpu
SRC_GPU = src/gpu

.PHONY: all cpu gpu clean

all: cpu gpu

cpu:
	$(MAKE) -C $(SRC_CPU)

gpu:
	$(MAKE) -C $(SRC_GPU)

clean:
	$(MAKE) -C $(SRC_CPU) clean
	$(MAKE) -C $(SRC_GPU) clean