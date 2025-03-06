function [x_values, y_values] = P2_zad3a_values(x0y0, t_dane) 
% Funkcja wyznaczająca estymaty wartości x(t2), ... x(tN) przy pomocy ode45
% Wejście:
%   x0y0      - wektor wartości parametrów rx, rxy, rxx oraz x(t1), ry, ryx,
%               ryy, y(x1)
%   t_dane    - wektor wartości dokładnych t (długości N)
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

% Wyliczenie wartości x i y przy użyciu ode45
[t, v] = ode45(@URRZ, [min(t_dane) max(t_dane)], [x1 y1]);
        
    function xy_ = URRZ(~, v)
            x = v(1);
            y = v(2);
            xy_ = [rx*x + rxy*x.*y + rxx*x.*x; ...
                ry*y + ryx*x.*y + ryy*y.*y];
    end

% Interpolacja
x_values = interp1(t, v(:,1), t_dane);
y_values = interp1(t, v(:,2), t_dane);
end

