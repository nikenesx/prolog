fac("Физический").
fac("Математический").
fac("Химический").

student("Роман").
student("Петр").
student("Сергей").

in_list([H|_],H).
in_list([_|T],H):-in_list(T,H).

launch:-student(X),
	student(Y),
	student(Z),

	not(X = Y),
	not(X = Z),
	not(Y = Z),

        Data = [[X, "Физический"], [Y, "Математический"], [Z, "Химический"]],


