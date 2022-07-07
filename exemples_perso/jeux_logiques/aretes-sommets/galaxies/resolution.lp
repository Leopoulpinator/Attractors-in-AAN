% Taille variable

size(7).

% Variables utiles

row(1..R) :- size(R).
column(1..C) :- size(C).
val(0;1).
cote(d;g;h;b).
pos(1..2*S-1,1..2*S-1) :- size(S).

% Génération des solutions

1 { s(R,C,K,V) : val(V) } 1 :- cote(K), row(R), column(C).

% Les arêtes sur le bord sont toujours à 1

sur_le_bord(1,C,g) :- column(C).
sur_le_bord(S,C,d) :- column(C), size(S).
sur_le_bord(R,1,h) :- row(R).
sur_le_bord(R,S,b) :- row(R), size(S).
:- sur_le_bord(R,C,K), s(R,C,K,0).

% Egalité entre les arêtes

:- s(R,C,d,V), s(R+1,C,g,1-V).
:- s(R,C,b,V), s(R,C+1,h,1-V).

% Les contraintes

% Partition avec un seul point (c) par sous-ensemble

1 { repr(R,C,N) : c(N,_,_) } 1 :- row(R), column(C).

repr(R/2 + 1,C/2 + 1,N) :- c(N,R,C), R\2 = 1, C\2 = 1.
repr(R/2,C/2 + 1,N) :- c(N,R,C), R\2 = 0, C\2 = 1.
repr(R/2 + 1,C/2 + 1,N) :- c(N,R,C), R\2 = 0, C\2 = 1.
repr(R/2 + 1,C/2,N) :- c(N,R,C), R\2 = 1, C\2 = 0.
repr(R/2 + 1,C/2 + 1,N) :- c(N,R,C), R\2 = 1, C\2 = 0.
repr(R/2,C/2,N) :- c(N,R,C), R\2 = 0, C\2 = 0.
repr(R/2 + 1,C/2,N) :- c(N,R,C), R\2 = 0, C\2 = 0.
repr(R/2,C/2 + 1,N) :- c(N,R,C), R\2 = 0, C\2 = 0.
repr(R/2 + 1,C/2 + 1,N) :- c(N,R,C), R\2 = 0, C\2 = 0.

repr(R-1,C,N) :- repr(R,C,N), s(R,C,g,0), not sur_le_bord(R,C,g).
repr(R+1,C,N) :- repr(R,C,N), s(R,C,d,0), not sur_le_bord(R,C,d).
repr(R,C-1,N) :- repr(R,C,N), s(R,C,h,0), not sur_le_bord(R,C,h).
repr(R,C+1,N) :- repr(R,C,N), s(R,C,b,0), not sur_le_bord(R,C,b).

% Les sous-ensembles sont symétriques

repr(R2-R+1,C2-C+1,N) :- repr(R,C,N), c(N,R2,C2).
:- repr(R,C,_), R > S, size(S).
:- repr(R,C,_), R < 1.
:- repr(R,C,_), C > S, size(S).
:- repr(R,C,_), C < 1.

% Si on a une arête qui ne sert à rien, alors elle n'existe pas

:- s(R,C,g,1), repr(R,C,N), repr(R-1,C,N).
:- s(R,C,h,1), repr(R,C,N), repr(R,C-1,N).

s(R,C,g) :- s(R,C,g,1), not sur_le_bord(R,C,g).
s(R,C,h) :- s(R,C,h,1), not sur_le_bord(R,C,h).

#show s/3.
