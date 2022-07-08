% Valeurs autorisées

val(1..9).
cases(1..3).

% On ne prend qu'une seule valeur par carré

1 {s(R,C,V): val(V) } 1:- cases(R) ; cases(C).

:- s(1,C,V1), s(2,C,V2), s(3,C,V3), somme_ligne(C,V), not V1 + V2 + V3 = V.
:- s(R,1,V1), s(R,2,V2), s(R,3,V3), somme_colonne(R,V), not V1 + V2 + V3 = V.

#show s/3.
