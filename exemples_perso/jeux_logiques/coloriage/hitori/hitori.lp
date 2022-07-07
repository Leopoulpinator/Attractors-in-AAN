size(5).
val(1..S) :- size(S).
column(1..S) :- size(S).
row(1..S) :- size(S).
color(0;1).

% On génère un ensemble de solution

1 { s(R,C,V) : color(V) } 1 :- column(C), row(R).

% On ne peut pas avoir deux cases noires adjacentes

:- s(R,C,1), s(R+1,C,1).
:- s(R,C,1), s(R-1,C,1).
:- s(R,C,1), s(R,C+1,1).
:- s(R,C,1), s(R,C-1,1).

% Sur une ligne ou une colonne, les valeurs sur les cases blanches sont uniques

:- s(R,C,0), s(R,C2,0), C != C2, c(R,C,V), c(R,C2,V).
:- s(R,C,0), s(R2,C,0), R != R2, c(R,C,V), c(R2,C,V).

% Si (c1,c2) est une paire de cases blanches, alors il existe un chemin de cases blanches allant de l'une à l'autre

chemin((R1,C1),(R2,C2)) :- chemin((R1,C1),(X,Y)), chemin((X,Y),(R2,C2)).
chemin((R,C),(R+1,C)) :- s(R,C,0), s(R+1,C,0).
chemin((R,C),(R-1,C)) :- s(R,C,0), s(R-1,C,0).
chemin((R,C),(R,C+1)) :- s(R,C,0), s(R,C+1,0).
chemin((R,C),(R,C-1)) :- s(R,C,0), s(R,C-1,0).
:- s(R,C,0), s(R2,C2,0), not chemin((R,C),(R2,C2)).

#show s/3.
