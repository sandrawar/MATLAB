function S = P1Z01_SAD_calka(f,a,b,c,d,n,m)
% Projekt 1, zadanie 01
% Sandra Adamiec, 327330
%
% Obliczanie całki podwójnej funkcji dwóch zmiennych na obszarze 
% D = [a,b] x [c,d] złożonymi kwadraturami prostokątów 
% (z punktem środkowym) ze względu na każdą zmienną
% Wejście:
%   f - uchwyt do funkcji (dwóch zmiennych), której całka ma być obliczona
%       (f powinna być napisana tak, aby potrafiła obliczać wartości dla 
%       argumentów wektorowych i zwracać macierz wyników)
%   a - ograniczenie obszaru całkowania od lewej
%   b - ograniczenie obszaru całkowania od prawej
%   c - ograniczenie obszaru całkowania od dołu
%   d - ograniczenie obszaru całkowania od góry
%   n - liczba podprzedziałów przedziału [a,b]
%   m - liczba podprzedziałów przedziału [c,d]
% Wyjście:
%   S - wartość całki
H1 = (b - a)/n;
H2 = (d - c)/m;
% C - macierz wspołczynników kwadratury
C1 = ones(n,1);
C2 = ones(1,m);
C = C1*C2*H1*H2;

% W - macierz warości funkcji podcałkowej w punktach środkowych (między
% węzłami)
punkty_srodkowe_poziome = a + H1/2 : H1 : b - H1/2;
punkty_srodkowe_pionowe = c + H2/2 : H2 : d - H2/2;
W = f(punkty_srodkowe_poziome, punkty_srodkowe_pionowe);

%S = trace(transpose(C)*W);
S = sum(C.*W, "all");
