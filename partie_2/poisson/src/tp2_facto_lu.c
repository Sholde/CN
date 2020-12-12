#include <stdlib.h>

#include "lib_poisson1D.h"
#include "lib_lu.h"

int main()
{
  int tridiag = 3;
  int la = 10;
  int kv = 0;
  double *a = aligned_alloc(sizeof(double), sizeof(double) * la * tridiag);

  set_GB_operator_colMajor_poisson1D(a, &tridiag, &la, &kv);

  printf("--------- Facto LU ---------\n\n");
  myblas_dgbtlu(MyblasNoTrans, a, la);
  
  printf("\n----------- End ------------\n");
  
  free(a);
  return 0;
}
