iz1:-start(Res),write(Res).

elemCount([],X,Acc):-Acc = X.
elemCount([_|T],X,Acc):-X1 is X+1,elemCount(T,X1,Acc).

isPeriod([],_,_).
isPeriod(G,P,Per1):-P = [], append(P,Per1,T), isPeriod(G,T,Per1).
isPeriod([H|T],[X|Y],Per1):-H=X,isPeriod(T,Y,Per1).

search([_,_|T],R1):-search_1(T,R1,[]).
search_1([],_,_):-!.
search_1([H|T],R1,Per):-
    append([H],Per,Per1),
    isPeriod([H|T],Per1,Per1),
    Rr is R1 + 1,
    search_1(T,Rr,Per1).
search_1([_|T],R1,Per):-search_1(T,R1,Per).

start_1(_,N,N).
start_1(Res,N,I):-
    Fr is 1/I,
    name(Fr,FrList),
    search(FrList,R1),
    R1 > Res,
    I1 is I + 1,
    start_1(R1,N,I1).
start_1(Res,N,I):-
    I1 is I + 1,
    start_1(Res,N,I1).

start(Res):-start_1(0,1000,2).

