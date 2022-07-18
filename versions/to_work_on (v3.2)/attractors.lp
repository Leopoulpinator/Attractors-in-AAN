automaton(A) :- automaton_level(A,_).
local_transition(Transition, Automaton) :- target(Transition, Automaton, _).
local_transition(Transition) :- target(Transition, _, _).

nb_automaton(N) :- N = #count { A : automaton(A) }.
nb_level(A,N) :- automaton(A), N = #count { L : automaton_level(A,L) }.

enum(1..N) :- nb_automaton(N).

1 { moment(A,N) : enum(N) } 1 :- automaton(A).
1 { moment(A,N) : automaton(A) } 1 :- enum(N).

:- 
	moment(A,N),
	moment(A2,N2),
	automaton(A), automaton(A2),
	enum(N), enum(N2),
	N < N2,
	A < A2. % Par ordre alphabétique

% Construction de la liste

build_list(0,empty).
build_list(N+1,(nb(A,0..K-1),L)) :- 
	build_list(N,L),
	enum(N+1),
	moment(A,N+1),
	nb_level(A,K).

global_state(L) :- build_list(N,L), nb_automaton(N).
nb_global_state(N) :- N = #count {L : global_state(L)}.

% Dépilage de la liste

unstack_list(empty,Gs,Gs,Step) :-
	global_state(Gs),
	step(Step),
	active_g(Gs,Step).

unstack_list(level(Automaton,Level),Gs,Queue2,Step) :-
	global_state(Gs),
	unstack_list(_,Gs,Queue,Step),
	Queue = (nb(Automaton,Level),Queue2).

active_in_g(X,Gs) :-
	unstack_list(X,Gs,_,Step),
	X != empty,
	step(Step),
	active_g(Gs,Step),
	global_state(Gs).

% Début du programme

step(0..n).

1 {main_cycle_length(N) : step(N), N > 0 } 1.
cycle_step(0..N) :- main_cycle_length(N).
after_cycle_step(N+1..n) :- main_cycle_length(N).

1 { active_g(Gs, 0) : global_state(Gs) } 1.

1 { 
	played(Gs1,Gs2,Step) :
		playable(Gs1,Gs2),
		active_g(Gs1,Step)
  } 1 :- step(Step).

active_g(Gs2,Step) :-
	step(Step),
	step(Step-1),
	played(Gs1,Gs2,Step-1).

same_state(Step1, Step2) :-
	active_g(Gs,Step1),
	active_g(Gs,Step2),
	step(Step1),
	step(Step2),
	Step1 != Step2.

:- not same_state(0, N), main_cycle_length(N).

% Make sure to not visit new states after the main cycle
valid_state_after_main_cycle(Step2) :-
	same_state(Step1, Step2),
	cycle_step(Step1),
	after_cycle_step(Step2).

:- not valid_state_after_main_cycle(Step1), after_cycle_step(Step1).

% Make sure that we cannot escape from the main cycle in a local transition
also_playable(Gs1,Gs2,Step) :-
	playable(Gs1,Gs2),
	not played(Gs1,Gs2,Step),
	active_g(Gs1,Step),
	step(Step).

evolves_in_main_cycle(Gs1,Gs2,Step1,Step2) :-
	playable(Gs1,Gs2),
	active_g(Gs1,Step1),
	active_g(Gs2,Step2).

:- also_playable(Gs1,Gs2,Step), not evolves_in_main_cycle(Gs1,Gs2,Step,_).

#show active_g/2.
%#show active/2.
%#show unstack_list/3.
