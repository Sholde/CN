#include <stdlib.h>

#include "lib_poisson1D.h"
#include "lib_lu.h"

int main()
{
  int tridiag = 3;
  int la = 10;
  int kv = 0;
  double *a = aligned_alloc(sizeof(double), sizeof(double) * la * tridiag);
  double *RHS = aligned_alloc(sizeof(double), sizeof(double) * la);
  double *X = aligned_alloc(sizeof(double), sizeof(double) * la);
  double *EX_SOL = aligned_alloc(sizeof(double), sizeof(double) * la);
  

  set_dense_RHS_DBC_1D(RHS,&la,&T0,&T1);
  set_analytical_solution_DBC_1D(EX_SOL, X, &la, &T0, &T1);

  set_GB_operator_colMajor_poisson1D(a, &tridiag, &la, &kv);

  printf("--------- Facto LU ---------\n\n");
  myblas_dgbtlu(MyblasNoTrans, a, la);
  LAPACKE_dgbsv(LAPACKE_COL_MAJOR);

  /* Relative residual for DGBSV */
  temp = cblas_ddot(la, EX_SOL, 1, EX_SOL,1);
  temp = sqrt(temp);
  cblas_daxpy(la, -1.0, RHS, 1, EX_
	      , 1);
  relres = cblas_ddot(la, EX_SOL, 1, EX_SOL,1);
  relres = sqrt(relres);
  relres = relres / temp;

  printf("\n----------- End ------------\n");
  
  free(a);
  return 0;
}
