Files contained in this folder: scripts for stable state enumeration

By: Emna Ben Abdallah, Maxime Folschette and Morgan Magnin



Prerequisite:
  Clingo version 5 or more must be installed: https://potassco.org/clingo/



*** Stable state enumeration ***

File:
  - stable-states.lp

Usage:
  clingo 0 stabe-states.lp <model.lp>

Example:

  clingo 0 stabe-states.lp ../models/asp/lambda-phage.lp
Result: 1 stable state printed on screen

