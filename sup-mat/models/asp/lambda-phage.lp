
automaton_level("CI", 0..2).
automaton_level("Cro", 0..3).
automaton_level("CII", 0..1).
automaton_level("N", 0..1).

condition(t1, "CI", 0). target(t1, "CI", 1). condition(t1, "Cro", 0).
condition(t2, "CI", 1). target(t2, "CI", 2). condition(t2, "Cro", 0).
condition(t3, "CI", 1). target(t3, "CI", 0). condition(t3, "Cro", 1). condition(t3, "CII", 0).
condition(t4, "CI", 2). target(t4, "CI", 1). condition(t4, "Cro", 1). condition(t4, "CII", 0).
condition(t5, "CI", 0). target(t5, "CI", 1). condition(t5, "Cro", 1). condition(t5, "CII", 1).
condition(t6, "CI", 1). target(t6, "CI", 2). condition(t6, "Cro", 1). condition(t6, "CII", 1).
condition(t7, "CI", 1). target(t7, "CI", 0). condition(t7, "Cro", 2). condition(t7, "CII", 0).
condition(t8, "CI", 2). target(t8, "CI", 1). condition(t8, "Cro", 2). condition(t8, "CII", 0).
condition(t9, "CI", 0). target(t9, "CI", 1). condition(t9, "Cro", 2). condition(t9, "CII", 1).
condition(t10, "CI", 1). target(t10, "CI", 2). condition(t10, "Cro", 2). condition(t10, "CII", 1).
condition(t11, "CI", 1). target(t11, "CI", 0). condition(t11, "Cro", 3). condition(t11, "CII", 0).
condition(t12, "CI", 2). target(t12, "CI", 1). condition(t12, "Cro", 3). condition(t12, "CII", 0).
condition(t13, "CI", 0). target(t13, "CI", 1). condition(t13, "Cro", 3). condition(t13, "CII", 1).
condition(t14, "CI", 1). target(t14, "CI", 2). condition(t14, "Cro", 3). condition(t14, "CII", 1).

condition(t15, "Cro", 0). target(t15, "Cro", 1). condition(t15, "CI", 0).
condition(t16, "Cro", 1). target(t16, "Cro", 2). condition(t16, "CI", 0).
condition(t17, "Cro", 2). target(t17, "Cro", 3). condition(t17, "CI", 0).
condition(t18, "Cro", 3). target(t18, "Cro", 2). condition(t18, "CI", 0).
condition(t19, "Cro", 0). target(t19, "Cro", 1). condition(t19, "CI", 1).
condition(t20, "Cro", 1). target(t20, "Cro", 2). condition(t20, "CI", 1).
condition(t21, "Cro", 2). target(t21, "Cro", 3). condition(t21, "CI", 1).
condition(t22, "Cro", 3). target(t22, "Cro", 2). condition(t22, "CI", 1).
condition(t23, "Cro", 1). target(t23, "Cro", 0). condition(t23, "CI", 2).
condition(t24, "Cro", 2). target(t24, "Cro", 1). condition(t24, "CI", 2).
condition(t25, "Cro", 3). target(t25, "Cro", 2). condition(t25, "CI", 2).

condition(t26, "CII", 1). target(t26, "CII", 0). condition(t26, "CI", 0). condition(t26, "Cro", 0). condition(t26, "N", 0).
condition(t27, "CII", 0). target(t27, "CII", 1). condition(t27, "CI", 0). condition(t27, "Cro", 0). condition(t27, "N", 1).
condition(t28, "CII", 1). target(t28, "CII", 0). condition(t28, "CI", 0). condition(t28, "Cro", 1). condition(t28, "N", 0).
condition(t29, "CII", 0). target(t29, "CII", 1). condition(t29, "CI", 0). condition(t29, "Cro", 1). condition(t29, "N", 1).
condition(t30, "CII", 1). target(t30, "CII", 0). condition(t30, "CI", 0). condition(t30, "Cro", 2). condition(t30, "N", 0).
condition(t31, "CII", 0). target(t31, "CII", 1). condition(t31, "CI", 0). condition(t31, "Cro", 2). condition(t31, "N", 1).
condition(t32, "CII", 1). target(t32, "CII", 0). condition(t32, "CI", 0). condition(t32, "Cro", 3).
condition(t33, "CII", 1). target(t33, "CII", 0). condition(t33, "CI", 1). condition(t33, "Cro", 0). condition(t33, "N", 0).
condition(t34, "CII", 0). target(t34, "CII", 1). condition(t34, "CI", 1). condition(t34, "Cro", 0). condition(t34, "N", 1).
condition(t35, "CII", 1). target(t35, "CII", 0). condition(t35, "CI", 1). condition(t35, "Cro", 1). condition(t35, "N", 0).
condition(t36, "CII", 0). target(t36, "CII", 1). condition(t36, "CI", 1). condition(t36, "Cro", 1). condition(t36, "N", 1).
condition(t37, "CII", 1). target(t37, "CII", 0). condition(t37, "CI", 1). condition(t37, "Cro", 2). condition(t37, "N", 0).
condition(t38, "CII", 0). target(t38, "CII", 1). condition(t38, "CI", 1). condition(t38, "Cro", 2). condition(t38, "N", 1).
condition(t39, "CII", 1). target(t39, "CII", 0). condition(t39, "CI", 1). condition(t39, "Cro", 3).
condition(t40, "CII", 1). target(t40, "CII", 0). condition(t40, "CI", 2).

condition(t41, "N", 0). target(t41, "N", 1). condition(t41, "CI", 0). condition(t41, "Cro", 0).
condition(t42, "N", 0). target(t42, "N", 1). condition(t42, "CI", 0). condition(t42, "Cro", 1).
condition(t43, "N", 1). target(t43, "N", 0). condition(t43, "CI", 0). condition(t43, "Cro", 2).
condition(t44, "N", 1). target(t44, "N", 0). condition(t44, "CI", 0). condition(t44, "Cro", 3).
condition(t45, "N", 1). target(t45, "N", 0). condition(t45, "CI", 1).
condition(t46, "N", 1). target(t46, "N", 0). condition(t46, "CI", 2).

