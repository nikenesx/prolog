iz1:-start(Res),write(Res).

d:-search([1,2,3],X),write(X).

ifMore(R1,Res,Res1):-
    R1 > Res,
    Res1 = R1.
ifMore(_,Res,Res1):-
    Res1 = Res.

countElem([],_).
countElem([_|T],X):-X1 is X+1,countElem(T,X1).

search([_,_|T],R1):-search_1(T,R1,[],T).
search_1([H|_],R1,Per,TS):-append(H,Per,Per1), isPeriod(Per1,TS),X is 0,countElem(Per1,X),R1 = X.
search_1([_|T],R1,Per,TS):-search(T,R1,Per,TS).

start_1(_,N,N).
start_1(Res,N,I):-
    Fr is 1/N,
    name(Fr,FrList),
    search(FrList,R1),
    ifMore(R1,Res,Res1),
    I1 is I + 1,
    start_1(Res1,N,I1).
start(Res):-start_1(Res,1000,2).
