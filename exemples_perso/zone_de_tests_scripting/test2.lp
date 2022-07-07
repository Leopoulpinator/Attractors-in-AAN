#script (python)

from clingo.symbol import Number
from clingo.symbol import Function

class Context:
    def inc(self, x):
        return Number(x.number)

    def seq(self, x, y):
        return [x, y]

def main(prg):
    prg.add("base", [], "a. #external b.")
    prg.add("fun", ["p"],"fun(p).")
    prg.ground([("base", [])], context = Context())
    prg.ground([("fun", [Number(2)]),("fun",[Number(3)])], context = Context())
    prg.assign_external(Function("b"), True)
    prg.solve()

#end.

t(1;2).
1 { s(A,B,0) ; s(A,B,1) } 1 :- t(A), t(B).

p(@inc(10)).
q(@seq(1,2)).

#show s/3.
