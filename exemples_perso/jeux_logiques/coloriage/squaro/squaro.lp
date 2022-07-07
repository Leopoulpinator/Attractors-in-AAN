% Taille variable

size(5,5).

% Définition des valeurs

real_size(X+1,Y+1) :- size(X,Y).
row(1..R) :- real_size(R,_).
column(1..C) :- real_size(_,C).
val(0;1).

% Génération des solutions

1 { s(R,C,V) : val(V) } 1 :- row(R), column(C).

% Les contraintes

sum_neighbour(R,C,X1+X2+X3+X4) :- s(R,C,X1), s(R+1,C,X2), s(R,C+1,X3), s(R+1,C+1,X4).
:- row(R), column(C), c(R,C,V), sum_neighbour(R,C,V2), V != V2.

to_show(R,C) :- s(R,C,1).

#show to_show/2.
