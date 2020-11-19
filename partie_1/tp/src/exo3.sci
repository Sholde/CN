// Exercice 3

// Calcul x au carré
function [y] = square(x)
	 y = x * x;
endfunction

//**********************************************************

// Calcul la fonction f
function [y] = func(x)
	 y = log(2 * cos(square((%pi * x) / 4)) + 1);
endfunction
