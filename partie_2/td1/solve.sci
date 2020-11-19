
function [x] = usolve(U, b)

	 //
	 n = max(size(U));

	 //
	 x = zeros(n);
	 x(n) = b(n) / U(n, n);

	 for i = n-1:-1:1
	     x(i) = (b(i) - U(i, (i + 1):n)) * x((i + 1):n) / U(i, i);
	 end

endfunction