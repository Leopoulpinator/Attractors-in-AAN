#!/bin/bash

# Benchmark for attractor enumeration
# Usage: change benchmarks parameters below and run:
#   bash benchmarks.sh

### Benchmark parameters
# Size of paths
PathSizes="2 5 10 15"
# Model files
ModelFiles="example.lp lambda-phage.lp trp-reg.lp fisson-yeast.lp mammalian.lp tcrsig.lp t-helper.lp"
# Filter modes
FilterModes="no pre post"
# Semantics
Semantics="synch asynch"
# Clingo time limit in seconds (0 = no time limit)
TimeLimit="100"

### Other parameters
# Additional parameters
AdditionalParameters="--const print_solutions=0 --const print_solution_sizes=1"
# Folder containing model files
ModelsFolder="../models/asp/"
# Template file name for number of solutions of current filter (without .csv extension)
GatherNbrSolutions="nbrsolutions"
# Template file name for execution times of current filter (without .csv extension)
Time="time"
# File name to gather all terminal outputs (with extension)
GlobalOutputFile="out.out"
# Temp file (with extension)
TempOutputFile="temp.out"
# Final forlder to move the benchmark files into
MoveFolder=$(date "+%F_%T")
MoveFolder="../benchmarks/benchmarks_${MoveFolder//:/-}"

echo "Final benchmarks folder: $MoveFolder"
mkdir "$MoveFolder"

echo -n "" > "$GlobalOutputFile"

echo "begin."

# For all semantics...
for CurSemantics in $Semantics
do
  # Erase old output files + start with headers (model names)
  for CurFilter in $FilterModes
  do
    CurGatherFile="$GatherNbrSolutions$CurFilter"
    CurTimeFile="$Time$CurFilter"
    # Empty file
    echo -n "n" > "$CurGatherFile"
    echo -n "n" > "$CurTimeFile"
    for CurModel in $ModelFiles
    do
      echo -n ", $CurModel" >> "$CurGatherFile"
      echo -n ", $CurModel" >> "$CurTimeFile"
    done # End all models
    echo "" >> "$CurGatherFile"
    echo "" >> "$CurTimeFile"
  done # End all filters
  
  # Main execution
  # For all sizes...
  for CurSize in $PathSizes
  do
    # Before all models : add path size to output files
    for CurFilter in $FilterModes
    do
      CurGatherFile="$GatherNbrSolutions$CurFilter"
      CurTimeFile="$Time$CurFilter"
      echo -n "$CurSize" >> "$CurGatherFile"
      echo -n "$CurSize" >> "$CurTimeFile"
    done # End all models
    # For all models...
    for CurModel in $ModelFiles
    do
      # For all filters...
      for CurFilter in $FilterModes
      do
        # Main execution : compute + add results for each model in output files
        CurGatherFile="$GatherNbrSolutions$CurFilter"
        CurTimeFile="$Time$CurFilter"
        echo "*** n = ${CurSize} ; update=${CurSemantics} ; filter=${CurFilter} ; model=${CurModel} ***" | tee -a "$GlobalOutputFile"
        Command="clingo 0 --quiet=2 --time-limit=${TimeLimit} --const n=${CurSize} --const filtering=${CurFilter} --const write_nbr_solutions=${CurGatherFile} ${AdditionalParameters} ${CurSemantics}.lp attractors.lp filtering-attractors.lp ${ModelsFolder}${CurModel}"
        echo $Command | tee -a "$GlobalOutputFile"
        echo -n ", " >> "$CurGatherFile"
        eval $Command | tee -a "$GlobalOutputFile" | tee "$TempOutputFile"
        echo -n ", " >> "$CurTimeFile"
        grep "(Solving:" "$TempOutputFile" | cut -d":" -f2 | cut -d"s" -f1 | tr -d '\n' >> "$CurTimeFile"
      done # End all filters
    done # End all models
    # After all models : end lines in output files
    for CurFilter in $FilterModes
    do
      CurGatherFile="$GatherNbrSolutions$CurFilter"
      CurTimeFile="$Time$CurFilter"
      echo "" >> "$CurGatherFile"
      echo "" >> "$CurTimeFile"
    done # End all filters
  done # End all sizes

  # Rename and move output files
  mkdir "${MoveFolder}/${CurSemantics}"
  for CurFilter in $FilterModes
  do
    OldCurGatherFile="$GatherNbrSolutions$CurFilter"
    OldCurTimeFile="$Time$CurFilter"
    NewCurGatherFile="${GatherNbrSolutions}-${CurFilter}.csv"
    NewCurTimeFile="${Time}-${CurFilter}.csv"
    mv "$OldCurGatherFile" "${MoveFolder}/${CurSemantics}/${NewCurGatherFile}"
    mv "$OldCurTimeFile" "${MoveFolder}/${CurSemantics}/${NewCurTimeFile}"
  done # End all filters
done # End all semantics

echo "done."

mv "$GlobalOutputFile" "$MoveFolder/$GlobalOutputFile"
#rm "$TempOutputFile"

