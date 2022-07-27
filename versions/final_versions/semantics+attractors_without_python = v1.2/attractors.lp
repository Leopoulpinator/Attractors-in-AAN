%%% Some definition of names
automaton(A) :- automaton_level(A, _).
local_transition(Transition, Automaton) :- target(Transition, Automaton, _).
local_transition(Transition) :- target(Transition, _, _).
nb_automaton(N) :- N = #count { A : automaton(A) }.
nb_level(A, N) :- automaton(A), N = #count { L : automaton_level(A, L) }.

%%% Ready to make an order between automaton
enum(1..N) :- nb_automaton(N).

% The 3 following instructions create the order
%%% First we choose a moment for each automaton to be considered
1 { moment(A, N) : enum(N) } 1 :- automaton(A).
1 { moment(A, N) : automaton(A) } 1 :- enum(N).

%%% Then we filter by an alphabetic order
:- 
	moment(A, N),
	moment(A2, N2),
	automaton(A), automaton(A2),
	enum(N), enum(N2),
	N < N2,
	A < A2.

% The 2 following instructions create the 'ASP' list to encode each global state
%%% We start with an empty list of length 0
build_list(0, empty).
build_list(Length + 1, (nb(A, 0..K-1), L)) :- 
	build_list(Length, L),
	enum(Length + 1),
	moment(A, Length + 1),
	nb_level(A, K).

% From the previous creation of 'ASP' list we deduce the global states, and how many of them exist
global_state(L) :- build_list(N,L), nb_automaton(N).
nb_global_state(N) :- N = #count {L : global_state(L)}.


% Here, we unstack our 'ASP' lists to determine which are the level of each local state in a given global state
unstack_list("EMPTY", Gs, Gs) :- global_state(Gs).
unstack_list(level(Automaton, Level), Gs, Queue2) :-
	global_state(Gs),
	unstack_list(_, Gs, Queue),
	Queue = (nb(Automaton, Level), Queue2).

%%% This instruction with X = level(Automaton, Level) is true if Automaton in Gs has level Level on automaton Automaton
active_in_g(X, Gs) :- unstack_list(X, Gs, _), X != "EMPTY".
	
% n has to be written as a const in option
%%% Here we define each step of the path we'll do
step(0..n).
%%% With the length of the main_cycle
1 {main_cycle_length(N) : step(N), N > 0 } 1.
cycle_step(0..N) :- main_cycle_length(N).
after_cycle_step(N+1..n) :- main_cycle_length(N).

%%% At the beginning (step 0), we choose a global state
1 { active_g(Gs, 0) : global_state(Gs) } 1.

%%% If we are in global state Gs at step Step, this instruction deduces what are the levels of each automaton activated in Gs
active(level(Automaton, Level), Step) :-
	automaton(Automaton),
	active_in_g(level(Automaton, Level), Gs),
	step(Step),
	active_g(Gs, Step),
	global_state(Gs).

%%% For each step, we choose a playable move (defined in our semantics file), and we play it
1 {
	played(Gs1,Gs2,Step) :
		playable(Gs1,Gs2),
		active_g(Gs1,Step)
  } 1 :-
  	step(Step).

%%% With the precedent step, and the chosen played move, we deduce the next global state
active_g(Gs2, Step) :-
	step(Step),
	step(Step-1),
	played(Gs1, Gs2, Step-1).

%%% same_state(Step1, Step2) is true if the global states in Step1 and Step2 are the same
same_state(Step1, Step2) :-
	active_g(Gs, Step1),
	active_g(Gs, Step2),
	step(Step1),
	step(Step2),
	Step1 != Step2.
%%% So we can make sure that we have a cycle of length main_sycle_length
:- not same_state(0, N), main_cycle_length(N).

%%% Here, we make sure to not visit new states after the main cycle
valid_state_after_main_cycle(Step2) :-
	same_state(Step1, Step2),
	cycle_step(Step1),
	after_cycle_step(Step2).

:- not valid_state_after_main_cycle(Step1), after_cycle_step(Step1).

% And here we make sure that we cannot escape from the main cycle in a local transition
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

%#show active_in_g/2.
%#show active_g/1.
%#show active/2.
%#show unstack_list/3.
