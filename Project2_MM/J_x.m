function J = J_x(x0, x, y, t)
% Funkcja wyliczająca wskaźnik dopasowania do danych Jx dla wartości x 
% przybliżonych przy pomocy jawnej metody Eulera
% Wejście:
%   x0  - wektor wartości parametrów rx, rxy, rxx oraz x(t1)
%   x   - wektor wartości dokładnych x
%   y   - wektor wartości dokładnych y
%   t   - wektor wartości dokładnych t (długości N)
% Wyjście:
%   J   - wartość wskaźnika dopasowania

% Wyznaczenie wektora estymacji x(t) przy użyciu jawnej metody Eulera
xn = P2_zad1a_values(x0, x, y, t);

% Wyliczenie wskaźnika dopasowania do danych
J = sum((xn-x).*(xn-x));