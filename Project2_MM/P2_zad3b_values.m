function [xn, yn] = P2_zad3b_values(x0y0,x,y,t)
% Funkcja wyznaczająca estymaty wartości x(t2), ... x(tN) przy pomocy ode45
% Wejście:
%   x0y0 - wektor wartości parametrów rx, rxy, rxx oraz x(t1), ry, ryx,
%               ryy, y(x1)
%   x    - dokładne wartości x
%   y    - dokładne wartości y
%   t    - wektor wartości dokładnych t (długości N)
% Wyjście:
%   x_values  - wektor przybliżonych wartości x w chwilach t1, t2, ... tN
%   y_values  - wektor przybliżonych wartości y w chwilach t1, t2, ... tN

% odczytanie parametrów
rx = x0y0(1);
rxy = x0y0(2);
rxx = x0y0(3);
x1 = x0y0(4);
ry = x0y0(5);
ryx = x0y0(6);
ryy = x0y0(7);
y1 = x0y0(8);

t_ = 0:0.001:3;

% stworzenie wektora xn i wpisanie na niego wartości x(t1)
% stworzenie wektora yn i wpisanie na niego wartości y(t1)
xn = zeros(length(t_), 1);
yn = zeros(length(t_), 1);
xn(1) = x1;
yn(1) = y1;

for n = 2:length(yn)
    % wyliczanie kolejnych przybliżonych wartości x(tn) i yn(tn)
    yn(n) = yn(n-1) + (ry*yn(n-1) + ryx*xn(n-1)*yn(n-1) + ...
        ryy*yn(n-1)*yn(n-1))*(t_(n) - t_(n-1));
    xn(n) = xn(n-1) + (rx*xn(n-1) + rxy*xn(n-1)*yn(n-1) + ...
        rxx*xn(n-1)*xn(n-1))*(t_(n) - t_(n-1));
end

% Interpolacja
xn = interp1(t_, xn, t);
yn = interp1(t_, yn, t);

