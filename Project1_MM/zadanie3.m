function [err1b, err2b, err1c, err2c, err1d, err2d] = zadanie3(h)
% Funkcja wyliczająca błędy względne wyników otrzymanych metodami 2b, 2c
% oraz 2d dla podanego kroku h

% deklaracja zmiennych
err1b = 1:length(h);
err2b = 1:length(h);
err1c = 1:length(h);
err2c = 1:length(h);
err1d = 1:length(h);
err2d = 1:length(h);

% wyliczenie błędów przy pomocy wzorów podanych w zadaniu
for i = 1:length(h)
    [y1, y2] = zadanie1(h(i));
    [y1b, y2b] = zadanie2b(h(i));
    [y1c, y2c] = zadanie2c(h(i));
    [y1d, y2d] = zadanie2d(h(i));
    err1b(i) = sum((y1 - y1b).*(y1 - y1b)) / sum(y1.*y1);
    err2b(i) = sum((y2 - y2b).*(y2 - y2b)) / sum(y2.*y2);
    err1c(i) = sum((y1 - y1c).*(y1 - y1c)) / sum(y1.*y1);
    err2c(i) = sum((y2 - y2c).*(y2 - y2c)) / sum(y2.*y2);
    err1d(i) = sum((y1 - y1d).*(y1 - y1d)) / sum(y1.*y1);
    err2d(i) = sum((y2 - y2d).*(y2 - y2d)) / sum(y2.*y2);
end

end % function

