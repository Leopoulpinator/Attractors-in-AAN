sym(1).  sym(a).  sym(f(a)). sym(g(a)). sym(f(g(a))).
eq (X,Y) :- X =  Y, sym(X), sym(Y).
neq(X,Y) :- X != Y, sym(X), sym(Y).
lt (X,Y) :- X <  Y, sym(X), sym(Y).
leq(X,Y) :- X <= Y, sym(X), sym(Y).
gt (X,Y) :- X >  Y, sym(X), sym(Y).
geq(X,Y) :- X >= Y, sym(X), sym(Y).
