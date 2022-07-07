% Taille variable

size(4).

% Variables utiles

row(1..S) :- size(S).
column(1..S) :- size(S).
var(0..2*S-2) :- size(S).


% Génération des solutions

1 { s(R,C,V) : var(V) } 1 :- row(R), column(C).

% Les contraintes

bleu(R,C) :- V > 0, s(R,C,V).
rouge(R,C) :- s(R,C,0).

red_between_row_right(R,C,C2) :- C < X, X < C2, rouge(R,X), bleu(R,C), bleu(R,C2).
see_each_other_row_right((R,C),(R,C2)) :- C < C2, not red_between_row_right(R,C,C2), bleu(R,C), bleu(R,C2).
see_each_other_row_left((R,C),(R,C2)) :- C > C2, not red_between_row_right(R,C2,C), bleu(R,C), bleu(R,C2).

red_between_column_right(C,R,R2) :- R < X, X < R2, rouge(X,C), bleu(R,C), bleu(R2,C).
see_each_other_column_right((R,C),(R2,C)) :- R < R2, not red_between_column_right(C,R,R2), bleu(R,C), bleu(R2,C).
see_each_other_column_left((R,C),(R2,C)) :- R > R2, not red_between_column_right(C,R2,R), bleu(R,C), bleu(R2,C).

:- s(R,C,V), X_row_right = #count { C2 : see_each_other_row_right((R,C),(R,C2)) },
	     X_row_left = #count { C2 : see_each_other_row_left((R,C),(R,C2)) },
	     X_column_right = #count { R2 : see_each_other_column_right((R,C),(R2,C)) },
	     X_column_left = #count { R2 : see_each_other_column_left((R,C),(R2,C)) },
	     V != X_row_right+X_row_left+X_column_right+X_column_left.

#show s/3.
