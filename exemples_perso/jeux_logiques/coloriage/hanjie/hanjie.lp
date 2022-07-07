size(10).
column(1..S) :- size(S).
row(1..S) :- size(S).
val(0). val(1).

1 { s(R,C,V) : val(V) } 1 :- row(R), column(C).

% On doit avoir autant de 1 par ligne et par colonne que la somme des contraintes affichées pour cette ligne ou colonne

:- X = #count { R,C : s(R,C,1) }, Y = #sum { K,N : c(C,N,K) }, X != Y, column(C).
:- X = #count { R,C : s(R,C,1) }, Y = #sum { K,N : c(R+S,N,K), size(S) }, X != Y, row(R).

% col_temp(Num_paquet_de_1,Row,Column,Nb_de_1_dans_paquet)

col_temp(0,0,C,0) :- c_def(C,"column",_). % Initialisation
col_temp(T+1,R+1,C,1) :- col_temp(T,R,C,0), s(R+1,C,1).  % Si c'est la première fois qu'on a un 1 depuis le dernier paquet, on passe au suivant
col_temp(T,R+1,C,K+1) :- col_temp(T,R,C,K), s(R+1,C,1), K != 0. % Si on a un 1, on continue le paquet en cours
col_temp(T,R+1,C,0) :- col_temp(T,R,C,0), s(R+1,C,0). % Si on a un 0 sur un paquet de 0, on passe au suivant
col_temp(T,R+1,C,0) :- col_temp(T,R,C,K), s(R+1,C,0), c(C,T,K).% Si on a fini un paquet et qu'on croise un 0

:- col_temp(T,R,C,K), s(R+1,C,1), c(C,T,K).
:- col_temp(T,_,C,K), K > K2, c(C,T,K2). % Si on a dépassé le paquet de 1 en cours, on lui casse la figure
:- col_temp(T,R,C,K), K != 0, K != K2, c(C,T,K2), s(R+1,C,0). % Si on n'a pas fini le paquet de 1 en cours, on lui casse la figure

% row_temp(Num_paquet_de_1,Row,Column,Nb_de_1_dans_paquet)

row_temp(0,R-S,0,0) :- c_def(R,"row",_), size(S). % Initialisation
row_temp(T+1,R,C+1,1) :- row_temp(T,R,C,0), s(R,C+1,1).  % Si c'est la première fois qu'on a un 1 depuis le dernier paquet, on passe au suivant
row_temp(T,R,C+1,K+1) :- row_temp(T,R,C,K), s(R,C+1,1), K != 0. % Si on a un 1, on continue le paquet en cours
row_temp(T,R,C+1,0) :- row_temp(T,R,C,0), s(R,C+1,0). % Si on a un 0 sur un paquet de 0, on passe au suivant
row_temp(T,R,C+1,0) :- row_temp(T,R,C,K), s(R,C+1,0), c(R+S,T,K), size(S). % Si on a fini un paquet et qu'on croise un 0

:- row_temp(T,R,C,K), s(R,C+1,1), c(R+S,T,K), size(S).
:- row_temp(T,R,_,K), K > K2, row(R), c(R+S,T,K2), size(S). % Si on a dépassé le paquet de 1 en cours, on lui casse la figure
:- row_temp(T,R,C,K), K != 0, K != K2, row(R), c(R+S,T,K2), s(R,C+1,0), size(S). % Si on n'a pas fini le paquet de 1 en cours, on lui casse la figure

% Forme de l'instance :
% c(label,num_contrainte,contrainte) et c_def(label,"objet",total_contrainte)

to_show(X,Y) :- s(X,Y,1).

#show to_show/2.
