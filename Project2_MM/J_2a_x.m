function J = J_2a_x(x0, x, y, t)
% Funkcja wyliczająca wskaźnik dopasowania do danych Jx dla wartości x 
% przybliżonych przy pomocy niejawnej metody Eulera
% Wejście:
%   x0  - wektor wartości parametrów rx, rxy, rxx oraz x(t1)
%   x   - wektor wartości dokładnych x
%   y   - wektor wartości dokładnych y
%   t   - wektor wartości dokładnych t (długości N)
% Wyjście:
%   J   - wartość wskaźnika dopasowania

% Wyznaczenie wektora estymacji x(t) przy użyciu niejawnej metody Eulera
xn = P2_zad2a_values_x(x0, x, y, t);

% Wyliczenie wskaźnika dopasowania do danych
J = sum((xn-x).*(xn-x));