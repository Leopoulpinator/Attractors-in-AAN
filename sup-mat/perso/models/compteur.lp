
automaton_level("a", 0..3). % état 2 et 3 sont des puits
automaton_level("b", 0..10). % état 10 est un puits
automaton_level("c", 0..10). % état 10 est un puits

condition(t1, "a", 0). target(t1, "a", 1).
condition(t2, "a", 1). target(t2, "a", 0). condition(t2, "b", 0).
condition(t3, "a", 1). target(t3, "a", 2). condition(t3, "b", 10).

condition(t4, "b", 0). target(t4, "b", 1). condition(t4, "a", 1).
condition(t5, "b", 1). target(t5, "b", 2). condition(t5, "a", 1).
condition(t6, "b", 2). target(t6, "b", 3). condition(t6, "a", 1).
condition(t7, "b", 3). target(t7, "b", 4). condition(t7, "a", 1).
condition(t8, "b", 4). target(t8, "b", 5). condition(t8, "a", 1).
condition(t9, "b", 5). target(t9, "b", 6). condition(t9, "a", 1).
condition(t10, "b", 6). target(t10, "b", 7). condition(t10, "a", 1).
condition(t11, "b", 7). target(t11, "b", 8). condition(t11, "a", 1).
condition(t12, "b", 8). target(t12, "b", 9). condition(t12, "a", 1).
condition(t13, "b", 9). target(t13, "b", 0). condition(t13, "a", 1).
condition(t14, "b", 9). target(t13, "b", 10). condition(t14, "a", 1). condition(t14, "c", 10).

condition(t15, "c", 0). target(t15, "c", 1). condition(t15, "a", 1). condition(t15, "b", 9).
condition(t16, "c", 1). target(t16, "c", 2). condition(t16, "a", 1). condition(t16, "b", 9).
condition(t17, "c", 2). target(t17, "c", 3). condition(t17, "a", 1). condition(t17, "b", 9).
condition(t18, "c", 3). target(t18, "c", 4). condition(t18, "a", 1). condition(t18, "b", 9).
condition(t19, "c", 4). target(t19, "c", 5). condition(t19, "a", 1). condition(t19, "b", 9).
condition(t20, "c", 5). target(t20, "c", 6). condition(t20, "a", 1). condition(t20, "b", 9).
condition(t21, "c", 6). target(t21, "c", 7). condition(t21, "a", 1). condition(t21, "b", 9).
condition(t22, "c", 7). target(t22, "c", 8). condition(t22, "a", 1). condition(t22, "b", 9).
condition(t23, "c", 8). target(t23, "c", 9). condition(t23, "a", 1). condition(t23, "b", 9).
condition(t24, "c", 9). target(t24, "c", 10). condition(t24, "b", 9). condition(t24, "a", 1).

condition(t25, "a", 2). target(t25, "a", 3).
condition(t26, "a", 3). target(t26, "a", 2).

