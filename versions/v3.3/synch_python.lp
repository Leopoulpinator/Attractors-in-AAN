% synchrone semantic

#script (python)

from clingo import Number, Function, String, parse_term

set_condition = {}
list_target = []
list_automaton = []

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
	#print(list_automaton)
	return Number(42)

list_playable = []

def product(ar_list):
    if not ar_list:
        yield ()
    else:
        for a in ar_list[0]:
            for prod in product(ar_list[1:]):
                yield (a,)+prod

def playable(g):
	list_g = []
	#print(g)
	while g.name != 'empty':
		level = g.arguments[0]
		g = g.arguments[1]
		if level.name == 'nb':
			list_g.append((level.arguments[0].string, level.arguments[1].number))
		else:
			return Number(-1)
	list_of_list = []
	for automaton in list_automaton:
		list_for_automaton = []
		for target in list_target:
			#print(target)
			t = target[0]
			ok_for_condition = True
			for automaton2 in set_condition[t]:
				if (automaton2, set_condition[t][automaton2]) not in list_g:
					ok_for_condition = False
			if ok_for_condition and target[2] not in list_for_automaton:
				list_for_automaton.append(target[2])
		if list_for_automaton == []:		
			list_for_automaton = [list_g[list_automaton.index(automaton)][1]]
		list_of_list.append(list_for_automaton)
	#print(list_of_list)
	product_list = list(product(tuple(list_of_list)))
	#print(product_list)
	list_global_states = []
	for global_state in product_list:
		next_one = "(g"
		for element in global_state:
			if next_one != "(g":
				next_one += '_'
			next_one += str(element)
		next_one += ")"
		list_global_states.append(parse_term(next_one))
	#print(list_global_states)
	return list_global_states

### This function determines the global state when we are in l and the level of automaton a change to level
### g has to be an "ASP-list" which represents a global state
### level has to be a number Symbol in ASP representing the level of the automaton a after it changes
### a has to be a string Symbol in ASP representing the studied automaton
### it returns an "ASP-list" as a Symbol in ASP representign the next global state

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

%%% In this semantics, if Gs2 has only one different local state from Gs1 and there is a playable transition in Gs1 that brings us to Gs2, the global transition Gs1-Gs2 is playable
can_be_playable(Gs, @playable(L)) :-
	bin_ready,
	global_state(Gs, L).

%%% We have top remove the auto-cycle (cycle of length 1)
playable(Gs1, Gs2) :-
	can_be_playable(Gs1, Gs2),
	Gs1 != Gs2.

% Nota Bene :
% This version is constructive : we create all Gs2 possibles that we can reach from Gs1
