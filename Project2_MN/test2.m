function [] = test2()
fprintf('Testowanie programu ze wzgledu na dozwoloną liczbę iteracji\n')

fprintf('1) d = 1e-13, i = 1,\n\n macierz A:\n');
A = [2 2 2; 6 5 4; 7 8 9];
disp(A)
[W, it] = P2Z04_SAD_wlasne(A,1e-13,1);
W_dok = [15; 1; 0];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf('liczby iteracji:\n');
disp(it)
pause

fprintf('2) d = 1e-13, i = 10,\n\n macierz A:\n');
A = [2 2 2; 6 5 4; 7 8 9];
disp(A)
[W, it] = P2Z04_SAD_wlasne(A,1e-13,10);
W_dok = [15; 1; 0];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf('liczby iteracji:\n');
disp(it)
pause

fprintf('3) d = 1e-13, i = 100,\n\n macierz A:\n');
A = [2 2 2; 6 5 4; 7 8 9];
disp(A)
[W, it] = P2Z04_SAD_wlasne(A,1e-13,100);
W_dok = [15; 1; 0];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf('liczby iteracji:\n');
disp(it)
pause

fprintf('3) d = 1e-16, i = 50,\n\n macierz A:\n');
A = [5 3; -6 -4];
disp(A)
[W, it] = P2Z04_SAD_wlasne(A,1e-16,50);
W_dok = [2; -1];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf('liczby iteracji:\n');
disp(it)
pause

fprintf('4) d = 1e-16, i = 1e6,\n\n macierz A:\n');
A = [5 3; -6 -4];
disp(A)
[W, it] = P2Z04_SAD_wlasne(A,1e-16,1e6);
W_dok = [2; -1];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf('liczby iteracji:\n');
disp(it)
pause

fprintf('5) d = 1e-13, i = 100,\n\n macierz A:\n');
A = [1 1 1; 1 1 1; 1 1 1];
disp(A)
[W, it] = P2Z04_SAD_wlasne(A,1e-13,100);
W_dok = [3; 0; 0];
fprintf('wartość własne:\n');
disp(W_dok)
fprintf('wyliczone własności własne:\n');
disp(W)
fprintf('liczby iteracji:\n');
disp(it)

