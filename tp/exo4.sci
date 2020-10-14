//Exercice 4

// Calcul une séquence de produit scpécifique
function [res] = product_of_sequences(x, xj, xi)
	 res = (x - xj) / (xi - xj);
endfunction

// Trouve les pôlinomes d'interpolation de Lagrange associés aux point xi[i]
function [Lag] = polyLag(x, xi)

	 //Vérifie la taille de x
	 if x < 1
	    [Lag] = return 0;
	 end
	 
	 //Récupère la taille de xi
	 n = size(xi, '*');

	 //Initialise à zéro le vecteur de résultat
	 Lag = zeros(n);

	 for i = 1:n
	     // Initialise Lag[i] à 1 pour ne pas faire une multiplication par zéro
	     Lag(i) = 1;

	     // Calcul de Li(x)
	     for j = 1:n
	       	 if i ~= j
	     	    Lag(i) = Lag(i) * product_of_sequences(x, xi(j), xi(i));
		 end
	     end
	 end
	 
endfunction
