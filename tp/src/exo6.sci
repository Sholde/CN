// Exercice 6

function [u] = resouScd(N, alpha, beta, cofc, foncf)

	 // Initialise le tableau
	 u = zeros(N + 1);

	 // Calcul h
	 h = 1 / N;

	 // Initialise u0 et u1
	 u(1) = alpha;
	 u(2) = u(1) + h * beta;

	 // A faire
	 
endfunction