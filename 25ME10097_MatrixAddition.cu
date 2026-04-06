#include<cuda_runtime.h>
#include<stdio.h>
#include<time.h>

__global__ void AddMatrices(int *A, int *B, int *C)
{
    int col = blockIdx.x*blockDim.x + threadIdx.x;
    int row = blockIdx.y*blockDim.y + threadIdx.y;

    if(row<16 && col<16)
    {
        int i = row*16 + col;
        C[i] = A[i] + B[i];
    }
}

int main()
{
    const int N=32;
    int size = N*N*sizeof(int);
    int a[N][N],b[N][N],c[N][N];
    for(int i = 0;i<N; i++)
    {
        for(int j=0;j<N;j++)
        {
            a[i][j] = i;
            b[i][j] = j;
        }
    }
    int *A,*B,*C;
    cudaMalloc(&A,size);
    cudaMalloc(&B,size);
    cudaMalloc(&C,size);
    
    cudaMemcpy(A,a,size,cudaMemcpyHostToDevice);
    cudaMemcpy(B,b,size,cudaMemcpyHostToDevice);

    dim3 blockDim(N,N);
    dim3 gridDim(2,2);
    clock_t start = clock();
    AddMatrices<<<gridDim,blockDim>>>(A,B,C);
    clock_t end = clock();
    cudaMemcpy(c,C,size,cudaMemcpyDeviceToHost);
    double time_spent = ((double)(end - start))/CLOCKS_PER_SEC;

    printf("Time spent is %lf seconds",time_spent);
    cudaFree(A);
    cudaFree(B);
    cudaFree(C);
    return 0;
}