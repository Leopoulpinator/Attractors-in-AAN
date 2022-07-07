% Les tailles les plus courantes sont entre 6x6 et 14x14

size(6).

% Valeurs autorisées

val(0;1).
row(1..Y) :- size(Y).
column(1..Y) :- size(Y).

% On ne prend qu'une seule valeur par carré

1 {s(R,C,V): val(V) } 1 :- row(R) ; column(C).

% On doit avoir autant de cases à 1 qu'à 0 sur chaque ligne et colonne

:- X != Y, X = #count { C : s(R,C,1), column(C) }, Y = #count { C : s(R,C,0), column(C) }, row(R).
:- X != Y, X = #count { R : s(R,C,1), row(R) }, Y = #count { R : s(R,C,0), row(R) }, column(C).

% Pas plus de 2 chiffres identiques côte à côte

:- s(R,C,T), s(R+1,C,T), s(R+2,C,T).
:- s(R,C,T), s(R,C+1,T), s(R,C+2,T).

% Deux lignes ou deux colonnes ne peuvent pas être identiques

different_column(C,C2) :- s(R,C,X), s(R,C2,Y), C != C2, X != Y.
:- not different_column(C,C2) : column(C), column(C2), C != C2.
different_row(R,R2) :- s(R,C,X), s(R2,C,Y), R != R2, X != Y.
:- not different_row(R,R2) : row(R), row(R2), R != R2.

#show s/3.
