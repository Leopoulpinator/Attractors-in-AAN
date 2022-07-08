def main() :
	for i in range(20,89):
		mot = str(i)
		with open("screen."+mot) as file:
			lines = file.readlines()
			a_renvoyer = ""
			for line in lines :
				mot_1 = "      <pre><code id=\"sourcecode\" class=\"no-highlight\"><span id=\"line1\" class=\"codeline \">"
				k = len(mot_1)
				if len(line) >= k and line[0:k] == mot_1 :
					if line[k+1] != 'C':
						a_renvoyer += line[k:]
				for i in range(2,21):
					mot_i = "</span><span id=\"line"+str(i)+"\" class=\"codeline \">"
					l = len(mot_i)
					if len(line) >= l and line[0:l] == mot_i :
						if line[l+1] != 'A':
							a_renvoyer += line[l:]
			new_file = open("../txt/screen."+mot,"w")
			new_file.write(a_renvoyer)
			new_file.close()
	return ()

main()
