% Taille variables

size(20,2).

% Variables utiles

row(1..R) :- size(R,_).
column(1..C) :- size(_,C).
var(0;1).

% Génération des solutions

1 { s(R,C,V) : var(V) } 1 :- row(R), column(C).

% Les contraintes

:- c(R,C,V), X = #count 
		{ 1 : s(R-1,C-1,1) ; 2 : s(R-1,C,1) ; 3 : s(R-1,C+1,1) ;
		4 : s(R,C-1,1) ; 5 : s(R,C,1) ; 6 : s(R,C+1,1) ;
		7 : s(R+1,C-1,1) ; 8 : s(R+1,C,1) ; 9 : s(R+1,C+1,1) }, X != V.

to_show(R,C) :- s(R,C,1).

#show to_show/2.
