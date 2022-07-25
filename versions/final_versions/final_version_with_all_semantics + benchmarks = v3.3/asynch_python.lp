% asynchrone semantics

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
	to_return = "(g"
	nb = 0
	while g.name != 'empty':
		level2 = g.arguments[0]
		g = g.arguments[1]
		if level2.name == 'nb':
			if to_return != "(g":
				to_return += "_"
			if level2.arguments[0].string == s:
				to_return += l
			else :
				to_return += str(level2.arguments[1].number)
		else:
			return Number(-1)
	to_return += ")"
	return parse_term(to_return)

#end.

%%% unplayable(Transition, Global_state) is True if the transition Transition cannot be played in the global state Global_State
unplayable(Transition, Gs) :-
	local_transition(Transition),
	global_state(Gs),
	automaton(Automaton),
	active_in_g(level(Automaton, LevelI), Gs),
	condition(Transition, Automaton, LevelJ),
	LevelI != LevelJ.

%%% playable(Gs1, Gs2) is True if we can reach Gs2 from Gs1
%%% In this semantics, if Gs2 has only one different local state from Gs1 and there is a playable transition in Gs1 that brings us to Gs2, the global transition Gs1-Gs2 is playable
playable(Gs, @playable(L, Automaton, Level)) :-
	global_state(Gs,L),
	local_transition(Transition),
	not unplayable(Transition, Gs),
	target(Transition, Automaton, Level).

% Nota Bene :
% This version is constructive : we create all Gs2 possibles that we can reach from Gs1
