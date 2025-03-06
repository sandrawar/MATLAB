function [y1, y2] = zadanie2b(h)
% Funkcja rozwiązująca URRZ z zadania metodą 2d

% deklaracja zmiennych
b = [1;1];
n = 0:h:8;
y = zeros(2,length(n));
s = exp(-(n)).*sin(n);

% aktualizacja wektora odpowiedzi zgodnie ze wzorem podanym w zadaniu
for t = 3:length(n)
    y(:,t) = y(:,t-1) + (h/2)*([-1, -2; 2, -6]*y(:,t-1) + b*s(t-1) +...
        [-1, -2; 2, -6]*y(:,t-2) + b*s(t-2));
end

% zwrócenie wyników
y1 = y(1,:);
y2 = y(2,:);

end % function