// Fix format
format("e", 16);

//
n = 3;
T0 = -5;
T1 = 5;
e = 10^(-8);
max_count = 10^4;

//
A = set_matrix_A_heat(n);
b = set_vector_b_heat(n, T0, T1);

//
[vec_j, count_j] = jacobi(A, b, e, max_count);
[vec_g, count_g] = gauss_seidel(A, b, e, max_count);

//
disp(count_j);
disp(count_g);