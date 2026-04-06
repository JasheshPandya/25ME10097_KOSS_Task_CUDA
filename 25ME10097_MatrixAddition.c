#include<stdio.h>
#include<time.h>
#define N 32
int main()
{   
    
    int A[N][N],B[N][N],C[N][N];
    for(int i = 0;i<N; i++)
    {
        for(int j=0;j<N;j++)
        {
            A[i][j] = i;
            B[i][j] = j;
        }
    }
    clock_t start = clock();
    for(int i = 0;i<N;i++)
    {
        for(int j=0;j<N;j++)
        {
            C[i][j] = A[i][j] + B[i][j];
        }
    }
    clock_t end = clock();
    double time_spent = ((double)(end - start))/CLOCKS_PER_SEC;
    printf("Time Spent is %lf seconds",time_spent);
    return 0;
}