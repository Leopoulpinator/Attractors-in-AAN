Le script synch.lp n'est pas fait.
Cette version est vraiment inefficace et peu intéressante.
Elle reprend la version 1.1 en enlevant toute la partie pré-mémorisation pour se focaliser sur le calcul lors de la recherche.
Plus précisément, au lieu de stocker toutes les transitions possibles entre toute paire d'états globaux, on vient ici recalculer chacune des transitions possibles à partir d'un état global lorsqu'on se trouve dans celui-ci.
Cela allège la mémoire, mais décuple le nombre de calculs considérablement.
