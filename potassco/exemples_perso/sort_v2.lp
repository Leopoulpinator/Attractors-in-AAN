set(1..4).
next(X,Z) :- set(X), set(Z), X < Z; #false : set(Y), set(A), X < Y, Y < A, A < Z; X != 2.
#show next/2.
