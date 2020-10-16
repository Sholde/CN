// Exercice 5

// Calcul la fonction f(x) = (1 / (2x + 1))
function [res] = func(x)
	 res = 1 / ( 2 * x + 1);
endfunction

// Calcul de la dérivé de x
function [res] = func_derive(x)
	 res = - 2 / ((2 * x + 1) * (2 * x + 1));
endfunction

// Calcul le valeurs yi avec la méthode d'Euler Explicite
function [tab] = EulerExplicite(T, N)
	 // Vérifie les conditions de N
	 if N < 1
	    tab = 0;
	    return
	 end

	 // Vérifie les conditions de T
	 if T <= 0
	    tab = 0;
	    return
	 end
	 
	 // Calcul de h
	 h = T / N;

	 // Initialise le tableau
	 tab = zeros(N + 1);
	 
	 // Calcul des yi de 0 à N-1
	 for i = 1:N
	     tab(i + 1) = tab(i) + h * func(tab(i));
	 end 
endfunction

// Calcul le valeurs yi avec la méthode de Heun
function [tab] = Heun(T, N)
	 // Vérifie les conditions de N
	 if N < 1
	    tab = 0;
	    return
	 end

	 // Vérifie les conditions de T
	 if T <= 0
	    tab = 0;
	    return
	 end
	 
	 // Calcul de h
	 h = T / N;
	 h_2 = h / 2;

	 // Initialise le tableau à 0
	 tab = zeros(N + 1);

	 for i = 1:N
	     tab(i + 1) = tab(i) + h_2 * (func(tab(i) + h * func(tab(i))) + func(tab(i)));
	 end
endfunction

// Calcul le valeurs yi avec la méthode d'Euler Implicite
function [tab] = EulerImplicite(T, N)
	 // Vérifie les conditions de N
	 if N < 1
	    tab = 0;
	    return
	 end

	 // Vérifie les conditions de T
	 if T <= 0
	    tab = 0;
	    return
	 end
	 
	 // Calcul de h
	 h = T / N;

	 // Initialise le tableau à 0
	 tab = zeros(N + 1);

	 for i = 1:N
	     y_i_1 = tab(i) - (func(tab(i)) / func_derive(tab(i)));
	     tab(i + 1) = tab(i) + h * y_i_1;
	 end
endfunction

// Affiche les différents résultat
function [] = AfficheRes(T, N)

	 ee = EulerExplicite(T, N);
	 heun = Heun(T, N);
	 ei = EulerImplicite(T, N);
	 
	 print(%io(2), ei, heun, ee);
endfunction

// 4 a) calculer y1

// parti 2 f(ti) sinon en haut f(ti-1)
