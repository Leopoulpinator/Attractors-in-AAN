% synchrone semantic

#script (python)

from clingo import Number, Function, String, parse_term

set_condition = {}
list_target = []
list_automaton = []

	# The 3 following functions make links between some clingo information and some python list to fill

def fill_condition(t, a, l):
	if t.name not in set_condition:
		set_condition[t.name] = {}
	set_condition[t.name][a.string] = l.number
	#print(set_condition)
	return Number(42)

def fill_target(t, a, l):
	list_target.append((t.name, a.string, l.number))
	#print(list_target)
	return Number(42)

def fill_automaton_names(a):
	list_automaton.append((a.string))
	list_automaton.sort()
	#print(list_automaton)
	return Number(42)

def product(ar_list):
    if not ar_list:
        yield ()
    else:
        for a in ar_list[0]:
            for prod in product(ar_list[1:]):
                yield (a,)+prod

list_playable = []

	# This function determines all next possible global states when we are in global state g
	# g has to be an "ASP-list" which represents a global state
	# it returns a python list of ASP functions defining each global state reachable from g

def playable(g):
	list_g = []
	while g.name != 'empty':
		level = g.arguments[0]
		g = g.arguments[1]
		if level.name == 'nb':
			list_g.append((level.arguments[0].string, level.arguments[1].number))
		else:
			return Number(-1)
	list_of_list = []
	for automaton in list_automaton:
		list_for_automaton = [list_g[list_automaton.index(automaton)][1]]
		for target in list_target:
			t = target[0]
			if target[1] == automaton:
				ok_for_condition = True
				for automaton2 in set_condition[t]:
					if (automaton2, set_condition[t][automaton2]) not in list_g:
						ok_for_condition = False
				if ok_for_condition and target[2] not in list_for_automaton:
					list_for_automaton.append(target[2])
		list_of_list.append(list_for_automaton)
	product_list = list(product(tuple(list_of_list)))
	list_global_states = []
	for global_state in product_list:
		next_one = "(g"
		for element in global_state:
			if next_one != "(g":
				next_one += '_'
			next_one += str(element)
		next_one += ")"
		list_global_states.append(parse_term(next_one))
	return list_global_states

#end.

%%% unplayable(Transition, Global_state) is True if the transition Transition cannot be played in the global state Global_State
unplayable(Transition, Gs) :-
	local_transition(Transition),
	global_state(Gs),
	automaton(Automaton),
	active_in_g(level(Automaton, LevelI), Gs),
	condition(Transition, Automaton, LevelJ),
	LevelI != LevelJ.

bin_condition(T, A, L, @fill_condition(T, A, L)) :- condition(T, A, L).
bin_target(T, A, L, @fill_target(T, A, L)) :- target(T, A, L).
bin_automaton(A, @fill_automaton_names(A)) :- automaton(A).


bin_condition_ready :-
	N = #count { T, A, L : bin_condition(T, A, L, _) },
	N = #count { T, A, L : condition(T, A, L) }.
bin_target_ready :- 
	N = #count { T, A, L : bin_target(T, A, L, _) },
	N = #count { T, A, L : target(T, A, L) }.
bin_automaton_ready :- 
	N = #count { A : bin_automaton(A, _) },
	N = #count { A : automaton(A) }.

bin_ready :-
	bin_condition_ready,
	bin_target_ready,
	bin_automaton_ready.

%%% In this semantics, if Gs2 has only K > 0 different local states from Gs1 and there is a playable transition for some (at least one) of those local states in Gs1 that brings us to Gs2, the global transition Gs1-Gs2 is playable
can_be_playable(Gs, @playable(L)) :-
	bin_ready,
	global_state(Gs, L).

%%% We have top remove the auto-cycle (cycle of length 1)
playable(Gs1, Gs2) :-
	can_be_playable(Gs1, Gs2),
	Gs1 != Gs2.

% Nota Bene :
% This version is constructive : we create all Gs2 possibles that we can reach from Gs1
