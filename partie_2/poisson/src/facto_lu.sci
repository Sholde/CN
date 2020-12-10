
// Create LU compact matrix from A
function [LU] = lu_compact(A)

	 // Recup the size
	 n = max(size(A));

	 // Init LU
	 LU = zeros(n, n);
	 LU(1, 1) = A(1, 1);

	 // Compute
	 for i = 2:n
	     // Compute d_i
	     LU(i, i) = A(i, i) - (A(i-1, i) * A(i, i-1)) / LU(i-1, i-1);

	     // Compute c_i
	     LU(i-1, i) = A(i-1, i);

	     // Compute e_i
	     LU(i, i-1) = A(i, i-1) / LU(i-1, i-1);
	 end
	 
endfunction

// Compute  LU compact matrix
function [LU] = lu_compute(LU)

	 // Recup the size
	 n = max(size(LU));

	 // n2
	 n2 = n^2;

	 // Init L
	 L = zeros(n, n);
	 L(1:n+1:n2) = 1;
	 L(2:n+1:n2) = LU(2:n+1:n2);

	 // Init U
	 U = zeros(n, n);
	 U(1:n+1:n2) = LU(1:n+1:n2);
	 U(n+1:n+1:n2) = LU(n+1:n+1:n2);

	 // Compute
	 LU = L * U;
	 
endfunction