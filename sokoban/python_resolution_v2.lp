#script (python) 

from clingo import Number, String, Function
import time

def get(val, default):
    return val if val != None else default

def main(prg):
	t = time.time()
	t1 = time.time()
	imin   = get(prg.get_const("imin"), Number(0))
	imax   = prg.get_const("imax")
	istop  = get(prg.get_const("istop"), String("SAT"))
	
	step, ret = 0, None
	while ((imax is None or step < imax.number) and
		(step == 0 or step < imin.number or (
		(istop.string == "SAT"     and not ret.satisfiable) or
		(istop.string == "UNSAT"   and not ret.unsatisfiable) or
		(istop.string == "UNKNOWN" and not ret.unknown)))):
		parts = []
		parts.append(("check", [Number(step)]))
		if step > 0:
			prg.release_external(Function("query", [Number(step-1)]))
			parts.append(("step", [Number(step)]))
		else:
			parts.append(("base", []))
		prg.ground(parts)
		prg.assign_external(Function("query", [Number(step)]), True)
		t2 = time.time()
		print("Incrementation : etape : {}, duree : {:.2f} s, total : {:.2f} s".format(step + 1,t2 - t1,t2-t))
		t1 = t2
		ret, step = prg.solve(), step+1
#end.

#program check(t).
#external query(t).

#const imin = 1.
#const imax = 50.
#const istop  = "SAT".

#program base.

perso(0,R,C) :- init(R,C).
caisse_a_instant(0,R,C) :- caisse_init(_,R,C). % N est le numéro de la caisse

#program step(k).

acces_a_instant(k-1,R,C) :- perso(k-1,R,C).
acces_a_instant(k-1,R+1,C) :- sol(R+1,C), acces_a_instant(k-1,R,C), not caisse_a_instant(k-1,R+1,C).
acces_a_instant(k-1,R-1,C) :- sol(R-1,C), acces_a_instant(k-1,R,C), not caisse_a_instant(k-1,R-1,C).
acces_a_instant(k-1,R,C+1) :- sol(R,C+1), acces_a_instant(k-1,R,C), not caisse_a_instant(k-1,R,C+1).
acces_a_instant(k-1,R,C-1) :- sol(R,C-1), acces_a_instant(k-1,R,C), not caisse_a_instant(k-1,R,C-1).
1 { coup_a_instant(k,(R,C),(R+1,C)) : sol(R,C), sol(R+2,C),
				      acces_a_instant(k-1,R,C),
				      caisse_a_instant(k-1,R+1,C),
				      not caisse_a_instant(k-1,R+2,C);
    coup_a_instant(k,(R,C),(R-1,C)) : sol(R,C), sol(R-2,C),
				      acces_a_instant(k-1,R,C),
				      caisse_a_instant(k-1,R-1,C),
				      not caisse_a_instant(k-1,R-2,C);
    coup_a_instant(k,(R,C),(R,C+1)) : sol(R,C), sol(R,C+2),
				      acces_a_instant(k-1,R,C),
				      caisse_a_instant(k-1,R,C+1),
				      not caisse_a_instant(k-1,R,C+2);
    coup_a_instant(k,(R,C),(R,C-1)) : sol(R,C), sol(R,C-2),
				      acces_a_instant(k-1,R,C),
				      caisse_a_instant(k-1,R,C-1),
				      not caisse_a_instant(k-1,R,C-2)} 1.
perso(k,R2,C2) :- coup_a_instant(k,_,(R2,C2)). % Déplacement du personnage

caisse_a_instant(k,2*R2-R,2*C2-C) :-
	sol(R2,C2), sol(R,C), sol(2*R2-R,2*C2-C),
	caisse_a_instant(k-1,R2,C2), coup_a_instant(k,(R,C),(R2,C2)). % On pousse une seule caisse : elle bouge

caisse_a_instant(k,R,C) :-
	sol(R,C), sol(R2,C2),
	caisse_a_instant(k-1,R,C), perso(k,R2,C2), R2 != R. % Si on ne pousse pas une caisse, elle ne bouge pas

caisse_a_instant(k,R,C) :-
	sol(R,C), sol(R2,C2),
	caisse_a_instant(k-1,R,C), perso(k,R2,C2), C2 != C. % idem

caisse_pas_place(k) :- caisse_a_instant(k,R,C), not arrivee(R,C).
fini(k) :- not caisse_pas_place(k).

% Optimisation : on passe de 2.8s à 1.5s sur jeux-gratuits/niveau_35.lp

bloquee(R,C) :- caisse_a_instant(k,R,C), mur(R+1,C), mur(R,C+1), not arrivee(R,C).
bloquee(R,C) :- caisse_a_instant(k,R,C), mur(R,C+1), mur(R-1,C), not arrivee(R,C).
bloquee(R,C) :- caisse_a_instant(k,R,C), mur(R-1,C), mur(R,C-1), not arrivee(R,C).
bloquee(R,C) :- caisse_a_instant(k,R,C), mur(R,C-1), mur(R+1,C), not arrivee(R,C).

bloquee(R,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R+1,C), mur(R,C+1), mur(R+1,C+1), not arrivee(R,C).
bloquee(R+1,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R+1,C), mur(R,C+1), mur(R+1,C+1), not arrivee(R+1,C).
bloquee(R,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R+1,C), mur(R,C-1), mur(R+1,C-1), not arrivee(R,C).
bloquee(R+1,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R+1,C), mur(R,C-1), mur(R+1,C-1), not arrivee(R+1,C).

bloquee(R,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R+1,C), mur(R,C+1), mur(R+1,C-1), not arrivee(R,C).
bloquee(R+1,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R+1,C), mur(R,C+1), mur(R+1,C-1), not arrivee(R+1,C).
bloquee(R,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R+1,C), mur(R,C-1), mur(R+1,C+1), not arrivee(R,C).
bloquee(R+1,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R+1,C), mur(R,C-1), mur(R+1,C+1), not arrivee(R+1,C).

bloquee(R,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R,C+1), mur(R+1,C), mur(R+1,C+1), not arrivee(R,C).
bloquee(R,C+1) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R,C+1), mur(R+1,C), mur(R+1,C+1), not arrivee(R,C+1).
bloquee(R,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R,C+1), mur(R-1,C), mur(R-1,C+1), not arrivee(R,C).
bloquee(R,C+1) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R,C+1), mur(R-1,C), mur(R-1,C+1), not arrivee(R,C+1).

bloquee(R,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R,C+1), mur(R+1,C), mur(R-1,C+1), not arrivee(R,C).
bloquee(R,C+1) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R,C+1), mur(R+1,C), mur(R-1,C+1), not arrivee(R,C+1).
bloquee(R,C) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R,C+1), mur(R-1,C), mur(R+1,C+1), not arrivee(R,C).
bloquee(R,C+1) :- caisse_a_instant(k,R,C), caisse_a_instant(k,R,C+1), mur(R-1,C), mur(R+1,C+1), not arrivee(R,C+1).

:- bloquee(_,_).

% A priori très couteux...
caisse_endroit_different(T1,k) :- instant(T1), caisse_a_instant(T1,R,C), caisse_a_instant(k,R2,C2), (R,C) != (R2,C2), T1 < k-1.
toutes_les_caisses_aux_memes_endroits(T1,k) :- instant(T1), not caisse_endroit_different(T1,k), T1 < k-1.
meme_config(T1,k) :- instant(T1), perso(T1,R,C), perso(k,R,C), toutes_les_caisses_aux_memes_endroits(T1,k).

:- mem_config(T1,k), T1 < k-1.

m(k,(R,C),droite) :- coup_a_instant(k,(R,C),(R+1,C)). % Plus agréable à lire
m(k,(R,C),gauche) :- coup_a_instant(k,(R,C),(R-1,C)).
m(k,(R,C),bas) :- coup_a_instant(k,(R,C),(R,C+1)).
m(k,(R,C),haut) :- coup_a_instant(k,(R,C),(R,C-1)).

a(0,(0,0),0). a(k,(R,C),M) :- a(k-1,_,_), m(k,(R,C),M). % Permet de trier par ordre les coups
s(k,(R,C),M) :- a(k,(R,C),M), k != 0.

#program check(k).

instant(k) :- k != 0.
:- not fini(k), query(k).
:- query(k), k = 0.

#show s/3.
#show fini/1.
