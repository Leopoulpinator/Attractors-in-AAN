% J'ai 3 copains dans ma classe
copain(1..3).
% Parfois certains ne viennent pas à la récré
{ en_recre(1..3) }.
% On a un certain nombre de paquets à disposition, mais toujours au moins 2 quand même
{ nb_paquets(2..4) }.
% une question difficile :
gauche ; droite.
% bah oui quand même faut pas déconner hein !
draft_tarot :- gauche.
% Tous mes copains ne sont pas dégénérés tous les jours
choix1 ; choix2.
% Mais ça arrive parfois
degenere(C) :- copain(C), choix1.
% On joue au tarot quand on est tous les quatre dégénérés (oui c'est pas toujours le cas) et qu'on a au moins trois paquets, bien sûr en faisant du draft-tarot
on_joue_au_tarot :- en_recre(C): degenere(C), nb_paquets(X), X >= 3, draft_tarot.
% Et sinon, on est des gamins d'une normale banalité
on_joue_au_ballon :- not on_joue_au_tarot.
#show on_joue_au_tarot/0.
#show on_joue_au_ballon/0.
