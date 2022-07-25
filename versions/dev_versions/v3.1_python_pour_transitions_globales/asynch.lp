#script (python)

from clingo import Number, Function, String, parse_term

	# This function determines the global state when we are in l and the level of automaton a change to level
	# g has to be an "ASP-list" which represents a global state
	# level has to be a number Symbol in ASP representing the level of the automaton a after it changes
	# a has to be a string Symbol in ASP representing the studied automaton
	# it returns an "ASP-list" as a Symbol in ASP representign the next global state

def playable(g, a, level):
	s = a.string
	l = str(level.number)
	to_return = ""
	nb = 0
	while g.name != 'empty':
		nb += 1
		to_return += "("
		level2 = g.arguments[0]
		g = g.arguments[1]
		if level2.name == 'nb':
			to_return += "nb("
			if level2.arguments[0].string == s:
				to_return += "\""+s+"\","+l
			else :
				to_return += "\""+level2.arguments[0].string+"\","+str(level2.arguments[1].number)
			to_return += "),"
		else:
			return Number(-1)
	end = ")"*nb
	to_return += "empty"+end
	return parse_term(to_return)

#end.


% asynch semantic

unplayable(Transition, Step) :-
	local_transition(Transition),
	global_state(Gs),
	active_g(Gs,Step),
	automaton(Automaton),
	active(level(Automaton,LevelI),Step),
	condition(Transition,Automaton,LevelJ),
	LevelI != LevelJ.

transition_playable_modify_automaton(Transition, Automaton, Level, Step) :-
	local_transition(Transition),
	step(Step),
	not unplayable(Transition, Step),
	target(Transition, Automaton, Level).

playable(Gs1, @playable(Gs1, Automaton, Level), Step) :-
	transition_playable_modify_automaton(_, Automaton, Level, Step),
	active_g(Gs1, Step).
