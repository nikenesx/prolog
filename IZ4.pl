fac("����������").
fac("��������������").
fac("����������").

student("�����").
student("����").
student("������").

in_list([H|_],H).
in_list([_|T],H):-in_list(T,H).

launch:-student(X),
	student(Y),
	student(Z),

	not(X = Y),
	not(X = Z),
	not(Y = Z),

        Data = [[X, "����������"], [Y, "��������������"], [Z, "����������"]],


