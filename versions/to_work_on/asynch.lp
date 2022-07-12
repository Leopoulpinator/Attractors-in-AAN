#script (python)

from clingo import Number, Function, String, parse_term

	# This function determines the global state when we are in l and the level of automaton a change to level
	# l has to be an "ASP-list" which represents a global state
	# level has to be a number Symbol in ASP representing the level of the automaton a after it changes
	# a has to be a string Symbol in ASP representing the studied automaton
	# it returns an "ASP-list" as a Symbol in ASP representign the next global state

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

