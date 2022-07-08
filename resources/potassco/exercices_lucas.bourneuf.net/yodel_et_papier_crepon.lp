aime("Gérard",("Joueur du Grenier";"Les pois cassés")).
aime("Julie",("Les pois cassés";"Star Wars 9: les siths fantôme contre-retournent l'espoir")).
aime("Marlène",("Les chansons des années 20";"Symballium volume 4";"les roses vertes")).
aime("Michel",("La grande musique (dans le sens de la longueur)";"Star Wars 9: les siths fantôme contre-retournent l'espoir")).
aime("Dominique",("La grande musique (dans le sens de la longueur)";"les roses vertes";"Les poids cassés";"Symballium volume 4")).
1 { loisir(X) : aime(_,X) } 1.
set(G) :- aime(G,X), loisir(X).
#show set/1.
