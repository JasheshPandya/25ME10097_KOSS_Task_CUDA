#include<stdio.h>
#include<time.h>

int main()
{   
    clock_t start = clock();
    for(int i=0;i<1024;i++)
    {
        printf("Hello World!",i);
    }
    clock_t end = clock();
    double time_spent = ((double)(end - start))/CLOCKS_PER_SEC;
    printf("\nTime taken: %lf seconds",time_spent);
    return 0;
}