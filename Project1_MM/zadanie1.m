function [y1, y2] = zadanie1(h)
% Funkcja rozwiązująca URRZ z zadania przy użyciu procedury dsolve

% deklaracja zmiennych
syms y(t) y1(t) y2(t) x(t);
y(t) = [y1(t); y2(t)];
Df(t) = [diff(y1); diff(y2)];
x(t) = exp(-t)*sin(t);
b = [1; 1];
Dy = [-1, -2; 2, -6]*y + b*x(t);
cond = Df(0) == 0;

% użycie procedury dsolve do wyznaczenia rozwiązania
a = dsolve(Df == Dy, cond);
s = subs(a, 0:h:8);

% wyznaczenie odpowidzi
y1 = s.y1;
y2 = s.y2;

end % function

