
// Compute LU from A
function [LU] = lu(A)

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