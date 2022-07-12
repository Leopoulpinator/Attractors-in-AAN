#script (python)

from clingo import Number, Function, String, parse_term

	# This function create a cleaner name for global states
	# g has to be an "ASP-list" (see the functionbuild_list in ASP)
	# it returns a flattening of g

def work(g):
	g = g.arguments[0]
	s = "(g"
	while g.name != 'empty':
		level = g.arguments[0]
		g = g.arguments[1]
		if level.name == 'nb':
			s+= str(level.arguments[1].number) + '_'
		else:
			return Number(-1)
	s += ')'
	#print(s)
	return parse_term(s)

	# This function determine the active level of the automaton a in the global state g
	# a has to be an automaton symbolised by an ASP-symbol String 
	# g has to be an "ASP-list" flattened
	# it returns the active level of a in g as level(a,number_level)

def determine_active_level(a,g):
	s = a.string
	#print(s)
	#print(g)
	while g.name != 'empty':
		level = g.arguments[0]
		g = g.arguments[1]
		if level.name == 'nb':
			if level.arguments[0].string == s:
				return parse_term("level(\""+s+"\","+str(level.arguments[1].number)+")")
		else:
			return Number(-1)
	return Number(-1)

#end.

% Some useful simplifications
automaton(A) :- automaton_level(A,_).
local_transition(Transition, Automaton) :- target(Transition, Automaton, _).
local_transition(Transition) :- target(Transition, _, _).

% Determines the number of automaton in the AAN studied, and the number of level in each of those automatons
nb_automaton(N) :- N = #count { A : automaton(A) }.
nb_level(A, N) :- automaton(A), N = #count { L : automaton_level(A,L) }.

% Here is a way to create an order for automatons to read them one by one and putting them into an ASP-list
enum(1..N) :- nb_automaton(N).
1 { moment(A, N) : enum(N) } 1 :- automaton(A).
1 { moment(A, N) : automaton(A) } 1 :- enum(N).
:-
	moment(A, N),
	moment(A2, N2),
	automaton(A), automaton(A2),
	enum(N), enum(N2),
	N < N2,
	A < A2. % Alphabetic order

% Here is the ASP-list creation of length N, the number of automatons
build_list(0, empty).
build_list(N+1, (nb(A, 0..K-1), L)) :- 
	build_list(N, L),
	enum(N+1),
	moment(A, N+1),
	nb_level(A, K).

% After creating the ASP-list, we define the global states gs as list, and we use the fonction "work" in python to make a name for each global state
gs(L) :- build_list(N,L), nb_automaton(N).
global_state(@work(gs(L)),L) :- gs(L). 
global_state(Gs) :- global_state(Gs,_).

%%% ===== %%%

% Enumeration of steps of the path
step(0..n).

% we can have a cycle of any length between 0 and n, and then stay in this cycle
1 {main_cycle_length(N) : step(N), N > 0 } 1.
cycle_step(0..N) :- main_cycle_length(N).
after_cycle_step(N+1..n) :- main_cycle_length(N).

% Here is chosen the initial global state
1 { active_g(Gs, 0) : global_state(Gs) } 1.

% From global state we find the active levels of each automaton during a Step
active(@determine_active_level(Automaton,L),Step) :-
	automaton(Automaton),
	step(Step),
	active_g(Gs,Step),
	global_state(Gs,L).

% Each step we chose a move to play
1 { played(Gs2,Step) : playable(Gs2,Step) } 1 :- step(Step).

% Change the global state after a step
active_g(Gs2,Step) :-
	step(Step),
	step(Step-1),
	played(Gs2,Step-1).

% Make sure to do a cycle of length N
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
	playable(Gs2,Step),
	not played(Gs2,Step),
	active_g(Gs1,Step),
	step(Step).

evolves_in_main_cycle(Gs1,Gs2,Step1,Step2) :-
	playable(Gs2,Step1),
	active_g(Gs1,Step1),
	active_g(Gs2,Step2).

:- also_playable(Gs1,Gs2,Step), not evolves_in_main_cycle(Gs1,Gs2,Step,_).

%#show test/2.
%#show playable/2.
%#show step/1.
%#show played/3.
%#show active_in_g/2.
%#show different_except/3.
%#show active/2.
%#show main_cycle_length/1.
%#show active_g/2.
%#show locally_playable/2.
%#show nb_playable/2.
%#show locally_played/3.
%#show gs2_calcul/2.
%#show gs/1.
%#show global_state/1.
%#show is_stuck/1.
%#show try/2.
%#show not_playable/2.
%#show exist_transition_from_gs1/3.
