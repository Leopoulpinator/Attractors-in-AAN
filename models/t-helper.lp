
automaton_level("APC", 0..1).
automaton_level("BCL6", 0..1).
automaton_level("CD28", 0..1).
automaton_level("CGC", 0..1).
automaton_level("FOXP3", 0..1).
automaton_level("GATA3", 0..1).
automaton_level("GP130", 0..1).
automaton_level("IFNAR", 0..1).
automaton_level("IFNAR1", 0..1).
automaton_level("IFNAR2", 0..1).
automaton_level("IFNA_e", 0..1).
automaton_level("IFNB_e", 0..1).
automaton_level("IFNG", 0..1).
automaton_level("IFNGR", 0..1).
automaton_level("IFNGR1", 0..1).
automaton_level("IFNGR2", 0..1).
automaton_level("IFNG_e", 0..1).
automaton_level("IKB", 0..1).
automaton_level("IL10", 0..1).
automaton_level("IL10R", 0..1).
automaton_level("IL10RA", 0..1).
automaton_level("IL10RB", 0..1).
automaton_level("IL10_e", 0..1).
automaton_level("IL12R", 0..1).
automaton_level("IL12RB1", 0..1).
automaton_level("IL12RB2", 0..1).
automaton_level("IL12_e", 0..1).
automaton_level("IL13", 0..1).
automaton_level("IL15R", 0..1).
automaton_level("IL15RA", 0..1).
automaton_level("IL15_e", 0..1).
automaton_level("IL17", 0..1).
automaton_level("IL17RB", 0..1).
automaton_level("IL18R", 0..1).
automaton_level("IL18RA", 0..1).
automaton_level("IL18RAP", 0..1).
automaton_level("IL18_e", 0..1).
automaton_level("IL1A_e", 0..1).
automaton_level("IL1B_e", 0..1).
automaton_level("IL1R", 0..1).
automaton_level("IL1R1", 0..1).
automaton_level("IL1RAP", 0..1).
automaton_level("IL1RL2", 0..1).
automaton_level("IL2", 0..1).
automaton_level("IL21", 0..1).
automaton_level("IL21R", 0..1).
automaton_level("IL21_e", 0..1).
automaton_level("IL22", 0..1).
automaton_level("IL23R", 0..1).
automaton_level("IL23_e", 0..1).
automaton_level("IL24", 0..1).
automaton_level("IL25", 0..1).
automaton_level("IL25R", 0..1).
automaton_level("IL25_e", 0..1).
automaton_level("IL27R", 0..1).
automaton_level("IL27RA", 0..1).
automaton_level("IL27_e", 0..1).
automaton_level("IL28RA", 0..1).
automaton_level("IL29R", 0..1).
automaton_level("IL29_e", 0..1).
automaton_level("IL2R", 0..2).
automaton_level("IL2RA", 0..1).
automaton_level("IL2RB", 0..1).
automaton_level("IL2_e", 0..1).
automaton_level("IL3", 0..1).
automaton_level("IL31", 0..1).
automaton_level("IL33R", 0..1).
automaton_level("IL33_e", 0..1).
automaton_level("IL35", 0..1).
automaton_level("IL36R", 0..1).
automaton_level("IL36_e", 0..1).
automaton_level("IL4", 0..1).
automaton_level("IL4R", 0..1).
automaton_level("IL4RA", 0..1).
automaton_level("IL4_e", 0..1).
automaton_level("IL5", 0..1).
automaton_level("IL6", 0..1).
automaton_level("IL6R", 0..1).
automaton_level("IL6RA", 0..1).
automaton_level("IL6_e", 0..1).
automaton_level("IL9", 0..1).
automaton_level("IRF1", 0..1).
automaton_level("NFAT", 0..1).
automaton_level("NFKB", 0..1).
automaton_level("PU1", 0..1).
automaton_level("RORGT", 0..1).
automaton_level("RUNX3", 0..1).
automaton_level("SMAD3", 0..1).
automaton_level("ST2", 0..1).
automaton_level("STAT1", 0..1).
automaton_level("STAT3", 0..1).
automaton_level("STAT4", 0..1).
automaton_level("STAT5", 0..2).
automaton_level("STAT6", 0..1).
automaton_level("TBET", 0..1).
automaton_level("TCR", 0..1).
automaton_level("TGFB", 0..1).
automaton_level("TGFBR", 0..1).
automaton_level("TGFB_e", 0..1).
automaton_level("cMAF", 0..1).
automaton_level("proliferation", 0..1).

condition(t1, "BCL6", 0). target(t1, "BCL6", 1). condition(t1, "STAT1", 0). condition(t1, "STAT3", 0). condition(t1, "STAT4", 1). condition(t1, "STAT5", 0). condition(t1, "TBET", 0).
condition(t2, "BCL6", 0). target(t2, "BCL6", 1). condition(t2, "STAT1", 1). condition(t2, "STAT3", 0). condition(t2, "STAT5", 0). condition(t2, "TBET", 0).
condition(t3, "BCL6", 0). target(t3, "BCL6", 1). condition(t3, "STAT3", 1). condition(t3, "STAT4", 0). condition(t3, "STAT5", 0). condition(t3, "TBET", 0).
condition(t4, "BCL6", 0). target(t4, "BCL6", 1). condition(t4, "STAT3", 1). condition(t4, "STAT4", 1). condition(t4, "TBET", 0).
condition(t5, "BCL6", 1). target(t5, "BCL6", 0). condition(t5, "STAT1", 0). condition(t5, "STAT3", 0). condition(t5, "STAT4", 0).
condition(t6, "BCL6", 1). target(t6, "BCL6", 0). condition(t6, "STAT3", 0). condition(t6, "STAT5", 1).
condition(t7, "BCL6", 1). target(t7, "BCL6", 0). condition(t7, "STAT3", 0). condition(t7, "STAT5", 2).
condition(t8, "BCL6", 1). target(t8, "BCL6", 0). condition(t8, "STAT3", 1). condition(t8, "STAT4", 0). condition(t8, "STAT5", 1).
condition(t9, "BCL6", 1). target(t9, "BCL6", 0). condition(t9, "STAT3", 1). condition(t9, "STAT4", 0). condition(t9, "STAT5", 2).
condition(t10, "BCL6", 1). target(t10, "BCL6", 0). condition(t10, "TBET", 1).
condition(t11, "CD28", 0). target(t11, "CD28", 1). condition(t11, "APC", 1).
condition(t12, "CD28", 1). target(t12, "CD28", 0). condition(t12, "APC", 0).
condition(t13, "CGC", 0). target(t13, "CGC", 1).
condition(t14, "FOXP3", 0). target(t14, "FOXP3", 1). condition(t14, "NFAT", 1). condition(t14, "RORGT", 0). condition(t14, "SMAD3", 1). condition(t14, "STAT1", 0). condition(t14, "STAT3", 1). condition(t14, "STAT5", 1). condition(t14, "STAT6", 0).
condition(t15, "FOXP3", 0). target(t15, "FOXP3", 1). condition(t15, "NFAT", 1). condition(t15, "RORGT", 0). condition(t15, "SMAD3", 1). condition(t15, "STAT1", 0). condition(t15, "STAT3", 1). condition(t15, "STAT5", 2). condition(t15, "STAT6", 0).
condition(t16, "FOXP3", 0). target(t16, "FOXP3", 1). condition(t16, "NFAT", 1). condition(t16, "SMAD3", 1). condition(t16, "STAT1", 0). condition(t16, "STAT3", 0). condition(t16, "STAT5", 1). condition(t16, "STAT6", 0).
condition(t17, "FOXP3", 0). target(t17, "FOXP3", 1). condition(t17, "NFAT", 1). condition(t17, "SMAD3", 1). condition(t17, "STAT1", 0). condition(t17, "STAT3", 0). condition(t17, "STAT5", 2). condition(t17, "STAT6", 0).
condition(t18, "FOXP3", 1). target(t18, "FOXP3", 0). condition(t18, "NFAT", 0).
condition(t19, "FOXP3", 1). target(t19, "FOXP3", 0). condition(t19, "STAT5", 0).
condition(t20, "FOXP3", 1). target(t20, "FOXP3", 0). condition(t20, "STAT6", 1).
condition(t21, "GATA3", 0). target(t21, "GATA3", 1). condition(t21, "BCL6", 0). condition(t21, "IL25R", 0). condition(t21, "IL29R", 0). condition(t21, "PU1", 0). condition(t21, "STAT6", 1). condition(t21, "TBET", 0).
condition(t22, "GATA3", 0). target(t22, "GATA3", 1). condition(t22, "BCL6", 0). condition(t22, "IL25R", 1). condition(t22, "IL29R", 0). condition(t22, "PU1", 0). condition(t22, "TBET", 0).
condition(t23, "GATA3", 1). target(t23, "GATA3", 0). condition(t23, "BCL6", 1).
condition(t24, "GATA3", 1). target(t24, "GATA3", 0). condition(t24, "IL29R", 1).
condition(t25, "GATA3", 1). target(t25, "GATA3", 0). condition(t25, "PU1", 1).
condition(t26, "GP130", 0). target(t26, "GP130", 1).
condition(t27, "IFNAR", 0). target(t27, "IFNAR", 1). condition(t27, "IFNAR1", 1). condition(t27, "IFNAR2", 1). condition(t27, "IFNA_e", 1).
condition(t28, "IFNAR", 0). target(t28, "IFNAR", 1). condition(t28, "IFNAR1", 1). condition(t28, "IFNAR2", 1). condition(t28, "IFNB_e", 1).
condition(t29, "IFNAR", 1). target(t29, "IFNAR", 0). condition(t29, "IFNAR1", 0).
condition(t30, "IFNAR", 1). target(t30, "IFNAR", 0). condition(t30, "IFNAR2", 0).
condition(t31, "IFNAR", 1). target(t31, "IFNAR", 0). condition(t31, "IFNA_e", 0). condition(t31, "IFNB_e", 0).
condition(t32, "IFNAR1", 0). target(t32, "IFNAR1", 1).
condition(t33, "IFNAR2", 0). target(t33, "IFNAR2", 1).
condition(t34, "IFNG", 0). target(t34, "IFNG", 1). condition(t34, "FOXP3", 0). condition(t34, "IL18R", 1). condition(t34, "NFAT", 1). condition(t34, "STAT4", 0). condition(t34, "proliferation", 1).
condition(t35, "IFNG", 0). target(t35, "IFNG", 1). condition(t35, "FOXP3", 0). condition(t35, "NFAT", 1). condition(t35, "RUNX3", 1). condition(t35, "STAT4", 0). condition(t35, "TBET", 1). condition(t35, "proliferation", 1).
condition(t36, "IFNG", 0). target(t36, "IFNG", 1). condition(t36, "FOXP3", 0). condition(t36, "NFAT", 1). condition(t36, "STAT4", 1). condition(t36, "proliferation", 1).
condition(t37, "IFNG", 1). target(t37, "IFNG", 0). condition(t37, "FOXP3", 1).
condition(t38, "IFNG", 1). target(t38, "IFNG", 0). condition(t38, "IL18R", 0). condition(t38, "RUNX3", 0). condition(t38, "STAT4", 0).
condition(t39, "IFNG", 1). target(t39, "IFNG", 0). condition(t39, "IL18R", 0). condition(t39, "RUNX3", 1). condition(t39, "STAT4", 0). condition(t39, "TBET", 0).
condition(t40, "IFNG", 1). target(t40, "IFNG", 0). condition(t40, "NFAT", 0).
condition(t41, "IFNG", 1). target(t41, "IFNG", 0). condition(t41, "proliferation", 0).
condition(t42, "IFNGR", 0). target(t42, "IFNGR", 1). condition(t42, "IFNG", 0). condition(t42, "IFNGR1", 1). condition(t42, "IFNGR2", 1). condition(t42, "IFNG_e", 1).
condition(t43, "IFNGR", 0). target(t43, "IFNGR", 1). condition(t43, "IFNG", 1). condition(t43, "IFNGR1", 1). condition(t43, "IFNGR2", 1).
condition(t44, "IFNGR", 1). target(t44, "IFNGR", 0). condition(t44, "IFNG", 0). condition(t44, "IFNG_e", 0).
condition(t45, "IFNGR", 1). target(t45, "IFNGR", 0). condition(t45, "IFNGR1", 0).
condition(t46, "IFNGR", 1). target(t46, "IFNGR", 0). condition(t46, "IFNGR2", 0).
condition(t47, "IFNGR1", 0). target(t47, "IFNGR1", 1).
condition(t48, "IFNGR2", 0). target(t48, "IFNGR2", 1).
condition(t49, "IKB", 0). target(t49, "IKB", 1). condition(t49, "TCR", 0).
condition(t50, "IKB", 1). target(t50, "IKB", 0). condition(t50, "TCR", 1).
condition(t51, "IL10", 0). target(t51, "IL10", 1). condition(t51, "GATA3", 0). condition(t51, "IL18R", 0). condition(t51, "IL33R", 0). condition(t51, "IRF1", 0). condition(t51, "NFAT", 1). condition(t51, "STAT3", 0). condition(t51, "STAT4", 1). condition(t51, "cMAF", 0). condition(t51, "proliferation", 1).
condition(t52, "IL10", 0). target(t52, "IL10", 1). condition(t52, "GATA3", 1). condition(t52, "IL18R", 0). condition(t52, "IL33R", 0). condition(t52, "IRF1", 0). condition(t52, "NFAT", 1). condition(t52, "STAT3", 0). condition(t52, "cMAF", 0). condition(t52, "proliferation", 1).
condition(t53, "IL10", 0). target(t53, "IL10", 1). condition(t53, "IL18R", 0). condition(t53, "IL33R", 0). condition(t53, "IRF1", 1). condition(t53, "NFAT", 1). condition(t53, "STAT3", 0). condition(t53, "cMAF", 0). condition(t53, "proliferation", 1).
condition(t54, "IL10", 0). target(t54, "IL10", 1). condition(t54, "IL18R", 0). condition(t54, "IL33R", 0). condition(t54, "NFAT", 1). condition(t54, "STAT3", 1). condition(t54, "cMAF", 0). condition(t54, "proliferation", 1).
condition(t55, "IL10", 0). target(t55, "IL10", 1). condition(t55, "IL18R", 0). condition(t55, "IL33R", 0). condition(t55, "NFAT", 1). condition(t55, "cMAF", 1). condition(t55, "proliferation", 1).
condition(t56, "IL10", 1). target(t56, "IL10", 0). condition(t56, "GATA3", 0). condition(t56, "IRF1", 0). condition(t56, "STAT3", 0). condition(t56, "STAT4", 0). condition(t56, "cMAF", 0).
condition(t57, "IL10", 1). target(t57, "IL10", 0). condition(t57, "IL18R", 1).
condition(t58, "IL10", 1). target(t58, "IL10", 0). condition(t58, "IL33R", 1).
condition(t59, "IL10", 1). target(t59, "IL10", 0). condition(t59, "NFAT", 0).
condition(t60, "IL10", 1). target(t60, "IL10", 0). condition(t60, "proliferation", 0).
condition(t61, "IL10R", 0). target(t61, "IL10R", 1). condition(t61, "IL10", 0). condition(t61, "IL10RA", 1). condition(t61, "IL10RB", 1). condition(t61, "IL10_e", 1).
condition(t62, "IL10R", 0). target(t62, "IL10R", 1). condition(t62, "IL10", 1). condition(t62, "IL10RA", 1). condition(t62, "IL10RB", 1).
condition(t63, "IL10R", 1). target(t63, "IL10R", 0). condition(t63, "IL10", 0). condition(t63, "IL10_e", 0).
condition(t64, "IL10R", 1). target(t64, "IL10R", 0). condition(t64, "IL10RA", 0).
condition(t65, "IL10R", 1). target(t65, "IL10R", 0). condition(t65, "IL10RB", 0).
condition(t66, "IL10RA", 0). target(t66, "IL10RA", 1).
condition(t67, "IL10RB", 0). target(t67, "IL10RB", 1).
condition(t68, "IL12R", 0). target(t68, "IL12R", 1). condition(t68, "IL12RB1", 1). condition(t68, "IL12RB2", 1). condition(t68, "IL12_e", 1).
condition(t69, "IL12R", 1). target(t69, "IL12R", 0). condition(t69, "IL12RB1", 0).
condition(t70, "IL12R", 1). target(t70, "IL12R", 0). condition(t70, "IL12RB2", 0).
condition(t71, "IL12R", 1). target(t71, "IL12R", 0). condition(t71, "IL12_e", 0).
condition(t72, "IL12RB1", 0). target(t72, "IL12RB1", 1).
condition(t73, "IL12RB2", 0). target(t73, "IL12RB2", 1). condition(t73, "STAT6", 0).
condition(t74, "IL12RB2", 1). target(t74, "IL12RB2", 0). condition(t74, "STAT6", 1).
condition(t75, "IL13", 0). target(t75, "IL13", 1). condition(t75, "FOXP3", 0). condition(t75, "GATA3", 0). condition(t75, "IL33R", 0). condition(t75, "NFAT", 1). condition(t75, "cMAF", 1). condition(t75, "proliferation", 1).
condition(t76, "IL13", 0). target(t76, "IL13", 1). condition(t76, "FOXP3", 0). condition(t76, "GATA3", 0). condition(t76, "IL33R", 1). condition(t76, "NFAT", 1). condition(t76, "proliferation", 1).
condition(t77, "IL13", 0). target(t77, "IL13", 1). condition(t77, "FOXP3", 0). condition(t77, "GATA3", 1). condition(t77, "NFAT", 1). condition(t77, "proliferation", 1).
condition(t78, "IL13", 1). target(t78, "IL13", 0). condition(t78, "FOXP3", 1).
condition(t79, "IL13", 1). target(t79, "IL13", 0). condition(t79, "GATA3", 0). condition(t79, "IL33R", 0). condition(t79, "cMAF", 0).
condition(t80, "IL13", 1). target(t80, "IL13", 0). condition(t80, "NFAT", 0).
condition(t81, "IL13", 1). target(t81, "IL13", 0). condition(t81, "proliferation", 0).
condition(t82, "IL15R", 0). target(t82, "IL15R", 1). condition(t82, "CGC", 1). condition(t82, "IL15RA", 1). condition(t82, "IL15_e", 1). condition(t82, "IL2RB", 1).
condition(t83, "IL15R", 1). target(t83, "IL15R", 0). condition(t83, "CGC", 0).
condition(t84, "IL15R", 1). target(t84, "IL15R", 0). condition(t84, "IL15RA", 0).
condition(t85, "IL15R", 1). target(t85, "IL15R", 0). condition(t85, "IL15_e", 0).
condition(t86, "IL15R", 1). target(t86, "IL15R", 0). condition(t86, "IL2RB", 0).
condition(t87, "IL15RA", 0). target(t87, "IL15RA", 1).
condition(t88, "IL17", 0). target(t88, "IL17", 1). condition(t88, "FOXP3", 0). condition(t88, "NFAT", 1). condition(t88, "NFKB", 1). condition(t88, "RORGT", 1). condition(t88, "STAT1", 1). condition(t88, "STAT3", 1). condition(t88, "STAT6", 1). condition(t88, "proliferation", 1).
condition(t89, "IL17", 0). target(t89, "IL17", 1). condition(t89, "FOXP3", 1). condition(t89, "NFAT", 1). condition(t89, "NFKB", 1). condition(t89, "RORGT", 1). condition(t89, "STAT1", 1). condition(t89, "STAT3", 1). condition(t89, "STAT5", 0). condition(t89, "STAT6", 1). condition(t89, "proliferation", 1).
condition(t90, "IL17", 0). target(t90, "IL17", 1). condition(t90, "NFAT", 1). condition(t90, "NFKB", 1). condition(t90, "RORGT", 1). condition(t90, "STAT1", 0). condition(t90, "STAT3", 1). condition(t90, "STAT6", 1). condition(t90, "proliferation", 1).
condition(t91, "IL17", 0). target(t91, "IL17", 1). condition(t91, "NFAT", 1). condition(t91, "NFKB", 1). condition(t91, "RORGT", 1). condition(t91, "STAT3", 1). condition(t91, "STAT6", 0). condition(t91, "proliferation", 1).
condition(t92, "IL17", 1). target(t92, "IL17", 0). condition(t92, "FOXP3", 1). condition(t92, "STAT1", 1). condition(t92, "STAT5", 1). condition(t92, "STAT6", 1).
condition(t93, "IL17", 1). target(t93, "IL17", 0). condition(t93, "FOXP3", 1). condition(t93, "STAT1", 1). condition(t93, "STAT5", 2). condition(t93, "STAT6", 1).
condition(t94, "IL17", 1). target(t94, "IL17", 0). condition(t94, "NFAT", 0).
condition(t95, "IL17", 1). target(t95, "IL17", 0). condition(t95, "NFKB", 0).
condition(t96, "IL17", 1). target(t96, "IL17", 0). condition(t96, "RORGT", 0).
condition(t97, "IL17", 1). target(t97, "IL17", 0). condition(t97, "STAT3", 0).
condition(t98, "IL17", 1). target(t98, "IL17", 0). condition(t98, "proliferation", 0).
condition(t99, "IL17RB", 0). target(t99, "IL17RB", 1).
condition(t100, "IL18R", 0). target(t100, "IL18R", 1). condition(t100, "IL18RA", 1). condition(t100, "IL18RAP", 1). condition(t100, "IL18_e", 1). condition(t100, "STAT4", 1).
condition(t101, "IL18R", 1). target(t101, "IL18R", 0). condition(t101, "IL18RA", 0).
condition(t102, "IL18R", 1). target(t102, "IL18R", 0). condition(t102, "IL18RAP", 0).
condition(t103, "IL18R", 1). target(t103, "IL18R", 0). condition(t103, "IL18_e", 0).
condition(t104, "IL18R", 1). target(t104, "IL18R", 0). condition(t104, "STAT4", 0).
condition(t105, "IL18RA", 0). target(t105, "IL18RA", 1).
condition(t106, "IL18RAP", 0). target(t106, "IL18RAP", 1).
condition(t107, "IL1R", 0). target(t107, "IL1R", 1). condition(t107, "IL1A_e", 0). condition(t107, "IL1B_e", 1). condition(t107, "IL1R1", 1). condition(t107, "IL1RAP", 1).
condition(t108, "IL1R", 0). target(t108, "IL1R", 1). condition(t108, "IL1A_e", 1). condition(t108, "IL1R1", 1). condition(t108, "IL1RAP", 1).
condition(t109, "IL1R", 1). target(t109, "IL1R", 0). condition(t109, "IL1A_e", 0). condition(t109, "IL1B_e", 0).
condition(t110, "IL1R", 1). target(t110, "IL1R", 0). condition(t110, "IL1R1", 0).
condition(t111, "IL1R", 1). target(t111, "IL1R", 0). condition(t111, "IL1RAP", 0).
condition(t112, "IL1R1", 0). target(t112, "IL1R1", 1). condition(t112, "STAT3", 1).
condition(t113, "IL1R1", 1). target(t113, "IL1R1", 0). condition(t113, "STAT3", 0).
condition(t114, "IL1RAP", 0). target(t114, "IL1RAP", 1).
condition(t115, "IL1RL2", 0). target(t115, "IL1RL2", 1).
condition(t116, "IL2", 0). target(t116, "IL2", 1). condition(t116, "FOXP3", 0). condition(t116, "NFAT", 0). condition(t116, "NFKB", 1). condition(t116, "STAT5", 0). condition(t116, "TBET", 0).
condition(t117, "IL2", 0). target(t117, "IL2", 1). condition(t117, "FOXP3", 0). condition(t117, "NFAT", 0). condition(t117, "NFKB", 1). condition(t117, "STAT5", 1). condition(t117, "STAT6", 0). condition(t117, "TBET", 0).
condition(t118, "IL2", 0). target(t118, "IL2", 1). condition(t118, "FOXP3", 0). condition(t118, "NFAT", 0). condition(t118, "NFKB", 1). condition(t118, "STAT5", 2). condition(t118, "STAT6", 0). condition(t118, "TBET", 0).
condition(t119, "IL2", 0). target(t119, "IL2", 1). condition(t119, "FOXP3", 0). condition(t119, "NFAT", 1). condition(t119, "STAT5", 0).
condition(t120, "IL2", 0). target(t120, "IL2", 1). condition(t120, "FOXP3", 0). condition(t120, "NFAT", 1). condition(t120, "STAT5", 1). condition(t120, "STAT6", 0).
condition(t121, "IL2", 0). target(t121, "IL2", 1). condition(t121, "FOXP3", 0). condition(t121, "NFAT", 1). condition(t121, "STAT5", 2). condition(t121, "STAT6", 0).
condition(t122, "IL2", 1). target(t122, "IL2", 0). condition(t122, "FOXP3", 1).
condition(t123, "IL2", 1). target(t123, "IL2", 0). condition(t123, "NFAT", 0). condition(t123, "NFKB", 0).
condition(t124, "IL2", 1). target(t124, "IL2", 0). condition(t124, "NFAT", 0). condition(t124, "TBET", 1).
condition(t125, "IL2", 1). target(t125, "IL2", 0). condition(t125, "STAT5", 1). condition(t125, "STAT6", 1).
condition(t126, "IL2", 1). target(t126, "IL2", 0). condition(t126, "STAT5", 2). condition(t126, "STAT6", 1).
condition(t127, "IL21", 0). target(t127, "IL21", 1). condition(t127, "NFAT", 1). condition(t127, "STAT3", 0). condition(t127, "STAT4", 0). condition(t127, "cMAF", 1). condition(t127, "proliferation", 1).
condition(t128, "IL21", 0). target(t128, "IL21", 1). condition(t128, "NFAT", 1). condition(t128, "STAT3", 0). condition(t128, "STAT4", 1). condition(t128, "proliferation", 1).
condition(t129, "IL21", 0). target(t129, "IL21", 1). condition(t129, "NFAT", 1). condition(t129, "STAT3", 1). condition(t129, "proliferation", 1).
condition(t130, "IL21", 1). target(t130, "IL21", 0). condition(t130, "NFAT", 0).
condition(t131, "IL21", 1). target(t131, "IL21", 0). condition(t131, "STAT3", 0). condition(t131, "STAT4", 0). condition(t131, "cMAF", 0).
condition(t132, "IL21", 1). target(t132, "IL21", 0). condition(t132, "proliferation", 0).
condition(t133, "IL21R", 0). target(t133, "IL21R", 1). condition(t133, "CGC", 1). condition(t133, "GP130", 1). condition(t133, "IL21", 1).
condition(t134, "IL21R", 0). target(t134, "IL21R", 1). condition(t134, "CGC", 1). condition(t134, "GP130", 1). condition(t134, "IL21_e", 1).
condition(t135, "IL21R", 1). target(t135, "IL21R", 0). condition(t135, "CGC", 0).
condition(t136, "IL21R", 1). target(t136, "IL21R", 0). condition(t136, "GP130", 0).
condition(t137, "IL21R", 1). target(t137, "IL21R", 0). condition(t137, "IL21", 0). condition(t137, "IL21_e", 0).
condition(t138, "IL22", 0). target(t138, "IL22", 1). condition(t138, "NFAT", 1). condition(t138, "STAT1", 0). condition(t138, "STAT3", 1). condition(t138, "cMAF", 0). condition(t138, "proliferation", 1).
condition(t139, "IL22", 0). target(t139, "IL22", 1). condition(t139, "NFAT", 1). condition(t139, "STAT1", 1). condition(t139, "cMAF", 0). condition(t139, "proliferation", 1).
condition(t140, "IL22", 1). target(t140, "IL22", 0). condition(t140, "NFAT", 0).
condition(t141, "IL22", 1). target(t141, "IL22", 0). condition(t141, "STAT1", 0). condition(t141, "STAT3", 0).
condition(t142, "IL22", 1). target(t142, "IL22", 0). condition(t142, "cMAF", 1).
condition(t143, "IL22", 1). target(t143, "IL22", 0). condition(t143, "proliferation", 0).
condition(t144, "IL23R", 0). target(t144, "IL23R", 1). condition(t144, "GP130", 1). condition(t144, "IL12RB1", 1). condition(t144, "IL23_e", 1). condition(t144, "RORGT", 1). condition(t144, "STAT3", 1).
condition(t145, "IL23R", 1). target(t145, "IL23R", 0). condition(t145, "GP130", 0).
condition(t146, "IL23R", 1). target(t146, "IL23R", 0). condition(t146, "IL12RB1", 0).
condition(t147, "IL23R", 1). target(t147, "IL23R", 0). condition(t147, "IL23_e", 0).
condition(t148, "IL23R", 1). target(t148, "IL23R", 0). condition(t148, "RORGT", 0).
condition(t149, "IL23R", 1). target(t149, "IL23R", 0). condition(t149, "STAT3", 0).
condition(t150, "IL24", 0). target(t150, "IL24", 1). condition(t150, "NFAT", 1). condition(t150, "STAT6", 1). condition(t150, "proliferation", 1).
condition(t151, "IL24", 1). target(t151, "IL24", 0). condition(t151, "NFAT", 0).
condition(t152, "IL24", 1). target(t152, "IL24", 0). condition(t152, "STAT6", 0).
condition(t153, "IL24", 1). target(t153, "IL24", 0). condition(t153, "proliferation", 0).
condition(t154, "IL25", 0). target(t154, "IL25", 1). condition(t154, "GATA3", 1). condition(t154, "NFAT", 1). condition(t154, "proliferation", 1).
condition(t155, "IL25", 1). target(t155, "IL25", 0). condition(t155, "GATA3", 0).
condition(t156, "IL25", 1). target(t156, "IL25", 0). condition(t156, "NFAT", 0).
condition(t157, "IL25", 1). target(t157, "IL25", 0). condition(t157, "proliferation", 0).
condition(t158, "IL25R", 0). target(t158, "IL25R", 1). condition(t158, "IL17RB", 1). condition(t158, "IL25", 1).
condition(t159, "IL25R", 0). target(t159, "IL25R", 1). condition(t159, "IL17RB", 1). condition(t159, "IL25_e", 1).
condition(t160, "IL25R", 1). target(t160, "IL25R", 0). condition(t160, "IL17RB", 0).
condition(t161, "IL25R", 1). target(t161, "IL25R", 0). condition(t161, "IL25", 0). condition(t161, "IL25_e", 0).
condition(t162, "IL27R", 0). target(t162, "IL27R", 1). condition(t162, "GP130", 1). condition(t162, "IL27RA", 1). condition(t162, "IL27_e", 1).
condition(t163, "IL27R", 1). target(t163, "IL27R", 0). condition(t163, "GP130", 0).
condition(t164, "IL27R", 1). target(t164, "IL27R", 0). condition(t164, "IL27RA", 0).
condition(t165, "IL27R", 1). target(t165, "IL27R", 0). condition(t165, "IL27_e", 0).
condition(t166, "IL27RA", 0). target(t166, "IL27RA", 1).
condition(t167, "IL28RA", 0). target(t167, "IL28RA", 1).
condition(t168, "IL29R", 0). target(t168, "IL29R", 1). condition(t168, "IL10RB", 1). condition(t168, "IL28RA", 1). condition(t168, "IL29_e", 1).
condition(t169, "IL29R", 1). target(t169, "IL29R", 0). condition(t169, "IL10RB", 0).
condition(t170, "IL29R", 1). target(t170, "IL29R", 0). condition(t170, "IL28RA", 0).
condition(t171, "IL29R", 1). target(t171, "IL29R", 0). condition(t171, "IL29_e", 0).
condition(t172, "IL2R", 0). target(t172, "IL2R", 1). condition(t172, "CGC", 1). condition(t172, "IL2", 0). condition(t172, "IL2RB", 1). condition(t172, "IL2_e", 1).
condition(t173, "IL2R", 0). target(t173, "IL2R", 1). condition(t173, "CGC", 1). condition(t173, "IL2", 1). condition(t173, "IL2RB", 1).
condition(t174, "IL2R", 1). target(t174, "IL2R", 0). condition(t174, "CGC", 0).
condition(t175, "IL2R", 1). target(t175, "IL2R", 0). condition(t175, "IL2", 0). condition(t175, "IL2_e", 0).
condition(t176, "IL2R", 1). target(t176, "IL2R", 0). condition(t176, "IL2RB", 0).
condition(t177, "IL2R", 1). target(t177, "IL2R", 2). condition(t177, "CGC", 1). condition(t177, "IL2", 0). condition(t177, "IL2RA", 1). condition(t177, "IL2RB", 1). condition(t177, "IL2_e", 1).
condition(t178, "IL2R", 1). target(t178, "IL2R", 2). condition(t178, "CGC", 1). condition(t178, "IL2", 1). condition(t178, "IL2RA", 1). condition(t178, "IL2RB", 1).
condition(t179, "IL2R", 2). target(t179, "IL2R", 1). condition(t179, "CGC", 0).
condition(t180, "IL2R", 2). target(t180, "IL2R", 1). condition(t180, "IL2", 0). condition(t180, "IL2_e", 0).
condition(t181, "IL2R", 2). target(t181, "IL2R", 1). condition(t181, "IL2RA", 0).
condition(t182, "IL2R", 2). target(t182, "IL2R", 1). condition(t182, "IL2RB", 0).
condition(t183, "IL2RA", 0). target(t183, "IL2RA", 1). condition(t183, "FOXP3", 0). condition(t183, "NFAT", 1). condition(t183, "NFKB", 1).
condition(t184, "IL2RA", 0). target(t184, "IL2RA", 1). condition(t184, "FOXP3", 0). condition(t184, "NFAT", 1). condition(t184, "SMAD3", 1).
condition(t185, "IL2RA", 0). target(t185, "IL2RA", 1). condition(t185, "FOXP3", 0). condition(t185, "NFAT", 1). condition(t185, "STAT5", 1).
condition(t186, "IL2RA", 0). target(t186, "IL2RA", 1). condition(t186, "FOXP3", 0). condition(t186, "NFAT", 1). condition(t186, "STAT5", 2).
condition(t187, "IL2RA", 0). target(t187, "IL2RA", 1). condition(t187, "FOXP3", 1). condition(t187, "NFAT", 1).
condition(t188, "IL2RA", 1). target(t188, "IL2RA", 0). condition(t188, "FOXP3", 0). condition(t188, "NFKB", 0). condition(t188, "SMAD3", 0). condition(t188, "STAT5", 0).
condition(t189, "IL2RA", 1). target(t189, "IL2RA", 0). condition(t189, "NFAT", 0).
condition(t190, "IL2RB", 0). target(t190, "IL2RB", 1).
condition(t191, "IL3", 0). target(t191, "IL3", 1). condition(t191, "GATA3", 1). condition(t191, "NFAT", 1). condition(t191, "proliferation", 1).
condition(t192, "IL3", 1). target(t192, "IL3", 0). condition(t192, "GATA3", 0).
condition(t193, "IL3", 1). target(t193, "IL3", 0). condition(t193, "NFAT", 0).
condition(t194, "IL3", 1). target(t194, "IL3", 0). condition(t194, "proliferation", 0).
condition(t195, "IL31", 0). target(t195, "IL31", 1). condition(t195, "NFAT", 1). condition(t195, "STAT6", 1). condition(t195, "proliferation", 1).
condition(t196, "IL31", 1). target(t196, "IL31", 0). condition(t196, "NFAT", 0).
condition(t197, "IL31", 1). target(t197, "IL31", 0). condition(t197, "STAT6", 0).
condition(t198, "IL31", 1). target(t198, "IL31", 0). condition(t198, "proliferation", 0).
condition(t199, "IL33R", 0). target(t199, "IL33R", 1). condition(t199, "IL1RAP", 1). condition(t199, "IL33_e", 1). condition(t199, "ST2", 1).
condition(t200, "IL33R", 1). target(t200, "IL33R", 0). condition(t200, "IL1RAP", 0).
condition(t201, "IL33R", 1). target(t201, "IL33R", 0). condition(t201, "IL33_e", 0).
condition(t202, "IL33R", 1). target(t202, "IL33R", 0). condition(t202, "ST2", 0).
condition(t203, "IL35", 0). target(t203, "IL35", 1). condition(t203, "FOXP3", 1). condition(t203, "NFAT", 1). condition(t203, "proliferation", 1).
condition(t204, "IL35", 1). target(t204, "IL35", 0). condition(t204, "FOXP3", 0).
condition(t205, "IL35", 1). target(t205, "IL35", 0). condition(t205, "NFAT", 0).
condition(t206, "IL35", 1). target(t206, "IL35", 0). condition(t206, "proliferation", 0).
condition(t207, "IL36R", 0). target(t207, "IL36R", 1). condition(t207, "IL1RAP", 1). condition(t207, "IL1RL2", 1). condition(t207, "IL36_e", 1).
condition(t208, "IL36R", 1). target(t208, "IL36R", 0). condition(t208, "IL1RAP", 0).
condition(t209, "IL36R", 1). target(t209, "IL36R", 0). condition(t209, "IL1RL2", 0).
condition(t210, "IL36R", 1). target(t210, "IL36R", 0). condition(t210, "IL36_e", 0).
condition(t211, "IL4", 0). target(t211, "IL4", 1). condition(t211, "FOXP3", 0). condition(t211, "GATA3", 1). condition(t211, "IRF1", 0). condition(t211, "NFAT", 1). condition(t211, "RUNX3", 0). condition(t211, "STAT5", 1). condition(t211, "cMAF", 0). condition(t211, "proliferation", 1).
condition(t212, "IL4", 0). target(t212, "IL4", 1). condition(t212, "FOXP3", 0). condition(t212, "GATA3", 1). condition(t212, "IRF1", 0). condition(t212, "NFAT", 1). condition(t212, "RUNX3", 0). condition(t212, "STAT5", 2). condition(t212, "cMAF", 0). condition(t212, "proliferation", 1).
condition(t213, "IL4", 0). target(t213, "IL4", 1). condition(t213, "FOXP3", 0). condition(t213, "GATA3", 1). condition(t213, "IRF1", 0). condition(t213, "NFAT", 1). condition(t213, "RUNX3", 0). condition(t213, "cMAF", 1). condition(t213, "proliferation", 1).
condition(t214, "IL4", 0). target(t214, "IL4", 1). condition(t214, "FOXP3", 0). condition(t214, "GATA3", 1). condition(t214, "IRF1", 0). condition(t214, "NFAT", 1). condition(t214, "RUNX3", 1). condition(t214, "STAT5", 1). condition(t214, "TBET", 0). condition(t214, "cMAF", 0). condition(t214, "proliferation", 1).
condition(t215, "IL4", 0). target(t215, "IL4", 1). condition(t215, "FOXP3", 0). condition(t215, "GATA3", 1). condition(t215, "IRF1", 0). condition(t215, "NFAT", 1). condition(t215, "RUNX3", 1). condition(t215, "STAT5", 2). condition(t215, "TBET", 0). condition(t215, "cMAF", 0). condition(t215, "proliferation", 1).
condition(t216, "IL4", 0). target(t216, "IL4", 1). condition(t216, "FOXP3", 0). condition(t216, "GATA3", 1). condition(t216, "IRF1", 0). condition(t216, "NFAT", 1). condition(t216, "RUNX3", 1). condition(t216, "TBET", 0). condition(t216, "cMAF", 1). condition(t216, "proliferation", 1).
condition(t217, "IL4", 1). target(t217, "IL4", 0). condition(t217, "FOXP3", 1).
condition(t218, "IL4", 1). target(t218, "IL4", 0). condition(t218, "GATA3", 0).
condition(t219, "IL4", 1). target(t219, "IL4", 0). condition(t219, "IRF1", 1).
condition(t220, "IL4", 1). target(t220, "IL4", 0). condition(t220, "NFAT", 0).
condition(t221, "IL4", 1). target(t221, "IL4", 0). condition(t221, "RUNX3", 1). condition(t221, "TBET", 1).
condition(t222, "IL4", 1). target(t222, "IL4", 0). condition(t222, "STAT5", 0). condition(t222, "cMAF", 0).
condition(t223, "IL4", 1). target(t223, "IL4", 0). condition(t223, "proliferation", 0).
condition(t224, "IL4R", 0). target(t224, "IL4R", 1). condition(t224, "CGC", 1). condition(t224, "IL4", 0). condition(t224, "IL4RA", 1). condition(t224, "IL4_e", 1).
condition(t225, "IL4R", 0). target(t225, "IL4R", 1). condition(t225, "CGC", 1). condition(t225, "IL4", 1). condition(t225, "IL4RA", 1).
condition(t226, "IL4R", 1). target(t226, "IL4R", 0). condition(t226, "CGC", 0).
condition(t227, "IL4R", 1). target(t227, "IL4R", 0). condition(t227, "IL4", 0). condition(t227, "IL4_e", 0).
condition(t228, "IL4R", 1). target(t228, "IL4R", 0). condition(t228, "IL4RA", 0).
condition(t229, "IL4RA", 0). target(t229, "IL4RA", 1).
condition(t230, "IL5", 0). target(t230, "IL5", 1). condition(t230, "FOXP3", 0). condition(t230, "GATA3", 0). condition(t230, "IL33R", 0). condition(t230, "NFAT", 1). condition(t230, "cMAF", 1). condition(t230, "proliferation", 1).
condition(t231, "IL5", 0). target(t231, "IL5", 1). condition(t231, "FOXP3", 0). condition(t231, "GATA3", 0). condition(t231, "IL33R", 1). condition(t231, "NFAT", 1). condition(t231, "proliferation", 1).
condition(t232, "IL5", 0). target(t232, "IL5", 1). condition(t232, "FOXP3", 0). condition(t232, "GATA3", 1). condition(t232, "NFAT", 1). condition(t232, "proliferation", 1).
condition(t233, "IL5", 1). target(t233, "IL5", 0). condition(t233, "FOXP3", 1).
condition(t234, "IL5", 1). target(t234, "IL5", 0). condition(t234, "GATA3", 0). condition(t234, "IL33R", 0). condition(t234, "cMAF", 0).
condition(t235, "IL5", 1). target(t235, "IL5", 0). condition(t235, "NFAT", 0).
condition(t236, "IL5", 1). target(t236, "IL5", 0). condition(t236, "proliferation", 0).
condition(t237, "IL6", 0). target(t237, "IL6", 1). condition(t237, "NFAT", 1). condition(t237, "STAT3", 1). condition(t237, "proliferation", 1).
condition(t238, "IL6", 1). target(t238, "IL6", 0). condition(t238, "NFAT", 0).
condition(t239, "IL6", 1). target(t239, "IL6", 0). condition(t239, "STAT3", 0).
condition(t240, "IL6", 1). target(t240, "IL6", 0). condition(t240, "proliferation", 0).
condition(t241, "IL6R", 0). target(t241, "IL6R", 1). condition(t241, "GP130", 1). condition(t241, "IL6", 0). condition(t241, "IL6RA", 1). condition(t241, "IL6_e", 1).
condition(t242, "IL6R", 0). target(t242, "IL6R", 1). condition(t242, "GP130", 1). condition(t242, "IL6", 1). condition(t242, "IL6RA", 1).
condition(t243, "IL6R", 1). target(t243, "IL6R", 0). condition(t243, "GP130", 0).
condition(t244, "IL6R", 1). target(t244, "IL6R", 0). condition(t244, "IL6", 0). condition(t244, "IL6_e", 0).
condition(t245, "IL6R", 1). target(t245, "IL6R", 0). condition(t245, "IL6RA", 0).
condition(t246, "IL6RA", 0). target(t246, "IL6RA", 1).
condition(t247, "IL9", 0). target(t247, "IL9", 1). condition(t247, "IL33R", 0). condition(t247, "NFAT", 1). condition(t247, "NFKB", 0). condition(t247, "PU1", 1). condition(t247, "SMAD3", 0). condition(t247, "STAT6", 1). condition(t247, "proliferation", 1).
condition(t248, "IL9", 0). target(t248, "IL9", 1). condition(t248, "IL33R", 0). condition(t248, "NFKB", 1). condition(t248, "PU1", 1). condition(t248, "SMAD3", 0). condition(t248, "STAT6", 1). condition(t248, "proliferation", 1).
condition(t249, "IL9", 0). target(t249, "IL9", 1). condition(t249, "IL33R", 1). condition(t249, "NFAT", 1). condition(t249, "NFKB", 0). condition(t249, "SMAD3", 0). condition(t249, "STAT6", 1). condition(t249, "proliferation", 1).
condition(t250, "IL9", 0). target(t250, "IL9", 1). condition(t250, "IL33R", 1). condition(t250, "NFKB", 1). condition(t250, "SMAD3", 0). condition(t250, "STAT6", 1). condition(t250, "proliferation", 1).
condition(t251, "IL9", 0). target(t251, "IL9", 1). condition(t251, "NFAT", 1). condition(t251, "NFKB", 0). condition(t251, "SMAD3", 1). condition(t251, "STAT6", 1). condition(t251, "proliferation", 1).
condition(t252, "IL9", 0). target(t252, "IL9", 1). condition(t252, "NFKB", 1). condition(t252, "SMAD3", 1). condition(t252, "STAT6", 1). condition(t252, "proliferation", 1).
condition(t253, "IL9", 1). target(t253, "IL9", 0). condition(t253, "IL33R", 0). condition(t253, "PU1", 0). condition(t253, "SMAD3", 0).
condition(t254, "IL9", 1). target(t254, "IL9", 0). condition(t254, "NFAT", 0). condition(t254, "NFKB", 0).
condition(t255, "IL9", 1). target(t255, "IL9", 0). condition(t255, "STAT6", 0).
condition(t256, "IL9", 1). target(t256, "IL9", 0). condition(t256, "proliferation", 0).
condition(t257, "IRF1", 0). target(t257, "IRF1", 1). condition(t257, "STAT1", 1).
condition(t258, "IRF1", 1). target(t258, "IRF1", 0). condition(t258, "STAT1", 0).
condition(t259, "NFAT", 0). target(t259, "NFAT", 1). condition(t259, "CD28", 1). condition(t259, "TCR", 1).
condition(t260, "NFAT", 1). target(t260, "NFAT", 0). condition(t260, "CD28", 0).
condition(t261, "NFAT", 1). target(t261, "NFAT", 0). condition(t261, "TCR", 0).
condition(t262, "NFKB", 0). target(t262, "NFKB", 1). condition(t262, "FOXP3", 0). condition(t262, "IKB", 0).
condition(t263, "NFKB", 1). target(t263, "NFKB", 0). condition(t263, "FOXP3", 1).
condition(t264, "NFKB", 1). target(t264, "NFKB", 0). condition(t264, "IKB", 1).
condition(t265, "PU1", 0). target(t265, "PU1", 1). condition(t265, "TGFBR", 1).
condition(t266, "PU1", 1). target(t266, "PU1", 0). condition(t266, "TGFBR", 0).
condition(t267, "RORGT", 0). target(t267, "RORGT", 1). condition(t267, "BCL6", 0). condition(t267, "FOXP3", 0). condition(t267, "STAT3", 1). condition(t267, "TGFBR", 1).
condition(t268, "RORGT", 1). target(t268, "RORGT", 0). condition(t268, "BCL6", 1).
condition(t269, "RORGT", 1). target(t269, "RORGT", 0). condition(t269, "FOXP3", 1).
condition(t270, "RORGT", 1). target(t270, "RORGT", 0). condition(t270, "STAT3", 0).
condition(t271, "RORGT", 1). target(t271, "RORGT", 0). condition(t271, "TGFBR", 0).
condition(t272, "RUNX3", 0). target(t272, "RUNX3", 1). condition(t272, "TBET", 1).
condition(t273, "RUNX3", 1). target(t273, "RUNX3", 0). condition(t273, "TBET", 0).
condition(t274, "SMAD3", 0). target(t274, "SMAD3", 1). condition(t274, "TGFBR", 1).
condition(t275, "SMAD3", 1). target(t275, "SMAD3", 0). condition(t275, "TGFBR", 0).
condition(t276, "ST2", 0). target(t276, "ST2", 1). condition(t276, "GATA3", 1).
condition(t277, "ST2", 1). target(t277, "ST2", 0). condition(t277, "GATA3", 0).
condition(t278, "STAT1", 0). target(t278, "STAT1", 1). condition(t278, "IFNAR", 1).
condition(t279, "STAT1", 0). target(t279, "STAT1", 1). condition(t279, "IFNGR", 1).
condition(t280, "STAT1", 0). target(t280, "STAT1", 1). condition(t280, "IL27R", 1).
condition(t281, "STAT1", 1). target(t281, "STAT1", 0). condition(t281, "IFNAR", 0). condition(t281, "IFNGR", 0). condition(t281, "IL27R", 0).
condition(t282, "STAT3", 0). target(t282, "STAT3", 1). condition(t282, "IL1R", 1).
condition(t283, "STAT3", 0). target(t283, "STAT3", 1). condition(t283, "IL21R", 1).
condition(t284, "STAT3", 0). target(t284, "STAT3", 1). condition(t284, "IL23R", 1).
condition(t285, "STAT3", 0). target(t285, "STAT3", 1). condition(t285, "IL27R", 1).
condition(t286, "STAT3", 0). target(t286, "STAT3", 1). condition(t286, "IL6R", 1).
condition(t287, "STAT3", 1). target(t287, "STAT3", 0). condition(t287, "IL1R", 0). condition(t287, "IL21R", 0). condition(t287, "IL23R", 0). condition(t287, "IL27R", 0). condition(t287, "IL6R", 0).
condition(t288, "STAT4", 0). target(t288, "STAT4", 1). condition(t288, "GATA3", 0). condition(t288, "IL12R", 1).
condition(t289, "STAT4", 1). target(t289, "STAT4", 0). condition(t289, "GATA3", 1).
condition(t290, "STAT4", 1). target(t290, "STAT4", 0). condition(t290, "IL12R", 0).
condition(t291, "STAT5", 0). target(t291, "STAT5", 1). condition(t291, "IL15R", 1).
condition(t292, "STAT5", 0). target(t292, "STAT5", 1). condition(t292, "IL2R", 1).
condition(t293, "STAT5", 0). target(t293, "STAT5", 1). condition(t293, "IL2R", 2).
condition(t294, "STAT5", 1). target(t294, "STAT5", 0). condition(t294, "IL15R", 0). condition(t294, "IL2R", 0).
condition(t295, "STAT5", 1). target(t295, "STAT5", 2). condition(t295, "IL2R", 2).
condition(t296, "STAT5", 2). target(t296, "STAT5", 1). condition(t296, "IL2R", 0).
condition(t297, "STAT5", 2). target(t297, "STAT5", 1). condition(t297, "IL2R", 1).
condition(t298, "STAT6", 0). target(t298, "STAT6", 1). condition(t298, "IL4R", 1).
condition(t299, "STAT6", 1). target(t299, "STAT6", 0). condition(t299, "IL4R", 0).
condition(t300, "TBET", 0). target(t300, "TBET", 1). condition(t300, "BCL6", 0). condition(t300, "IL36R", 0). condition(t300, "RORGT", 0). condition(t300, "STAT1", 1).
condition(t301, "TBET", 0). target(t301, "TBET", 1). condition(t301, "BCL6", 0). condition(t301, "IL36R", 1). condition(t301, "RORGT", 0).
condition(t302, "TBET", 1). target(t302, "TBET", 0). condition(t302, "BCL6", 1).
condition(t303, "TBET", 1). target(t303, "TBET", 0). condition(t303, "RORGT", 1).
condition(t304, "TCR", 0). target(t304, "TCR", 1). condition(t304, "APC", 1).
condition(t305, "TCR", 1). target(t305, "TCR", 0). condition(t305, "APC", 0).
condition(t306, "TGFB", 0). target(t306, "TGFB", 1). condition(t306, "FOXP3", 1). condition(t306, "NFAT", 1). condition(t306, "proliferation", 1).
condition(t307, "TGFB", 1). target(t307, "TGFB", 0). condition(t307, "FOXP3", 0).
condition(t308, "TGFB", 1). target(t308, "TGFB", 0). condition(t308, "NFAT", 0).
condition(t309, "TGFB", 1). target(t309, "TGFB", 0). condition(t309, "proliferation", 0).
condition(t310, "TGFBR", 0). target(t310, "TGFBR", 1). condition(t310, "TGFB", 1).
condition(t311, "TGFBR", 0). target(t311, "TGFBR", 1). condition(t311, "TGFB_e", 1).
condition(t312, "TGFBR", 1). target(t312, "TGFBR", 0). condition(t312, "TGFB", 0). condition(t312, "TGFB_e", 0).
condition(t313, "cMAF", 0). target(t313, "cMAF", 1). condition(t313, "STAT3", 1). condition(t313, "TGFBR", 1).
condition(t314, "cMAF", 1). target(t314, "cMAF", 0). condition(t314, "STAT3", 0).
condition(t315, "cMAF", 1). target(t315, "cMAF", 0). condition(t315, "TGFBR", 0).
condition(t316, "proliferation", 0). target(t316, "proliferation", 1). condition(t316, "STAT5", 2).

