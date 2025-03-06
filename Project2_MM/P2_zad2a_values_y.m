function yn = P2_zad2a_values_y(y0, x, y, t)
% Funkcja wyznaczająca estymaty wartości y(t2), ... y(tN) przy pomocy 
% niejawnej metody Eulera
% Wejście:
%   y0  - wektor wartości parametrów ry, ryx, ryy oraz y(t1)
%   x   - wektor wartości dokładnych x
%   y   - wektor wartości dokładnych y
%   t   - wektor wartości dokładnych t (długości N)
% Wyjście:
%   yn  - wektor przybliżonych wartości y w chwilach t1, t2, ... tN

% odczytanie parametrów
ry = y0(1);
ryx = y0(2);
ryy = y0(3);
y1 = y0(4);

% stworzenie wektora yn i wpisanie na niego wartości y(t1)
yn = zeros(length(y), 1);
yn(1) = y1;
for n = 2:length(yn)
    % wyliczanie kolejnych przybliżonych wartości x(tn)
    r = roots([ryy*(t(n)-t(n-1)),...
        -(1 - ry*(t(n)-t(n-1)) - ryx*x(n)*(t(n)-t(n-1))),...
        yn(n-1)]);
    yn(n) = max(r);
end