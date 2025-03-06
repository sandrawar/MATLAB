function [] = test3()
fprintf(['Testowanie funkcji G_rotation - przekształcania macierzy ' ...
'obrotami Givensa\n'])

A = [1 1 1; 1 1 1; 1 1 1];
x = [1; 1; 1];
fprintf('\n1) macierz A:\n')
disp(A)
fprintf('wektor własny:\n')
disp(x)
fprintf('wartość własna: 3\n\n')
fprintf('macierz A po przekształceniu:\n')
A = G_rotation(A, x);
disp(A)
pause

A = [1 1 1; 1 1 1; 1 1 1];
x = [-1; 1; 0];
fprintf('\n2) macierz A:\n')
disp(A)
fprintf('wektor własny:\n')
disp(x)
fprintf('wartość własna: 0\n\n')
fprintf('macierz A po przekształceniu:\n')
A = G_rotation(A, x);
disp(A)
pause

A = [1 1 1; 1 1 1; 1 1 1];
x = [-1; 0; 1];
fprintf('\n3) macierz A:\n')
disp(A)
fprintf('wektor własny:\n')
disp(x)
fprintf('wartość własna: 0\n\n')
fprintf('macierz A po przekształceniu:\n')
A = G_rotation(A, x);
disp(A)
pause

A = [2 2 2; 6 5 4; 7 8 9];
x = [1; -2; 1];
fprintf('\n4) macierz A:\n')
disp(A)
fprintf('wektor własny:\n')
disp(x)
fprintf('wartość własna: 0\n\n')
fprintf('macierz A po przekształceniu:\n')
A = G_rotation(A, x);
disp(A)
pause

A = [2 2 2; 6 5 4; 7 8 9];
x = [0; -1; 1];
fprintf('\n5) macierz A:\n')
disp(A)
fprintf('wektor własny:\n')
disp(x)
fprintf('wartość własna: 1\n\n')
fprintf('macierz A po przekształceniu:\n')
A = G_rotation(A, x);
disp(A)
pause

A = [2 2 2; 6 5 4; 7 8 9];
x = [14/59; 32/59; 1];
fprintf('\n6) macierz A:\n')
disp(A)
fprintf('wektor własny:\n')
disp(x)
fprintf('wartość własna: 15\n\n')
fprintf('macierz A po przekształceniu:\n')
A = G_rotation(A, x);
disp(A)
pause
