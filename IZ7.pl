:- dynamic car/7.

car("Infinity QX60", 2, 1, 5, 1, 2, 1).
car("Volkswagen Tiguan", 2, 1, 4, 2, 3, 1).
car("Lada Granta", 2, 1, 1, 2, 1, 1).
car("Lada Priora", 2, 2, 2, 2, 2, 1).

car("Audi Q5", 2, 1, 4, 2, 3, 1).
car("КамАЗ-65207", 3, 1, 5, 2, 2, 1).
car("ТОНАР-7502", 3, 2, 5, 2, 3, 1).
car("MAN TGS", 3, 2, 5, 2, 2, 1).

car("Navistar 9000", 3, 2, 5, 3, 1, 1).
car("ПАЗ-3205 (классический 80-х годов)", 4, 2, 5, 2, 1).
car("КамАЗ-6282", 4, 2, 5, 2, 3, 2).
car("Tesla Roadster", 2, 2, 5, 3, 2).

car("Tesla Cybertruck", 2, 1, 4, 3, 2).
car("Chevrolet Volt", 2, 1, 2, 3, 2, 3).
car("Ford Fusion", 2, 1, 2, 3, 2, 3).
car("Honda Insight", 1, 1, 2, 1, 2, 3).
car("Lexus RX 450h", 2, 1, 4, 2, 3, 3).

iz7:-
    write("Какая категория вашего автомобиля?"), nl,
    write("1. A"), nl,
    write("2. B"), nl,
    write("3. C"), nl,
    write("4. D"), nl,
    read(Category), nl,

    write("Ваш автомобиль выпускается на данный момент?"), nl,
    write("1. Да"), nl,
    write("2. Нет"), nl,
    read(IsAliveNow), nl,

    write("Какой тип кузова у вашего автомобиля?"), nl,
    write("1. Седан"), nl,
    write("2. Хэтчбек"), nl,
    write("3. Универсал"), nl,
    write("4. Внедорожник"), nl,
    write("5. Иной"), nl,
    read(BodyType), nl,

    write("К какому региону принадлежит марка вашего автомобиля?"), nl,
    write("1. Азия"), nl,
    write("2. Европа"), nl,
    write("3. Америка"), nl,
    write("4. Иной"), nl,
    read(RegionOfProduction), nl,

    write("Каково расположение ведущих колёс?"), nl,
    write("1. Заднеприводная компоновка"), nl,
    write("2. Переднеприводная компоновка"), nl,
    write("3. Полноприводная компоновка"), nl,
    write("4. Иной"), nl,
    read(Composition), nl,

    write("Какой вид мотора у вашей машины?"), nl,
    write("1. Бензин / дизель"), nl,
    write("2. Электричество"), nl,
    write("3. Гибрид"), nl,
    read(MotorType), nl,

    forall(
               (car(Name, Category, IsAliveNow, BodyType, RegionOfProduction, Composition, MotorType),
                write("Ваш автомобиль - "), write(Name), write("?"), nl,
                write("1. Да"), nl,
                write("2. Нет"), nl,
                read(Answer),
                Answer = 1),

               (fail)
	),

	write("Вашего автомобиля нет в базе данных. Введите название:"), read(NewCarName),
	assert(car(NewCarName, Category, IsAliveNow, BodyType, RegionOfProduction, Composition, MotorType)),
	write("Автомобиль добавлен в БД!"), save('c:/Users/who/Desktop/db.pl').

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
