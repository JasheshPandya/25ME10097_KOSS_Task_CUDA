#include<cuda_runtime.h>
#include<stdio.h>
#include<time.h>
__global__ void Hello()
{
    printf("Hello World!");
}
int main()
{   
    clock_t start = clock();
    Hello<<<4,256>>>();
    cudaDeviceSynchronize();
    clock_t end = clock();
    double time_spent = ((double)(end - start))/CLOCKS_PER_SEC;
    printf("\nTime taken is %lf seconds",time_spent);
    return 0;
}
