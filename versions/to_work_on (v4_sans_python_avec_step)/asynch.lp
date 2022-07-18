% asynch semantic

different_on(Gs1,Gs2,Automaton2) :-
	global_state(Gs1),
	global_state(Gs2),
	Gs1 != Gs2,
	automaton(Automaton2),
	active_in_g(level(Automaton2,LevelI),Gs1),
	active_in_g(level(Automaton2,LevelJ),Gs2),
	LevelI != LevelJ.

unplayable(Transition, Gs) :-
	local_transition(Transition),
	global_state(Gs),
	automaton(Automaton),
	active_in_g(level(Automaton,LevelI),Gs),
	condition(Transition,Automaton,LevelJ),
	LevelI != LevelJ.

not_equal_except(Automaton,Gs1,Gs2) :-
	automaton(Automaton),
	global_state(Gs1),
	global_state(Gs2),
	automaton(Automaton2),
	Automaton != Automaton2,
	different_on(Gs1,Gs2,Automaton2).

playable(Gs1,Gs2) :- % doivent être identiques sur tous les automates autres que Automaton
	active_in_g(level(Automaton,LevelI),Gs1),
	target(Transition,Automaton,LevelJ),
	not unplayable(Transition,Gs1),
	active_in_g(level(Automaton,LevelJ),Gs2),
	local_transition(Transition),
	not not_equal_except(Automaton,Gs1,Gs2),
	automaton(Automaton),
	global_state(Gs1),
	global_state(Gs2),
	LevelI != LevelJ.

