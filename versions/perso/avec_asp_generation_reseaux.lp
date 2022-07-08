#script (python)

from clingo import Number
from clingo import Function
from clingo import String
from clingo import parse_term

def conversion(n):
	char = 97 + n.number
	return String(chr(char))

def conv_bis(s,n1,n2):
	s2 = s.string+str(n1.number)+str(n2.number)
	return String(s2)

def main(prg):
	compteur = 0
	print('[ Grounding ]')
	prg.ground([("base", [])])
	with prg.solve(yield_=True) as it:
		print('[ Solving ]')
		for cur_model in it:
			compteur += 1
			new_file = open("in_reseaux_2_niveaux_2-3_automates/ex"+str(compteur)+".lp","w")
			a_renvoyer = ""
			transition_list = []
			for x in cur_model.symbols(shown = True):
				if x.name == 'condition':
					transition_name = x.arguments[0].string
					automata_name = x.arguments[1].string
					level = x.arguments[2].number
					position = -1
					if transition_name in transition_list:
						position = transition_list.index(transition_name)
					else:
						transition_list.append(transition_name)
						position = transition_list.index(transition_name)
					a_renvoyer += "condition(t"+str(position+1)+","+"\""+automata_name+"\""+","+str(level)+").\n"
				if x.name == 'target':
					transition_name = x.arguments[0].string
					automata_name = x.arguments[1].string
					level = x.arguments[2].number
					position = -1
					if transition_name in transition_list:
						position = transition_list.index(transition_name)
					else:
						transition_list.append(transition_name)
						position = transition_list.index(transition_name)
					a_renvoyer += "target(t"+str(position+1)+","+"\""+automata_name+"\""+","+str(level)+").\n"
				if x.name == 'automaton_level':
					name = x.arguments[0].string
					num = x.arguments[1].number
					a_renvoyer += "automaton_level("+"\""+str(name)+"\""+","+str(num)+").\n"
			new_file.write(a_renvoyer)
			new_file.close()

#end.

nb_possibles_automates(2..3).

1 { nb_automates(K) : nb_possibles_automates(K) } 1.

num_automates(1..K) :- nb_automates(K).
nb_possibles_niveaux(N,2) :- num_automates(N).

1 { nb_niveaux(N,K) : nb_possibles_niveaux(N,K) } 1 :- num_automates(N).

automaton_level(@conversion(N-1),0..K-1) :- num_automates(N), nb_niveaux(N,K).

possible_transition(A,L,L2) :- automaton_level(A,L), automaton_level(A,L2), L != L2.

1 {transition(A,L,L2)} 1 :- possible_transition(A,L,L2) . % précédemment : 0 {transition(A,L,L2)} 1 :- possible_transition(A,L,L2) .

possible_condition_pour_transition(A,L,L2,A2,L3) :- transition(A,L,L2), automaton_level(A2,L3), A != A2.

1 { condition_pour_transition(A,L,L2,A2,L3) : possible_condition_pour_transition(A,L,L2,A2,L3) } 1 :- transition(A,L,L2).

condition(@conv_bis(A,L,L2),A,L) :- transition(A,L,L2).
target(@conv_bis(A,L,L2),A,L2) :- transition(A,L,L2).
condition(@conv_bis(A,L,L2),A2,L3) :- condition_pour_transition(A,L,L2,A2,L3).

%#show automaton_level/2.
%#show condition/3.
%#show target/3.
