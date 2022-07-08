papa(jacques_dutronc,thomas_dutronc).
papa(dark_vador,luke).
papa(chronos,zeus).
papa(zurg,buzz).
maman(metis,athena).
papa(zeus,athena).
papa(la_force,dark_vador).
maman(shmi,dark_vador).
maman(padme,luke).
maman(jobal,padme).
papa(ruwee,padme).
maman(jobal,sola).
papa(ruwee,sola).
enfant(X,Y) :- maman(Y,X).
enfant(X,Y) :- papa(Y,X).
papapa(X) :- enfant(X,_) ; not papa(X,_).
#show papapa/1.
