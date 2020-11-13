// Exercice 2

function [res] = test(x)
	 res = (- x^3 / 3 + 5 * x^2 - 4 * x - 6);
endfunction

function [res] = calcul_y(func, a, k, h)
	 // Initialisation du résultat
	 res = 0;

	 res = res + func(a + (k + 1) * h);
	 res = res + func(a + (k - 1) *  h);
	 res = res - 2 * func(a + k * h);
endfunction

function [res] = moments(func, a, b, N)
	 // Calcul de h et h^2
	 h = (b - a) / N;
	 h2 = h * h;
	 
	 // Initialisation du tableau des moments
	 res = zeros(N - 1);
	 res(1) = 0;
	 res(N - 1) = 0;
	 
	 // Initialisation du tableau A
	 A = zeros(N - 1, N - 1);
	 for i = 1:(N - 1)
	     for j = 1:(N - 1)
	     	 if (i == j)
		    A(i, j) = 4;
		 elseif (j == i - 1 || j == i + 1)
		    A(i, j) = 1;
		 end
	     end
	 end

	 // inversion de A
	 A = inv(A);

	 // Initialisation du tableau U
	 u = zeros(N - 1);
 	 for k = 1:(N - 1)
	     u(k) = (6 * calcul_y(func, a, k, h)) / h2;
	 end

	 // Calcul des Mk
	 for i = 1:(N - 1)
	     for k = 1:(N - 1)
	     	 res(k) = A(k, i) * u(k);
	     end
	 end
endfunction

function [res] = interpol(M, func, a, b, N, x)
	 // Initialisation du résultat
	 res = 0;

	 // Calcul de h
	 h = (b - a) / N;

	 // Trouve k
	 find = -1;
	 for k = 1:(N - 1)
	     if (a + k * h >= x)
	     	find = k - 1;
	     end
	 end

	 if (find == -1)
	    res = 0;
	    return
	 end

	 // Initialise k, x_k et x_k1 (x_k+1)
	 k = find;
	 x_k = a + k * h;
	 x_k1 = a + (k + 1) * h;

	 // Calcul de Ak
	 Ak = - M(k) / (6 * h);

	 // Calcul de Bk
	 Bk = M(k + 1) / (6 * h);

	 // Calcul de Ck
	 Ck = (func(x_k1) - func(x_k)) / h + Ak + Bk;

	 // Calcul de Dk
	 Dk = func(x_k) - (M(k) * h^2) / 6;

	 // Calcul de Sf
	 res = Ak * (x - x_k1)^3 + Bk * (x - x_k)^3 + Ck * (x - x_k) + Dk;
endfunction