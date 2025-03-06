% Sandra Adamiec, Modelowanie matematyczne, Projekt 2, plik główny

clear vars;
% Wczytywanie danych
dane = readtable("dane01.csv");
t = dane{:,"t"};
x = dane{:, "x"};
y = dane{:, "y"};

% Wyznaczanie punktu startowego
rx = linspace(0,40,80);
rxy = linspace(-1,0,20);
rxx = linspace(-0.1,0,20);
x1 = linspace(100,1000,50);

ry = linspace(-40,0,80);
ryx = linspace(0,1,20);
ryy = linspace(-0.1,0,20);
y1 = linspace(10,200,50);

combs_x = combinations(rx,rxy,rxx,x1);
combs_x = table2array(combs_x);

combs_y = combinations(ry,ryx,ryy,y1);
combs_y = table2array(combs_y);

sols_x = zeros(length(rx),1);
sols_y = zeros(length(ry),1);
for i=1:length(combs_x)
    sols_x(i) = J_x(combs_x(i,:), x, y, t);
    sols_y(i) = J_y(combs_y(i,:), x, y, t);
end

minimum_x = min(sols_x);
start_x = combs_x(sols_x == minimum_x,:);
minimum_y = min(sols_y);
start_y = combs_y(sols_y == minimum_y,:);

% Dobieranie współczynników przy użyciu jawnej metody Eulera

J_x_func = @(x0) J_x(x0,x,y,t);
x0 = fminsearch(J_x_func, start_x(1,:));
rx = x0(1);
rxy = x0(2);
rxx = x0(3);
x1 = x0(4);

J_y_func = @(y0) J_y(y0,x,y,t);
y0 = fminsearch(J_y_func,start_y(1,:));
ry = y0(1);
ryx = y0(2);
ryy = y0(3);
y1 = y0(4);

% Dobieranie współczynników przy użyciu niejawnej metody Eulera

J_2a_x_func = @(x0) J_2a_x(x0,x,y,t);
x0_2a = fminsearch(J_2a_x_func,start_x(1,:));
rx_2a = x0_2a(1);
rxy_2a = x0_2a(2);
rxx_2a = x0_2a(3);
x1_2a = x0_2a(4);

J_2a_y_func = @(y0) J_2a_y(y0,x,y,t);
y0_2a = fminsearch(J_2a_y_func,start_y(1,:));
ry_2a = y0_2a(1);
ryx_2a = y0_2a(2);
ryy_2a = y0_2a(3);
y1_2a = y0_2a(4);

% Dobieranie wspólczynników przy użyciu niejawnej metody trapezów

J_2b_x_func = @(x0) J_2b_x(x0,x,y,t);
x0_2b = fminsearch(J_2b_x_func,start_x(1,:));
rx_2b = x0_2b(1);
rxy_2b = x0_2b(2);
rxx_2b = x0_2b(3);
x1_2b = x0_2b(4);

J_2b_y_func = @(y0) J_2b_y(y0,x,y,t);
y0_2b = fminsearch(J_2b_y_func,start_y(1,:));
ry_2b = y0_2b(1);
ryx_2b = y0_2b(2);
ryy_2b = y0_2b(3);
y1_2b = y0_2b(4);

% Dobieranie współczynników przy użyciu ode45

% punkt startowy z 1
J_3a_func = @(x0y0) J_3a(x0y0,x,y,t);
x0y0_3a_1 = fminsearch(J_3a_func,[x0 y0]);
rx_3a_1 = x0y0_3a_1(1);
rxy_3a_1 = x0y0_3a_1(2);
rxx_3a_1 = x0y0_3a_1(3);
x1_3a_1 = x0y0_3a_1(4);
ry_3a_1 = x0y0_3a_1(5);
ryx_3a_1 = x0y0_3a_1(6);
ryy_3a_1 = x0y0_3a_1(7);
y1_3a_1 = x0y0_3a_1(8);

% punkt startowy z 2a
x0y0_3a_2a = fminsearch(J_3a_func,[x0_2a y0_2a]);
rx_3a_2a = x0y0_3a_2a(1);
rxy_3a_2a = x0y0_3a_2a(2);
rxx_3a_2a = x0y0_3a_2a(3);
x1_3a_2a = x0y0_3a_2a(4);
ry_3a_2a = x0y0_3a_2a(5);
ryx_3a_2a = x0y0_3a_2a(6);
ryy_3a_2a = x0y0_3a_2a(7);
y1_3a_2a = x0y0_3a_2a(8);

% punkt startowy z 2b
x0y0_3a_2b = fminsearch(J_3a_func,[x0_2b y0_2b]);
rx_3a_2b = x0y0_3a_2b(1);
rxy_3a_2b = x0y0_3a_2b(2);
rxx_3a_2b = x0y0_3a_2b(3);
x1_3a_2b = x0y0_3a_2b(4);
ry_3a_2b = x0y0_3a_2b(5);
ryx_3a_2b = x0y0_3a_2b(6);
ryy_3a_2b = x0y0_3a_2b(7);
y1_3a_2b = x0y0_3a_2b(8);


% Dobieranie współczynników przy użyciu jawnej metody Eulera

% punkt startowy z 1
J_3b_func = @(x0y0) J_3b(x0y0,x,y,t);
x0y0_3b_1 = fminsearch(J_3b_func,[x0 y0]);
rx_3b_1 = x0y0_3b_1(1);
rxy_3b_1 = x0y0_3b_1(2);
rxx_3b_1 = x0y0_3b_1(3);
x1_3b_1 = x0y0_3b_1(4);
ry_3b_1 = x0y0_3b_1(5);
ryx_3b_1 = x0y0_3b_1(6);
ryy_3b_1 = x0y0_3b_1(7);
y1_3b_1 = x0y0_3b_1(8);

% punkt startowy z 2a
J_3b_func = @(x0y0) J_3b(x0y0,x,y,t);
x0y0_3b_2a = fminsearch(J_3b_func,[x0_2a y0_2a]);
rx_3b_2a = x0y0_3b_2a(1);
rxy_3b_2a = x0y0_3b_2a(2);
rxx_3b_2a = x0y0_3b_2a(3);
x1_3b_2a = x0y0_3b_2a(4);
ry_3b_2a = x0y0_3b_2a(5);
ryx_3b_2a = x0y0_3b_2a(6);
ryy_3b_2a = x0y0_3b_2a(7);
y1_3b_2a = x0y0_3b_2a(8);

% punkt startowy z 2b
J_3b_func = @(x0y0) J_3b(x0y0,x,y,t);
x0y0_3b_2b = fminsearch(J_3b_func,[x0_2b y0_2b]);
rx_3b_2b = x0y0_3b_2b(1);
rxy_3b_2b = x0y0_3b_2b(2);
rxx_3b_2b = x0y0_3b_2b(3);
x1_3b_2b = x0y0_3b_2b(4);
ry_3b_2b = x0y0_3b_2b(5);
ryx_3b_2b = x0y0_3b_2b(6);
ryy_3b_2b = x0y0_3b_2b(7);
y1_3b_2b = x0y0_3b_2b(8);

% Rysowanie wykresów wyników

figure(1)
subplot(2,1,1);
plot(t, x);
hold on
xn = P2_zad1a_values(x0, x, y, t);
plot(t, xn);
title("Przybliżenie wartości x jawną metodą Eulera")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
yn = P2_zad1b_values(y0, x, y, t);
plot(t, yn);
title("Przybliżenie wartości y jawną metodą Eulera")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

figure(2)
subplot(2,1,1);
plot(t, x);
hold on
xn = P2_zad2a_values_x(x0_2a, x, y, t);
plot(t, xn);
title("Przybliżenie wartości x niejawną metodą Eulera")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
yn = P2_zad2a_values_y(y0_2a, x, y, t);
plot(t, yn);
title("Przybliżenie wartości y niejawną metodą Eulera")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

figure(3)
subplot(2,1,1);
plot(t, x);
hold on
xn = P2_zad2b_values_x(x0_2b, x, y, t);
plot(t, xn);
title("Przybliżenie wartości x niejawną metodą trapezów")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
yn = P2_zad2b_values_y(y0_2b, x, y, t);
plot(t, yn);
title("Przybliżenie wartości y niejawną metodą trapezów")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

figure(4)
subplot(2,1,1);
plot(t, x);
hold on
[x0y0_3a_1x,~] = P2_zad3a_values(x0y0_3a_1, t);
plot(t, x0y0_3a_1x);
title("Przybliżenie wartości x przy użyciu ode45 i punktu startowego z 1a")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
[~,x0y0_3a_1y] = P2_zad3a_values(x0y0_3a_1,t);
plot(t, x0y0_3a_1y);
title("Przybliżenie wartości y przy użyciu ode45 i punktu startowego z 1b")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

figure(5)
subplot(2,1,1);
plot(t, x);
hold on
[x0y0_3a_2ax,~] = P2_zad3a_values(x0y0_3a_2a, t);
plot(t, x0y0_3a_2ax);
title("Przybliżenie wartości x przy użyciu ode45 i punktu startowego z 2a")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
[~,x0y0_3a_2ay] = P2_zad3a_values(x0y0_3a_2a,t);
plot(t, x0y0_3a_2ay);
title("Przybliżenie wartości y przy użyciu ode45 i punktu startowego z 2a")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

figure(6)
subplot(2,1,1);
plot(t, x);
hold on
[x0y0_3a_2bx,~] = P2_zad3a_values(x0y0_3a_2b, t);
plot(t, x0y0_3a_2bx);
title("Przybliżenie wartości x przy użyciu ode45 i punktu startowego z 2b")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
[~,x0y0_3a_2by] = P2_zad3a_values(x0y0_3a_2b,t);
plot(t, x0y0_3a_2by);
title("Przybliżenie wartości y przy użyciu ode45 i punktu startowego z 2b")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off


figure(7)
subplot(2,1,1);
plot(t, x);
hold on
[xn,~] = P2_zad3b_values(x0y0_3b_1, x, y, t);
plot(t, xn);
title("Przybliżenie wartości x przy użyciu jawnej metody Eulera i punktu startowego z 1a")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
[~,yn] = P2_zad3b_values(x0y0_3b_1, x, y, t);
plot(t, yn);
title("Przybliżenie wartości y przy użyciu jawnej metody Eulera i punktu startowego z 1b")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

figure(8)
subplot(2,1,1);
plot(t, x);
hold on
[xn,~] = P2_zad3b_values(x0y0_3b_2a, x, y, t);
plot(t, xn);
title("Przybliżenie wartości x przy użyciu jawnej metody Eulera i punktu startowego z 2a")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
[~,yn] = P2_zad3b_values(x0y0_3b_2a, x, y, t);
plot(t, yn);
title("Przybliżenie wartości y przy użyciu jawnej metody Eulera i punktu startowego z 2a")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

figure(9)
subplot(2,1,1);
plot(t, x);
hold on
[xn,~] = P2_zad3b_values(x0y0_3b_2b, x, y, t);
plot(t, xn);
title("Przybliżenie wartości x przy użyciu jawnej metody Eulera i punktu startowego z 2b")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

subplot(2,1,2);
plot(t, y);
hold on
[~, yn] = P2_zad3b_values(x0y0_3b_2b, x, y, t);
plot(t, yn);
title("Przybliżenie wartości y przy użyciu jawnej metody Eulera i punktu startowego z 2b")
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
hold off

% Szukanie x i y, dla których układ osiąga stan równowagi
syms x y
eq1 = rx*x + rxy*x*y + rxx*x*x;
eq2 = ry*y + ryx*x*y + ryy*y*y;
stale = solve(eq1, eq2);
odp4_x = double(stale.x);
odp4_y = double(stale.y);

% Wybranie odpowiedzi (zarówno x, jak i y muszą być dodatnie)
odp4_x = odp4_x(odp4_x>0 & odp4_y > 0)
odp4_y = odp4_y(odp4_x>0 & odp4_y > 0)





