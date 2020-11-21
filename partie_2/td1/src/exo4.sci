
//
s = 10
rand("seed", s);

// Init vectors 
ferrorb = zeros(10);
berrorb = zeros(10);

// xdata
xdata = [10:20];

// Loop
for n = xdata

	i = n - 9;
	
	// Init matrix
	U = rand(n, n);
	U = triu(U);
	xex = rand(n, 1);
	
	b = U * xex;
	
	x = usolve(U, b);
	
	// error
	ferrorb(i) = norm(xex - x, 2) / norm(xex, 2);
	
	berrorb(i) = norm(b - U * x, 2) / norm(b, 2);

end

xtitle("Forward relative result", "n", "ferrorb");
plot(xdata, ferrorb);
xs2png(0, "img/ferrorb.png");
clf();

xtitle("Backward relative result", "n", "berrorb");
plot(xdata, berrorb);
xs2png(0, "img/berrorb.png");
clf();
