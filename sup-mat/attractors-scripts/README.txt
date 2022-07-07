Files contained in this folder: scripts for attractor enumeration

By: Emna Ben Abdallah, Maxime Folschette and Morgan Magnin



Prerequisite:
  Clingo version 5 must be installed: https://potassco.org/clingo/



*** Attractor enumeration ***

Files:
  - attractors.lp: search for attractors of length ≤ n (mandatory)
  - filtering-attractors.lp: pre-filtering or post-filtering (optional)
  - <semantics.lp> (mandatory)
    * asynch.lp: asynchronous semantics
    * synch.lp: synchronous semantics

Usage:
  clingo 0 --const n=<attractors length> [other constants...] <semantics.lp> attractors.lp [filtering.lp] <model.lp>
Where <attractors length> is an integer that gives the maximum length of the searched attractors (length = number of dynamical steps)
Other constants can be defined to change settings of the filtering; see the comments in filtering-attractors.lp for more information.

Examples:

  - With pre-filtering:
      clingo 0 --const n=10 --const filtering=pre asynch.lp attractors.lp filtering-attractors.lp ../models/asp/lambda-phage.lp
    Result: Only one model is found (after it is found, constraints are added to avoid finding the same attractor again)

  - With post-filtering:
      clingo 0 --quiet=2 --const n=10 --const filtering=post --const print_solutions=1 asynch.lp attractors.lp filtering-attractors.lp ../models/asp/lambda-phage.lp
    Result: 10 models are found but only one is printed at the end (after it is found and stored, other answers are considered redundant, and standard Clingo output is disabled)

  - With no filtering:
      clingo 0 --const n=10 --const filtering=no asynch.lp attractors.lp filtering-attractors.lp ../models/asp/lambda-phage.lp
    or equivalently:
      clingo 0 --const n=10 asynch.lp attractors.lp ../models/asp/lambda-phage.lp
    Result: 10 models are found (but they are all duplicates of the same attractor with different initial states or traversals)

