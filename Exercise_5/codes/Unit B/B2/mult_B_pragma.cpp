#include<stdio.h>
#include<stdlib.h>
#include <ap_int.h>

typedef ap_int<12> inttype1;
typedef ap_int<24> inttype2;



void mult_function_pragma (inttype1 A[4][4],inttype1 B[4][4], inttype2 C[4][4])
{
#pragma HLS array_partition variable=A complete
#pragma HLS array_partition variable=B complete
#pragma HLS array_partition variable=C complete

	for(int i=0;i<4;i++)
	{	
		#pragma HLS unroll factor=4
		for(int j=0;j<4;j++)
		{
			#pragma HLS unroll factor=4
			C[i][j]=0;
			for(int k=0;k<4;k++)
			{
				#pragma HLS unroll factor=4
				C[i][j]= C[i][j] + A[i][k]*B[k][j];
			}
		}
	}
}
