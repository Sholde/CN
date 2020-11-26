
//
format("e", 16);

//
s = 10
rand("seed", s);

// Init vectors 
U_ferrorb = zeros(10);
U_berrorb = zeros(10);
U_cond = zeros(10);
L_ferrorb = zeros(10);
L_berrorb = zeros(10);
L_cond = zeros(10);

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

	U_cond(i) = cond(U);


	b = L * xex;

        // L
	x = lsolve(L, b);
	
	// error
	L_ferrorb(i) = norm(xex - x, 2) / norm(xex, 2);
	L_berrorb(i) = norm(b - L * x, 2) / norm(b, 2);

	L_cond(i) = cond(L);

end

xtitle("Forward relative result", "sizes of matrix", "forward error");
plot(xdata, [log(U_ferrorb) log(L_ferrorb)]);
legend(["upper matrix" "lower matrix"], 2);
xs2png(0, "img/ferrorb.png");
clf();

xtitle("Backward relative result", "sizes of matrix", "backward error");
plot(xdata, [log(U_berrorb) log(L_berrorb)]);
legend(["upper matrix" "lower matrix"], 2);
xs2png(0, "img/berrorb.png");
clf();

xtitle("Condition", "sizes of matrix", "cond");
plot(xdata, [log(U_cond) log(L_cond)]);
legend(["upper matrix" "lower matrix"], 2);
xs2png(0, "img/condb.png");
clf();
