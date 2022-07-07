p(a) :- not p(b).
p(b) :- not p(a).
:- p(b).
p(a).
