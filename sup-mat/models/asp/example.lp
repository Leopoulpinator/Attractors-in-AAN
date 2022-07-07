
automaton_level("a", 0..1).
automaton_level("b", 0..2).
automaton_level("c", 0..1).
automaton_level("d", 0..2).

condition(t1, "a", 0). target(t1, "a", 1). condition(t1, "c", 1).
condition(t2, "a", 1). target(t2, "a", 0). condition(t2, "b", 2).

condition(t3, "b", 0). target(t3, "b", 1). condition(t3, "d", 0).
condition(t4, "b", 0). target(t4, "b", 2). condition(t4, "a", 1). condition(t4, "c", 1).
condition(t5, "b", 1). target(t5, "b", 2). condition(t5, "d", 1).
condition(t6, "b", 2). target(t6, "b", 0). condition(t6, "c", 0).

condition(t7, "c", 0). target(t7, "c", 1). condition(t7, "a", 1). condition(t7, "b", 0).
condition(t8, "c", 1). target(t8, "c", 0). condition(t8, "d", 2).

condition(t9, "d", 0). target(t9, "d", 1). condition(t9, "b", 2).
condition(t10, "d", 0). target(t10, "d", 2). condition(t10, "a", 0). condition(t10, "b", 1).
condition(t11, "d", 1). target(t11, "d", 0). condition(t11, "a", 1).
condition(t12, "d", 2). target(t12, "d", 0). condition(t12, "c", 0).

