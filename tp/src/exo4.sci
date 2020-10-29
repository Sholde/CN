// Exercice 4

// Calcul une séquence de produit scpécifique
function [res] = differences(x, xj, xi)
	 res = (x - xj) / (xi - xj);
endfunction

// Trouve les pôlinomes d'interpolation de Lagrange associés aux point xi[i]
function [Lag] = polyLag(x, xi)

	 // Récupère la taille de xi
	 n = size(xi, '*');

	 // Vérifie la taille de xi
	 if n < 1
	    Lag = 0;
	    return
	 end
	 
	 // Initialise à zéro le vecteur de résultat
	 Lag = zeros(n);

	 for i = 1:n
	     // Initialise Lag[i] à 1 pour ne pas faire une multiplication par zéro
	     Lag(i) = 1;

	     // Calcul de Li(x)
	     for j = 1:n
	       	 if i ~= j
	     	    Lag(i) = Lag(i) * differences(x, xi(j), xi(i));
		 end
	     end
	 end
	 
endfunction

// Calcul le polynôme d'interpolation de la function func aux point du tableau xi
function [p] = myinterpol(func, x, xi)

	 // Récupère la taille de xi
	 n = size(xi, '*');

	 // Vérifie la taille de xi
	 if n < 1
	    p = 0;
	    return
	 end

	 // Initialisation du résultat
	 p = 0;


	 // Calcul le polynôme d'interpolation
	 for i = 1:n
	     // Initialisation de la variable temporaire Lag
	     // qui est le polynôme de Lagrange associé au point
	     // correspondant à i
	     Lag = 1;

	     for j = 1:n
	     	 // Si i != j
		 if i ~= j
	     	    Lag = Lag * differences(x, xi(j), xi(i));
		 end
	     end
     	     p = p + func(xi(i)) * Lag;
	 end
	 
endfunction
