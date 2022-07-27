% asynchrone semantic
%%% different_on(Gs1, Gs2, Automaton2) is True if Gs1 and Gs2 have different levels on the automaton Automaton2
different_on(Gs1, Gs2, Automaton2) :-
	global_state(Gs1),
	global_state(Gs2),
	Gs1 != Gs2,
	automaton(Automaton2),
	active_in_g(level(Automaton2, LevelI), Gs1),
	active_in_g(level(Automaton2, LevelJ), Gs2),
	LevelI != LevelJ.

%%% unplayable(Transition, Global_state) is True if the transition Transition cannot be played in the global state Global_State
unplayable(Transition, Gs) :-
	local_transition(Transition),
	global_state(Gs),
	automaton(Automaton),
	active_in_g(level(Automaton, LevelI), Gs),
	condition(Transition, Automaton, LevelJ),
	LevelI != LevelJ.

%%% not_equal_except(Automaton, Gs1, Gs2) is True if Gs1 and Gs2 have a different level on an automaton different than Automaton
not_equal_except(Automaton, Gs1, Gs2) :-
	automaton(Automaton),
	global_state(Gs1),
	global_state(Gs2),
	automaton(Automaton2),
	Automaton != Automaton2,
	different_on(Gs1, Gs2, Automaton2).

%%% playable(Gs1, Gs2) is True if we can reach Gs2 from Gs1
%%% In this semantics, if Gs2 has only one different local state from Gs1 and there is a playable transition in Gs1 that brings us to Gs2, the global transition Gs1-Gs2 is playable
%%% That means that Gs1 and Gs2 have to be different on an automaton Automaton, and have to be equal except that Automaton, and there is a playable Transition from Gs1 which change the automaton Automaton into their level in Gs2
playable(Gs1, Gs2) :-
	active_in_g(level(Automaton, LevelI), Gs1),
	target(Transition, Automaton, LevelJ),
	not unplayable(Transition, Gs1),
	active_in_g(level(Automaton, LevelJ), Gs2),
	local_transition(Transition),
	not not_equal_except(Automaton, Gs1, Gs2),
	automaton(Automaton),
	global_state(Gs1),
	global_state(Gs2),
	LevelI != LevelJ.

% Nota Bene :
% This version is not constructive : we try each Gs2 possible for each Gs1 and we create playable(Gs1, Gs2) if that is possible to make the transition
