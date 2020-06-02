iz2:-read(N),read_list(A,N),new_list(A,B,R,[]), write(R).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-
    I1 is I+1,read(X),
    append(List,[X],List1),
    read_list(List1,A,I1,N).

notBelong(_,[]).
notBelong(M,[X|Y]):-M \= X, notBelong(M,Y).


isPrime(X):-isPrime_1(X,2).
isPrime_1(X,X).
isPrime_1(X,P):-
    Temp is X mod P,
    Temp > 0,
    P1 is P+1,
    isPrime_1(X,P1).

delit(N,B):-delit_1(N,B,2).
delit_1(N,[],N).
delit_1(N,[X|Y],I):-
    Temp is N mod I,
    Temp = 0,
    isPrime(I),
    X is I,
    I1 is I + 1,
    delit_1(N,Y,I1).

delit_1(N,B,I):-
    I1 is I+1,
    delit_1(N,B,I1).

new_list([],[],R,RAcc) :- R = RAcc, !.
new_list([H|T],[X|Y],R, RAcc):-
    delit(H,X),
    append(RAcc, X, R1),
    new_list(T,Y,R,R1).
