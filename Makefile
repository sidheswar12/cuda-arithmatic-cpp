CXX :=nvcc
SRCS :=arithmatic.cu
OBJ :=build
all:
	rm -rf $(OBJ)
	mkdir build
	$(CXX) $(SRCS) -o $(OBJ)/arithmatic