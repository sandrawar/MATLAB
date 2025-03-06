function J = J_3a(x0y0, x, y, t)
% Funkcja wyliczająca wskaźnik dopasowania do danych J dla wartości
% x oraz y przybliżonych przy użyciu ode45
% Wejście:
%   x0y0  - wektor wartości parametrów rx, rxy, rxx, x(t1), ry, ryx, ryy
%           oraz y(t1)  
%   x     - wektor wartości dokładnych x
%   y     - wektor wartości dokładnych y
%   t     - wektor wartości dokładnych t (długości N)
% Wyjście:
%   J   - wartość wskaźnika dopasowania

% Wyznaczenie wektorów estymacji x(t) oraz y(t) przy użyciu ode45
[x_ode, y_ode] = P2_zad3a_values(x0y0, t);

% Wyliczenie wskaźnika dopasowania do danych
J = sum((x_ode - x).^2) + sum((y_ode - y).^2);
