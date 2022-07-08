% Taille non variable

size(16).

% Variables utiles

row(1..R) :- size(R).
column(1..C) :- size(C).
var(a;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p).

% Génération des solutions

1 { s(R,C,V) :var(V) } 1 :- row(R), column(C).

% Les contraintes

:- s(R,C,V), s((R+K-1)\S+1,C,V2),
   s(R2,C2,V), s((R2+K-1)\S+1,C2,V3),
   V3 != V2, row(R), row(R2), size(S), row(K).

#show s/3.
