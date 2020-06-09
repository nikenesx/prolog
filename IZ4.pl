student("Роман").
student("Петр").
student("Сергей").

in_list([H|_],H).
in_list([_|T],H):-in_list(T,H).

iz4:-
    student(X),
    student(Y),
    student(Z),

    not(X = Y),
    not(X = Z),
    not(Y = Z),

    Data = [[X, "Физический"], [Y, "Математический"], [Z, "Химический"]],

    (
        ((in_list(Data, ["Петр", "Математический"]),
        not(in_list(Data, ["Сергей", "Физический"])));
        not(in_list(Data, ["Петр", "Математический"]))),

        ((not(in_list(Data, ["Роман", "Физический"])),
        in_list(Data, ["Петр", "Математический"]));
        in_list(Data, ["Роман", "Физический"])),

        ((not(in_list(Data, ["Сергей", "Математический"])),
        in_list(Data, ["Роман", "Химический"]));
        in_list(Data, ["Сергей", "Математический"]))
    ),
    write(Data).
