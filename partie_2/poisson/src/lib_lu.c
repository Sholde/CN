#include <stdio.h>
#include "lib_lu.h"

void myblas_dgbtlu(enum myblas_enum my_enum, double *a, int la)
{
  switch (my_enum)
    {
    case MyblasNoTrans:
      printf("myblas_dgbtlu : here\n");
      break;
    case MyblasTrans:
      printf("myblas_dgbtlu : MyblasTrans not implemented yet !\n");
      break;
    default:
      printf("myblas_dgbtlu : Bad enum\n");
      break;
    }
}

