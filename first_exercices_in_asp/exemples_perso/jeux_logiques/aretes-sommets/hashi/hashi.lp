% Taille variable

size(9).

% Variables utiles

var(0;1;2).
row(1..S) :- size(S).
column(1..S) :- size(S).

% Génération des arêtes

entre_deux_colonnes(R,C,C2) :- row(R), C < X, X < C2, c(R,X,_), c(R,C,_), c(R,C2,_).
arete((R,C),(R,C2)) :- c(R,C,_), c(R,C2,_), not entre_deux_colonnes(R,C,C2), C < C2.

entre_deux_lignes(C,R,R2) :- column(C), R < X, X < R2, c(X,C,_), c(R,C,_), c(R2,C,_).
arete((R,C),(R2,C)) :- c(R,C,_), c(R2,C,_), not entre_deux_lignes(C,R,R2), R < R2.

1 { s((R,C),(R2,C2),V) : var(V) } 1 :- arete((R,C),(R2,C2)).
s((R,C),(R2,C2),V) :- s((R2,C2),(R,C),V).

% Les contraintes

% Nombre d'arêtes sortantes = valeur inscrite

:- c(R,C,V), X = #sum { V2,R2,C2 : s((R,C),(R2,C2),V2) }, X != V.

% Tout les ilots sont reliables par un chemin continu

atteignable(X,Y) :- s(X,Y,V), V != 0.
atteignable(X,Y) :- atteignable(Y,X).
atteignable(X,Z) :- atteignable(X,Y), atteignable(Y,Z).
:- c(R,C,_), c(R2,C2,_), not atteignable((R,C),(R2,C2)).

% Le chemin ne peut pas se couper : il est continu

:- s((R,C),(R,C1),K1), s((R2,C2),(R3,C2),K2), K1 != 0, K2 != 0, R2 > R, R > R3, C < C2, C2 < C1.

to_show((R,C),(R2,C2),K) :- s((R,C),(R2,C2),K), K != 0, R < R2, C = C2.
to_show((R,C),(R2,C2),K) :- s((R,C),(R2,C2),K), K != 0, R = R2, C < C2.

#show to_show/3.
