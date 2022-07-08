% Taille variable

size(5,5).

row(1..X) :- size(X,_).
column(1..Y) :- size(_,Y).
val(1..X*Y) :- size(X,Y).

% Génération de toutes les solutions possibles

1 {s(R,C,V): val(V) } 1 :- row(R) ; column(C).

% On gère le cas des 1 à part

:- s(R,C,1), s(R+1,C,1).
:- s(R,C,1), s(R-1,C,1).
:- s(R,C,1), s(R,C+1,1).
:- s(R,C,1), s(R,C-1,1).

% On compte le nombre de voisins numérotés identiquement dans les blocs
% bloc((X_repr,Y_repr),(X1,Y1)) si X1,Y1 est dans le même bloc que le représentant

bloc((R,C),(R,C)) :- s(R,C,_).
bloc((R,C),(R+1,C)) :- s(R,C,V), s(R+1,C,V).
bloc((R,C),(R-1,C)) :- s(R,C,V), s(R-1,C,V).
bloc((R,C),(R,C+1)) :- s(R,C,V), s(R,C+1,V).
bloc((R,C),(R,C-1)) :- s(R,C,V), s(R,C-1,V).
bloc((R,C),(R3,C3)) :- bloc((R,C),(R2,C2)), bloc((R2,C2),(R3,C3)).

% Si on n'en a pas le bon nombre, KABOOM

:- V != #count { R2,C2 : s(R2,C2,V), bloc((R,C),(R2,C2)) }, s(R,C,V).

#show s/3.
