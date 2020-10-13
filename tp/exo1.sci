//func
function [y] = func_test(x)
	     y = x * x;
endfunction


//Calcul l'intégrale de func avec la méthode du calcul des aires des rectangles à gauche
function [y] = pointgauche(a, b, func, N)

	 //Initialise à 0 la somme
	 y = 0;

	 //Calcul de la somme
	 for i = a:N:b
	     y += (i + N - i) * func(i + N);
	 end
endfunction