#!/usr/bin/env python
# coding: utf-8

# In[1]:


# 1. Создать класс TrafficLight (светофор).

# ● определить у него один атрибут color (цвет) и метод running (запуск);
# ● атрибут реализовать как приватный;
# ● в рамках метода реализовать переключение светофора в режимы: красный, жёлтый,
# зелёный;
# ● продолжительность первого состояния (красный) составляет 7 секунд, второго
# (жёлтый) — 2 секунды, третьего (зелёный) — на ваше усмотрение;
# ● переключение между режимами должно осуществляться только в указанном порядке
# (красный, жёлтый, зелёный);
# ● проверить работу примера, создав экземпляр и вызвав описанный метод.

# Задачу можно усложнить, реализовав проверку порядка режимов. При его нарушении
# выводить соответствующее сообщение и завершать скрипт.


# In[31]:


import time

class TrafficLight: #класс
    __position_color = ['RED', 'YELLOW', 'GREEN']
        
    def running(self): # метод запуск
        print(self.__position_color[0])
        time.sleep(7)
        print(self.__position_color[1])
        time.sleep(2)
        print(self.__position_color[2])
        time.sleep(4)
        
        while True:
            self.running()
        
color = TrafficLight()
color.running()


# In[2]:


# 2. Реализовать класс Road (дорога).

# ● определить атрибуты: length (длина), width (ширина);
# ● значения атрибутов должны передаваться при создании экземпляра класса;
# ● атрибуты сделать защищёнными;
# ● определить метод расчёта массы асфальта, необходимого для покрытия всей дороги;
# ● использовать формулу: длина*ширина*масса асфальта для покрытия одного кв. метра
# дороги асфальтом, толщиной в 1 см*число см толщины полотна;
# ● проверить работу метода.

# Например: 20 м*5000 м*25 кг*5 см = 12500 т.


# In[45]:


class Road:
    def __init__(self, length, width):
        self._length = length
        self._width = width
        self.h = 5
        self.m = 30
    
    def mass(self):
        return self._length * self._width * self.h * self.m / 1000

itog = Road(2000, 80)
itog.mass()
    


# In[3]:


# 3. Реализовать базовый класс Worker (работник).

# ● определить атрибуты: name, surname, position (должность), income (доход);
# ● последний атрибут должен быть защищённым и ссылаться на словарь, содержащий
# элементы: оклад и премия, например, {"wage": wage, "bonus": bonus};
# ● создать класс Position (должность) на базе класса Worker;
# ● в классе Position реализовать методы получения полного имени сотрудника
# (get_full_name) и дохода с учётом премии (get_total_income);
# ● проверить работу примера на реальных данных: создать экземпляры класса Position,
# передать данные, проверить значения атрибутов, вызвать методы экземпляров.


# In[56]:


class Worker:
    def __init__(self, name, surname, position, wage, bonus):
        self.name = name
        self.surname = surname
        self.position = position
        self._income = {"wage": int(wage), "bonus": (bonus)}
    
class Position(Worker):
    def __init__(self, name, surname, position, wage, bonus):
        super().__init__(name, surname, position, wage, bonus)
        
    def get_full_name(self):
        return f'{self.name} {self.surname}'
    
    def get_total_income(self):
        return self._income["wage"] + self._income["bonus"]

result = Position('Vasya', 'Pupkin', 'HR', 1000, 56)
print(result.get_full_name(), result.get_total_income())


# In[4]:


# 4. Реализуйте базовый класс Car.

# ● у класса должны быть следующие атрибуты: speed, color, name, is_police (булево). А
# также методы: go, stop, turn(direction), которые должны сообщать, что машина
# поехала, остановилась, повернула (куда);
# ● опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar;
# ● добавьте в базовый класс метод show_speed, который должен показывать текущую
# скорость автомобиля;
# ● для классов TownCar и WorkCar переопределите метод show_speed. При значении
# скорости свыше 60 (TownCar) и 40 (WorkCar) должно выводиться сообщение о
# превышении скорости.

# Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам,
# выведите результат. Вызовите методы и покажите результат.


# In[70]:


class Car:
    def __init__(self, speed, color, name, is_police):
        self.speed = speed
        self.color = color
        self.name = name
        self.is_police = False
        
    def go(self):
        return f'ТС {self.name} тронулось с места'
    
    def stop(self):
        return f'ТС {self.name} остановилось'
    
    def turn(self, left_right):
        return f'ТС {self.name} повернуло {left_right}'
    
    def show_speed(self, speed):
        return f'Скорость {self.speed}'
    
class TownCar(Car):
    
    def show_speed(self):
        if self.speed > 60:
            return f'Вы привысили на скорость'
        return self.speed
    
class SportCar(Car):
    pass

class WorkCar(Car):
    def show_speed(self):
        if self.speed > 40:
            return f'Вы привысили на скорость'
        return f'Скорость {self.speed}'
    
class PoliceCar(Car):
    pass

T_CAR = TownCar(100, 'green', 'IVECO', False)
S_CAR = SportCar(260, 'red', 'Ferrari', True)
W_CAR = WorkCar(39, 'orange', 'mazda', False)
P_CAR = PoliceCar(150, 'blue', 'UAZ', True)

print(T_CAR.speed, T_CAR.name, T_CAR.color, T_CAR.is_police)
print(S_CAR.speed, S_CAR.name, S_CAR.color, S_CAR.is_police)
print(W_CAR.speed, W_CAR.name, W_CAR.color, W_CAR.is_police)
print(P_CAR.speed, P_CAR.name, P_CAR.color, P_CAR.is_police)

print(f'{T_CAR.go()}\n{T_CAR.stop()}\n{T_CAR.turn("налево")}\n{T_CAR.show_speed()}')
print(f'{S_CAR.go()}\n{S_CAR.stop()}\n{S_CAR.turn("налево")}')
print(f'{W_CAR.go()}\n{W_CAR.stop()}\n{W_CAR.turn("налево")}\n{W_CAR.show_speed()}')
print(f'{P_CAR.go()}\n{P_CAR.stop()}\n{P_CAR.turn("налево")}')


# In[5]:


# 5. Реализовать класс Stationery (канцелярская принадлежность).

# ● определить в нём атрибут title (название) и метод draw (отрисовка). Метод выводит
# сообщение «Запуск отрисовки»;
# ● создать три дочерних класса Pen (ручка), Pencil (карандаш), Handle (маркер);
# ● в каждом классе реализовать переопределение метода draw. Для каждого класса
# метод должен выводить уникальное сообщение;
# ● создать экземпляры классов и проверить, что выведет описанный метод для каждого
# экземпляра.


# In[93]:


class Stationery:
    title: str

    def draw(self):
        return 'Запуск отрисовки'

class Pen(Stationery):
    title = 'Pen'

    def draw(self):
        return self.title

class Pencil(Stationery):
    title = 'Pencil'

    def draw(self):
        return self.title

class Handle(Stationery):
    title = 'Handle'

    def draw(self):
        return self.title


p = Pen()
pc = Pencil()
h = Handle()
s = Stationery()

print(s.draw())
print(h.draw())
print(p.draw())
print(pc.draw())


# In[ ]:




