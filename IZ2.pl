iz2:-read(N),read_list(A,N),new_list(A,B),razb(B,C),write(C).
prime:-read(N),isPrime(N).
bel:-read(N), notBelong(N,[1,2,3,4]).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-
    I1 is I+1,read(X),
    append(List,[X],List1),
    read_list(List1,A,I1,N).

notBelong(_,[]).
notBelong(M,[X|Y]):- M \= X ,belong(X,Y).

isPrime(X):-isPrime_1(X,2).
isPrime_1(X,X).
isPrime_1(X,P):-
    Temp is X mod P,
    Temp > 0,
    P1 is P+1,
    isPrime_1(X,P1).

delit(N,H):-delit_1(N,H,2).
delit_1(N,[],N).
delit_1(N,[A|B],C):-
    Temp is N mod C,
    Temp = 0,
    isPrime(C),
    notBelong(C,[A|B]),
    A is C,
    C1 is C + 1,
    delit_1(N,B,C1).

delit_1(N,L,C):-
    C1 is C+1,
    delit_1(N,L,C1).

new_list([],[]).
new_list([H|T],[X|Y]):-
    delit(H,X),
    new_list(T,Y).
