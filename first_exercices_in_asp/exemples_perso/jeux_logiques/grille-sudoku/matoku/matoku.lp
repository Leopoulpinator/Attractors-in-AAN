size(5).

% Valeurs autorisées

val(1..S) :- size(S).

% On ne prend qu'une seule valeur par carré

1 {s(R,C,V): val(V) } 1:- val(R) ; val(C).

% Une valeur ne peut pas apparaître plusieurs fois dans la même colonne ou dans la même ligne

:- val(C), val(V), s(R,C,V), s(R2,C,V), R != R2.
:- val(R), val(V), s(R,C,V), s(R,C2,V), C != C2.

% Les valeurs doivent respecter les contraintes imposées

% Les sommes :

:- K_V != #sum { V,C,R : s(R,C,V), c(K,R,C,_) }, c_def(K,K_V,"plus",_).

% Les produits :

prod(1,L,NB_C,0) :- c_def(L,_,"mult",NB_C).
prod(P*V,L,NB_C,N+1) :- prod(P,L,NB_C,N), c(L,X,Y,N+1), s(X,Y,V).
:- prod(P,L,X,X), c_def(L,P2,_,_), P != P2.

% Les divisions (seulement deux arguments) :

:- c_def(Label,Goal,"div",2),
	c(Label,X1,Y1,1),
	c(Label,X2,Y2,2),
	s(X1,Y1,V1),
	s(X2,Y2,V2),
	Goal != V1/V2 ; Goal != V2/V1.

% Les soustractions (on retranche au plus grand les plus petits) :

plus_grand(Label,K) :- K = #max { V : c(Label,X,Y,_), s(X,Y,V) }, c_def(Label,_,"moins",_).
somme_sans_plus_grand(Label,K) :- K = #sum { V : c(Label,X,Y,_), s(X,Y,V), V != Max }, c_def(Label,_,"moins",_), plus_grand(Label,Max).
:- K1 != K2 + Goal, plus_grand(Label,K1), somme_sans_plus_grand(Label,K2), c_def(Label,Goal,"moins",_).

#show s/3.
