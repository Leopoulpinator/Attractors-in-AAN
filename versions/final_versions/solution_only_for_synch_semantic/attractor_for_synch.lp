#script(python)

# Apply pre-filtering (default: True)
SETTING_pre_filtering = True
# Apply post-filtering (default: False)
SETTING_post_filtering = False
# Pretty-print the path on standard output (default: False)
SETTING_print_path = False
# Print the set of final solutions on standard output (default: False)
SETTING_print_solutions = False
# Print the distribution of solution sizes on standard output (default: False)
SETTING_print_solution_sizes = False
# Show messages if new attractor/already found (default: False)
SETTING_verbose = False
# Write nbr_solutions to a file (default: None)
SETTING_write_nbr_solutions = None

from collections import OrderedDict
from clingo import Number, Function, String, parse_term

# Debug function
def dp(x):
  print(x, type(x))

# Easy build of an active(level("a", 1), 3) clause
def activelevel(a, l, s):
  return Function("active", [Function("level", [String(a), Number(l)]), Number(s)])

def product(ar_list):
    if not ar_list:
        yield ()
    else:
        for a in ar_list[0]:
            for prod in product(ar_list[1:]):
                yield (a,)+prod

# Main function: solving and control calls
def main(prg):
  print('[ Calling Python ]')
  global SETTING_pre_filtering
  global SETTING_post_filtering
  global SETTING_print_path
  global SETTING_print_solutions
  global SETTING_print_solution_sizes
  global SETTING_verbose
  global SETTING_write_nbr_solutions
  
  # Pyhton set for conditions of transitions ([transition][automata] = level)
  condition_transitions = {}
  # Python set for target of transitions ([transition][automata] = level)
  target_transitions = {}
  # A boolean to say if transitions is already created or not
  transitions_already_done = False
  # Set of unique solutions
  solutions = set()
  # Number of unique solutions
  nbr_solutions = 0
  # Number of duplicate solutions (skipped attractors) (useful for post-filtering only)
  nbr_skipped = 0
  # Number of steps
  n = prg.get_const("n").number
  # List of automata names
  sorted_automata_names = []
  # List of attractor size frequencies
  size_freq = {cur_size : 0 for cur_size in range(1, n + 1)}
  
  # Seettings thrgough Clingo constants
  # Filtering
  if prg.get_const("filtering") is not None:
    if prg.get_const("filtering").name == "pre":
      SETTING_pre_filtering = True
      SETTING_post_filtering = False
    elif prg.get_const("filtering").name == "post":
      SETTING_pre_filtering = False
      SETTING_post_filtering = True
    elif prg.get_const("filtering").name == "both":
      SETTING_pre_filtering = True
      SETTING_post_filtering = True
    else:
      SETTING_pre_filtering = False
      SETTING_post_filtering = False
  # DEBUG
  print('Pre : {} ; Post : {}'.format(SETTING_pre_filtering, SETTING_post_filtering))
  # Pretty-print the path
  if prg.get_const("print_path") is not None:
    if prg.get_const("print_path").number == 1:
      SETTING_print_path = True
    else:
      SETTING_print_path = False
  # Pretty-print the final set of solutions
  if prg.get_const("print_solutions") is not None:
    if prg.get_const("print_solutions").number == 1:
      SETTING_print_solutions = True
    else:
      SETTING_print_solutions = False
  # Pretty-print the distribution of the solution sizes
  if prg.get_const("print_solution_sizes") is not None:
    if prg.get_const("print_solution_sizes").number == 1:
      SETTING_print_solution_sizes = True
    else:
      SETTING_print_solution_sizes = False
  # Verbose
  if prg.get_const("verbose") is not None:
    if prg.get_const("verbose").number == 1:
      SETTING_verbose = True
    else:
      SETTING_verbose = False
  # Write nbr_solutions to a file
  if prg.get_const("write_nbr_solutions") is not None:
    SETTING_write_nbr_solutions = prg.get_const("write_nbr_solutions").name
  
  # Grounding
  print('[ Grounding ]')
  prg.ground([("base", [])])
  
  # For each solution yielded by Clingo...
  with prg.solve(yield_=True) as it:
    print('[ Solving ]')
    # Enumerate models
    for cur_model in it:
      # Dictionary for current attractor ([step][automata] = level)
      cur_dict = {}
      # Enumerate predicates
      for x in cur_model.symbols(shown = True):
        # Only look at: active(level(AUTOMATA, LEVEL), STEP)
        if x.name == 'active' and x.arguments[0].name == 'level':
          step_number = x.arguments[1].number
          automata_name = x.arguments[0].arguments[0].string
          active_level = x.arguments[0].arguments[1].number
          # If new step number
          if step_number not in cur_dict:
            cur_dict[step_number] = {}
          # No duplicate automaton level in the same step (?)
          assert automata_name not in cur_dict[step_number]
          cur_dict[step_number][automata_name] = active_level
          
        # Creation of the python sets for transitions
        elif not transitions_already_done :
          if x.name == 'condition' :
            transition = x.arguments[0].name
            automata_name = x.arguments[1].string
            level = x.arguments[2].number
            if transition not in condition_transitions:
              condition_transitions[transition] = {}
            assert automata_name not in condition_transitions[transition]
            condition_transitions[transition][automata_name] = level
          elif x.name == 'target' : 
            transition = x.arguments[0].name
            automata_name = x.arguments[1].string
            level = x.arguments[2].number
            if transition not in target_transitions:
              target_transitions[transition] = {}
            assert automata_name not in target_transitions[transition]
            target_transitions[transition][automata_name] = level
      # Creation unique (the first time we occurs in the loop) of the set for transitions
      transitions_already_done = True
      # After predicates enumeration
      
      # DEBUG: Pretty-print the current path
      if SETTING_print_path:
        for step_number in range(n + 1):
          print('{:>3}: {}'.format(step_number, cur_dict[step_number]))
      
      # List of sorted automata names
      if sorted_automata_names == []:
        sorted_automata_names = sorted(cur_dict[0])
      # (Unordered) set of states in current attractor
      cur_set = set()
      # For each step
      for step_number in cur_dict:
        # Add corresponding state to current set
        cur_set.add(tuple(cur_dict[step_number][automata_name] for automata_name in sorted_automata_names))
      
      # playable is the set of all possible transitions for each global state and automaton : playable[global_state][automata_name][transition] = level where 'level' is the level of automaton after the transition
      playable = {}
      number_automaton = len(sorted_automata_names)
      for global_state in cur_set:
        playable[global_state] = {}
        for transition in condition_transitions:
          can_be_played = True
          for automata_name in condition_transitions[transition]:
            if automata_name not in playable[global_state]:
              playable[global_state][automata_name] = {}
            if global_state[sorted_automata_names.index(automata_name)] != condition_transitions[transition][automata_name]:
              can_be_played = False
          if can_be_played:
            level = -1
            for temp in target_transitions[transition]:
              automata_name = temp
              level = target_transitions[transition][automata_name]
            playable[global_state][automata_name][transition] = level
      
      # list_of_list is the list associated to the previous set with the last automaton level for each automaton chich cannot move
      list_of_list = []
      for global_state in playable:
        list_for_current_state = []
        for automaton_name in sorted_automata_names:
          list_for_automaton = []
          if playable[global_state][automaton_name] == {}: # No changes for that automaton if we have no possible moves on it
            list_for_automaton.append(global_state[sorted_automata_names.index(automaton_name)])
            #print(global_state)
            #print(automaton_name)
            #print(sorted_automata_names.index(automaton_name))
          else:
            for transition in playable[global_state][automaton_name]:
              level = playable[global_state][automaton_name][transition]
              list_for_automaton.append(level)
          list_for_current_state.append(list_for_automaton)
        list_of_list.append(list_for_current_state)
      
      # list_of_product is the cartesian product of each possible moves for a global state
      list_of_product = []
      for l in list_of_list:
        #print(l)
        #print(list(product(tuple(l))))
        list_of_product += list(product(tuple(l)))
      
      #print(playable)
      #print(list_of_list)
      #print(list_of_product)
      
      # we assure the fact that each neighbour of a global state is also a global state of cur_set
      in_solutions = True
      for global_state in list_of_product:
        if global_state not in cur_set:
          in_solutions = False
      
      # Check if solution id redundant
      #   If pre-filtering is enabled, this doesn't happen (because of constraints)
      #   If post-filtering is enabled, check is made here
      if (SETTING_post_filtering) and (cur_set in solutions):
        nbr_skipped += 1
        if SETTING_verbose:
          print('*** Already found, skipping. ({} found, {} skipped)'
                .format(nbr_solutions, nbr_skipped))
      elif in_solutions:  # Solution is NOT redundant
        nbr_solutions += 1
        if SETTING_verbose:
          print('*** New model found! ({} found, {} skipped)'
                .format(nbr_solutions, nbr_skipped))
          print(cur_set)
        # Add to set of solutions
        solutions.add(frozenset(cur_set))
        size_freq[len(cur_set)] += 1
        # Add negative clause to avoid enumerating these states again (pre-filtering only)
        if SETTING_pre_filtering:
          # For all states
          for st in cur_set:
            symb_st = []
            # For all automata
            for i, a in enumerate(sorted_automata_names):
              symb_st.append((activelevel(a, st[i], 0), False)) # Add only for step 0
            # Add clause
#            print('* Add clause: {}'.format(symb_st))
            cur_model.context.add_clause(symb_st)
  
  # End of solving
  print('[ Solving ended ]')
  
  # Print results
  print('*** Solutions found: {}; skipped: {}'.format(nbr_solutions, nbr_skipped))
  if (SETTING_print_solutions):
    print('Automata names in order:')
    print(sorted_automata_names)
    print('Unique attractors:')
    print(solutions)
  if (SETTING_print_solution_sizes):
    print('Frequencies of attractor sizes:')
    print({s: size_freq[s] for s in size_freq if size_freq[s] != 0})
  
  # Write nbr_solutions to a file
  if SETTING_write_nbr_solutions is not None:
    with open(SETTING_write_nbr_solutions, "a") as outFile:
      outFile.write("{}".format(nbr_solutions))
      outFile.close()

#end.

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
:- 0 { played(_, Step) } 0, step(Step).

%#show played/2.
#show active/2.
#show condition/3.
#show target/3.
%#show played/2.
%#show main_cycle_length/1.
