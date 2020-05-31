pr:-read(N),read_list(A,N),del(A,B),mop(B,C), write(C).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X), append(List,[X],List1), read_list(List1,A,I1,N).

delit(0,0,[]):-!.
delit(H,K,[A|B]):-K1 is K-1,.

mop([],[]).
mop([H|T],[X|Y]):-X is H, mop(T,Y).

min([],[]):-!.
min([H|T],[X|Y]):-delit(H,H,X), min(T,Y).

del([],[]).
del([H|T],[X|Y]):-X is H/2, del(T,Y).
