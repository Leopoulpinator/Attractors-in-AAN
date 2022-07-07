Il y a actuellement deux méthodes possibles de résolution.

La première (resolution_v1.lp) consiste à parcourir tout les coups possibles à chaque instant.

La seconde (resolution_v2.lp) regarde plutôt les coups de caisses possibles (et ne donne par conséquent que deux-ci lors de la résolution).
Celle-ci n'est pas forcèment optimale en terme de nombre de coups, mais elle l'est en terme de nombre de coups de caisses.

Afin d'utiliser les grilles de Xsokoban, il faut se mettre dans le répertoire Xsokoban, et taper ce genre de ligne de commande :
	clingo -n 0 python_resolution_v2.lp Xsokoban/ASP/screen.04
Ici on considérera la grille N°4 de Xsokoban.
