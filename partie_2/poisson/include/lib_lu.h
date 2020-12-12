#ifndef lib_lu_h
#define lib_lu_h

enum myblas_enum
  {
    MyblasNoTrans,
    MyblasTrans
  };

void myblas_dgb_set_lu(double *a, int la);
void myblas_dgbtlu(enum myblas_enum my_enum, double *a, int la);

#endif
