% Taille variable

size(4).

% Variables utiles

sommets(1..S+1) :- size(S).
row(S) :- sommets(S).
column(S) :- sommets(S).
val(0;1).

% Génération des solutions

1 { s((R,C),(R+1,C),V) : val(V) } 1 :- row(R), column(C), R < S, sommets(S).
1 { s((R,C),(R,C+1),V) : val(V) } 1 :- row(R), column(C), C < S, sommets(S).

% Les contraintes

% Le nombre de voisins d'un c(R,C,V)

compte(R,C,X) :- c(R,C,V), X = #count { 
				1 : s((R,C),(R+1,C),1);
				2 : s((R,C),(R,C+1),1);
				3 : s((R,C+1),(R+1,C+1),1);
				4 : s((R+1,C),(R+1,C+1),1)
			}.
			
:- compte(R,C,X), c(R,C,V), V != X.

% Une ligne continue

compte2(R,C,X):- row(R), column(C), X = #count {
	1 : s((R,C),(R+1,C),1);
	2 : s((R,C),(R,C+1),1);
	3 : s((R-1,C),(R,C),1);
	4 : s((R,C-1),(R,C),1)
		}.

:- compte2(R,C,X), X = 1.
:- compte2(R,C,X), X = 3.
:- compte2(R,C,X), X = 4.

% Et connexe

s((R2,C2),(R,C),1) :- s((R,C),(R2,C2),1).
meme_bloc((R,C),(R2,C2)) :- s((R,C),(R2,C2),1).
meme_bloc((R,C),(R2,C2)) :- meme_bloc((R2,C2),(R,C)).
meme_bloc((R,C),(R3,C3)) :- meme_bloc((R,C),(R2,C2)), meme_bloc((R2,C2),(R3,C3)).
:- s((R,C),_,1), s((R2,C2),_,1), not meme_bloc((R,C),(R2,C2)).

to_show((R,C),(R2,C2)) :- s((R,C),(R2,C2),1), R < R2, C = C2.
to_show((R,C),(R2,C2)) :- s((R,C),(R2,C2),1), R = R2, C < C2.

#show to_show/2.
