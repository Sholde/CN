// Exercice 5

//
format("e", 16);

//
s = 10
rand("seed", s);

// Init vectors
ferror = zeros(10);
berror = zeros(10);
condA = zeros(10);

// xdata
xdata = [10:10:100];

// Loop
for n = xdata

        i = n / 10;
	
	// Init matrix
	A = rand(n, n);
	xex = rand(n, 1);

	// b
	b = A * xex;

	// x
	x = gausskij3b(A, b);
	
	// error
	ferror(i) = norm(xex - x, 2) / norm(xex, 2);
	berror(i) = norm(b - A * x, 2) / norm(b, 2);

	// cond
	condA(i) = cond(A);

end

xtitle("Relative error result", "sizes of matrix", "relative error");
plot(xdata, [log(ferror) log(berror)]);
legend(["forward error" "backward error"], 2)
xs2png(0, "img/gauss_error.png");
clf();

xtitle("Condition", "sizes of matrix", "cond");
plot(xdata, log(condA));
xs2png(0, "img/gauss_cond.png");
clf();
