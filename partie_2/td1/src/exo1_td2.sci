// Exercice 1

//
format("e", 16);

//
s = 10
rand("seed", s);

// Init vectors
times = zeros(10);
condA = zeros(10);
ferror = zeros(10);
berror = zeros(10);

// xdata
xdata = [10:10:100];

// Loop
for n = xdata

        k = n / 10;
	
	// Init matrix
	A = rand(n, n);
	for i = 1:n
	    for j = 1:n
	    	if ((i ~= j) & (i-1 ~= j) & (i+1 ~= j))
		   A(i, j) = 0;
		end
	    end
	end

	// compute
	tic();
	LU = lu_compact(A);
	LU = lu_compute(LU);
	times(k) = toc();

	// error
	ferror(k) = norm(A - LU) / norm(A);
	
	// cond
	condA(k) = cond(A);

end

xtitle("Times per size", "sizes of matrix", "times");
plot(xdata, times);
xs2png(0, "img/lu_times.png");
clf();

xtitle("Condition", "sizes of matrix", "cond");
plot(xdata, log(condA));
xs2png(0, "img/lu_cond.png");
clf();

xtitle("Forward relative error", "sizes of matrix", "error (log_10)");
plot(xdata, log(ferror));
xs2png(0, "img/lu_compact_error.png");
clf();
