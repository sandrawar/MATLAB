function J = J_2b_y(y0, x, y, t)
% Funkcja wyliczająca wskaźnik dopasowania do danych Jy dla wartości y 
% przybliżonych przy pomocy niejawnej metody trapezów
% Wejście:
%   y0  - wektor wartości parametrów ry, ryx, ryy oraz y(t1)
%   x   - wektor wartości dokładnych x
%   y   - wektor wartości dokładnych y
%   t   - wektor wartości dokładnych t (długości N)
% Wyjście:
%   J   - wartość wskaźnika dopasowania

% Wyznaczenie wektora estymacji y(t) przy użyciu niejawnej metody trapezów
yn = P2_zad2b_values_y(y0, x, y, t);

% Wyliczenie wskaźnika dopasowania do danych
J = sum((yn-y).*(yn-y));