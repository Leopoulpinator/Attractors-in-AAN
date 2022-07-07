Model files and conversion script for the benchmarks

Contents:
  - an2asp.py: conversion script from AN to ASP (see below)
  - each folder: the model files in defferent formats (see below)



*** Files and formats description ***

Four formats are available:
  - ASP, with file extension ".lp", is the format translated into Answer Set Programming predicates; you must use this format to run the analysis of the paper
  - AN (Automata Network), with file extension ".an", is the format supported by Pint (https://loicpauleve.name/pint/)
  - SBML-qual, with file extension ".sbml", is used to represent qualitative models in XML (http://colomoto.org/formats/sbml-qual.html)
  - ZGINML, with file extension ".zginml", is the enriched format of the software GINsim (http://ginsim.org/)

Typically, models are initially downloaded in ZGINML (or GINML) format from the GINsim model repoository. In this case, the conversion pipeline is:
  (Z)GINML -> SBML-qual -> AN -> ASP
The whole pipeline can be performed using a Colomoto notebook (http://colomoto.org/). Otherwise, the detailed conversion steps are:
  - (Z)GINML -> SBML-qual: open the file with GINsim (http://ginsim.org/) and export to SBML-qual
  - SBML-qual -> AN: install bioLQM (https://github.com/colomoto/bioLQM) and run: java -jar bioLQM-0.8.jar <SBML-qual file.sbml> <output file.an>
  - AN -> ASP: use the script an2asp as described below

Note that some models were manually written in AN format from literature and simply converted into ASP using the last step.

Models available and source:
  Name          Source
  example       (manually written from paper)
  lambda-phage  http://ginsim.org/node/47
  trp-reg       https://doi.org/10.1093/bioinformatics/bti1130 (manually converted)
  fission-yeast http://ginsim.org/node/37
  mammalian     https://doi.org/10.1093/bioinformatics/btl210 (manually converted)
  tcrsig        http://ginsim.org/node/78
  t-helper      https://doi.org/10.3389/fbioe.2014.00086 (manually converted)



*** an2asp.py conversion script ***

Usage of an2asp.py:
  python2 an2asp.py <source file.an> <target file.lp>
Where <source file.an> is an existing file in AN format, and
      <target file.lp> is a file name where the result is written to (any existing file with this name is erased)

Example:
  python2 an2asp.py an/example.an asp/example.lp

