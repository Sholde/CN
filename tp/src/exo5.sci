// Exercice 5

// Calcul la fonction f(x) = (1 / (2x + 1))
function [res] = func(x)
	 res = 1 / ( 2 * x + 1);
endfunction

// Calcul le valeurs yi avec la méthode d'Euler Explicite
function [y] = EulerExplicite(T, N)
	 // Vérifie les conditions de N
	 if N < 1
	    y = 0;
	    return
	 end

	 // Vérifie les conditions de T
	 if T <= 0
	    y = 0;
	    return
	 end
	 
	 // Calcul de h
	 h = T / N;

	 // Initialise le tableau
	 y = zeros(N + 1);
	 
	 // Calcul des yi de 0 à N-1
	 for i = 1:N
	     y(i + 1) = y(i) + h * func(y(i));
	 end 
endfunction

// Calcul le valeurs yi avec la méthode de Heun
function [y] = Heun(T, N)
	 // Vérifie les conditions de N
	 if N < 1
	    y = 0;
	    return
	 end

	 // Vérifie les conditions de T
	 if T <= 0
	    y = 0;
	    return
	 end
	 
	 // Calcul de h
	 h = T / N;
	 h_2 = h / 2;

	 // Initialise le tableau à 0
	 y = zeros(N + 1);

	 // Calcul des yi de 0 à N-1
	 for i = 1:N
	     y(i + 1) = y(i) + h_2 * (func(y(i) + h * func(y(i))) + func(y(i)));
	 end
endfunction

// Calcul le valeurs yi avec la méthode d'Euler Implicite
function [y] = EulerImplicite(T, N)
	 // Vérifie les conditions de N
	 if N < 1
	    y = 0;
	    return
	 end

	 // Vérifie les conditions de T
	 if T <= 0
	    y = 0;
	    return
	 end
	 
		// Calcul de h
	 h = T / N;

	 // Initialise le tableau à 0
	 y = zeros(N + 1);

	 // Calcul des yi de 0 à N-1
	 for i = 1:N
	     // Calcul (2yi + 1)^2
	     yi_x2_1 = (2 * y(i) + 1) * (2 * y(i) + 1);

	     // Calcul la racine carré qui est dans la fonction
	     sqrt_res = sqrt(yi_x2_1 + 8 * h);

	     // Calcul yi+1
	     y(i + 1) = (2 * y(i) - 1 + sqrt_res) / 4;
	 end
endfunction

// Affiche les différents résultat
function [] = AfficheRes(T, N)

	 C4 = EulerExplicite(T, N);
	 C3 = Heun(T, N);
	 C2 = EulerImplicite(T, N);
	 // C1 = [0, 0.552681, 0.1, 0.1442049, 0.1855655, 0.2245688, 0.261573, 0.2968689, 0.3306624, a finir];
	 
	 print(%io(2), C2, C3, C4);
endfunction

// 4 a) calculer y1

// parti 2 f(ti) sinon en haut f(ti-1)
