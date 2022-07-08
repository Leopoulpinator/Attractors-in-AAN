Les fichiers du dossier en_html_bizarre sont issus de https://sources.debian.org/src/xsok/1.02-19/lib/Sokoban/.
Ils étaient initialement au format html.
Avec la commande : 
	find . -depth -name "*.html" -exec sh -c 'f="{}"; mv -- "$f" "${f%.html}.txt"' ; 
on a renommé tout ses fichiers en .txt.
On a ensuite utilisé krename pour les renommer au nom de leur dossier : screen.XX (et plus index.txt).
Suite à quoi on les a déplacé dans le dossier en_html_bizarre avec la commande :
	find . -depth -name "screen*" -exec sh -c 'f="{}"; mv -- "$f" ~/Documents/Stage_2022/exemples_perso/jeux_logiques/autres/sokoban/Xsokoban' ;
Après cela, on a écrit un code python pour extraire de chacun de ces fichiers seulement ce qui nous intéressait, et on l'a envoyé dans le dossier ../txt.
Le code python, nommé "gene.py" est présent dans le dossier en_html_bizarre.

Les fichiers du dossier txt sont utilisables avec le code python "script-py.lp".
Celui-ci nécessite d'être appelé avec une commande du style : 
	clingo -n 0 script-py.lp --const num=42
avec la valeur de num qui vaut le niveau que l'on souhaite générer en ASP

Cela nous permet d'obtenir le niveau (donc le sol, les murs, les cases d'arrivée, ainsi que la position initiale) en ASP.

CORRECTION : avec le code tout_passe_en_ASP on a directement les fichiers en .lp comme on le souhaite.
