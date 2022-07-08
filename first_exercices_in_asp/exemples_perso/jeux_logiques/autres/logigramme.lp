% Image pour comprendre : https://www.educmat.fr/categories/jeux_reflexion/fiches_jeux/logigramme/avant_logigramme.jpg

forme(carre;hexagone;rectangle;cercle).
taille(20;30;40;50).
prix(10;15;20;25).
matiere(plastique;resine;terre;zinc).

% Génération des solutions

1 { pot(M,F,T,P) : forme(F), taille(T), prix(P) } 1 :- matiere(M).

% Unicité partout

1 { pot(M,F,T,P) : forme(F), taille(T), matiere(M) } 1 :- prix(P).
1 { pot(M,F,T,P) : forme(F), matiere(M), prix(P) } 1 :- taille(T).
1 { pot(M,F,T,P) : matiere(M), taille(T), prix(P) } 1 :- forme(F).

% Indices

:- pot(terre,hexagone,_,_).
:- pot(terre,_,_,P), pot(plastique,_,_,P2), P < P2.
:- pot(plastique,_,40,_).
:- pot(_,_,40,P), pot(_,rectangle,_,P2), P+10 != P2.
:- pot(resine,_,_,25).
:- pot(_,carre,_,10).
:- pot(_,carre,T,_), pot(terre,_,T2,_), T2+10 != T.
:- pot(_,carre,T,_), pot(_,_,T2,25), T+10 != T2.

#show pot/4.
