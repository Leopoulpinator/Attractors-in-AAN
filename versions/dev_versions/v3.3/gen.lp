% synchrone semantic
%%% In this semantics, if Gs2 has only K > 0 different local states from Gs1 and there is a playable transition for some (at least one) of those local states in Gs1 that brings us to Gs2, the global transition Gs1-Gs2 is playable
%%% different_on(Gs1, Gs2, Automaton2) is True if Gs1 and Gs2 have different levels on the automaton Automaton2
different_on(Gs1, Gs2, Automaton) :-
	global_state(Gs1),
	global_state(Gs2),
	Gs1 != Gs2,
	automaton(Automaton),
	active_in_g(level(Automaton, LevelI), Gs1),
	active_in_g(level(Automaton, LevelJ), Gs2),
	LevelI != LevelJ.

%%% unplayable(Transition, Global_state) is True if the transition Transition cannot be played in the global state Global_State
unplayable(Transition, Gs) :-
	local_transition(Transition),
	global_state(Gs),
	automaton(Automaton),
	active_in_g(level(Automaton, LevelI), Gs),
	condition(Transition, Automaton, LevelJ),
	LevelI != LevelJ.

%%% has_playable(Automaton, Gs, I, J) is True if the automaton Automaton can change from level I to level J with a transition
has_playable(Automaton, Gs, LevelI, LevelJ) :-
	not unplayable(Transition, Gs),
	condition(Transition, Automaton, LevelI),
	target(Transition, Automaton, LevelJ),
	local_transition(Transition, Automaton),
	global_state(Gs).

%%% try(Gs1, Gs2) is True if Gs1 and Gs2 are different -> so this code bloc create a lot of atoms (N² if N is the number of global state...)
try(Gs1, Gs2) :-
	global_state(Gs1),
	global_state(Gs2),
	Gs1 != Gs2.

% not_playable(Gs1, Gs2) is True if we cannot reach Gs2 from Gs1
%%% here, we cannot reach Gs2 from Gs1 if they are different on an automaton A and A has no possible move
not_playable(Gs1, Gs2) :- 
	try(Gs1, Gs2),
	automaton(A),
	not has_playable(A, Gs1, _, _),
	different_on(Gs1, Gs2, A).

%%% exist_transition_from_gs1(Gs1, Gs2, Automaton) is True if there is at least one playable transition that change the level of Automaton in Gs1 into the level they have in Gs2
exist_transition_from_gs1(Gs1, Gs2, Automaton) :-
	try(Gs1, Gs2),
	has_playable(A, Gs1, _, Level),
	local_transition(Transition),
	not unplayable(Transition, Gs1),
	target(Transition, Automaton, Level),
	active_in_g(level(Automaton, Level), Gs2).
%%% here, we cannot reach Gs2 from Gs1 if there is no transition that can change the level of an automaton A which has a playable move in Gs1 into the level they have in Gs2
not_playable(Gs1, Gs2) :-
	try(Gs1, Gs2),
	automaton(A),
	different_on(Gs1, Gs2, A),
	not exist_transition_from_gs1(Gs1, Gs2, A).

%%% Also, (Gs1, Gs2) is not playable if Gs1 is a stuck state
is_stuck(Gs) :- global_state(Gs), not has_playable(_, Gs, _, _).
not_playable(Gs1, Gs2) :-
	try(Gs1, Gs2),
	is_stuck(Gs1).

%%% playable(Gs1, Gs2) is True if the transition isn't unplayable
playable(Gs1, Gs2) :-
	try(Gs1, Gs2),
	not not_playable(Gs1, Gs2).

% Nota Bene :
% This version is not constructive : we try each Gs2 possible for each Gs1 and we create playable(Gs1, Gs2) if that is possible to make the transition

