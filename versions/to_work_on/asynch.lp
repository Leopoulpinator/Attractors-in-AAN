#script (python)

from clingo import Number, Function, String, parse_term

# La fonction suivante détermine l'état global lorsque l'on est en l, et que l'automate a passe au niveau level

def next(l,level,a): 
	s = a.string
	#print(s)
	#print(g)
	to_return = "(g"
	while l.name != 'empty':
		level2 = l.arguments[0]
		l = l.arguments[1]
		if level2.name == 'nb':
			if level2.arguments[0].string == s:
				to_return += str(level.number)
			else :
				to_return += str(level2.arguments[1].number)
			to_return += '_'
		else:
			return Number(-1)
	to_return += ')'
	return parse_term(to_return)

#end.

% asynch semantic

unplayable(Transition,Step) :-
	local_transition(Transition),
	automaton(Automaton),
	active(level(Automaton,LevelI),Step),
	condition(Transition,Automaton,LevelJ),
	LevelI != LevelJ.

playable(@next(L, Level, A), Step) :-
	step(Step),
	not unplayable(T, Step),
	target(T, A, Level),
	active_g(Gs,Step),
	global_state(Gs,L).











