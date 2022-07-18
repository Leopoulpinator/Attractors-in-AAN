Le script synch.lp n'est pas fait et n'est donc pas valide.

Le but de cette version est de calculer à partir d'un état global tout les états globaux dans lesquels il peut aller.
Cependant, comme on manipule les listes en ASP, on doit créer plein d'atomes intermédiaires pour dépiler les listes (qui sont d'une longueur égale au nombre d'automates...).
Ainsi, depuis un état stable à une étape Step, on va créer 2 x Nb_automaton x Nb_transitions_possibles atomes juste pour dire que l'on peut atteindre tout les autres états globaux...
Donc ça fait vraiment beaucoup d'atomes.

La solution que j'envisage est donc de manipuler les listes sous python pour éviter de trop occuper la mémoire.
