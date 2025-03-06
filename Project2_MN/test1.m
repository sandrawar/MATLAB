function [] = test1()
fprintf('Testowanie całego programu\n\n')

A = [1 1 1; 1 1 1; 1 1 1];
fprintf('1) d = 1e-16, i = 1e7\n macierz A:\n');
disp(A)
[W, ~] = P2Z04_SAD_wlasne(A,1e-16,1e7);
W_dok = [3; 0; 0];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf("błąd:\n");
disp(W_dok - W);
pause

A = [5 4 4; -3 -3 -5; 1 2 4];
fprintf('2) d = 1e-16, i = 1e7\n macierz A:\n');
disp(A)
[W, ~] = P2Z04_SAD_wlasne(A,1e-16,1e7);
W_dok = [3; 2; 1];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf("błąd:\n");
disp(W_dok - W);
pause

A = [2 2 2; 6 5 4; 7 8 9];
fprintf('3) d = 1e-15, i = 1e7\n macierz A:\n');
disp(A)
[W, ~] = P2Z04_SAD_wlasne(A,1e-15,1e7);
W_dok = [15; 1; 0];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf("błąd:\n");
disp(W_dok - W);
pause

A = [2 0 1; 0 2 0; 5 0 6];
fprintf('4) d = 1e-14, i = 1e7\n macierz A:\n');
disp(A)
[W, ~] = P2Z04_SAD_wlasne(A,1e-14,1e7);
W_dok = [7; 2; 1];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf("błąd:\n");
disp(W_dok - W);
pause