#include <ap_int.h>
#include <stdio.h>
#include <stdlib.h>

typedef ap_int<5> inttype1;
typedef ap_int<10> inttype2;

void matrix_mult_pr( inttype1 A[3][3], inttype1 B[3][3], inttype2 C[3][3]);

int main(){

	inttype1 A[3][3];
	inttype1 B[3][3];
	inttype2 C[3][3];
	inttype2 C_test[3][3];

	srand(0);

	for(int i=0; i<3; i++)
	{
		 for(int j=0;j<3;j++)
	     {
		  A[i][j]=(inttype1)(rand()% 16);
		  B[i][j]=(inttype1)(rand()% 16);
	     }
	}

	for(int i=0;i<3;i++)
		{
		    for(int j=0;j<3;j++)
		    {

		     C_test[i][j]= A[i][j] * B[i][j];

		    }
		}

	matrix_mult_pr(A,B,C);
	int ret=0;
	for(int i=0; i<3; i++)
		{
			for(int j=0;j<3;j++)
			{
			    if(C_test[i][j]!=C[i][j])
			    {
			    ret=-1;
			    printf("Test failed!");
		        }
	        }
		}
	for(int i=0; i<3; i++)
	   {
		     for(int j=0;j<3;j++)
			 {
				 printf("A[%d][%d]=%d \n", i,j, (int)A[i][j]);
				 printf("B[%d][%d]=%d \n", i,j, (int)B[i][j]);
				 printf("C[%d][%d]=%d \n", i,j, (int)C[i][j]);
				 printf("C_test[%d][%d]=%d \n", i,j, (int)C_test[i][j]);
		      }
		}
		return ret;
}
