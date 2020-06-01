iz2:-read(N),delit(N,H), write(H).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X), append(List,[X],List1), read_list(List1,A,I1,N).

delit(N,H):-delit_1(N,H,1).
delit_1(N,_,C):-N=C.
delit_1(N,[A|B],C):-N mod C = 0, A is C, C1 is C + 1, delit_1(N,B,C1).
delit_1(N,L,C):-C1 is C+1, delit_1(N,L,C1).

del([],[]).
del([H|T],[X|Y]):-d(2,H,X), del(T,Y).
