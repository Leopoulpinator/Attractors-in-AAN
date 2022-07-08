size(10).
matrix(X,Y) :- X = 1..S, Y = 1..S, size(S), X - Y != 0, X + Y - 1 != S.
% ne rajoute aucun cas, et est inutile :
matrix(X,Y) :- matrix(Y,X).
#show matrix/2.
