#script (python)
from clingo.control import Control

def main(prg):
    prg.conf.solve.models = 0
    prg.ground([("base", [])])
    prg.solve()
 
#end.
 
{a; c}.
