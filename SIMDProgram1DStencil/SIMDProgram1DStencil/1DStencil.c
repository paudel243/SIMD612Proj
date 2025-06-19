// Abdul Raafi Bandrang, Paulo Delgado
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <windows.h>
#define VectorSize 268435456 // 1048576, 67108864 ,268435456

extern void asmfunction(double* X, double* Y, int max); // x86-64 
extern void simdfunction(double* X, double* Y, int max); //SIMD YMM
extern void xmmfunction(double* X, double* Y, int max); // SIMD XMM

void CVersionStencil(double* y,double* x,int n)
{
    int min = 3,check=0,
        max = n - 3;
    for (int i = 0; min < max; i++)
    {
        y[i] = x[min - 3] + x[min - 2] + x[min - 1] + x[min] + x[min + 1] + x[min + 2] + x[min + 3];
        min++;
        check = i;
    }
    //printf("%d\n", check);
}

void print_array(double* array, int size)
{
    for (int i = 0; i < 5; i++)
    {
        printf("%lf\n", array[i]);
        
    }
}
void errorCheck(double* x, double* y, int size)
{
    int min = 3, errorCount = 0;
    for (int i = 0; min < size; i++)
    {
        int Stencil = x[min - 3] + x[min - 2] + x[min - 1] + x[min] + x[min + 1] + x[min + 2] + x[min + 3];
        if (y[i] != Stencil)
        {
            errorCount++;
        }
        min++;
    }
    printf("Error Count : %d \n", errorCount);
}

int main(int argc, char** argv)
{
    const int ARRAY_SIZE = VectorSize;
    double *CKernelX;
    double *CKernelY;
    double time_spent = 0.0;
    clock_t start, end;
    CKernelX = (double*)VirtualAlloc(NULL, ARRAY_SIZE * sizeof(double), MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    CKernelY = (double*)VirtualAlloc(NULL, (ARRAY_SIZE - 6) * sizeof(double), MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (CKernelX == NULL || CKernelY == NULL)
    {
        printf("Virtual Alloc Failed \n");
        printf("CKernelX: %p, CKernelY: %p\n", CKernelX, CKernelY);
        return -1;
    }
    
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        CKernelX[i] = (double)(i + 1.0);
        
    }
    
    for (int i = 0; i < ARRAY_SIZE - 6; i++)
    {
        CKernelY[i] = (double)(0.0);
    }
    start = clock();
    CVersionStencil(CKernelY, CKernelX, ARRAY_SIZE);
    end = clock();
    time_spent += ((double)(end - start)) * 1e3 / CLOCKS_PER_SEC;
    printf(" C Kernel : \n");
    errorCheck(CKernelX, CKernelY, ARRAY_SIZE - 3);
    print_array(CKernelY, 5);
    
    printf("The elapsed time is %lf miliseconds for C Kernel\n", time_spent);

// X86=============================================================
    for (int i = 0; i < ARRAY_SIZE-6; i++) // Reinitialize
    {
        CKernelY[i] = (double)(0.0);
    }
    asmfunction(CKernelX, CKernelY, ARRAY_SIZE - 3); // Flush out cache

    start = clock();
    asmfunction(CKernelX, CKernelY, ARRAY_SIZE-3);
    end = clock();
    time_spent = 0.0;
    time_spent += ((double)(end - start)) * 1e3 / CLOCKS_PER_SEC;
    printf("X86 Kernel: \n");
    print_array(CKernelY, 5);
    errorCheck(CKernelX, CKernelY, ARRAY_SIZE - 3);
    printf("The elapsed time is %lf miliseconds for X86 Kernel\n", time_spent);
    // SIMD XMM ================================================== 
    for (int i = 0; i < ARRAY_SIZE - 6; i++) // Reinitialize
    {
        CKernelY[i] = (double)(0.0);
    }
    xmmfunction(CKernelX, CKernelY, ARRAY_SIZE - 6); // flush out cache
    printf("XMM Kernel: \n");
    start = clock();
    xmmfunction(CKernelX, CKernelY, ARRAY_SIZE - 6);
    end = clock();
    time_spent = 0.0;
    time_spent += ((double)(end - start)) * 1e3 / CLOCKS_PER_SEC;
    print_array(CKernelY, 5);
    errorCheck(CKernelX, CKernelY, ARRAY_SIZE - 6);
    printf("The elapsed time is %lf miliseconds for SIMD XMM Kernel\n", time_spent);
    // SIMD YMM ==================================================   
    for (int i = 0; i < ARRAY_SIZE - 6; i++) // Reinitialize
    {
        CKernelY[i] = (double)(0.0);
    }
    simdfunction(CKernelX, CKernelY, ARRAY_SIZE - 6); // Flush out cache
    printf("SIMD Kernel: \n ");
    start = clock();
    simdfunction(CKernelX, CKernelY, ARRAY_SIZE-6);
    end = clock();
    time_spent = 0.0;
    time_spent += ((double)(end - start)) * 1e3 / CLOCKS_PER_SEC;
    print_array(CKernelY, 5);
    errorCheck(CKernelX, CKernelY, ARRAY_SIZE - 6);
    printf("The elapsed time is %lf miliseconds for SIMD YMM Kernel\n", time_spent);
    VirtualFree(CKernelX, 0, MEM_RELEASE);
    VirtualFree(CKernelY, 0, MEM_RELEASE);

    return 0;
}

