instant(1..T) :- total_duree(T).
var(0;1).

% Définition de la grille

grille(R,C) :- row(R), column(C), 2 < R, R < 6.
grille(R,C) :- row(R), column(C), R <= 2, 2 < C, C < 6.
grille(R,C) :- row(R), column(C), R >= 6, 2 < C, C < 6.
centre(4,4). row(1..7). column(1..7). total_duree(31).

%*centre(2,1). row(1..4). column(1..3). total_duree(4).
grille(1,1). grille(2,1). grille(3,1).
grille(4,1). grille(4,2). grille(4,3).*%

% Définition de l'état initial

s(0,R,C,1) :- grille(R,C), R != A, centre(A,_).
s(0,R,C,1) :- grille(R,C), C != B, centre(_,B).
s(0,A,B,0) :- centre(A,B).

% Génération des solutions

1 { s(T,R,C,V) : var(V) } 1 :- instant(T), grille(R,C).
1 {
	coup_a_instant(T,(R,C),(R,C+2)) : grille(R,C), grille(R,C+2);
	coup_a_instant(T,(R,C),(R+2,C)) : grille(R,C), grille(R+2,C);
	coup_a_instant(T,(R,C),(R,C-2)) : grille(R,C), grille(R,C-2);
	coup_a_instant(T,(R,C),(R-2,C)) : grille(R,C), grille(R-2,C)
  } 1 :- instant(T).

% Les contraintes

:- coup_a_instant(T,(R,C),(R2,C2)), s(T-1,R,C,0). % Il faut la bille qui va sauter
:- coup_a_instant(T,(R,C),(R2,C2)), s(T-1,(R+R2)/2,(C+C2)/2,0). % Celle qu'on va enlever
:- coup_a_instant(T,(R,C),(R2,C2)), s(T-1,R2,C2,1). % Une case libre

:- coup_a_instant(T,(R,C),(R2,C2)), s(T,R,C,1). % On obtient une case libre
:- coup_a_instant(T,(R,C),(R2,C2)), s(T,(R+R2)/2,(C+C2)/2,1). % Une deuxième case libre
:- coup_a_instant(T,(R,C),(R2,C2)), s(T,R2,C2,0). % La case sur laquelle on a mis notre bille qui a sauté

% Dans tout les autres cas on ne change rien

s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R2,C2),(R2,C2+2)), R != R2.
s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R,C2),(R,C2+2)), C < C2.
s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R,C2),(R,C2+2)), C > C2+2.

s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R2,C2),(R2+2,C2)), C != C2.
s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R2,C),(R2+2,C)), R < R2.
s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R2,C),(R2+2,C)), R > R2+2.

s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R2,C2),(R2,C2-2)), R != R2.
s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R,C2),(R,C2-2)), C > C2.
s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R,C2),(R,C2-2)), C < C2-2.

s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R2,C2),(R2-2,C2)), C != C2.
s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R2,C),(R2-2,C)), R > R2.
s(T,R,C,K) :- s(T-1,R,C,K), coup_a_instant(T,(R2,C),(R2-2,C)), R < R2-2.

:- coup_a_instant(T,_,Y), Y != X, total_duree(T), centre(A,B), X = (A,B).

coup_a_instant(1,(4,6),(4,4)).
coup_a_instant(2,(2,5),(4,5)).
coup_a_instant(3,(3,3),(3,5)).
coup_a_instant(4,(4,5),(2,5)).
coup_a_instant(5,(3,1),(3,3)).
coup_a_instant(6,(5,2),(3,2)).
coup_a_instant(7,(3,7),(3,5)).
coup_a_instant(8,(3,2),(3,4)).
coup_a_instant(9,(3,5),(3,3)).
coup_a_instant(10,(4,4),(4,2)).
coup_a_instant(11,(1,4),(3,4)).
coup_a_instant(12,(3,4),(3,2)).
coup_a_instant(13,(6,5),(4,5)).
coup_a_instant(14,(5,4),(5,2)).
coup_a_instant(15,(1,3),(3,3)).
coup_a_instant(16,(3,2),(3,4)).
coup_a_instant(17,(5,7),(3,7)). % Là ça fait déjà beaucoup : ~27s
%coup_a_instant(18,(5,1),(5,3)).
%coup_a_instant(19,(1,5),(3,5)).
%coup_a_instant(20,(3,4),(3,6)).
%coup_a_instant(21,(3,7),(3,5)).
%coup_a_instant(22,(3,5),(5,5)).
%coup_a_instant(23,(4,1),(4,3)).
%coup_a_instant(24,(5,6),(5,4)).
%coup_a_instant(25,(5,4),(5,2)).
%coup_a_instant(26,(7,3),(5,3)).
%coup_a_instant(27,(4,3),(6,3)).
%coup_a_instant(28,(7,5),(7,3)).
%coup_a_instant(29,(7,3),(5,3)).
%coup_a_instant(30,(5,2),(5,4)).
%coup_a_instant(31,(6,4),(4,4)).


%#show.
#show coup_a_instant/3.
