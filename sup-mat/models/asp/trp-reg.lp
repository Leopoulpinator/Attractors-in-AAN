
automaton_level("Trp", 0..2).
automaton_level("TrpE", 0..1).
automaton_level("TrpR", 0..1).
automaton_level("Trpext", 0..2).

condition(t1, "Trp", 0). target(t1, "Trp", 1). condition(t1, "TrpE", 1).
condition(t2, "Trp", 0). target(t2, "Trp", 1). condition(t2, "Trpext", 1).
condition(t3, "Trp", 0). target(t3, "Trp", 1). condition(t3, "Trpext", 2).
condition(t4, "Trp", 1). target(t4, "Trp", 0). condition(t4, "TrpE", 0). condition(t4, "Trpext", 0).
condition(t5, "Trp", 1). target(t5, "Trp", 2). condition(t5, "Trpext", 2).
condition(t6, "Trp", 2). target(t6, "Trp", 1). condition(t6, "Trpext", 0).
condition(t7, "Trp", 2). target(t7, "Trp", 1). condition(t7, "Trpext", 1).
condition(t8, "TrpE", 0). target(t8, "TrpE", 1). condition(t8, "Trp", 0). condition(t8, "TrpR", 0).
condition(t9, "TrpE", 1). target(t9, "TrpE", 0). condition(t9, "Trp", 1).
condition(t10, "TrpE", 1). target(t10, "TrpE", 0). condition(t10, "Trp", 2).
condition(t11, "TrpE", 1). target(t11, "TrpE", 0). condition(t11, "TrpR", 1).
condition(t12, "TrpR", 0). target(t12, "TrpR", 1). condition(t12, "Trp", 2).
condition(t13, "TrpR", 1). target(t13, "TrpR", 0). condition(t13, "Trp", 0).
condition(t14, "TrpR", 1). target(t14, "TrpR", 0). condition(t14, "Trp", 1).

