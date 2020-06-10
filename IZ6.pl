read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X),append(List,[X],List1),read_list(List1,A,I1,N).

sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

getEdges(0, Acc, Acc) :- !.
getEdges(Number, List, Acc) :-
	write('Первая вершина: '), read(From),
	write('Вторая вершина: '), read(To),
	nl,
	NT is Number - 1,
	append([[From, To], [To, From]], Acc, Appended),
	getEdges(NT, List, Appended).

temp(VertexesSubset, Edges, Vertexes) :-
	getAllAdjForList(VertexesSubset, Edges, Vertexes, [], R),
	append(R, VertexesSubset, RWithSub),
	unique_elems(RWithSub, RWithSubUn),
	isSimilarList(RWithSubUn, Vertexes).

iz(Vertexes, Edges, VN, VN) :- write("Число равняется: "), write(VN), write("."), nl, !.

iz(Vertexes, Edges, Size, VN) :-
	forall(
		(
			sochet(VertexesSubset, Size, Vertexes),
			temp(VertexesSubset, Edges, Vertexes)
		),

		(
			write("Число равняется "), write(Size), nl, !, fail
		 )
	),

	S1 is Size + 1,
	iz(Vertexes, Edges, S1, VN).


iz6:-
	write("Введите количество вершин в графе: "), read(VN),
	read_list(Vertexes, VN),
	write('Entered vertexes: '), write(Vertexes), nl, nl,

	write('Введите количество ребер: '), read(EN),
	getEdges(EN, Edges, []),

	dynamic(result/1),
	not(iz(Vertexes, Edges, 1, VN)),
	abolish(result/1).


