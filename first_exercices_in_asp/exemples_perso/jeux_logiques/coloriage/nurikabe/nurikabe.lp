% Taille variable

size(5,5).

% Variables utiles

row(1..R) :- size(R,_).
column(1..C) :- size(_,C).
val(0;1).

% Généreation des solutions

1 { s(R,C,V) : val(V) } 1 :- row(R), column(C).

% Les règles du jeu

% Définition d'un bloc

bloc((R,C),(R,C)) :- c(R,C,_).
bloc((R,C),(R2+1,C2)) :- bloc((R,C),(R2,C2)), s(R2+1,C2,0).
bloc((R,C),(R2-1,C2)) :- bloc((R,C),(R2,C2)), s(R2-1,C2,0).
bloc((R,C),(R2,C2+1)) :- bloc((R,C),(R2,C2)), s(R2,C2+1,0).
bloc((R,C),(R2,C2-1)) :- bloc((R,C),(R2,C2)), s(R2,C2-1,0).
bloc((R,C),(R3,C3)) :- bloc((R,C),(R2,C2)), bloc((R2,C2),(R3,C3)).

% Chaque bloc doit contenir un et un seul nombre

:- bloc((R,C),(R2,C2)), bloc((R1,C1),(R2,C2)), R != R1.
:- bloc((R,C),(R2,C2)), bloc((R1,C1),(R2,C2)), C != C1.
:- s(R,C,1), bloc((_,_),(R,C)).
s(R,C,0) :- bloc((_,_),(R,C)).

% Le nombre de cases formant un bloc doit etre egal au nombre inscrit dans le bloc

:- A = #count { R2,C2 : bloc(_,(R2,C2)) }, B = #sum { X,R,C : c(R,C,X) }, A != B.
:- c(R,C,X), T = #count { R2,C2 : bloc((R,C),(R2,C2)) }, X != T.

% Toutes les cases noires doivent être connectées entre elles

fleuve((R,C),(R,C)) :- s(R,C,1).
fleuve((R,C),(R2+1,C2)) :- fleuve((R,C),(R2,C2)), s(R2+1,C2,1).
fleuve((R,C),(R2-1,C2)) :- fleuve((R,C),(R2,C2)), s(R2-1,C2,1).
fleuve((R,C),(R2,C2+1)) :- fleuve((R,C),(R2,C2)), s(R2,C2+1,1).
fleuve((R,C),(R2,C2-1)) :- fleuve((R,C),(R2,C2)), s(R2,C2-1,1).
fleuve((R,C),(R3,C3)) :- fleuve((R,C),(R2,C2)), fleuve((R2,C2),(R3,C3)).
:- s(R,C,1), s(R2,C2,1), not fleuve((R,C),(R2,C2)).

% Il ne doit y avoir aucun bloc de 2x2 de cases noires

:- s(R,C,1), s(R+1,C,1), s(R,C+1,1), s(R+1,C+1,1).


to_show(R,C) :- s(R,C,0).

#show to_show/2.
