#ifndef lib_lu_h
#define lib_lu_h

enum myblas_enum
  {
    MyblasNoTrans,
    MyblasTrans
  };

void myblas_dgbtlu(enum myblas_enum my_enum, double *a, int la);

#endif
