/* Author: Sidheswar Ghosh*/

# ifndef ARITHMATIC_H
# define ARITHMATIC_H

#include <stdlib.h>
#include <stdio.h>

__global__  
void addition(int *x, int *y, float *res)
{
    *res = (float)*x + *y;     
}

__global__ 
void substraction(int *x, int *y, float *res)
{
    *res = (float)*x - *y;    
}

__global__ 
void multiplication(int *x, int *y, float *res)
{
    *res = (float)*x * *y;    
}

__global__ 
void division(int *x, int *y, float *res)
{
    if(y!=0)
        *res = (float)*x / *y;   
}
#endif //ARITHMATIC_H