# Attractors-in-AAN

Ce travail a été effectué durant mon stage de L3 au laboratoire CRIStAL de Villeneuve d'Ascq.

On définit un réseau d'automates asynchrones par un ensemble fini d'automates finis sans état initial, ni final.
Chaque transition d'un automate est numéroté par une, plusieurs, ou aucune valeur d'un autre automate.
Si on a trois automates A,B et C, on notera a_0, a_1, ..., a_{|A|-1} (où |A| est le nombre d'état de l'automate A), ses états.
Si une transition au sein de l'automate X fait passer de l'état i à j en étant étiqueté par y_k, cela signifie que la transition est possible ssi Y est à k.

Dans ce réseau d'automates (= AAN), on a donc 2 types d'états :
	- les états locaux, ce sont les a_k, b_k, ...
	- les états globaux, il s'agit du produit des états locaux à un instant donné

On s'intéresse dans ce travail à la détermination des attracteurs pour un AAN.
On définit tout d'abord la notion de domaine piège et état stable.

Un état global est dit stable si aucune transition locale n'est possible depuis celui-ci.
Un ensemble E d'état globaux est un domaine piège s'il n'existe pas d'état global dans E, et de transition globale depuis E telle que l'état global suivant ne soit pas dans E.
Autrement dit, on ne peut pas s'enfuir d'un domaine piège.
Enfin, un attracteur est un domaine piège minimal au sens de l'inclusion.

Un précédent travail a montré que les attracteurs d'un graphe étaient exactement les traces des domaines pièges cycliques.
Un code a ensuite été effectué en ASP, un langage purement logique.
Le but du code n'est pas seulement de trouver les attracteurs, mais également de le faire pour n'importe quel sémantique, c'est-à-dire manière de se déplacer au sein du graphe.

Le code a eu un problème au niveau de la sémantique synchrone : une transition est globale si de l'état global G1 on peut aller vers G2 en faisant bouger le plus possible d'automates localement.

Ce travail a pour but de corriger ce souci avec la sémantique synchrone, mais également de rajouter une sémantique "généralisée" dans le code.

(********************************************************************************************************************************************************************************************)

Dans la première partie de mon stage, j'ai découvert ce qu'était ASP et comment l'utiliser. Tout mes exercices sont dans le dossier first_exercices_in_asp.
Le dossier de resources contient un peu tout et n'importe quoi.
Les fichiers de /models/ sont des AAN que l'on utilise avec notre méthode de résolution.
Cette dernière est présente dans le dossier /versions/, sous différents versions possibles.

La première consiste à effectuer la recherche de la manière la plus naïve possible : on définit tout les états globaux, et on définit toutes les transitions possibles au sein de ce grand automate
(qui est donc le produit des petis automates), puis on sélectionne celle que l'on souhaite jouer pour chaque étape.
