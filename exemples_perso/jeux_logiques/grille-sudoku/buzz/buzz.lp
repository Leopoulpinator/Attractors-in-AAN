% Valeurs autorisées

val(1..5).

% On ne prend qu'une seule valeur par carré

1 {s(R,C,V): val(V) } 1:- val(R) ; val(C).

% Une valeur ne peut pas apparaître plusieurs fois dans la même colonne ou dans la même ligne

1 {s(R,C,V): val(R) } 1:- val(C) ; val(V).
1 {s(R,C,V): val(C) } 1:- val(R) ; val(V).

% Les valeurs doivent respecter les relations "supérieur"

:- superieur((X1,Y1),(X2,Y2)), s(X1,Y1,V1), s(X2,Y2,V2), V1 <= V2.

#show s/3.
