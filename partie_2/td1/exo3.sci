
// Seed
s = 9;
rand("seed", s);

// Init times
t3 = zeros(10);
t2 = zeros(10);
t1 = zeros(10);

//
for n = 10:10:100

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

end

// Plot
xtitle("matmat3b", "n", "time");
plot([10:10:100], t3);

xtitle("matmat2b", "n", "time");
plot([10:10:100], t2);

xtitle("matmat1b", "n", "time");
plot([10:10:100], t1);