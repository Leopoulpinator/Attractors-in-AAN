% Unité temporelle bornant la profondeur de l'arbre de recherche

t_max(48).

% Quelques variables

perso(0,R,C) :- init(R,C).
nb_caisses(K) :- K = #count { R,C : caisse_init(_,R,C) }.
instant(1..T) :- t_max(T).

% Génération des coups

1 { coup_a_instant(T,(R,C),(R+1,C)) : sol(R+1,C);
    coup_a_instant(T,(R,C),(R-1,C)) : sol(R-1,C);
    coup_a_instant(T,(R,C),(R,C+1)) : sol(R,C+1);
    coup_a_instant(T,(R,C),(R,C-1)) : sol(R,C-1)
  } 1 :- perso(T-1,R,C), instant(T). % On génère les coups possibles / on peut faire un not fini(T2), T2 <= T

caisse_a_instant(0,R,C,N) :- caisse_init(N,R,C). % N est le numéro de la caisse

perso(T,R2,C2) :- perso(T-1,R,C), coup_a_instant(T,(R,C),(R2,C2)). % Déplacement du personnage

:- instant(T), sol(R,C), sol(R2,C2), sol(2*R2-R,2*C2-C),
	perso(T-1,R,C), perso(T,R2,C2), caisse_a_instant(T-1,R2,C2,_), caisse_a_instant(T-1,2*R2-R,2*C2-C,_). % Si on pousse au moins deux caisses : kaboom

:- instant(T), sol(R,C), sol(R2,C2), mur(2*R2-R,2*C2-C),
	perso(T-1,R,C), perso(T,R2,C2), caisse_a_instant(T-1,R2,C2,_). % Si on pousse une caisse contre un mur : kaboom

:- nb_caisses(K), instant(T), K != #count { R,C,N : caisse_a_instant(T,R,C,N) }.% Si on n'a plus toutes nos caisses, c'est qu'on a évité un kaboom, mais du coup on kaboom quand même

caisse_a_instant(T,2*R2-R,2*C2-C,N) :-
	instant(T), sol(R,C), sol(R2,C2), sol(2*R2-R,2*C2-C),
	caisse_a_instant(T-1,R2,C2,N), perso(T-1,R,C), perso(T,R2,C2). % On pousse une seule caisse : elle bouge

caisse_a_instant(T,R,C,N) :-
	instant(T), sol(R,C), sol(R3,C3),
	caisse_a_instant(T-1,R,C,N), perso(T,R3,C3), R3 != R. % Si on ne pousse pas une caisse, elle ne bouge pas

caisse_a_instant(T,R,C,N) :-
	instant(T), sol(R,C), sol(R3,C3),
	caisse_a_instant(T-1,R,C,N), perso(T,R3,C3), C3 != C. % idem

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

%* Fait perdre du temps, mais est utile si on recherche le minimum de coups
caisse_endroit_different(T1,T2,N) :- instant(T1), instant(T2), caisse_a_instant(T1,R,C,N), caisse_a_instant(T2,R2,C2,N), (R,C) != (R2,C2), T1 != T2.
toutes_les_caisses_aux_memes_endroits(T1,T2) :- instant(T1), instant(T2), not caisse_endroit_different(T1,T2,_), T1 != T2.
meme_config(T1,T2) :- instant(T1), instant(T2), perso(T1,R,C), perso(T2,R,C), toutes_les_caisses_aux_memes_endroits(T1,T2).
:- instant(T1), instant(T2), meme_config(T1,T2). *%

% Essayer de détecter quand il se bloque -> permet de diviser par 6 le temps de résolution du niveau 27
caisse_dans_un_coin_sans_fin(N) :- caisse_a_instant(_,R,C,N), mur(R+1,C), mur(R,C+1), not arrivee(R,C).
caisse_dans_un_coin_sans_fin(N) :- caisse_a_instant(_,R,C,N), mur(R,C+1), mur(R-1,C), not arrivee(R,C).
caisse_dans_un_coin_sans_fin(N) :- caisse_a_instant(_,R,C,N), mur(R-1,C), mur(R,C-1), not arrivee(R,C).
caisse_dans_un_coin_sans_fin(N) :- caisse_a_instant(_,R,C,N), mur(R,C-1), mur(R+1,C), not arrivee(R,C).
:- caisse_dans_un_coin_sans_fin(_).

#show s/2.
#show fini_a_t/1.
%#show caisse_a_instant/4.
%#show meme_config/2.
