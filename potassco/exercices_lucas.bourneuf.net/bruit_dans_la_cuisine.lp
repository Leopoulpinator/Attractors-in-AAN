next_room(0,9).
next_room(4,(3;5)).
next_room(6,(3;13;5)).
next_room(7,(0;1;2;3;8;12;13)).
next_room(8,(9;11)).
next_room(10,(9;11)).
next_room(11,(10;12)).
next_room(X,Y) :- next_room(Y,X).

sound(4,10).

sound(Next_room,T-1) :- sound(Room,T), T > 1, next_room(Room, Next_room).

max_sound(Room,T) :- sound(Room,T); not sound(Room,U) : U > T, sound(Room,U).

#show max_sound/2.
