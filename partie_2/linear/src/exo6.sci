// Exercice 6

//
format("e", 16);

//
s = 10
rand("seed", s);

// Init vectors
times = zeros(10);
x3 = zeros(10);
ferror = zeros(10);
condA = zeros(10);

// xdata
xdata = [10:10:100];

// Loop
for n = xdata

        i = n / 10;
	
	// Init matrix
	A = rand(n, n);
	tmp = A;

	// LU
	tic();
	LU = mylu3b(tmp);
	LU = lu_compute(LU);
	times(i) = toc();

	// x3
	x3(i) = 2.5 * 10^(-6) * xdata(i)^3;

	// error
	ferror(i) = norm(A - LU) / norm(A);

	// cond
	condA(i) = cond(A);

end

xtitle("Times per size", "sizes of matrix", "times (second)");
plot(xdata, [times x3]);
legend(["mylu3b" "2.5*10^(-6) x^3"], 2);
xs2png(0, "img/mylu_times.png");
clf();

xtitle("Relative error result", "sizes of matrix", "relative error");
plot(xdata, log(ferror));
xs2png(0, "img/mylu_error.png");
clf();

xtitle("Condition", "sizes of matrix", "cond");
plot(xdata, log(condA));
xs2png(0, "img/mylu_cond.png");
clf();
