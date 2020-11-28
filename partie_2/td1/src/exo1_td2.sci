// Exercice 1

//
format("e", 16);

//
s = 10
rand("seed", s);

// Init vectors
times = zeros(10);
condA = zeros(10);

// xdata
xdata = [10:10:100];

// Loop
for n = xdata

        i = n / 10;
	
	// Init matrix
	A = rand(n, n);

	// compute
	tic();
	LU = lu(A);
	times(i) = toc();
	
	// cond
	condA(i) = cond(A);

end

xtitle("Times per size", "sizes of matrix", "times");
plot(xdata, times);
xs2png(0, "img/lu_times.png");
clf();

xtitle("Condition", "sizes of matrix", "cond");
plot(xdata, log(condA));
xs2png(0, "img/lu_cond.png");
clf();
