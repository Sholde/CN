// Exercice 5

// Calcul la fonction f(x) = (1 / (2x + 1))
function [res] = func(x)
	 res = 1 / ( 2 * x + 1);
endfunction

// Calcul le valeurs yi avec la méthode d'Eulere Explicite
function [tab] = EulerExplicite(T, N)
	 // Vérifie les conditions de N
	 if N < 1
	    tab = 0;
	    return
	 end

	 // Vérifie les conditions de T
	 if T < 1
	    tab = 0;
	    return
	 end
	 
	 // Calcul de h
	 h = T / N;

	 // Initialise le tableau
	 tab = zeros(N);
	 
	 // Calcul des yi
	 for i = 0:(N - 1)
	     tab_i = tab(i);
	     tab(j) = tab_i + h * func(tab_i);
	 end 
endfunction
