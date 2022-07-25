automaton_level("a", 0..1).
automaton_level("b", 0..1).

condition(t1, "a", 0). target(t1, "a", 1). condition(t1, "b", 0).
condition(t2, "a", 1). target(t2, "a", 0). condition(t2, "b", 0).

condition(t3, "b", 0). target(t3, "b", 1). condition(t3, "a", 0).
condition(t4, "b", 1). target(t4, "b", 0). condition(t4, "a", 0).
%condition(t5, "a", 1). target(t5, "a", 0).
