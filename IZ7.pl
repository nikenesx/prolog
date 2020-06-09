:- dynamic car/7.

iz7:-
    write("����� ��������� ������ ����������?"), nl,
    write("1. A"), nl,
    write("2. B"), nl,
    write("3. C"), nl,
    write("4. D"), nl,
    read(Category), nl,

    write("��� ���������� ����������� �� ������ ������?"), nl,
    write("1. ��"), nl,
    write("2. ���"), nl,
    read(IsAliveNow), nl,

    write("����� ��� ������ � ������ ����������?"), nl,
    write("1. �����"), nl,
    write("2. �������"), nl,
    write("3. ���������"), nl,
    write("4. �����������"), nl,
    write("5. ����"), nl,
    read(BodyType), nl,

    write("� ������ ������� ����������� ����� ������ ����������?"), nl,
    write("1. ����"), nl,
    write("2. ������"), nl,
    write("3. �������"), nl,
    write("4. ����"), nl,
    read(RegionOfProduction), nl,

    write("������ ������������ ������� ����?"), nl,
    write("1. �������������� ����������"), nl,
    write("2. ���������������� ����������"), nl,
    write("3. �������������� ����������"), nl,
    write("4. ����"), nl,
    read(Composition), nl,

    write("����� ��� ������ � ����� ������?"), nl,
    write("1. ������ / ������"), nl,
    write("2. �������������"), nl,
    write("3. ������"), nl,
    read(MotorType), nl,

    forall(
               (car(Name, Category, IsAliveNow, BodyType, RegionOfProduction, Composition, MotorType),
                write("��� ���������� - "), write(Name), write("?"), nl,
                write("1. ��"), nl,
                write("2. ���"), nl,
                read(Answer),
                Answer = 1),

               (fail)
	),

	write("������ ���������� ��� � ���� ������. ������� ��������:"), read(NewCarName),
	assert(car(NewCarName, Category, IsAliveNow, BodyType, RegionOfProduction, Composition, MotorType)),
	write("���������� �������� � ��!"), save('c:/Users/who/Desktop/db.pl').
