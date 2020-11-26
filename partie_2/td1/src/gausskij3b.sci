
// Gauss without pivot
function [x] = gausskij3b(A, b)

	 //
	 n = max(size(A));

	 for k = 1:n
	     for i = k+1:n
	     	 mik = A(i, k) / A(k, k);
		 b(i) = b(i) - mik * b(k);
		 A(i, k+1:n) = A(i, k+1:n) - mik * A(k, k+1:n);
	     end
	 end

	 x = usolve(A, b);
	 
endfunction