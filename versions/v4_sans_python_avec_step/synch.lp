% synch semantic

different_on(Gs1,Gs2,Automaton) :-
	global_state(Gs1),
	global_state(Gs2),
	Gs1 != Gs2,
	automaton(Automaton),
	active_in_g(level(Automaton,LevelI),Gs1),
	active_in_g(level(Automaton,LevelJ),Gs2),
	LevelI != LevelJ.

unplayable(Transition, Gs) :-
	local_transition(Transition),
	global_state(Gs),
	automaton(Automaton),
	active_in_g(level(Automaton,LevelI),Gs),
	condition(Transition,Automaton,LevelJ),
	LevelI != LevelJ.

has_playable(Automaton,Gs,LevelI,LevelJ) :-
	not unplayable(Transition,Gs),
	condition(Transition,Automaton,LevelI),
	target(Transition,Automaton,LevelJ),
	local_transition(Transition,Automaton),
	global_state(Gs).

try(Gs1,Gs2) :-
	global_state(Gs1),
	global_state(Gs2),
	Gs1 != Gs2.

% not playable because Gs1 and Gs2 are equal on A and A has a possible move
not_playable(Gs1,Gs2) :-
	try(Gs1,Gs2),
	has_playable(A,Gs1,_,_),
	not different_on(Gs1,Gs2,A),
	automaton(A).

% not playable because if Gs1 has no move on automaton A, then Gs2 has to be on the same level
not_playable(Gs1,Gs2) :- 
	try(Gs1,Gs2),
	not has_playable(A,Gs1,_,_),
	different_on(Gs1,Gs2,A),
	automaton(A).

% not playable because Gs2 isn't reachable from Gs1 (it exists a transition that makes an error)
exist_transition_from_gs1(Gs1,Gs2,Automaton) :-
	try(Gs1,Gs2),
	has_playable(A,Gs1,_,Level),
	local_transition(Transition),
	not unplayable(Transition,Gs1),
	target(Transition,Automaton,Level),
	active_in_g(level(Automaton,Level),Gs2).

not_playable(Gs1,Gs2) :-
	try(Gs1,Gs2),
	automaton(A),
	has_playable(A,Gs1,_,_),
	not exist_transition_from_gs1(Gs1,Gs2,A).

% not playable because it is a stuck state
is_stuck(Gs) :- global_state(Gs),not has_playable(_,Gs,_,_).
not_playable(Gs1,Gs2) :-
	try(Gs1,Gs2),
	is_stuck(Gs1).

playable(Gs1,Gs2) :-
	try(Gs1,Gs2),
	not not_playable(Gs1,Gs2).

%#show is_stuck/1.
%#show try/2.
%#show playable/2.
%#show not_playable/2.
%#show exist_transition_from_gs1/3.
