
// Return LU compact matrix from A
function [A] = mylu3b(A)

	 // Compute size
	 n = max(size(A));

	 for k = 1:n-1
	     for i = k+1:n
	     	 A(i, k) = A(i, k) / A(k, k);
	     end
	     for i = k+1:n
	         for j = k+1:n
	     	     A(i, j) = A(i, j) - A(i, k) * A(k, j);
		 end
	     end
	 end

endfunction

// Compute  LU compact matrix
function [LU] = lu_compute(LU)

	 // Recup the size
	 n = max(size(LU));

	 // n2
	 n2 = n^2;

	 // Init L
	 L = tril(LU);
	 L(1:n+1:n2) = 1;

	 // Init U
	 U = triu(LU);

	 // Compute
	 LU = L * U;
	 
endfunction