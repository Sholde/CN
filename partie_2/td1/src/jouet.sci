
// Main function
function [f, b, c, b] = jouet(n)

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
frelres = norm(xex - x) / norm(x);
brelres = norm(b - A * x) / norm(b);

// Cumpute condition
capa = cond(A);

// Compute born
born = capa * brelres;

f = frelres;
b = brelres;
c = capa;
b = born;

endfunction

