
automaton_level("Start", 0..1).
automaton_level("SK", 0..1).
automaton_level("Cdc2_Cdc13", 0..2).
automaton_level("Ste9", 0..1).
automaton_level("Rum1", 0..1).
automaton_level("Slp1", 0..1).
automaton_level("Wee1_Mik1", 0..1).
automaton_level("Cdc25", 0..1).
automaton_level("PP", 0..1).

condition(t1, "Start", 1). target(t1, "Start", 0).

condition(t2, "SK", 1). target(t2, "SK", 0). condition(t2, "Start", 0).
condition(t3, "SK", 0). target(t3, "SK", 1). condition(t3, "Start", 1).

condition(t4, "Cdc2_Cdc13", 0). target(t4, "Cdc2_Cdc13", 1). condition(t4, "Ste9", 0). condition(t4, "Rum1", 0). condition(t4, "Slp1", 0). condition(t4, "Wee1_Mik1", 0). condition(t4, "Cdc25", 0).
condition(t5, "Cdc2_Cdc13", 2). target(t5, "Cdc2_Cdc13", 1). condition(t5, "Ste9", 0). condition(t5, "Rum1", 0). condition(t5, "Slp1", 0). condition(t5, "Wee1_Mik1", 0). condition(t5, "Cdc25", 0).
condition(t6, "Cdc2_Cdc13", 0). target(t6, "Cdc2_Cdc13", 1). condition(t6, "Ste9", 0). condition(t6, "Rum1", 0). condition(t6, "Slp1", 0). condition(t6, "Wee1_Mik1", 0). condition(t6, "Cdc25", 1).
condition(t7, "Cdc2_Cdc13", 1). target(t7, "Cdc2_Cdc13", 2). condition(t7, "Ste9", 0). condition(t7, "Rum1", 0). condition(t7, "Slp1", 0). condition(t7, "Wee1_Mik1", 0). condition(t7, "Cdc25", 1).
condition(t8, "Cdc2_Cdc13", 0). target(t8, "Cdc2_Cdc13", 1). condition(t8, "Ste9", 0). condition(t8, "Rum1", 0). condition(t8, "Slp1", 0). condition(t8, "Wee1_Mik1", 1).
condition(t9, "Cdc2_Cdc13", 2). target(t9, "Cdc2_Cdc13", 1). condition(t9, "Ste9", 0). condition(t9, "Rum1", 0). condition(t9, "Slp1", 0). condition(t9, "Wee1_Mik1", 1).
condition(t10, "Cdc2_Cdc13", 1). target(t10, "Cdc2_Cdc13", 0). condition(t10, "Ste9", 0). condition(t10, "Rum1", 0). condition(t10, "Slp1", 1).
condition(t11, "Cdc2_Cdc13", 2). target(t11, "Cdc2_Cdc13", 1). condition(t11, "Ste9", 0). condition(t11, "Rum1", 0). condition(t11, "Slp1", 1).
condition(t12, "Cdc2_Cdc13", 1). target(t12, "Cdc2_Cdc13", 0). condition(t12, "Ste9", 0). condition(t12, "Rum1", 1).
condition(t13, "Cdc2_Cdc13", 2). target(t13, "Cdc2_Cdc13", 1). condition(t13, "Ste9", 0). condition(t13, "Rum1", 1).
condition(t14, "Cdc2_Cdc13", 1). target(t14, "Cdc2_Cdc13", 0). condition(t14, "Ste9", 1).
condition(t15, "Cdc2_Cdc13", 2). target(t15, "Cdc2_Cdc13", 1). condition(t15, "Ste9", 1).

condition(t16, "Ste9", 0). target(t16, "Ste9", 1). condition(t16, "SK", 0). condition(t16, "Cdc2_Cdc13", 0).
condition(t17, "Ste9", 1). target(t17, "Ste9", 0). condition(t17, "SK", 0). condition(t17, "Cdc2_Cdc13", 1). condition(t17, "PP", 0).
condition(t18, "Ste9", 0). target(t18, "Ste9", 1). condition(t18, "SK", 0). condition(t18, "Cdc2_Cdc13", 1). condition(t18, "PP", 1).
condition(t19, "Ste9", 1). target(t19, "Ste9", 0). condition(t19, "SK", 0). condition(t19, "Cdc2_Cdc13", 2). condition(t19, "PP", 0).
condition(t20, "Ste9", 0). target(t20, "Ste9", 1). condition(t20, "SK", 0). condition(t20, "Cdc2_Cdc13", 2). condition(t20, "PP", 1).
condition(t21, "Ste9", 1). target(t21, "Ste9", 0). condition(t21, "SK", 1). condition(t21, "PP", 0).
condition(t22, "Ste9", 0). target(t22, "Ste9", 1). condition(t22, "SK", 1). condition(t22, "PP", 1).

condition(t23, "Rum1", 0). target(t23, "Rum1", 1). condition(t23, "SK", 0). condition(t23, "Cdc2_Cdc13", 0).
condition(t24, "Rum1", 1). target(t24, "Rum1", 0). condition(t24, "SK", 0). condition(t24, "Cdc2_Cdc13", 1). condition(t24, "PP", 0).
condition(t25, "Rum1", 0). target(t25, "Rum1", 1). condition(t25, "SK", 0). condition(t25, "Cdc2_Cdc13", 1). condition(t25, "PP", 1).
condition(t26, "Rum1", 1). target(t26, "Rum1", 0). condition(t26, "SK", 0). condition(t26, "Cdc2_Cdc13", 2). condition(t26, "PP", 0).
condition(t27, "Rum1", 0). target(t27, "Rum1", 1). condition(t27, "SK", 0). condition(t27, "Cdc2_Cdc13", 2). condition(t27, "PP", 1).
condition(t28, "Rum1", 1). target(t28, "Rum1", 0). condition(t28, "SK", 1). condition(t28, "PP", 0).
condition(t29, "Rum1", 0). target(t29, "Rum1", 1). condition(t29, "SK", 1). condition(t29, "PP", 1).

condition(t30, "Slp1", 1). target(t30, "Slp1", 0). condition(t30, "Cdc2_Cdc13", 0).
condition(t31, "Slp1", 1). target(t31, "Slp1", 0). condition(t31, "Cdc2_Cdc13", 1).
condition(t32, "Slp1", 0). target(t32, "Slp1", 1). condition(t32, "Cdc2_Cdc13", 2).

condition(t33, "Wee1_Mik1", 0). target(t33, "Wee1_Mik1", 1). condition(t33, "Cdc2_Cdc13", 0).
condition(t34, "Wee1_Mik1", 1). target(t34, "Wee1_Mik1", 0). condition(t34, "Cdc2_Cdc13", 1). condition(t34, "PP", 0).
condition(t35, "Wee1_Mik1", 0). target(t35, "Wee1_Mik1", 1). condition(t35, "Cdc2_Cdc13", 1). condition(t35, "PP", 1).
condition(t36, "Wee1_Mik1", 1). target(t36, "Wee1_Mik1", 0). condition(t36, "Cdc2_Cdc13", 2). condition(t36, "PP", 0).
condition(t37, "Wee1_Mik1", 0). target(t37, "Wee1_Mik1", 1). condition(t37, "Cdc2_Cdc13", 2). condition(t37, "PP", 1).

condition(t38, "Cdc25", 1). target(t38, "Cdc25", 0). condition(t38, "Cdc2_Cdc13", 0).
condition(t39, "Cdc25", 0). target(t39, "Cdc25", 1). condition(t39, "Cdc2_Cdc13", 1). condition(t39, "PP", 0).
condition(t40, "Cdc25", 1). target(t40, "Cdc25", 0). condition(t40, "Cdc2_Cdc13", 1). condition(t40, "PP", 1).
condition(t41, "Cdc25", 0). target(t41, "Cdc25", 1). condition(t41, "Cdc2_Cdc13", 2).

condition(t42, "PP", 1). target(t42, "PP", 0). condition(t42, "Slp1", 0).
condition(t43, "PP", 0). target(t43, "PP", 1). condition(t43, "Slp1", 1).

