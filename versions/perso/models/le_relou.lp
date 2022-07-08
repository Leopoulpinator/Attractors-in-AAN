automaton_level("a", 0..2).
automaton_level("b", 0..2).

condition(t1, "a", 0). target(t1, "a", 1). condition(t1, "b", 0).
condition(t2, "a", 1). target(t2, "a", 2). condition(t2, "b", 1).
condition(t3, "a", 2). target(t3, "a", 1). condition(t3, "b", 1).
condition(t4, "a", 0). target(t4, "a", 2). condition(t4, "b", 0).
condition(t5, "a", 2). target(t5, "a", 0). condition(t5, "b", 2).

condition(t6, "b", 0). target(t6, "b", 1). condition(t6, "a", 0).
condition(t7, "b", 1). target(t7, "b", 2). condition(t7, "a", 1).
condition(t8, "b", 2). target(t8, "b", 1). condition(t8, "a", 1).
condition(t9, "b", 0). target(t9, "b", 2). condition(t9, "a", 0).
condition(t10, "b", 2). target(t10, "b", 0). condition(t10, "a", 2).

