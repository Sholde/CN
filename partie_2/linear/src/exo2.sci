
// Script
format("e", 16);

n = [10:10:100, 200:100:1000];

v = zeros(19, 4);

for i = 1:19
    v(i, :) = jouet(n(i));
end

xtitle("Forward relative result", "n", "frelres");
plot(n, log(v(:, 1)));
xs2png(0, "img/frelres.png");
clf();

xtitle("Backward relative result", "n", "brelres");
plot(n, log(v(:, 2)));
xs2png(0, "img/brelres.png");
clf();

xtitle("Cond A", "n", "cond");
plot(n, log(v(:, 3)));
xs2png(0, "img/capa.png");
clf();

xtitle("Born", "n", "born");
plot(n, log(v(:, 4)));
xs2png(0, "img/born.png");
clf();