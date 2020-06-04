iz2:-read(N),read_list(A,N),new_list(A,[],Result),delR(Result,R), write(R).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-
    I1 is I+1,read(X),
    append(List,[X],List1),
    read_list(List1,A,I1,N).

delR([],[]).
delR([H|T],[H|Y]):-
    delE(H,T,R),!,
    delR(R,Y).

delE(_,[],[]).
delE(H,[H|T],R):-!,
    delE(H,T,R).
delE(H,[X|T],[X|R]):-!,
    delE(H,T,R).

isPrime(X):-isPrime_1(X,2).
isPrime_1(X,X).
isPrime_1(X,P):-
    Temp is X mod P,
    Temp > 0,
    P1 is P+1,
    isPrime_1(X,P1).

delit(H,C):-delit_1(H,_,2,C).
delit_1(H,B,H,C):-C=B.
delit_1(H,B,I,C):-
    Temp is H mod I,
    Temp = 0,
    isPrime(I),
    append(B,[I],B1),
    I1 is I + 1,
    delit_1(H,B1,I1,C).

delit_1(H,B,I,C):-
    I1 is I+1,
    delit_1(H,B,I1,C).

new_list([],Result,Result2):-Result2 = Result.
new_list([H|T],Result,Result2):-
    delit(H,Temp1),
    append(Temp1,Result,ResultT),
    new_list(T,ResultT,Result2).


