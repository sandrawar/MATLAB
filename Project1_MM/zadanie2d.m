function [y1, y2] = zadanie2d(h)
% Funkcja rozwiązująca URRZ z zadania metodą 2d

% deklaracja zmiennych
A = [-1, -2; 2. -6];
b = [1; 1];
n = 0:h:8;
x = @(t) exp(-t)*sin(t);
y = zeros(2,length(n));
I = eye(2, 2);
a = [0,0,0;5/24,1/3,(-1)/14;1/6,2/3,1/6];
c = [0,1/2,1];
w = [1/6,2/3,1/6];

% deklaracja macierzy L pomocniczej do rozwiązania układy równań
L = [(I - a(1,1) * h * A), (-1 * a(1,2) * h * A),...
     (-1 * a(1,3) * h * A); (-1 * a(2,1) * h * A),...
     (I - a(2,2) * h * A), (-a(2,3) * h * A); ...
     (-1 * a(3,1) * h * A), (-a(3,2) * h * A), (I - a(3,3) * h * A)];
 
% rozwiązanie układu równań i aktualizacja wektora odpowiedzi y zgodnie ze
% wzorem z zadania
 for t = 2:length(n)
    p = [A * y(:, t - 1) + ...
            x(n(t - 1) + c(1) * h); ...
            A * y(:, t - 1) + ...
            x(n(t - 1) + c(2) * h);...
            A * y(:, t - 1) + ...
            x(n(t - 1) + c(3) * h)];
        q = L \ p;
        q = [q(1:2,1),q(3:4,1),q(5:6,1)];
        y(:, t) = y(:, t - 1) + h * sum(q .* w, 2);
 end
y1 = y(1,:);
y2 = y(2,:);

end % function