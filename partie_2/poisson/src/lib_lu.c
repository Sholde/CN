#include <stdio.h>
#include "lib_lu.h"

void myblas_dgb_set_lu(double *a, int la)
{
  // c_i

  // d_i
  for (int i = la + 1; i < 2 * la; ++i)
    {
      a[i] = (a[i] - (a[i - la] * a[i + la])) / a[i-1];
    }

  // e_i
  for (int i = 1; i < la; ++i)
    {
      a[i] = a[i] / a[i + la -1];
    }
}

void myblas_dgbtlu(enum myblas_enum my_enum, double *a, int la)
{
  switch (my_enum)
    {
    case MyblasNoTrans:
      myblas_dgb_set_lu(a, la);
      break;
    case MyblasTrans:
      printf("myblas_dgbtlu : MyblasTrans not implemented yet !\n");
      break;
    default:
      printf("myblas_dgbtlu : Bad enum\n");
      break;
    }
}

