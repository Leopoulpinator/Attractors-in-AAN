
def main():
	for i in range(1,89):
		mot = str(i)
		if len(mot) == 1:
			mot = '0'+mot
		new_file = open("ASP/screen."+mot,"w")
		a_renvoyer = ""
		with open("txt/screen."+mot) as f:
			content = f.read()
			colonne = 1
			ligne = 1
			nb_caisses = 1
			for i in range(len(content)):
				c = content[i]
				if c == '#' :
					a_renvoyer += "mur("+str(colonne)+','+str(ligne)+").\n"
					colonne += 1
				elif c == '\n':
					ligne += 1
					colonne = 1
				elif c == ' ':
					colonne += 1
				elif c == '$':
					a_renvoyer += "caisse_init("+str(nb_caisses)+','+str(colonne)+','+str(ligne)+").\n"
					nb_caisses += 1
					colonne += 1
				elif c == '.':
					a_renvoyer += "arrivee("+str(colonne)+','+str(ligne)+").\n"
					colonne += 1
				elif c == '@':
					a_renvoyer += "init("+str(colonne)+','+str(ligne)+").\n"
					colonne += 1
			a_renvoyer += "sol(R,C) :- init(R,C).\n"
			a_renvoyer += "sol(R,C) :- caisse_init(_,R,C).\n"
			a_renvoyer += "sol(R,C) :- arrivee(R,C).\n"
			a_renvoyer += "sol(R+1,C) :- sol(R,C), not mur(R+1,C).\n"
			a_renvoyer += "sol(R-1,C) :- sol(R,C), not mur(R-1,C).\n"
			a_renvoyer += "sol(R,C+1) :- sol(R,C), not mur(R,C+1).\n"
			a_renvoyer += "sol(R,C-1) :- sol(R,C), not mur(R,C-1).\n"
		new_file.write(a_renvoyer)
		new_file.close()

main()

