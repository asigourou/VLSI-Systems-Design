#include <ap_int.h>
#include <stdio.h>
#include <stdlib.h>

typedef ap_int<12> inttype1;
typedef ap_int<24> inttype2;

void mult_function_pragma(inttype1 A[4][4], inttype1 B[4][4], inttype2 C[4][4]);

int main(){

	inttype1 A[4][4];
	inttype1 B[4][4];
	inttype2 C[4][4];
	inttype2 C_test[4][4];

	srand(0);

	for(int i=0; i<4; i++)
	{
		 for(int j=0;j<4;j++)
	     {
		  A[i][j]=(inttype1)(rand()% 2048);
		  B[i][j]=(inttype1)(rand()% 2048);
	     }
	}

	for(int i=0;i<4;i++)
	{
		for(int j=0;j<4;j++)
		{
			C[i][j]=0;
			for(int k=0;k<4;k++)
			{
				C_test[i][j]= C_test[i][j] + A[i][k]*B[k][j];
			}
		}
	}
	mult_function_pragma(A,B,C);
	int ret=0;
	for(int i=0;i<4;i++)
	{
		for(int j=0;j<4;j++)
		{
			if(C_test[i][j]!=C[i][j])
			{
			   ret=-1;
			   printf("Test failed!");
		    }
	        
		}
	}
		for(int i=0;i<4;i++)
		{
			for(int j=0;j<4;j++)
			{
			
				 printf("A[%d][%d]=%d \n", i,j, (int)A[i][j]);
				 printf("B[%d][%d]=%d \n", i,j, (int)B[i][j]);
				 printf("C[%d][%d]=%d \n", i,j, (int)C[i][j]);
				 printf("C_test[%d][%d]=%d \n", i,j, (int)C_test[i][j]);
		    }
		}
		return ret;
}
