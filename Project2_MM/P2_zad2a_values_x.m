function xn = P2_zad2a_values_x(x0, x, y, t)
% Funkcja wyznaczająca estymaty wartości x(t2), ... x(tN) przy pomocy 
% niejawnej metody Eulera
% Wejście:
%   x0  - wektor wartości parametrów rx, rxy, rxx oraz x(t1)
%   x   - wektor wartości dokładnych x
%   y   - wektor wartości dokładnych y
%   t   - wektor wartości dokładnych t (długości N)
% Wyjście:
%   xn  - wektor przybliżonych wartości x w chwilach t1, t2, ... tN

% odczytanie parametrów
rx = x0(1);
rxy = x0(2);
rxx = x0(3);
x1 = x0(4);

% stworzenie wektora xn i wpisanie na niego wartości x(t1)
xn = zeros(length(x), 1);
xn(1, 1) = x1;
for n = 2:length(xn)
    % wyliczanie kolejnych przybliżonych wartości x(tn)
    r = roots([rxx*(t(n)-t(n-1)),...
        -(1 - rx*(t(n)-t(n-1)) - rxy*y(n)*(t(n)-t(n-1))),...
        xn(n-1, 1)]);
    xn(n) = max(r);
end