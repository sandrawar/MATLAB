% Sandra Adamiec, Modelowanie matematyczne, Projekt nr 2, zadanie 5
clear vars;

% Wczytanie danych z pliku
dane = readtable("HudsonBay.csv");
t = dane{:,"Year"};
x = dane{:, "Hares"};
y = dane{:, "Lynx"};
% Przeskalowanie wartości t do przedziału z poprzednich zadań
t = (t-1845)./30;

% Wyznaczenie wartości początkowych parametrów układu
rx = linspace(0,40,50);
rxy = linspace(-1,0,10);
rxx = linspace(-0.1,0,10);
x1 = linspace(2,150,60);

ry = linspace(-40,0,50);
ryx = linspace(0,1,10);
ryy = linspace(-0.1,0,10);
y1 = linspace(2,80,60);

combs = combinations(rx,rxy,rxx,x1);
combs = table2array(combs);

combs2 = combinations(ry,ryx,ryy,y1);
combs2 = table2array(combs2);

sols = zeros(length(rx),1);
sols2 = zeros(length(ry),1);

for i=1:length(combs)
    sols(i) = J_x(combs(i,:), x, y, t);
    sols2(i) = J_y(combs2(i,:), x, y, t);
end
minimum = min(sols);
Rminimum = combs(sols == minimum,:);
minimumY = min(sols2);
RminimumY = combs2(sols2 == minimumY,:);

% Dobieranie współczynników przy użyciu jawnej metody Eulera
J_x_func = @(x0) J_x(x0,x,y,t);
x0 = fminsearch(J_x_func, Rminimum(1,:));
rx = x0(1);
rxy = x0(2);
rxx = x0(3);
x1 = x0(4);

J_y_func = @(y0) J_y(y0,x,y,t);
y0 = fminsearch(J_y_func,RminimumY(1,:));
ry = y0(1);
ryx = y0(2);
ryy = y0(3);
y1 = y0(4);

% Dobieranie współczynników przy użyciu niejawnej metody Eulera
J_2a_x_func = @(x0) J_2a_x(x0,x,y,t);
x0_2a = fminsearch(J_2a_x_func,Rminimum(1,:));
rx_2a = x0_2a(1);
rxy_2a = x0_2a(2);
rxx_2a = x0_2a(3);
x1_2a = x0_2a(4);

J_2a_y_func = @(y0) J_2a_y(y0,x,y,t);
y0_2a = fminsearch(J_2a_y_func,RminimumY(1,:));
ry_2a = y0_2a(1);
ryx_2a = y0_2a(2);
ryy_2a = y0_2a(3);
y1_2a = y0_2a(4);

% Dobieranie wspólczynników przy użyciu niejawnej metody trapezów
J_2b_x_func = @(x0) J_2b_x(x0,x,y,t);
x0_2b = fminsearch(J_2b_x_func,Rminimum(1,:));
rx_2b = x0_2b(1);
rxy_2b = x0_2b(2);
rxx_2b = x0_2b(3);
x1_2b = x0_2b(4);

J_2b_y_func = @(y0) J_2b_y(y0,x,y,t);
y0_2b = fminsearch(J_2b_y_func,RminimumY(1,:));
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
plot(1845:1935, x);
hold on
[xn,~] = P2_zad3a_values(x0y0_3a_1, t);
plot(1845:1935, xn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji zajęcy amerykańskich..." + ...
    " przy użyciu ode45 i punktu startowego z 1a")
hold off

subplot(2,1,2);
plot(1845:1935, y);
hold on
[~,yn] = P2_zad3a_values(x0y0_3a_1, t);
plot(1845:1935, yn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji rysi kanadyjskich..." + ...
    " przy użyciu ode45 i punktu startowego z 1b")
hold off

figure(2)
subplot(2,1,1);
plot(1845:1935, x);
hold on
[xn,~] = P2_zad3a_values(x0y0_3a_2a, t);
plot(1845:1935, xn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności zajęcy amerykańskich..." + ...
    " przy użyciu ode45 i punktu startowego z 2a")
hold off

subplot(2,1,2);
plot(1845:1935, y);
hold on
[~,yn] = P2_zad3a_values(x0y0_3a_2a, t);
plot(1845:1935, yn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji rysi kanadyjskich..." + ...
    " przy użyciu ode45 i punktu startowego z 2a")
hold off

figure(3)
subplot(2,1,1);
plot(1845:1935, x);
hold on
[xn,~] = P2_zad3a_values(x0y0_3a_2b, t);
plot(1845:1935, xn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji zajęcy amerykańskich..." + ...
    " przy użyciu ode45 i punktu startowego z 2b")
hold off

subplot(2,1,2);
plot(1845:1935, y);
hold on
[~,yn] = P2_zad3a_values(x0y0_3a_2b, t);
plot(1845:1935, yn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji rysi kanadyjskich..." + ...
    " przy użyciu ode45 i punktu startowego z 2b")
hold off

figure(4)
subplot(2,1,1);
plot(1845:1935, x);
hold on
[xn,~] = P2_zad3b_values(x0y0_3b_1, x, y, t);
plot(1845:1935, xn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji zajęcy amerykańskich..." + ...
    " przy użyciu jawnej metody Eulera i punktu startowego z 1a")
hold off

subplot(2,1,2);
plot(1845:1935, y);
hold on
[~,yn] = P2_zad3b_values(x0y0_3b_1, x, y, t);
plot(1845:1935, yn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji rysi kanadyjskich..." + ...
    " przy użyciu jawnej metody Eulera i punktu startowego z 1b")
hold off

figure(5)
subplot(2,1,1);
plot(1845:1935, x);
hold on
[xn,~] = P2_zad3b_values(x0y0_3b_2a, x, y, t);
plot(1845:1935, xn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji zajęcy amerykańskich..." + ...
    " przy użyciu jawnej metody Eulera i punktu startowego z 2a")
hold off

subplot(2,1,2);
plot(1845:1935, y);
hold on
[~,yn] = P2_zad3b_values(x0y0_3b_2a, x, y, t);
plot(1845:1935, yn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji rysi kanadyjskich..." + ...
    " przy użyciu jawnej metody Eulera i punktu startowego z 2a")
hold off

figure(6)
subplot(2,1,1);
plot(1845:1935, x);
hold on
[xn,~] = P2_zad3b_values(x0y0_3b_2b, x, y, t);
plot(1845:1935, xn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji zajęcy amerykańskich..." + ...
    " przy użyciu jawnej metody Eulera i punktu startowego z 2b")
hold off

subplot(2,1,2);
plot(1845:1935, y);
hold on
[~, yn] = P2_zad3b_values(x0y0_3b_2b, x, y, t);
plot(1845:1935, yn);
legend("wartości dokładne", "wartości przybliżone")
xlabel("t - czas")
ylabel("liczność populacji")
title("Przybliżenie liczebności populacji rysi kanadyjskich..." + ...
    " przy użyciu jawnej metody Eulera i punktu startowego z 2b")
hold off