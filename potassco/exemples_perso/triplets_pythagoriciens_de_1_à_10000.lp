num(1..10000).
squares(X,Y,Y') :-
        XX = X*X, Y*Y = YY, Y'-1 = Y,
        Y'*Y' = XX+YY, num(X), num(Y), X < Y.
#show squares/3.
