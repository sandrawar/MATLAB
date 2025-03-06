function [y1, y2] = zadanie2a()
% Funkcja rozwiązująca URRZ z zadania przy użyciu procedury ode45

[~, y] = ode45(@(t, y)[-1, -2; 2, -6]*y + ...
    [1;1]*(exp((-1)*t)*sin(t)), [0 8], [0;0]);

% zwrócenie wyniku
y1 = y(:,1);
y2 = y(:,2);

end % function
  