#include <ap_int.h>

typedef ap_int<5> inttype1;
typedef ap_int<10> inttype2;

void matrix_mult( inttype1 A[3][3], inttype1 B[3][3], inttype2 C[3][3])
{
	for(int i=0;i<3;i++)
	{
	    for(int j=0;j<3;j++)
	    {

	     C[i][j]= A[i][j] * B[i][j];

	    }
	}
}

