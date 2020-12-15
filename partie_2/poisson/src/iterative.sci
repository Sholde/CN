
function [A] = set_matrix_A_heat(n)

	 //
	 A = zeros(n, n);

	 //
	 for i = 1:n
	     A(i, i) = 2;
	 end

	 //
	 for i = 1:n-1
	     A(i + 1, i) = -1;
	     A(i, i + 1) = -1;
	 end

endfunction

function [b] = set_vector_b_heat(n, T0, T1)

	 //
	 b = zeros(n, 1);

	 b(1) = T0;
	 for i = 2:n-1
	     b(i) = 0;
	 end
	 b(n) = T1;

endfunction

function [x, count] = jacobi(A, b, e, max_count)

	 // Size of matrix A
	 n = max(size(A));

	 // D-1
	 D = zeros(n, n);
	 for i = 1:n
	     D(i, i) = 1 / A(i, i);
	 end

	 // Set vector x with worst case
	 x = zeros(n, 1);
	 x(1:n) = 1;

	 // counter
	 count = 0;

	 // Residual
	 r = 1;

	 //
	 while norm(r) > e && count < max_count do
		r = (b - A * x);
		x = x + D * r;
		count = count + 1;
	 end

endfunction

function [x, count] = gauss_seidel(A, b, e, max_count)

	 // Size of matrix A
	 n = max(size(A));

	 // D
	 D = zeros(n, n);
	 for i = 1:n
	     D(i, i) = A(i, i);
	 end

	 // E
	 E = zeros(n, n);
	 for i = 2:n
	     E(i, i - 1) = - A(i, i - 1);
	 end

	 // (D - E)-1
	 DE = inv(D - E);

	 // Set vector x with worst case
	 x = zeros(n, 1);
	 x(1:n) = 1;

	 // counter
	 count = 0;

	 // Residual
	 r = 1;

	 //
	 while norm(r) > e && count < max_count do
		r = (b - A * x);
		x = x + DE * r;
		count = count + 1;
	 end

endfunction
