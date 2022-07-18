
automaton_level("CD45", 0..1).
automaton_level("CD8", 0..1).
automaton_level("TCRlig", 0..1).
automaton_level("TCRbind", 0..1).
automaton_level("PAGCsk", 0..1).
automaton_level("LCK", 0..1).
automaton_level("Fyn", 0..1).
automaton_level("cCbl", 0..1).
automaton_level("TCRphos", 0..1).
automaton_level("Rlk", 0..1).
automaton_level("ZAP70", 0..1).
automaton_level("LAT", 0..1).
automaton_level("Gads", 0..1).
automaton_level("Itk", 0..1).
automaton_level("IP3", 0..1).
automaton_level("Ca", 0..1).
automaton_level("Calcin", 0..1).
automaton_level("NFAT", 0..1).
automaton_level("CRE", 0..1).
automaton_level("AP1", 0..1).
automaton_level("NFkB", 0..1).
automaton_level("CREB", 0..1).
automaton_level("Rsk", 0..1).
automaton_level("ERK", 0..1).
automaton_level("Fos", 0..1).
automaton_level("Jun", 0..1).
automaton_level("MEK", 0..1).
automaton_level("Raf", 0..1).
automaton_level("Ras", 0..1).
automaton_level("Grb2Sos", 0..1).
automaton_level("Slp76", 0..1).
automaton_level("PLCg_b", 0..1).
automaton_level("PLCg_a", 0..1).
automaton_level("DAG", 0..1).
automaton_level("PKCth", 0..1).
automaton_level("RasGRP1", 0..1).
automaton_level("IkB", 0..1).
automaton_level("IKK", 0..1).
automaton_level("JNK", 0..1).
automaton_level("SEK", 0..1).




condition(t1, "TCRbind", 1). target(t1, "TCRbind", 0). condition(t1, "TCRlig", 0).
condition(t2, "TCRbind", 0). target(t2, "TCRbind", 1). condition(t2, "TCRlig", 1). condition(t2, "cCbl", 0).
condition(t3, "TCRbind", 1). target(t3, "TCRbind", 0). condition(t3, "TCRlig", 1). condition(t3, "cCbl", 1).

condition(t4, "PAGCsk", 0). target(t4, "PAGCsk", 1). condition(t4, "TCRbind", 0).
condition(t5, "PAGCsk", 1). target(t5, "PAGCsk", 0). condition(t5, "TCRbind", 1).

condition(t6, "LCK", 1). target(t6, "LCK", 0). condition(t6, "CD45", 0).
condition(t7, "LCK", 1). target(t7, "LCK", 0). condition(t7, "CD45", 1). condition(t7, "CD8", 0).
condition(t8, "LCK", 0). target(t8, "LCK", 1). condition(t8, "CD45", 1). condition(t8, "CD8", 1). condition(t8, "PAGCsk", 0).
condition(t9, "LCK", 1). target(t9, "LCK", 0). condition(t9, "CD45", 1). condition(t9, "CD8", 1). condition(t9, "PAGCsk", 1).

condition(t10, "Fyn", 1). target(t10, "Fyn", 0). condition(t10, "CD45", 0).
condition(t11, "Fyn", 1). target(t11, "Fyn", 0). condition(t11, "CD45", 1). condition(t11, "TCRbind", 0). condition(t11, "LCK", 0).
condition(t12, "Fyn", 0). target(t12, "Fyn", 1). condition(t12, "CD45", 1). condition(t12, "TCRbind", 0). condition(t12, "LCK", 1).
condition(t13, "Fyn", 0). target(t13, "Fyn", 1). condition(t13, "CD45", 1). condition(t13, "TCRbind", 1).

condition(t14, "cCbl", 1). target(t14, "cCbl", 0). condition(t14, "ZAP70", 0).
condition(t15, "cCbl", 0). target(t15, "cCbl", 1). condition(t15, "ZAP70", 1).

condition(t16, "TCRphos", 1). target(t16, "TCRphos", 0). condition(t16, "TCRbind", 0). condition(t16, "Fyn", 0).
condition(t17, "TCRphos", 0). target(t17, "TCRphos", 1). condition(t17, "TCRbind", 0). condition(t17, "Fyn", 1).
condition(t18, "TCRphos", 1). target(t18, "TCRphos", 0). condition(t18, "TCRbind", 1). condition(t18, "LCK", 0). condition(t18, "Fyn", 0).
condition(t19, "TCRphos", 0). target(t19, "TCRphos", 1). condition(t19, "TCRbind", 1). condition(t19, "LCK", 0). condition(t19, "Fyn", 1).
condition(t20, "TCRphos", 0). target(t20, "TCRphos", 1). condition(t20, "TCRbind", 1). condition(t20, "LCK", 1).

condition(t21, "Rlk", 1). target(t21, "Rlk", 0). condition(t21, "LCK", 0).
condition(t22, "Rlk", 0). target(t22, "Rlk", 1). condition(t22, "LCK", 1).

condition(t23, "ZAP70", 1). target(t23, "ZAP70", 0). condition(t23, "LCK", 0).
condition(t24, "ZAP70", 1). target(t24, "ZAP70", 0). condition(t24, "LCK", 1). condition(t24, "cCbl", 0). condition(t24, "TCRphos", 0).
condition(t25, "ZAP70", 0). target(t25, "ZAP70", 1). condition(t25, "LCK", 1). condition(t25, "cCbl", 0). condition(t25, "TCRphos", 1).
condition(t26, "ZAP70", 1). target(t26, "ZAP70", 0). condition(t26, "LCK", 1). condition(t26, "cCbl", 1).

condition(t27, "LAT", 1). target(t27, "LAT", 0). condition(t27, "ZAP70", 0).
condition(t28, "LAT", 0). target(t28, "LAT", 1). condition(t28, "ZAP70", 1).

condition(t29, "Gads", 1). target(t29, "Gads", 0). condition(t29, "LAT", 0).
condition(t30, "Gads", 0). target(t30, "Gads", 1). condition(t30, "LAT", 1).

condition(t31, "Itk", 1). target(t31, "Itk", 0). condition(t31, "ZAP70", 0).
condition(t32, "Itk", 1). target(t32, "Itk", 0). condition(t32, "ZAP70", 1). condition(t32, "Slp76", 0).
condition(t33, "Itk", 0). target(t33, "Itk", 1). condition(t33, "ZAP70", 1). condition(t33, "Slp76", 1).

condition(t34, "IP3", 1). target(t34, "IP3", 0). condition(t34, "PLCg_a", 0).
condition(t35, "IP3", 0). target(t35, "IP3", 1). condition(t35, "PLCg_a", 1).

condition(t36, "Ca", 1). target(t36, "Ca", 0). condition(t36, "IP3", 0).
condition(t37, "Ca", 0). target(t37, "Ca", 1). condition(t37, "IP3", 1).

condition(t38, "Calcin", 1). target(t38, "Calcin", 0). condition(t38, "Ca", 0).
condition(t39, "Calcin", 0). target(t39, "Calcin", 1). condition(t39, "Ca", 1).

condition(t40, "NFAT", 1). target(t40, "NFAT", 0). condition(t40, "Calcin", 0).
condition(t41, "NFAT", 0). target(t41, "NFAT", 1). condition(t41, "Calcin", 1).

condition(t42, "CRE", 1). target(t42, "CRE", 0). condition(t42, "CREB", 0).
condition(t43, "CRE", 0). target(t43, "CRE", 1). condition(t43, "CREB", 1).

condition(t44, "AP1", 1). target(t44, "AP1", 0). condition(t44, "Fos", 0).
condition(t45, "AP1", 1). target(t45, "AP1", 0). condition(t45, "Fos", 1). condition(t45, "Jun", 0).
condition(t46, "AP1", 0). target(t46, "AP1", 1). condition(t46, "Fos", 1). condition(t46, "Jun", 1).

condition(t47, "NFkB", 0). target(t47, "NFkB", 1). condition(t47, "IkB", 0).
condition(t48, "NFkB", 1). target(t48, "NFkB", 0). condition(t48, "IkB", 1).

condition(t49, "CREB", 1). target(t49, "CREB", 0). condition(t49, "Rsk", 0).
condition(t50, "CREB", 0). target(t50, "CREB", 1). condition(t50, "Rsk", 1).

condition(t51, "Rsk", 1). target(t51, "Rsk", 0). condition(t51, "ERK", 0).
condition(t52, "Rsk", 0). target(t52, "Rsk", 1). condition(t52, "ERK", 1).

condition(t53, "ERK", 1). target(t53, "ERK", 0). condition(t53, "MEK", 0).
condition(t54, "ERK", 0). target(t54, "ERK", 1). condition(t54, "MEK", 1).

condition(t55, "Fos", 1). target(t55, "Fos", 0). condition(t55, "ERK", 0).
condition(t56, "Fos", 0). target(t56, "Fos", 1). condition(t56, "ERK", 1).

condition(t57, "Jun", 1). target(t57, "Jun", 0). condition(t57, "JNK", 0).
condition(t58, "Jun", 0). target(t58, "Jun", 1). condition(t58, "JNK", 1).

condition(t59, "MEK", 1). target(t59, "MEK", 0). condition(t59, "Raf", 0).
condition(t60, "MEK", 0). target(t60, "MEK", 1). condition(t60, "Raf", 1).

condition(t61, "Raf", 1). target(t61, "Raf", 0). condition(t61, "Ras", 0).
condition(t62, "Raf", 0). target(t62, "Raf", 1). condition(t62, "Ras", 1).

condition(t63, "Ras", 1). target(t63, "Ras", 0). condition(t63, "Grb2Sos", 0).
condition(t64, "Ras", 1). target(t64, "Ras", 0). condition(t64, "Grb2Sos", 1). condition(t64, "RasGRP1", 0).
condition(t65, "Ras", 0). target(t65, "Ras", 1). condition(t65, "Grb2Sos", 1). condition(t65, "RasGRP1", 1).

condition(t66, "Grb2Sos", 1). target(t66, "Grb2Sos", 0). condition(t66, "LAT", 0).
condition(t67, "Grb2Sos", 0). target(t67, "Grb2Sos", 1). condition(t67, "LAT", 1).

condition(t68, "Slp76", 1). target(t68, "Slp76", 0). condition(t68, "Gads", 0).
condition(t69, "Slp76", 0). target(t69, "Slp76", 1). condition(t69, "Gads", 1).

condition(t70, "PLCg_b", 1). target(t70, "PLCg_b", 0). condition(t70, "LAT", 0).
condition(t71, "PLCg_b", 0). target(t71, "PLCg_b", 1). condition(t71, "LAT", 1).

condition(t72, "PLCg_a", 1). target(t72, "PLCg_a", 0). condition(t72, "Rlk", 0). condition(t72, "ZAP70", 0).
condition(t73, "PLCg_a", 1). target(t73, "PLCg_a", 0). condition(t73, "Rlk", 0). condition(t73, "ZAP70", 1). condition(t73, "Itk", 0).
condition(t74, "PLCg_a", 1). target(t74, "PLCg_a", 0). condition(t74, "Rlk", 0). condition(t74, "ZAP70", 1). condition(t74, "Itk", 1). condition(t74, "Slp76", 0).
condition(t75, "PLCg_a", 1). target(t75, "PLCg_a", 0). condition(t75, "Rlk", 0). condition(t75, "ZAP70", 1). condition(t75, "Itk", 1). condition(t75, "Slp76", 1). condition(t75, "PLCg_b", 0).
condition(t76, "PLCg_a", 0). target(t76, "PLCg_a", 1). condition(t76, "Rlk", 0). condition(t76, "ZAP70", 1). condition(t76, "Itk", 1). condition(t76, "Slp76", 1). condition(t76, "PLCg_b", 1).
condition(t77, "PLCg_a", 1). target(t77, "PLCg_a", 0). condition(t77, "Rlk", 1). condition(t77, "ZAP70", 0).
condition(t78, "PLCg_a", 1). target(t78, "PLCg_a", 0). condition(t78, "Rlk", 1). condition(t78, "ZAP70", 1). condition(t78, "Slp76", 0).
condition(t79, "PLCg_a", 1). target(t79, "PLCg_a", 0). condition(t79, "Rlk", 1). condition(t79, "ZAP70", 1). condition(t79, "Slp76", 1). condition(t79, "PLCg_b", 0).
condition(t80, "PLCg_a", 0). target(t80, "PLCg_a", 1). condition(t80, "Rlk", 1). condition(t80, "ZAP70", 1). condition(t80, "Slp76", 1). condition(t80, "PLCg_b", 1).

condition(t81, "DAG", 1). target(t81, "DAG", 0). condition(t81, "PLCg_a", 0).
condition(t82, "DAG", 0). target(t82, "DAG", 1). condition(t82, "PLCg_a", 1).

condition(t83, "PKCth", 1). target(t83, "PKCth", 0). condition(t83, "DAG", 0).
condition(t84, "PKCth", 0). target(t84, "PKCth", 1). condition(t84, "DAG", 1).

condition(t85, "RasGRP1", 1). target(t85, "RasGRP1", 0). condition(t85, "DAG", 0).
condition(t86, "RasGRP1", 1). target(t86, "RasGRP1", 0). condition(t86, "DAG", 1). condition(t86, "PKCth", 0).
condition(t87, "RasGRP1", 0). target(t87, "RasGRP1", 1). condition(t87, "DAG", 1). condition(t87, "PKCth", 1).

condition(t88, "IkB", 0). target(t88, "IkB", 1). condition(t88, "IKK", 0).
condition(t89, "IkB", 1). target(t89, "IkB", 0). condition(t89, "IKK", 1).

condition(t90, "IKK", 1). target(t90, "IKK", 0). condition(t90, "PKCth", 0).
condition(t91, "IKK", 0). target(t91, "IKK", 1). condition(t91, "PKCth", 1).

condition(t92, "JNK", 1). target(t92, "JNK", 0). condition(t92, "SEK", 0).
condition(t93, "JNK", 0). target(t93, "JNK", 1). condition(t93, "SEK", 1).

condition(t94, "SEK", 1). target(t94, "SEK", 0). condition(t94, "PKCth", 0).
condition(t95, "SEK", 0). target(t95, "SEK", 1). condition(t95, "PKCth", 1).

