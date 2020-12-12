#ifndef lib_lu_h
#define lib_lu_h

enum myblas_enum
  {
    MyblasNoTrans,
    MyblasTrans
  };

void myblas_tri_dgbsetlu(double *a, int la);
void myblas_tri_dgbup(int ld, double *a, double *x, double *b);
void myblas_tri_dgbdown(int ld, double *a, double *x, double *b);
void myblas_tri_dgblu(enum myblas_enum my_enum, int ld, double *a, double *x, double *b);

#endif
