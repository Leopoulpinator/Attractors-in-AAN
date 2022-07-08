% Taille variable

size(6).

% Variables utiles

row(1..S) :- size(S).
column(1..S) :- size(S).

% Génération des solutions

1 {
	tentes((R,C),(R+1,C)) : row(R+1),column(C);
	tentes((R,C),(R-1,C)) : row(R-1),column(C);
	tentes((R,C),(R,C+1)) : row(R),column(C+1);
	tentes((R,C),(R,C-1)) : row(R),column(C-1)
  } 1 :- arbre(R,C), row(R), column(C).

tente(R,C) :- tentes(_,(R,C)).

% Les contraintes

:- X = #count { R,C : arbre(R,C) }, X != #count{ R,C : tente(R,C) }. % Autant de tentes que d'arbre
:- tente(R,C), tente(R+1,C). % Deux tentes ne peuvent pas se toucher, même en diagonale
:- tente(R,C), tente(R-1,C).
:- tente(R,C), tente(R+1,C+1).
:- tente(R,C), tente(R+1,C-1).
:- tente(R,C), tente(R-1,C+1).
:- tente(R,C), tente(R-1,C-1).
:- tente(R,C), tente(R,C+1).
:- tente(R,C), tente(R,C-1).
:- ligne(C,K), K != #count { R : tente(R,C), row(R) }.% Autant de tentes dans chaque ligne qu'indiqué
:- colonne(R,K), K != #count { C : tente(R,C), column(C) }.% Autant de tentes dans chaque colonne qu'indiqué

#show tente/2.
