function [y1, y2] = zadanie2c(h)
% Funkcja rozwiązująca URRZ z zadania metodą 2d

% deklaracja zmiennych
b = [1;1];
n = 0:h:8;
y = zeros(2,length(n));
I = eye(2, 2);
s = exp(-(n)).*sin(n);

% aktualizacja wektora odpowiedzi zgodnie ze wzorem podanym w zadaniu
for t = 3:length(n)
    y(:,t) = ((I - (5/12)*h*[-1, -2; 2, -6])^(-1))*(y(:,t-1) + ...
        (h/12)*(5*b*s(t-1) + 8*[-1, -2; 2, -6]*y(:,t-1) + 8*b*s(t-2) - ...
        [-1, -2; 2, -6]*y(:,t-2) - b*exp(-(t-3))*sin(t-3)));
end

% zwrócenie odpowiedzi
y1 = y(1,:);
y2 = y(2,:);

end % function