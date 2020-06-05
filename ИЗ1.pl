iz1:-start(Res),write(Res).
d:-X is 1/3,name(X,X1),pr(X1,D),write(D).
pr([V1,V2|T],D):-append(T,[],D).

ifMore(R1,Res,Res1):-
    R1 > Res,
    Res1 = R1.
ifMore(_,Res,Res1):-
    Res1 = Res.

search([],_).
search([H|T],R1):-H = 46, search_1(T,R1).
search([_|T],R1):-search(T,R1).


start(Res):-start_1(Res,1000,2).
start_1(_,N,N).
start_1(Res,N,I):-
    Fr is 1/N,
    name(Fr,FrList),
    search(FrList,R1),
    ifMore(R1,Res,Res1),
    I1 is I + 1,
    start_1(Res1,N,I1).

