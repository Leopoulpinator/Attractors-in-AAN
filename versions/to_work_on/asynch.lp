% asynch semantic

different_on(Gs1,Gs2,Automaton,Step) :-
	active_g(Gs1,Step),
	global_state(Gs1),
	global_state(Gs2),
	Gs1 != Gs2,
	automaton(Automaton),
	active(level(Automaton,LevelI),Step),
	active_in_g(level(Automaton,LevelJ),Gs2),
	LevelI != LevelJ.

not_equal_except(Automaton,Gs1,Gs2,Step) :-
	active_g(Gs1,Step),
	automaton(Automaton),
	global_state(Gs1),
	global_state(Gs2),
	automaton(Automaton2),
	Automaton != Automaton2,
	different_on(Gs1,Gs2,Automaton2,Step).

unplayable(Transition,Step) :-
	local_transition(Transition),
	automaton(Automaton),
	active(level(Automaton,LevelI),Step),
	condition(Transition,Automaton,LevelJ),
	LevelI != LevelJ.

playable(Gs1,Gs2,Step) :- % doivent être identiques sur tous les automates autres que Automaton
	active_g(Gs1,Step),
	active(level(Automaton,LevelI),Step),
	target(Transition,Automaton,LevelJ),
	not unplayable(Transition,Step),
	active_in_g(level(Automaton,LevelJ),Gs2),
	local_transition(Transition),
	not not_equal_except(Automaton,Gs1,Gs2,Step),
	automaton(Automaton),
	global_state(Gs1),
	global_state(Gs2),
	Gs1 != Gs2,
	LevelI != LevelJ.

