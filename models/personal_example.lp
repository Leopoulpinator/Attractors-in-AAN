
automaton_level("a", 0..2).
automaton_level("b", 0..1).
automaton_level("c", 0..2).

condition(t1, "a", 0). target(t1, "a", 1). condition(t1, "b", 0).
condition(t2, "a", 1). target(t2, "a", 2). condition(t2, "b", 0).
condition(t3, "a", 2). target(t3, "a", 1). condition(t3, "b", 1).
condition(t4, "a", 1). target(t4, "a", 0). condition(t4, "b", 1).

condition(t5, "b", 0). target(t5, "b", 1). condition(t5, "c", 0).
condition(t6, "b", 1). target(t6, "b", 0). condition(t6, "a", 2).

condition(t7, "c", 0). target(t7, "c", 1). condition(t7, "b", 1).
condition(t8, "c", 1). target(t8, "c", 0). condition(t8, "b", 0).
condition(t9, "c", 1). target(t9, "c", 2). condition(t9, "a", 1).
condition(t10, "c", 0). target(t10, "c", 2). condition(t10, "a", 2).
condition(t11, "c", 2). target(t11, "c", 0). condition(t11, "b", 1).

condition(t12, "a", 0). target(t12, "a", 1). condition(t12, "b", 1). condition(t12, "c", 1).

