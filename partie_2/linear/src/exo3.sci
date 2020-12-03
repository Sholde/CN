//
format("e", 16);

// Seed
s = 9;
rand("seed", s);

// Init times
t3 = zeros(10);
t2 = zeros(10);
t1 = zeros(10);

// polynome
x3 = zeros(10);
x2 = zeros(10);
x1 = zeros(10);

xdata = [10:10:100];

//
for n = xdata

i = n / 10;

// Init matrix
A = rand(n, n);
B = rand(n, n);

// 
tic;
C3 = matmat3b(A, B);
t3(i) = toc();

tic;
C2 = matmat2b(A, B);
t2(i) = toc();

tic;
C1 = matmat1b(A, B);
t1(i) = toc();

x3(i) = (5 * 10^(-6) * n^3);
x2(i) = (1.2 * 10^(-5) * n^2);
x1(i) = (1.9 * 10^(-5) * n);

end

// Plot
xtitle("matmat3b", "n", "time");
plot(xdata, [t3 x3]);
legend(["matmat3b"; "5*10^(-6) x^3"], 2);
xs2png(0, "img/matmat3b.png");
clf();

xtitle("matmat2b", "n", "time");
plot(xdata, [t2 x2]);
legend(["matmat2b"; "1.2*10^(-5) x^2"], 2);
xs2png(0, "img/matmat2b.png");
clf();

xtitle("matmat1b", "n", "time");
plot(xdata, [t1 x1]);
legend(["matmat2b"; "1.9*10^(-5) x"], 2);
xs2png(0, "img/matmat1b.png");
clf();