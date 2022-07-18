Cette version reprend la version 1.1 mais enlève tout le code python.
Cela a pour avantage de nous assurer qu'ASP peut optimiser au mieux son calcul sans être surpris par des résultats que lui renvoie python(ASP ne peut pas les deviner, et doit attendre les réponses des calculs de python pour poursuivre son calcul).
Cependant, le dépilage de listes étant très couteux en termes de nombres d'atomes créés, cette version est moins performante que la 1.1 à cause du codage des sémantiques.
Comme Python était appelé avant le début des parcours, on peut alors chercher à s'en servir pendant ceux-ci pour être sûrs qu'ASP n'a pas d'autre choix que d'appeler python et de poursuivre le chemin dans le graphe.
C'est pour cela que je fais une version 4.
