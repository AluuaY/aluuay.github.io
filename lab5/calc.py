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


# Проверки части А (ответы должны совпасть с таблицей)
print(fee(500000))
print(fee(100000))
print(consult(2, "студент"))
print(consult(2, "компания"))
print(fine(65, 60))
print(fine(75, 60))
print(fine(90, 60))
