
automaton_level("CycD", 0..1).
automaton_level("CycE", 0..1).
automaton_level("Rb", 0..1).
automaton_level("E2F", 0..1).
automaton_level("CycA", 0..1).
automaton_level("p27", 0..1).
automaton_level("Cdc20", 0..1).
automaton_level("UbcH10", 0..1).
automaton_level("Cdh1", 0..1).
automaton_level("CycB", 0..1).

condition(t1, "CycE", 0). target(t1, "CycE", 1). condition(t1, "Rb", 0). condition(t1, "E2F", 1).
condition(t2, "CycE", 1). target(t2, "CycE", 0). condition(t2, "Rb", 1).
condition(t3, "CycE", 1). target(t3, "CycE", 0). condition(t3, "E2F", 0).

condition(t4, "Rb", 0). target(t4, "Rb", 1). condition(t4, "CycD", 0). condition(t4, "CycE", 0). condition(t4, "CycA", 0). condition(t4, "CycB", 0).
condition(t5, "Rb", 0). target(t5, "Rb", 1). condition(t5, "CycD", 0). condition(t5, "p27", 1). condition(t5, "CycB", 0).
condition(t6, "Rb", 1). target(t6, "Rb", 0). condition(t6, "CycA", 1). condition(t6, "p27", 0).
condition(t7, "Rb", 1). target(t7, "Rb", 0). condition(t7, "CycD", 1).
condition(t8, "Rb", 1). target(t8, "Rb", 0). condition(t8, "CycB", 1).

condition(t9, "E2F", 0). target(t9, "E2F", 1). condition(t9, "Rb", 0). condition(t9, "p27", 1). condition(t9, "CycB", 0).
condition(t10, "E2F", 0). target(t10, "E2F", 1). condition(t10, "Rb", 0). condition(t10, "CycA", 0). condition(t10, "CycB", 0).
condition(t11, "E2F", 1). target(t11, "E2F", 0). condition(t11, "CycA", 1). condition(t11, "p27", 0).
condition(t12, "E2F", 1). target(t12, "E2F", 0). condition(t12, "Rb", 1).
condition(t13, "E2F", 1). target(t13, "E2F", 0). condition(t13, "CycB", 1).


condition(t14, "CycA", 0). target(t14, "CycA", 1). condition(t14, "Rb", 0). condition(t14, "E2F", 1). condition(t14, "Cdc20", 0). condition(t14, "Cdh1", 0).
condition(t15, "CycA", 0). target(t15, "CycA", 1). condition(t15, "Rb", 0). condition(t15, "E2F", 1). condition(t15, "Cdc20", 0). condition(t15, "UbcH10", 0).
condition(t16, "CycA", 1). target(t16, "CycA", 0). condition(t16, "UbcH10", 1). condition(t16, "Cdh1", 1).
condition(t17, "CycA", 1). target(t17, "CycA", 0). condition(t17, "Rb", 1).
condition(t18, "CycA", 1). target(t18, "CycA", 0). condition(t18, "Cdc20", 1).


condition(t19, "p27", 0). target(t19, "p27", 1). condition(t19, "CycD", 0). condition(t19, "CycE", 0). condition(t19, "CycA", 0). condition(t19, "CycB", 0).
condition(t20, "p27", 1). target(t20, "p27", 0). condition(t20, "CycE", 1). condition(t20, "CycA", 1).
condition(t21, "p27", 1). target(t21, "p27", 0). condition(t21, "CycD", 1).
condition(t22, "p27", 1). target(t22, "p27", 0). condition(t22, "CycB", 1).

condition(t23, "Cdc20", 0). target(t23, "Cdc20", 1). condition(t23, "CycB", 1).
condition(t24, "Cdc20", 1). target(t24, "Cdc20", 0). condition(t24, "CycB", 0).


condition(t25, "UbcH10", 0). target(t25, "UbcH10", 1). condition(t25, "Cdh1", 0).
condition(t26, "UbcH10", 1). target(t26, "UbcH10", 0). condition(t26, "CycA", 0). condition(t26, "Cdc20", 0). condition(t26, "Cdh1", 1). condition(t26, "CycB", 0).

condition(t27, "Cdh1", 0). target(t27, "Cdh1", 1). condition(t27, "p27", 1). condition(t27, "CycB", 0).
condition(t28, "Cdh1", 0). target(t28, "Cdh1", 1). condition(t28, "CycA", 0). condition(t28, "CycB", 0).
condition(t29, "Cdh1", 0). target(t29, "Cdh1", 1). condition(t29, "Cdc20", 1).
condition(t30, "Cdh1", 1). target(t30, "Cdh1", 0). condition(t30, "Cdc20", 0). condition(t30, "CycB", 1).
condition(t31, "Cdh1", 1). target(t31, "Cdh1", 0). condition(t31, "CycA", 1). condition(t31, "p27", 0). condition(t31, "Cdc20", 0).

condition(t32, "CycB", 0). target(t32, "CycB", 1). condition(t32, "Cdc20", 0). condition(t32, "Cdh1", 0).
condition(t33, "CycB", 1). target(t33, "CycB", 0). condition(t33, "Cdc20", 1).
condition(t34, "CycB", 1). target(t34, "CycB", 0). condition(t34, "Cdh1", 1).




