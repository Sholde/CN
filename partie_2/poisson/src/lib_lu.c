#include <stdio.h>
#include "lib_lu.h"

void myblas_tri_dgbsetlu(double *a, int la)
{
  // c_i

  // d_i
  for (int i = la + 1; i < 2 * la; ++i)
    {
      a[i] = (a[i] - (a[i - la] * a[i - 1 + la])) / a[i-1];
    }

  // e_i
  for (int i = 1; i < la; ++i)
    {
      a[i] = a[i] / a[i + la - 2];
    }
}

void myblas_tri_dgbup(int ld, double *a, double *x, double *b)
{
  x[ld - 1] = b[ld - 1] / a[2 * ld - 1];
  x[ld - 2] = (b[ld - 2] - a[3 * ld - 1] * x[ld - 1]) / a[2 * ld - 1];
  for (int i = ld - 3; i > -1; --i)
    {
      x[i] = (b[i] - (a[ld + ld + i + 1] * x[i + 1])) / a[ld + i];
    }
}

void myblas_tri_dgbdown(int ld, double *a, double *x, double *b)
{
  x[0] = b[0];
  x[1] = b[1] - a[1] * x[0];
  for (int i = 2; i < ld; ++i)
    {
      x[i] = (b[i] - (a[i] * x[i - 1]));
    }
}

void myblas_tri_dgblu(enum myblas_enum my_enum, int ld, double *a, double *x, double *b)
{
  switch (my_enum)
    {
    case MyblasNoTrans:
      if (ld < 1)
	{
	  printf("myblas_dgbtlu : Bad leading dimension, need ld > 0\n");
	  return;
	}
      myblas_tri_dgbsetlu(a, ld);
      myblas_tri_dgbup(ld, a, x, b);
      myblas_tri_dgbdown(ld, a, x, b);
      break;
    case MyblasTrans:
      printf("myblas_dgbtlu : MyblasTrans not implemented yet !\n");
      break;
    default:
      printf("myblas_dgbtlu : Bad enum\n");
      break;
    }
}

