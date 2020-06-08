iz1:-start(Res),pp(Res,Per),write(Per).

pp(Res,Per):-pp_1(Res,Per,0,_).
pp_1([],Per,_,C):-Per = C.
pp_1([[V1,V2]|T],Per,I,_):-
    V2 > I,
    pp_1(T,Per,V2,V1).
pp_1([_|T],Per,I,C):- pp_1(T,Per,I,C).


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
searchPeriod_1(_,25,R1,I,_):-R1 = I.
searchPeriod_1([],_,_,_,_):- fail.
searchPeriod_1([H|T],Acc,R1,I,Tail):-
    I < 9,
    append(Acc,[H],Acc1),
    I1 is I+1,
    T\=[],
    isPeriod(Tail,Acc1),
    searchPeriod_1([],25,R1,I1,Tail).
searchPeriod_1([H|T],Acc,R1,I,Tail):-
    I < 10,
    append(Acc,[H],Acc1),
    I1 is I + 1,
    searchPeriod_1(T,Acc1,R1,I1,Tail).

start_1(R,N,N,Nn,_):-Nn = R.
start_1(R,N,I,Nn,_):-
    Fr is 1/I,
    name(Fr,FrList),
    searchPeriod(FrList,R1),
    append(R,[[I,R1]],K),
    Tt = Fr,
    I1 is I + 1,
    start_1(K,N,I1,Nn,Tt).
start_1(Res,N,I,Nn,T):-
    I1 is I + 1,
    start_1(Res,N,I1,Nn,T).

start(Nn):-start_1([],1000,2,Nn,_).

