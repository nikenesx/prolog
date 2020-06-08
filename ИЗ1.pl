iz1:-start(Res),write(Res).

isPeriod(List,List2):-isPeriod_1(List,List2,List2,0).
isPeriod_1(_,_,_,2).
isPeriod_1([],_,_,2).
isPeriod_1(G,P,Per1,I):-
    P = [],
    append(P,Per1,T),
    I1 is I + 1,
    isPeriod_1(G,T,Per1,I1).
isPeriod_1([H|T],[X|Y],Per1,I):-
    H = X,
    isPeriod_1(T,Y,Per1,I).

searchPeriod([_,_|Tail],R1):-searchPeriod_1(Tail,[],R1,0,Tail).
searchPeriod_1([],_,R1,I,_):- R1 = I.
searchPeriod_1([H|_],Acc,R1,I,Tail):-
    I < 9,
    append(Acc,[H],Acc1),
    I1 is I+1,
    isPeriod(Tail,Acc1),
    searchPeriod_1([],Acc,R1,I1,Tail).
searchPeriod_1([H|T],Acc,R1,I,Tail):-
    I < 9,
    append(Acc,[H],Acc1),
    I1 is I + 1,
    searchPeriod_1(T,Acc1,R1,I1,Tail).

start_1(_,N,N,Nn,T):-Nn = T.
start_1(Res,N,I,Nn,_):-
    Fr is 1/I,
    name(Fr,FrList),
    searchPeriod(FrList,R1),
    R1 > Res,
    Tt = Fr,
    I1 is I + 1,
    start_1(R1,N,I1,Nn,Tt).
start_1(Res,N,I,Nn,T):-
    I1 is I + 1,
    start_1(Res,N,I1,Nn,T).

start(Nn):-start_1(0,10,7,Nn,_).

