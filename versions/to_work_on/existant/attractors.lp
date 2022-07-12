% Compute the attractors of a model for a given max length n (constant)
% Principle: enumerate all possible paths of length n and filter out each one that
%            is not an attractor (i.e. does not contain a cycle with no outgoing transitions)
%            Here we consider a cycle that may be of length ≤ n
% Usage: see REAMDE.txt
%
% Glossary:
% Attractor = minimal set of states that cannot be dynamically escaped
%           = minimal SCC in the dynamics (see lemma)
%           = states of a cycle with no outgoing transitions (see lemma)
% Length = number of steps to cover the whole set of states: n
% Size = number of (distinct) states
% Step = an INTEGER that labels a state in the path currently considered (0 to n)
% State = a set of local states (automaton name & value for each automaton)
% Cycle (here) = path in which the first and last states are equal
% Main cycle = cyclic sub-part of the path that covers all states of the attractor



%%% Initialization (extended facts)
% Automata names
automaton(Automaton) :- automaton_level(Automaton, _).
% Local transition names
local_transition(Transition, Automaton) :- target(Transition, Automaton, _).
local_transition(Transition) :- target(Transition, _, _).

%%% Steps
% Steps in the whole path
step(0..n).
% Length of the main cycle (i.e., a cycling sub-path)
1 {main_cycle_length(N) : step(N), N > 0 } 1.
% Steps in the main cycle
cycle_step(0..N) :- main_cycle_length(N).
% Steps after the main cycle
after_cycle_step(N+1..n) :- main_cycle_length(N).

%%% Initial state
% Select randomly one initial state (step 0)
1 { active(level(Automaton, Level), 0) : automaton_level(Automaton, Level) } 1 :-
  automaton(Automaton).

%%% Prepare for the semantics computation
% Compute not playable transitions for each step
unplayable(Transition, Step) :-
  active(level(Automaton, LevelI), Step),
  condition(Transition, Automaton, LevelJ),
  LevelI != LevelJ,
  step(Step).
% Must be combined with a semantics (asynch.lp or synch.lp)

%%% Compute the next state, successor of each S
% In Step, Automaton uses Transition to change from LevelI to LevelJ
change(Transition, Automaton, LevelI, LevelJ, Step) :-
  played(Transition, Step),
  target(Transition, Automaton, LevelJ),
  condition(Transition, Automaton, LevelI).
% Change for the new active level if there is a change on Automaton
active(level(Automaton, LevelK), Step + 1) :-
  change(_, Automaton, _, LevelK, Step),
  Step < n.
% Keep the same active level if no change on Automaton
active(level(Automaton, LevelK), Step + 1) :-
  not change(_, Automaton, _, _, Step),
  active(level(Automaton, LevelK), Step),
  step(Step),
  Step < n.

%%% Check if there is a loop: a cycle between the first and the Nth state
% States of Step1 and Step2 are different on Automaton, with Step1 < Step2
different_states_on(Step1, Step2, Automaton) :-
  active(level(Automaton, LevelI), Step1),
  active(level(Automaton, LevelJ), Step2),
  LevelI != LevelJ,
  step(Step1),
  step(Step2),
  automaton(Automaton),
  Step1 != Step2.
% States of Step1 and Step2 are different on at least one automaton
different_states(Step1, Step2) :- different_states_on(Step1, Step2, _).
% States of Step1 and Step2 are identical (thus there is a cycle)
same_state(Step1, Step2) :-
  not different_states(Step1, Step2),
  step(Step1),
  step(Step2),
  Step1 != Step2.
% Constraint: remove answer sets that are not cyclic on the main cycle (steps 0 and N)
:- not same_state(0, N), main_cycle_length(N).

%%% State of Step2 after the main cycle is equal to a state in the main cycle
% Check that the states after the main cycle are already visited in the main cycle
valid_state_after_main_cycle(Step2) :-
  same_state(Step1, Step2),
  cycle_step(Step1),
  after_cycle_step(Step2).
% Constraint: remove answer sets that visit new states after the main cycle
:- not valid_state_after_main_cycle(Step1), after_cycle_step(Step1).

%%% Check if there is a transition that can be played and leads out of the cycle
% Enumerate transitions also playable in a state (but not chosen to build the path)
also_playable(Transition, Step) :-
  not unplayable(Transition, Step),
  not played(Transition, Step),
  local_transition(Transition),
  step(Step).
% Transition allows to go from Step1 to Step2 which is also in the path
% Note: 1 = { different_states_on(Step1, Step2, _) } is only correct for asynchonous,
%       it might filter out legitimate attractors for synchronous
evolves_in_main_cycle(Transition, Step1, Step2) :-
  also_playable(Transition, Step1),
  target(Transition, Automaton, LevelK),
  active(level(Automaton, LevelK), Step2),
  cycle_step(Step2),
  Step2 != Step1 + 1,
  1 = { different_states_on(Step1, Step2, _) }.
% Constraint: remove answer sets where a local transition is playable and allows to escape the main cycle (not an attractor)
:- also_playable(Transition, Step), not evolves_in_main_cycle(Transition, Step, _).



#show active/2.

%DEBUG
%#show played/2.
%#show main_cycle_length/1.

