#script (python)

from clingo.symbol import Number
from clingo.symbol import Function

def s(r, c, v):
  return Function("s", [Number(r), Number(c), Number(v)])

def main(prg):
	print('[ Calling Python ]')
	
	solutions = set()
	nbr_solutions = 0
	nbr_skipped = 0
	n = prg.get_const("n").number
	
	print('[ Grounding ]')
	#prg.add("base", [], "a. #external b.")
	prg.ground([("base", [])])
	#prg.assign_external(Function("b"), True)
	
	with prg.solve(yield_ = True) as it:
		print('[ Solving ]')
		for cur_model in it:
			cur_set = set()
			yop = True
			for x in cur_model.symbols(shown = True):
				if x.name == 's' :
					t = (x.arguments[0].number,x.arguments[1].number,x.arguments[2].number)
					cur_set.add(t)
					if t in solutions :
						yop = False
			if yop :
				nbr_solutions += 1
				#print('*** New model found! ({} found, {} skipped)'.format(nbr_solutions, nbr_skipped))
				#print(cur_set)
				for a in cur_set :
					solutions.add(a)
					(r,c,v) = a
					symb_st = []
					symb_st.append((s(r,c,v),False))
					#print('* Add clause: {}'.format(symb_st))
					cur_model.context.add_clause(symb_st)
			else :
				nbr_skipped += 1
				#print('*** Already found, skipping. ({} found, {} skipped)'.format(nbr_solutions, nbr_skipped))
	print('{} found, {} skipped'.format(nbr_solutions, nbr_skipped))
#end.

% Valeurs autorisées

#const n = 9.
val(1..n).

% Les bordures des 9 sous-grilles

border(1;4;7).

% On ne prend qu'une seule valeur par carré

1 {s(R,C,V): val(V) } 1:- val(R) ; val(C).

% Une valeur ne peut pas apparaître plusieurs fois dans la même colonne

1 {s(R,C,V): val(R) } 1:- val(C) ; val(V).

% Ni dans la même ligne.

1 {s(R,C,V): val(C) } 1:- val(R) ; val(V).

% Une valeur ne peut pas apparaître plusieurs fois dans une sous-grille.

1 { s(R,C,V):
   val(R), val(C),  % R et C sont des lignes/colonnes
   R1<=R, R<=(R1+2),  % la ligne est contenue entre les limites de la bordure
   C1<=C, C<=(C1+2)   % pareil pour la colonne
} 1 :- val(V) ; border(R1) ; border(C1).



#show s/3.
