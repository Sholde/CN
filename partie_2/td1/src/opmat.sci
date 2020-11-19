
function [C] = matmat3b(A, B)

	 n = max(size(A));

	 C = zeros(n, n);
	 
	 for i = 1:n
	     for j = 1:n
	     	 for k = 1:n
		     C(i, j) = A(i, k) * B(k, j);
		 end
	     end
	 end
	 
endfunction

function [C] = matmat2b(A, B)

	 n = max(size(A));

	 C = zeros(n, n);
	 
	 for i = 1:n
	     for j = 1:n
	     	 C(i, j) = A(i, :) * B(:, j);
	     end
	 end
	 
endfunction

function [C] = matmat1b(A, B)

	 n = max(size(A));

	 C = zeros(n, n);
	 
	 for i = 1:n
	     C(i, :) = A(i, :) * B;
	 end
	 
endfunction