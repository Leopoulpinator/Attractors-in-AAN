% Valeurs autorisées
val(1..9).
% Les bordures des 9 sous-grilles
border(1;4;7).

% On ne prend qu'une seule valeur par carré
%  (ça paraît évident pour nous, mais l'ordinateur ne peut pas le deviner)
1 {s(R,C,V): val(V) } 1:- val(R) ; val(C).

% Une valeur ne peut pas apparaître plusieurs fois dans la même colonne
1 {s(R,C,V): val(R) } 1:- val(C) ; val(V).

% Ni dans la même ligne.
1 {s(R,C,V): val(C) } 1:- val(R) ; val(V).

% Une valeur ne peut pas apparaître plusieurs fois dans une sous-grille.
1 { s(R,C,V):
   val(R), val(C),  % R et C sont des lignes/colonnes
   R1<=R, R<=(R1+2),  % la ligne est contenue entre les limites de la bordure
   C1<=C, C<=(C1+2)   % pareil pour la colonne
} 1 :- val(V) ; border(R1) ; border(C1).

#show s/3.
