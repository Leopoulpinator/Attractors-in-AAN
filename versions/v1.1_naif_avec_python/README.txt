Cette première version se veut très naïve.
On encode les états globaux via des listes sous ASP qu'on va ensuite utiliser sous python pour déduire tout les états locaux.
Cette encodage des états globaux permet de simplifier la manière dont on va calculer les transitions possibles : on aura juste besoin de définir une fonction qui pour chaque état global nous renvoie l'ensemble des états globaux atteignables.
