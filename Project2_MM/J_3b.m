function J = J_3b(x0y0, x, y, t)
% Funkcja wyliczająca wskaźnik dopasowania do danych J dla wartości
% x oraz y przybliżonych przy użyciu jawnej metody Eulera
% Wejście:
%   x0y0  - wektor wartości parametrów rx, rxy, rxx, x(t1), ry, ryx, ryy
%           oraz y(t1)  
%   x     - wektor wartości dokładnych x
%   y     - wektor wartości dokładnych y
%   t     - wektor wartości dokładnych t (długości N)
% Wyjście:
%   J   - wartość wskaźnika dopasowania

% Wyznaczenie wektorów estymacji x(t) oraz y(t) przy użyciu jawnej metody
% Eulera
[xn, yn] = P2_zad3b_values(x0y0, x, y, t);

% Wyliczenie wskaźnika dopasowania do danych
J = sum((xn - x).*(xn - x) + (yn - y).*(yn - y));