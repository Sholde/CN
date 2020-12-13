#include <stdio.h>

#include "lib_poisson1D.h"
#include "lib_lu.h"

void myblas_tri_dgbsetlu(int la, int lab, double *a)
{
  // c_i

  // d_i
  for (int i = 1; i < la; ++i)
    {
      a[lab * i + 1] = a[lab * i + 1] - ((a[lab * i] * a[lab * (i - 1) + 2]) / a[lab * (i - 1) + 1]);
    }

  // e_i
  for (int i = 1; i < la; ++i)
    {
      a[lab * i] = a[lab * i] / a[lab * (i - 1) + 1];
    }
}

void myblas_tri_dgbup(int ld, int lab, double *a, double *x, double *b)
{
  // Init up
  x[ld - 1] = b[ld - 1] / a[lab * (ld - 1) + 1];

  // Main loop
  for (int i = ld - 2; i > -1; --i)
    {
      x[i] = (b[i] - (a[lab * i + 2] * x[i + 1])) / a[lab * i + 1];
    }
}

void myblas_tri_dgbdown(int ld, int lab, double *a, double *x, double *b)
{
  // Init dowm
  x[0] = b[0];

  // Main loop
  for (int i = 1; i < ld; ++i)
    {
      x[i] = (b[i] - (a[lab * i] * x[i - 1]));
    }
}

void myblas_tri_dgblu(enum myblas_enum this_enum, int ld, int lab, double *a, double *x, double *b)
{
  switch (this_enum)
    {
    case MyblasNoTrans:
      if (ld < 1)
	{
	  printf("myblas_dgbtlu : Bad leading dimension, need ld > 0\n");
	  return;
	}

      if (lab != 3)
	{
	  printf("myblas_dgbtlu : Bad number of colum, need lab == 3\n");
	  return;
	}

      myblas_tri_dgbsetlu(ld, lab, a);
      myblas_tri_dgbdown(ld, lab, a, x, b);
      myblas_tri_dgbup(ld, lab, a, b, x);

      break;
    case MyblasTrans:
      printf("myblas_dgbtlu : MyblasTrans not implemented yet !\n");
      break;
    default:
      printf("myblas_dgbtlu : Bad enum\n");
      break;
    }
}

