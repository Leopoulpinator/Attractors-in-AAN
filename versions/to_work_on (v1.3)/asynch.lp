#script (python)



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

gs1_after_played_transition(empty, Gs, Transition, Automaton, Level, Step) :-
	transition_playable_modify_automaton(Transition, Automaton, Level, Step),
	active_g(Gs,Step).

gs1_after_played_transition(Gs1_apres, Gs2_apres, Transition, Automaton, Level, Step) :-
	gs1_after_played_transition(Gs1_avant, Gs2_avant, Transition, Automaton, Level, Step),
	Gs2_avant != empty,
	Gs2_avant = (nb(Automaton2, Level2), Gs2_apres),
	Automaton != Automaton2,
	Gs1_apres = (nb(Automaton2, Level2), Gs1_avant).

gs1_after_played_transition(Gs1_apres, Gs2_apres, Transition, Automaton, Level, Step) :-
	gs1_after_played_transition(Gs1_avant, Gs2_avant, Transition, Automaton, Level, Step),
	Gs2_avant != empty,
	Gs2_avant = (nb(Automaton, _), Gs2_apres),
	Gs1_apres = (nb(Automaton, Level), Gs1_avant).

gs1_after_played_transition(Gs, Transition, Step) :-
	gs1_after_played_transition(Gs, empty, Transition, _, _, Step).

gs2_returned(empty, Gs, Transition, Step) :- gs1_after_played_transition(Gs, Transition, Step).

gs2_returned(Gs1_apres, Gs2_apres, Transition, Step) :- 
	gs2_returned(Gs1_avant, Gs2_avant, Transition, Step),
	Gs2_avant = (nb(Automaton, Level), Gs2_apres),
	Gs1_apres = (nb(Automaton, Level), Gs1_avant).

playable(Gs1, Gs2, Step) :-
	gs2_returned(Gs2, empty, Transition, Step),
	active_g(Gs1, Step).
