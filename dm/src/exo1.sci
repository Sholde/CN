// Exercice 1

//**********************************************************

// Fonction carré
function [res] = mysquare(x)
	 res = - (x * x * x) / 3 +(67 / 4) * x * x + 7;
endfunction

//**********************************************************

// Fonction polynomiale d'ordre 3
function [res] = mypolynome(x)
	 res = - (x * x * x) / 3 +(67 / 4) * x * x + 7;
endfunction

//**********************************************************

// Calcul de la formule composite
function [res] = fourpoints(a, b, N, f)
	 // Initialisation du résultat
	 res = 0;

	 // Initialisation du tableau w_i
	 w_i = [1/8, 3/8, 3/8, 1/8];
	 
	 // Calcul du pas h
	 h = (b - a) / N;
	 h_8 = h / 8;

	 // Calcul de la somme
	 for k = 0:(N-1)
	     xk = a + k * h;
	     xk1 = a + (k + 1) * h;

	     res = res + f(xk);
	     res = res + 3 * f(1/3 * xk1 + 2/3 * xk);
	     res = res + 3 * f(2/3 * xk1 + 1/3 * xk);	     
	     res = res + f(xk1);	     
	 end

	 res = res * h_8;
endfunction