% Unité temporelle bornant la profondeur de l'arbre de recherche qui s'incrémente

t_max(15).

% Quelques variables

perso(0,R,C) :- init(R,C).
nb_caisses(K) :- K = #count { R,C : caisse_init(_,R,C) }.
instant(1..T) :- t_max(T).
caisse_a_instant(0,R,C,N) :- caisse_init(N,R,C). % N est le numéro de la caisse
acces_a_instant(T,R,C) :- instant(T+1), perso(T,R,C).
acces_a_instant(T,R+1,C) :- instant(T+1), sol(R+1,C), acces_a_instant(T,R,C), not caisse_a_instant(T,R+1,C,_).
acces_a_instant(T,R-1,C) :- instant(T+1), sol(R-1,C), acces_a_instant(T,R,C), not caisse_a_instant(T,R-1,C,_).
acces_a_instant(T,R,C+1) :- instant(T+1), sol(R,C+1), acces_a_instant(T,R,C), not caisse_a_instant(T,R,C+1,_).
acces_a_instant(T,R,C-1) :- instant(T+1), sol(R,C-1), acces_a_instant(T,R,C), not caisse_a_instant(T,R,C-1,_).

1 { coup_a_instant(T,(R,C),(R+1,C)) : sol(R,C), sol(R+2,C),
				      acces_a_instant(T-1,R,C),
				      caisse_a_instant(T-1,R+1,C,_),
				      not caisse_a_instant(T-1,R+2,C,_);
    coup_a_instant(T,(R,C),(R-1,C)) : sol(R,C), sol(R-2,C),
				      acces_a_instant(T-1,R,C),
				      caisse_a_instant(T-1,R-1,C,_),
				      not caisse_a_instant(T-1,R-2,C,_);
    coup_a_instant(T,(R,C),(R,C+1)) : sol(R,C), sol(R,C+2),
				      acces_a_instant(T-1,R,C),
				      caisse_a_instant(T-1,R,C+1,_),
				      not caisse_a_instant(T-1,R,C+2,_);
    coup_a_instant(T,(R,C),(R,C-1)) : sol(R,C), sol(R,C-2),
				      acces_a_instant(T-1,R,C),
				      caisse_a_instant(T-1,R,C-1,_),
				      not caisse_a_instant(T-1,R,C-2,_)} 1 :- instant(T).

perso(T,R2,C2) :- instant(T), coup_a_instant(T,_,(R2,C2)). % Déplacement du personnage

caisse_a_instant(T,2*R2-R,2*C2-C,N) :-
	instant(T), sol(R2,C2), sol(R,C), sol(2*R2-R,2*C2-C),
	caisse_a_instant(T-1,R2,C2,N), coup_a_instant(T,(R,C),(R2,C2)). % On pousse une seule caisse : elle bouge

caisse_a_instant(T,R,C,N) :-
	instant(T), sol(R,C), sol(R2,C2),
	caisse_a_instant(T-1,R,C,N), perso(T,R2,C2), R2 != R. % Si on ne pousse pas une caisse, elle ne bouge pas

caisse_a_instant(T,R,C,N) :-
	instant(T), sol(R,C), sol(R2,C2),
	caisse_a_instant(T-1,R,C,N), perso(T,R2,C2), C2 != C. % idem

caisse_pas_place(T,N) :- instant(T), caisse_a_instant(T,R,C,N), not arrivee(R,C).
fini(T) :- instant(T), not caisse_pas_place(T,_).
fini_a_t(T) :- instant(T), T = #min { T2 : fini(T2) }. % Nous donne le moment auquel on a placé toutes les caisses sur des arrivées
:- not fini_a_t(_).

m(T,droite) :- instant(T), coup_a_instant(T,(R,C),(R+1,C)). % Plus agréable à lire
m(T,gauche) :- instant(T), coup_a_instant(T,(R,C),(R-1,C)).
m(T,bas) :- instant(T), coup_a_instant(T,(R,C),(R,C+1)).
m(T,haut) :- instant(T), coup_a_instant(T,(R,C),(R,C-1)).

a(0,0). a(T,M) :- instant(T), a(T-1,_), m(T,M). % Permet de trier par ordre les coups
s(T,M) :- a(T,M), T != 0.

% Détecte quand il se bloque dans un coin
caisse_dans_un_coin_sans_fin(N) :- caisse_a_instant(_,R,C,N), mur(R+1,C), mur(R,C+1), not arrivee(R,C).
caisse_dans_un_coin_sans_fin(N) :- caisse_a_instant(_,R,C,N), mur(R,C+1), mur(R-1,C), not arrivee(R,C).
caisse_dans_un_coin_sans_fin(N) :- caisse_a_instant(_,R,C,N), mur(R-1,C), mur(R,C-1), not arrivee(R,C).
caisse_dans_un_coin_sans_fin(N) :- caisse_a_instant(_,R,C,N), mur(R,C-1), mur(R+1,C), not arrivee(R,C).
:- caisse_dans_un_coin_sans_fin(_).

%#show s/2.
%#show fini/1.
%#show caisse_pas_place/2.
#show fini_a_t/1.
%#show caisse_a_instant/4.
%#show meme_config/2.
#show coup_a_instant/3.
#show t_max/1.
