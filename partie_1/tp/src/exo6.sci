// Exercice 6

// Calcul tous les Ui de 0 à N
function [U] = resouScd(N, alpha, beta, cofc, foncf)

	 // Initialise les tableaux
	 U = zeros(N + 1);
	 A = zeros(N + 1, N + 1);
	 B = zeros(N + 1);
	 C = zeros(N + 1);

	 // Calcul h
	 h = 1 / N;
	 h2 = h * h;

	 // Initialise u0 et u1
	 U(1) = alpha;
	 U(2) = U(1) + h * beta;

	 // Calcul toutes les fonction f
	 for i = 1:N+1
	     ti = i * h;
	     B(i) = foncf(ti);
	 end

	 // Calcul toutes les coefficients c
	 for i = 1:N+1
	     ti = i * h;
	     C(i) = cofc(ti);
	 end

	 // Initilaise la matrice A
	 // Si i = j, alors a(i, j) = (2 / h2) + C(i);
	 // Sinon si i = j+1 ou i = j-1, alors a(i, j) = -(1 / h2);
	 for i = 1:N+1
	     for j = 1:N+1
	     	 if (i == j)
		    A(i, j) = (2 / h2) + C(i);
		 elseif (i == j-1 || i == j+1)
		 	A(i, j) = -(1 / h2);
		 end
	     end
	 end

	 // Calcul le résultat final
	 U = inv(A) * B;

endfunction

//**********************************************************

// Fonction 0
function [y] = zer(a)
	 y = 0;
endfunction

//**********************************************************

// Calcul tous les Ui de 0 à N
function [U] = partie2(N, cofc, foncf)

	 // Initialise les tableaux
	 U = zeros(N + 1);
	 A = zeros(N + 1, N + 1);
	 B = zeros(N + 1);
	 C = zeros(N + 1);

	 // Calcul h
	 h = 1 / N;
	 h2 = h * h;

	 // Calcul toutes les fonction f
	 for i = 1:N+1
	     ti = i * h;
	     B(i) = foncf(ti);
	 end

	 // Calcul toutes les coefficients c
	 for i = 1:N+1
	     ti = i * h;
	     C(i) = cofc(ti);
	 end

	 // Initilaise la matrice A
	 // Si i = j, alors a(i, j) = (2 / h2) + C(i);
	 // Sinon si i = j+1 ou i = j-1, alors a(i, j) = -(1 / h2);
	 for i = 1:N+1
	     for j = 1:N+1
	     	 if (i == j)
		    A(i, j) = (2 / h2) + C(i);
		 elseif (i == j-1 || i == j+1)
		 	A(i, j) = -(1 / h2);
		 end
	     end
	 end

	 // Calcul le résultat final
	 U = inv(A) * B;

endfunction