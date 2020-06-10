read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X),append(List,[X],List1),read_list(List1,A,I1,N).

getEdges(0, Acc, Acc) :- !.
getEdges(Number, List, Acc) :-
	write('������ �������: '), read(From),
	write('������ �������: '), read(To),
	nl,
	NT is Number - 1,
	append([[From, To], [To, From]], Acc, Appended),
	getEdges(NT, List, Appended).

iz6:-
	write("������� ���������� ������ � �����: "), read(VN),
	read_list(Vertexes, VN),
	write('Entered vertexes: '), write(Vertexes), nl, nl,

	write('������� ���������� �����: '), read(EN),
	getEdges(EN, Edges, []).

