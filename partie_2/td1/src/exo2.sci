
// Script

n = [10, 100, 1000];

v = zeros(3, 4);

for i = 1:3
    v(i) = jouet(n(i));
end

xtitle("Forward relative result", "n", "frelres");
plot(n, [v(1, 1), v(2, 1), v(3, 1)]);
xs2png(0, "img/frelres.png");
clf();

xtitle("Backward relative result", "n", "brelres");
plot(n, [v(1, 2), v(2, 2), v(3, 2)]);
xs2png(0, "img/brelres.png");
clf();

xtitle("Cond A", "n", "cond");
plot(n, [v(1, 3), v(2, 3), v(3, 3)]);
xs2png(0, "img/capa.png");
clf();

xtitle("Born", "n", "born");
plot(n, [v(1, 4), v(2, 4), v(3, 4)]);
xs2png(0, "img/born.png");
clf();