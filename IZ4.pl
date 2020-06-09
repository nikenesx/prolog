student("�����").
student("����").
student("������").

in_list([H|_],H).
in_list([_|T],H):-in_list(T,H).

iz4:-
    student(X),
    student(Y),
    student(Z),

    not(X = Y),
    not(X = Z),
    not(Y = Z),

    Data = [[X, "����������"], [Y, "��������������"], [Z, "����������"]],

    (
        ((in_list(Data, ["����", "��������������"]),
        not(in_list(Data, ["������", "����������"])));
        not(in_list(Data, ["����", "��������������"]))),

        ((not(in_list(Data, ["�����", "����������"])),
        in_list(Data, ["����", "��������������"]));
        in_list(Data, ["�����", "����������"])),

        ((not(in_list(Data, ["������", "��������������"])),
        in_list(Data, ["�����", "����������"]));
        in_list(Data, ["������", "��������������"]))
    ),
    write(Data).
