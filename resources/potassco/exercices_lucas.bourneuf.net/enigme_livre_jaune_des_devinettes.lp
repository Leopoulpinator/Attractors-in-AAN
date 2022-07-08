accuses(altomer;dummer;khajiit;orque).
3 { menteur(X) : accuses(X) } 3.
not menteur(altomer) :- coupable(dummer).
not menteur(dummer) :- coupable(khajiit) .
not menteur(orque) :- not coupable(orque).
not menteur(khajiit) :- menteur(dummer).
1 { coupable(X) : accuses(X) } 1.

#show coupable/1.
