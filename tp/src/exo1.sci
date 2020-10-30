// Exercice 1

// Calcul sin(PI * x)
function [y] = sin_pi_x(x)
	 y = sin(%pi * x);
endfunction


// Calcul l'intégrale de func avec la méthode du calcul des aires des rectangles à gauche
function [res] = pointgauche(a, b, func, N)

	 // Initialise à 0 la somme
	 res = 0;

	 // Calcul de h
	 h = (b-a)/N;

	 // Calcul de la somme
	 for i = 0:(N - 1)
	     res = res + func(a + i * h);
	 end

	 // Multiplication final
	 res = res * h;
endfunction

// Calcul l'intégrale de func avec la méthode des trapèzes
function [res] = trapeze(a, b, func, N)

	 // Initialise à 0 la somme
	 res = 0;

	 // Calcul de h
	 h = (b - a) / N;

	 // Calcul de petite multiplication
	 f_a = (1 / 2) * func(a);
	 f_b = (1 / 2) * func(b);

	 // Calcul de la somme
	 for i = 1:(N - 1)
	     res = res + func(a + i * h);
	 end

	 // Ajoute f_a et f_b à res
	 res = res + f_a + f_b;

	 // Multiplication final
	 res = res * h;
endfunction

// Calcul l'intégrale de func avec la méthode de simpson
function [res] = int_simpson(a, b, func, N)

	 // Initialise à 0 la somme
	 res = 0;

	 // Calcul de h
	 h = (b - a) / N;
	 h_6 = h / 6;

	 // Ajoute f(a) au résultat
	 res = res + func(a);
	 
	 // Calcul de la somme f(x_k)
	 somme_a_ih = 0;
	 
	 for i = 1:N-1
	     somme_a_ih = somme_a_ih + func(a + i * h);
	 end

	 res = res + 2 * somme_a_ih;

	 // Ajoute f(b) au résultat
	 res = res + func(b);

	 // Calcul de la some f(a + (i + 1/2) * h)
	 somme_a_i2h = 0;

	 for i = 0:(N - 1)
	     somme_a_i2h = somme_a_i2h + func(a + (i + 1 / 2) * h);
	 end

	 res = res + 4 * somme_a_i2h;

	 // Multiplication final
	 res = res * h_6;
endfunction
