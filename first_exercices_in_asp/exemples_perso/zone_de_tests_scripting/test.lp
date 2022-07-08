#script (python)

from clingo.symbol import Function, Number, parse_term

def cst() :
	return Number(33)

def gcd(a, b):
	if a.number == 0:
		return b
	else:
		na = a.number
		nb = b.number
		nc = nb % na
		return gcd(Number(nc), a)

fun = Function("fun", [cst()])

def test():
	return fun

#end.

a.
gcd(11,@cst,@gcd(11,@cst)).
gcd(33,12,@gcd(33,12)).
t(@test,3).
