:- dynamic car/7.

car("Infinity QX60", 2, 1, 5, 1, 2, 1).
car("Volkswagen Tiguan", 2, 1, 4, 2, 3, 1).
car("Lada Granta", 2, 1, 1, 2, 1, 1).
car("Lada Priora", 2, 2, 2, 2, 2, 1).

car("Audi Q5", 2, 1, 4, 2, 3, 1).
car("�����-65207", 3, 1, 5, 2, 2, 1).
car("�����-7502", 3, 2, 5, 2, 3, 1).
car("MAN TGS", 3, 2, 5, 2, 2, 1).

car("Navistar 9000", 3, 2, 5, 3, 1, 1).
car("���-3205 (������������ 80-� �����)", 4, 2, 5, 2, 1).
car("�����-6282", 4, 2, 5, 2, 3, 2).
car("Tesla Roadster", 2, 2, 5, 3, 2).

car("Tesla Cybertruck", 2, 1, 4, 3, 2).
car("Chevrolet Volt", 2, 1, 2, 3, 2, 3).
car("Ford Fusion", 2, 1, 2, 3, 2, 3).
car("Honda Insight", 1, 1, 2, 1, 2, 3).
car("Lexus RX 450h", 2, 1, 4, 2, 3, 3).

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

save(Filename) :-
    tell(Filename),
    forall(
                (car(Name, Category, IsAliveNow, BodyType, RegionOfProduction, Composition, MotorType)),
		(write(":- car(\""),
                 write(Name),
                 write("\", "),
                 write(Category),
                 write(", "),
                 write(IsAliveNow),
                 write(", "),
                 write(BodyType),
                 write(", "),
                 write(RegionOfProduction),
                 write(", "),
                 write(Composition),
                 write(", "),
                 write(MotorType),
                 write(")."), nl)
	), told.
