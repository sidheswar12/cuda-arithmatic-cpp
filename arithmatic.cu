/* Author: Sidheswar Ghosh*/

#include "arithmatic.h"


int main(int argc, char** argv)
{   

    if( argc != 3)
    {
     printf("Usage: Please provide all below arguments...\n");
     printf("First Value\n");
     printf("Second Value\n");     
     return -1;
    } 

    int x_h = atoi(argv[1]);
    int y_h = atoi(argv[2]);   

    int *x_d, *y_d;
    float *res_h, *res_d;   

    //Allocate CUDA device memory
    cudaMalloc(&x_d, sizeof(int));
    cudaMalloc(&y_d, sizeof(int));
    cudaMalloc(&res_d, sizeof(float));   

    //Copy value to CUDA device from host
    cudaMemcpy(x_d, &x_h, sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(y_d, &y_h, sizeof(int), cudaMemcpyHostToDevice);    
    cudaMemset(res_d, 0.0, sizeof(float));

    //Call CUDA function
    addition<<<1,1>>>(x_d, y_d, res_d);
    res_h = (float*)malloc(sizeof(float));
    cudaMemcpy(res_h, res_d, sizeof(float), cudaMemcpyDeviceToHost); //Copy result from CUDA device
    printf("Addition Result:%f\n", *res_h);

    //Call CUDA function
    substraction<<<1,1>>>(x_d, y_d, res_d);
    res_h = (float*)malloc(sizeof(float));
    cudaMemcpy(res_h, res_d, sizeof(float), cudaMemcpyDeviceToHost); //Copy result from CUDA device
    printf("Substraction Result:%f\n", *res_h);

    //Call CUDA function
    multiplication<<<1,1>>>(x_d, y_d, res_d);
    res_h = (float*)malloc(sizeof(float));
    cudaMemcpy(res_h, res_d, sizeof(float), cudaMemcpyDeviceToHost); //Copy result from CUDA device
    printf("Multiplication Result:%f\n", *res_h);

    //Call CUDA function
    division<<<1,1>>>(x_d, y_d, res_d);
    res_h = (float*)malloc(sizeof(float));
    cudaMemcpy(res_h, res_d, sizeof(float), cudaMemcpyDeviceToHost); //Copy result from CUDA device
    printf("Division Result:%f\n", *res_h);

    cudaDeviceSynchronize();    
   
    return 0;
}