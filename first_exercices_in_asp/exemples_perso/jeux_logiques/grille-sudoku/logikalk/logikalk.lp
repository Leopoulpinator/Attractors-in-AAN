% Taille variable même si ce n'est pas le cas dans le jeu de base : il ne s'agit que de 8x8

size(8).

% Variables utiles (?!?)

row(1..R) :- size(R).
column(1..C) :- size(C).

% Génération des solutions

1 { s(R,C,V) : var(V) } 1 :- row(R), column(C).
8 { var(1..S+1) } 8 :- size(S).


% Les contraintes

:- row(R), s(R,C,V), s(R,C2,V), C != C2.
:- column(C), s(R,C,V), s(R2,C,V), R != R2.
:- row(R), X = #sum { V,C : s(R,C,V), g(R,C) ;
		      V,C : s(R,C,V), gb(R,C) },
	   Y = #sum { V,C : s(R,C,V), b(R,C) ;
		      V,C : s(R,C,V), bg(R,C) },
	   |X - Y| != D, diff(D).
:- column(C), X = #sum { V,R : s(R,C,V), g(R,C) ;
		         V,R : s(R,C,V), bg(R,C) },
	      Y = #sum { V,R : s(R,C,V), b(R,C) ;
		         V,R : s(R,C,V), gb(R,C) },
	      |X - Y| != D, diff(D).

#show s/3.
