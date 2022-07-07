#script (python)

import clingo
N = clingo.Number

def rng(a, b):
  na = a.number
  nb = b.number
  mon_tab = []
  for i in range(na,nb+1):
    mon_tab.append(N(i))
  return mon_tab


#end.
