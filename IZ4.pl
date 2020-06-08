fac("Физический").
fac("Математический").
fac("Химический").

student("Роман").
student("Петр").
student("Сергей").

launch:-student(X),
	student(Y),
	student(Z),
	not(X = Y),
	not(X = Z),
	not(Y = Z),

