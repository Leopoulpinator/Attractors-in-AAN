mut(1,1). mur(2,1). mur(3,1). mur(4,1). mur(5,1). mur(6,1). mur(7,1).
mur(1,2). sol(2,2). sol(3,2). sol(4,2). sol(5,2). sol(6,2). mur(7,2). mur(8,2).
mur(1,3). sol(2,3). mur(3,3). sol(4,3). mur(5,3). sol(6,3). sol(7,3). mur(8,3).
mur(1,4). sol(2,4). sol(3,4). sol(4,4). sol(5,4). sol(6,4). sol(7,4). mur(8,4).
mur(1,5). sol(2,5). sol(3,5). sol(4,5). mur(5,5). sol(6,5). sol(7,5). mur(8,5).
mur(1,6). mur(2,6). mur(3,6). mur(4,6). mur(5,6). mur(6,6). mur(7,6). mur(8,6).

init(4,3).
caisse_init(1,3,4). caisse_init(2,4,4). caisse_init(3,5,4).
arrivee(2,4). arrivee(6,4). arrivee(6,5).

% Se résout en 54 coups : 1251s, un seul modèle, trouvé en 173s
% Avec la détection du blocage dans les coins, on passe à 652s, un seul modèle, trouvé en 27s
