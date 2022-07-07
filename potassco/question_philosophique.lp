case(1..4).
1 { s(R,C,V) : case(V) } 1 :- case(R), case(C).
:- s(R,C,V), s(R,C2,V), C != C2.
:- s(R,C,V), s(R2,C,V), R != R2.
diag1(R,R) :- case(R).
diag2(R,C) :- case(R), case(C), R+C = 5.
:- s(R,C,V), diag1(R,C), s(R2,C2,V), diag1(R2,C2), R != R2.
:- s(R,C,V), diag2(R,C), s(R2,C2,V), diag2(R2,C2), R != R2.
s(1,1,1). % -> Il n'y a pas de matrice 4x4 numérotée de 1 à 4 sur chaque ligne et colonne qui soit également numérotée dans toutes les diagonales du tore (regarder 2,4 et 3,3).
#show s/3.
