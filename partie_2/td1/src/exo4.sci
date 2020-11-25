
//
s = 10
rand("seed", s);

// Init vectors 
U_ferrorb = zeros(10);
U_berrorb = zeros(10);
L_ferrorb = zeros(10);
L_berrorb = zeros(10);

// xdata
xdata = [10:10:100];

// Loop
for n = xdata

        i = n / 10;
	
	// Init matrix
	A = rand(n, n);
	U = triu(A);
	L = tril(A);
	xex = rand(n, 1);
	
	b = U * xex;

	// U
	x = usolve(U, b);
	
	// error
	U_ferrorb(i) = norm(xex - x, 2) / norm(xex, 2);
	U_berrorb(i) = norm(b - U * x, 2) / norm(b, 2);


	b = L * xex;

        // L
	x = lsolve(L, b);
	
	// error
	L_ferrorb(i) = norm(xex - x, 2) / norm(xex, 2);
	L_berrorb(i) = norm(b - L * x, 2) / norm(b, 2);

end

xtitle("Forward relative result for U", "n", "ferrorb");
plot(xdata, log(U_ferrorb));
xs2png(0, "img/U_ferrorb.png");
clf();

xtitle("Backward relative result for U", "n", "berrorb");
plot(xdata, log(U_berrorb));
xs2png(0, "img/U_berrorb.png");
clf();

xtitle("Forward relative result for L", "n", "ferrorb");
plot(xdata, log(L_ferrorb));
xs2png(0, "img/L_ferrorb.png");
clf();

xtitle("Backward relative result for L", "n", "berrorb");
plot(xdata, log(L_berrorb));
xs2png(0, "img/L_berrorb.png");
clf();
