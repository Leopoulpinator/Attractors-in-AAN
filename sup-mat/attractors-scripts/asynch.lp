% Compute the asynchronous dynamics of a model
% - Exactly 1 automaton is updated at each step
% - In other words, each global transition is made of exactly 1 local transition
% Non-deterministic in general (several automata might be updated, in different manners)

%%% Asynchronous semantics
% Asynchronous semantics: select exactly 1 local transition to play
1 {
    played(Transition, Step) :
      local_transition(Transition),
      not unplayable(Transition, Step)
} 1 :-
  step(Step).

%#show played/2.

