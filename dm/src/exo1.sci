// Exercice 1

//**********************************************************

// Fonction carré
function [res] = mysquare(x)
	 res = x * x
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

	 // Calcul de l'intégrale
	 for j = 0:(N - 1)
	     for i = 0:3
	     	 res = res + w_i(i + 1) * f(i * h / (N - 1));
	     end
	 end
endfunction