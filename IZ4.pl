fac("����������").
fac("��������������").
fac("����������").

student("�����").
student("����").
student("������").

launch:-student(X),
	student(Y),
	student(Z),
	not(X = Y),
	not(X = Z),
	not(Y = Z),

