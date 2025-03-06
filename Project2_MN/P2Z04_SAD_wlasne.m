function [W, it] = P2Z04_SAD_wlasne(A,d,i)
% Projekt 2, zadanie 04
% Sandra Adamiec, 327330
%
% Znajdowanie możliwie najwięcej kolejnych największych co do modułu 
% wartości własnych macierzy kwadratowej A o wymiarach n x n i elementach  
% rzeczywistych przy użyciu metody potęgowej z normowaniem i zastosowaniu 
% deflacji przekształecniem G, będącym złożeniem n - 1 obrotów Givensa, 
% G(1,2)G(2,3)G(3,4)...G(n-1,n), gdzie G(i,j) jest obrotem względem 
% współrzędnych i oraz j.
% Wejście:
%   A - macierz o wymiarach n x n, której wartości własne mają być 
%       wyznaczone, musi posiadać n liniowo niezależnych wektorów własnych 
%       oraz elementy rzeczywiste i wartość własną dominującą
%   d - tolerancja na błąd
%   i - maksymalna liczba iteracji dla szukania pojedynczej wartości
%       własnej
% Wyjście:
%   W - wektor obliczonych wartości własnych
%  it - wektor zawierający liczby faktycznie wykonanych iteracji dla każdej
%       z wyznaczonych wartości własnych

% inicjalizacja zmiennych
n = size(A, 1);
N = size(A, 1);
W = zeros(n, 1);
it = zeros(n, 1);
w_count = 0;

% wyliczanie kolejnych wartości własnych
while(w_count < N)
    % wyznaczenie wektora startowego
    x0 = ones(n,1);
    w = (x0'*A*x0)/(x0'*x0);
    x1 = A*(x0/norm(x0, 2));
    j = 0;
    
    % sprawdzenie warunku zakończenia aktualizacji wektora i wartości
    % własnej oraz liczby iteracji
    while(abs(norm(x1 - w*(x0/norm(x0)))/w) >=d && j < i)
        x0 = x1;
        x1 = A*(x1/norm(x1, 2));
        j = j + 1;
        w = (x0'*A*x0)/(x0'*x0);
    end

    % zakończenie programu przy przekroczeniu dozwolonej liczby iteracji
    if(j==i)
        W = W(1:w_count);
        it(w_count + 1) = j;
        it = it(1:w_count+1);
        break;
    end

    % dopisanie wyliczonej wartości do wektora odpowiedzi 
    w_count = w_count + 1;
    W(w_count) = w;
    it(w_count) = j;

    % deflacja
    A = G_rotation(A, x1);
    A = A(2:end,2:end);
    n = n - 1;
end
% zwrócenie wyniku
W = W(1:w_count);
