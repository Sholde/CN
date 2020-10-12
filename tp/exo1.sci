function [y] = pointgauche(a, b, N, func)
	 y = integrate(func, 'x', a, a:N:b);
endfunction