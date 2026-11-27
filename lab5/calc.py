# Лабораторная работа №5. Калькулятор юрфирмы
# Ставки придуманы для задачи, это не закон.


# Госпошлина по иску: 1% от суммы иска, но не меньше 2000 тенге
def fee(amount):
    result = amount * 0.01
    if result < 2000:
        return 2000
    return result


# Стоимость консультации: 15 000 тенге за час, студенту скидка 50%
def consult(hours, client):
    price = hours * 15000
    if client == "студент":
        price = price * 0.5
    return price


# Штраф за скорость: смотрим, на сколько превышена скорость
def fine(speed, limit):
    over = speed - limit
    if over <= 10:
        return 0
    elif over <= 20:
        return 15000
    else:
        return 40000


# Моя функция: хранение коробок с делами в архиве фирмы.
# Обычно 3000 тенге за коробку в месяц,
# если коробок больше 10, то оптом по 2000 тенге.
def archive(boxes, months):
    if boxes > 10:
        price = 2000
    else:
        price = 3000
    return boxes * price * months


# Проверки части А (ответы должны совпасть с таблицей)
print(fee(500000))
print(fee(100000))
print(consult(2, "студент"))
print(consult(2, "компания"))
print(fine(65, 60))
print(fine(75, 60))
print(fine(90, 60))

# Проверки моей функции
print(archive(5, 2))
print(archive(20, 3))


# Меню
print("1 госпошлина, 2 консультация, 3 штраф за скорость, 4 хранение в архиве")
try:
    choice = int(input("Что считаем? "))
    if choice == 1:
        amount = int(input("Сумма иска: "))
        print("Госпошлина:", fee(amount))
    elif choice == 2:
        hours = int(input("Сколько часов: "))
        client = input("Кто клиент (студент или компания): ")
        print("Консультация:", consult(hours, client))
    elif choice == 3:
        speed = int(input("Скорость: "))
        limit = int(input("Ограничение скорости: "))
        print("Штраф:", fine(speed, limit))
    elif choice == 4:
        boxes = int(input("Сколько коробок: "))
        months = int(input("Сколько месяцев: "))
        print("Хранение в архиве:", archive(boxes, months))
    else:
        print("Нет такого пункта")
except ValueError:
    print("Нужно ввести число")
