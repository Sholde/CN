
s = 10
rand("seed", s);

n = 10

// Init matrix
U = rand(n, n);
U = triu(U);
xex = rand(n, 1);

b = U * xex;

x = usolve(U, b);

// error
ferrorb = norm(xex - x, 2) / norm(xex, 2)

berrorb = norm(b - U * x, 2) / norm(b, 2)
