% Taille variable

size(4).

% Variables utiles

column(1..S) :- size(S).
row(1..S) :- size(S).
var(1..S) :- size(S).

% Génération des solutions

1 { s(R,C,V) : var(V) } 1 :- row(R), column(C).
1 { s(R,C,V) : row(R) } 1 :- var(V), column(C).
1 { s(R,C,V) : column(C) } 1 :- row(R), var(V).

% Les contraintes : count(K,R,C,H)

count_left_r(0,R,0,0) :- row(R).
count_left_r(K+1,R,C+1,H2) :- count_left_r(K,R,C,H), s(R,C+1,H2), H2 > H.
count_left_r(K,R,C+1,H) :- count_left_r(K,R,C,H), s(R,C+1,H2), H2 < H.
:- count_left_r(K,R,S,_), size(S), r(R,K2,_), K != K2.

count_right_r(0,R,S+1,0) :- row(R), size(S).
count_right_r(K+1,R,C-1,H2) :- count_right_r(K,R,C,H), s(R,C-1,H2), H2 > H.
count_right_r(K,R,C-1,H) :- count_right_r(K,R,C,H), s(R,C-1,H2), H2 < H.
:- count_right_r(K,R,0,_), r(R,_,K2), K != K2.

count_down_r(0,0,C,0) :- column(C).
count_down_r(K+1,R+1,C,H2) :- count_down_r(K,R,C,H), s(R+1,C,H2), H2 > H.
count_down_r(K,R+1,C,H) :- count_down_r(K,R,C,H), s(R+1,C,H2), H2 < H.
:- count_down_r(K,S,C,_), size(S), c(C,K2,_), K != K2.

count_up_r(0,S+1,C,0) :- column(C), size(S).
count_up_r(K+1,R-1,C,H2) :- count_up_r(K,R,C,H), s(R-1,C,H2), H2 > H.
count_up_r(K,R-1,C,H) :- count_up_r(K,R,C,H), s(R-1,C,H2), H2 < H.
:- count_up_r(K,0,C,_), c(C,_,K2), K != K2.

#show s/3.
%#show count_left_r/4.
