#script (python)

from clingo import Number
from clingo import Function

def main(prg):
	num = 1
	if prg.get_const("num") is not None:
		num = prg.get_const("num").number
	mot = str(num)
	if len(mot) == 1:
		mot = '0'+mot
	with open("txt/screen."+mot) as f:
		content = f.read()
		colonne = 1
		ligne = 1
		nb_caisses = 1
		for i in range(len(content)):
			c = content[i]
			if c == '#' :
				prg.add("base",[], "mur("+str(colonne)+','+str(ligne)+").")
				colonne += 1
			elif c == '\n':
				ligne += 1
				colonne = 1
			elif c == ' ':
				colonne += 1
			elif c == '$':
				prg.add("base",[], "caisse_init("+str(nb_caisses)+','+str(colonne)+','+str(ligne)+").")
				nb_caisses += 1
				colonne += 1
			elif c == '.':
				prg.add("base",[], "arrivee("+str(colonne)+','+str(ligne)+").")
				colonne += 1
			elif c == '@':
				prg.add("base",[], "init("+str(colonne)+','+str(ligne)+").")
				colonne += 1
		prg.add("base",[], "sol(R,C) :- init(R,C).")
		prg.add("base",[], "sol(R,C) :- caisse_init(_,R,C).")
		prg.add("base",[], "sol(R,C) :- arrivee(R,C).")
		prg.add("base",[], "sol(R+1,C) :- sol(R,C), not mur(R+1,C).")
		prg.add("base",[], "sol(R-1,C) :- sol(R,C), not mur(R-1,C).")
		prg.add("base",[], "sol(R,C+1) :- sol(R,C), not mur(R,C+1).")
		prg.add("base",[], "sol(R,C-1) :- sol(R,C), not mur(R,C-1).")
		prg.ground([("base", [])])
		prg.solve()
#end.
