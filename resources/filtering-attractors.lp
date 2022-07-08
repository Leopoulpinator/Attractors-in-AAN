#script(python)

# Filtering of solutions (pre-filtering or post-filtering)
# Pre-filtering: After fetching solutions, add the states as negative clauses (constraints) so that they are not enumerated again by Clingo
# Post-filtering: During solutions enumeration, fetch descriptions of states in attractors and store them, to avoid outputing them once again
# Note: Pre-filtering renders the post-filtering useless, thus both should not be used together; default is pre-filtering only

# Usage:
# Call this script with attractors.lp, a semantics (asynch.lp or synch.lp) and a model (.lp)
# Some Clingo constants can be changed to modify the setting (preceeded by --const):
#   filtering=<value> where <value> can be:
#     * pre (pre-filtering only)
#     * post (post-filtering only)
#     * both (both filterings, should be equivalent to pre-filtering only)
#     * no (no filtering)
#   print_path=<value> where <value> can be:
#     * 0 (disable pretty-print of the current path)
#     * 1 (enable it)
#   print_solutions=<value> where <value> can be:
#     * 0 (disable printing of the final set of solutions)
#     * 1 (enable it)
#   print_solution_sizes=<value> where <value> can be:
#     * 0 (disable printing of the sizes of the final set of solutions)
#     * 1 (enable it)
#   verbose=<value> where <value> can be:
#     * 0 (disable solution status: new/redundant solution + printing of the solution)
#     * 1 (enable these messages)
#   write_nbr_solutions=<file> where <file> is a file name in which the total number
#     of solutions found is written (appened at the end of the file; useful for benchmarks)
# Clingo's answer set enumeration can be disabled with the option --quiet=2

# Examples:
# 
#   - With pre-filtering:
#       clingo 0 --const n=10 --const filtering=pre asynch.lp attractors.lp filtering-attractors.lp ../models/asp/lambda-phage.lp
#     Result: Only one model is found (after it is found, constraints are added to avoid finding the same attractor again)
# 
#   - With post-filtering:
#       clingo 0 --quiet=2 --const n=10 --const filtering=post --const print_solutions=1 asynch.lp attractors.lp filtering-attractors.lp ../models/asp/lambda-phage.lp
#     Result: 10 models are found but only one is printed at the end (after it is found and stored, other answers are considered redundant, and standard Clingo output is disabled)
# 
#   - With no filtering:
#       clingo 0 --const n=10 --const filtering=no asynch.lp attractors.lp filtering-attractors.lp ../models/asp/lambda-phage.lp
#     or equivalently:
#       clingo 0 --const n=10 asynch.lp attractors.lp ../models/asp/lambda-phage.lp
#     Result: 10 models are found (but they are all duplicates of the same attractor with different initial states or traversals)



# Outcomes/improvements:
#   - Pre-filtering: Use more or less constraints
#       - Too many constraints => solving is slower
#       - Too few => maybe slower too
#           => find the right balance
#       - Maybe build constraints with symbolic states (use a BDD?)
#   - Post-filtering: Compare only one state in the attractor (not the whole attractor) to avoind too long Python comparisons



# Default values for settings
# Each setting SETTING_xxx can be set by defining a constant xxx when calling Clingo,
# see Usage above

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
import clingo

# Debug function
def dp(x):
  print(x, type(x))

# Easy build of an active(level("a", 1), 3) clause
def activelevel(a, l, s):
  return clingo.Function("active", [clingo.Function("level", [a, l]), s])

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
      
      # Check if solution id redundant
      #   If pre-filtering is enabled, this doesn't happen (because of constraints)
      #   If post-filtering is enabled, check is made here
      if (SETTING_post_filtering) and (cur_set in solutions):
        nbr_skipped += 1
        if SETTING_verbose:
          print('*** Already found, skipping. ({} found, {} skipped)'
                .format(nbr_solutions, nbr_skipped))
      else:  # Solution is NOT redundant
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
  
#  # DEBUG: Show first state of first attractor
#  print('First state of first attractor:')
#  first_state_first_attractor = list(list(solutions)[0])[0]
#  for i in range(len(sorted_automata_names)):
#    print('{:>5} = {}'.format(sorted_automata_names[i], first_state_first_attractor[i]))

#end.

