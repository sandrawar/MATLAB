function A = G_rotation(A, x0)
% Funkcja przekształcająca macierz A w sposób A = G*A*G^(-1), gdzie
% G to macierz przekształcenia, będącego złożeniem n - 1 obrotów 
% Givensa, G(1,2)G(2,3)G(3,4)...G(n-1,n), gdzie G(i,j) jest obrotem 
% względem współrzędnych i oraz j.
% Wejście:
%   A  - macierz do przekształcenia
%   x0 - wektor własny, wzgledem którego ma być wykonane przekształcenie
% Wyjście:
%   A  - przekształcona macierz

n = size(A,1);

% wykonywanie kolejnych obrotów Givensa
for i=n-1:-1:1
    % wyznaczenie macierzy obrotu G(i,i+1) = [c, -s; s, c] oraz wartości
    % x0(i) po obrocie
    [c, s, beta] = givens(x0(i), x0(i+1));
    % aktualizacja wektora x0 (po obrocie)
    x0(i:i+1) = [beta; 0];
    % aktualizacja macierzy A (A = G(i,i+1)*A*G(i,i+1)^(-1))
    A(i:i+1,:) = [c, -s; s, c] * A(i:i+1,:);
    A(:,i:i+1) = A(:,i:i+1) * [c, s; -s, c];
end

