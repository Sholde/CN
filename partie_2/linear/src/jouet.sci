
// Main function
function [v] = jouet(n)

// Change format of floating point
format("e", 16);

// Init matrix and vectors with random value
A = rand(n, n);
xex = rand(n, 1);

// Compute b
b = A * xex;

// Compute x
x = A \ b;

// Compute error
frelres = norm(xex - x) / norm(xex);
brelres = norm(b - A * x) / norm(b);

// Cumpute condition
capa = cond(A);

// Compute born
born = capa * brelres;

// Result
v = [frelres; brelres; capa; born];

endfunction

