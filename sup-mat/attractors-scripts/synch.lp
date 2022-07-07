% Compute the synchronous dynamics of a model
% - All automata are updated at each step, if possible
% - In other words, each global transition is made of the max number of local transitions
% Non-deterministic in general (each automata might be updated in different manners)
% Deterministic in the Boolean case (where each automata can be updated only one way)

%%% Synchronous semantics
% Automata that have at least one playable local transition
has_playable(Automaton, Step) :-
  not unplayable(Transition, Step),
  local_transition(Transition, Automaton),
  step(Step).

% Synchronous semantics: select 1 transition to play for each automaton, if possible
1 {
    played(Transition, Step) :
      not unplayable(Transition, Step),
      local_transition(Transition, Automaton)
} 1 :-
  has_playable(Automaton, Step).

% Constraint: play at least one local transition
:- 0{ played(_, Step) } 0, step(Step).

%#show played/2.

