import pyautogui, time

time.sleep(5)

# открытие вкладок
pyautogui.click(450,750) #вкладка браузера
pyautogui.PAUSE = 2
pyautogui.click(396, 92) # добавить отчет
pyautogui.PAUSE = 2
pyautogui.click(376, 303) # выдачи заливы и сливы топлива
pyautogui.PAUSE = 2
pyautogui.click(560, 92)
pyautogui.PAUSE = 2
pyautogui.click(362, 405) # журнал
pyautogui.PAUSE = 2
pyautogui.click(805, 94)
pyautogui.PAUSE = 2
pyautogui.click(370, 455) # заправки и сливы


# выгрузка отчетов заправки и сливы
data = {'koordinate10-8': 500, 'uchastock10-8': '10-8',
        'koordinate41-1': 520, 'uchastock41-1': '41-1',
		'koordinate44-1': 436, 'uchastock44-1': '44-1',
		'koordinate786': 625, 'atz786': '786',
		'koordinate021': 521, 'atz021': '5557',
		'koordinate523': 521, 'atz523': '523',
		'koordinate504': 519, 'atz504': '504',
		'koordinate259': 500, 'atz259': '259',
		'koordinate685': 500, 'atz685': '685',
		'koordinate310': 500, 'atz310': '310'
		}


# значение координат будет меняться по вертикали. По горизонтали статичный пиксель
def sliv(k, koordinate, name):
    pyautogui.click(k, koordinate)  # клик на участке
    time.sleep(30)
    pyautogui.rightClick(551, 399)
    pyautogui.click(647, 472)
    pyautogui.click(694, 404)
    distance = 270
    pyautogui.dragRel(-distance, 0, duration=0.2)
    pyautogui.press('backspace')
    pyautogui.typewrite(name)
    pyautogui.click(838, 468)
    time.sleep(5)
    pyautogui.click(k, koordinate)  # клик на участке


def search():  # функция очистки поисковой строки
    pyautogui.click(99, 312)  # окошко поиска
    time.sleep(1)
    distance = 100
    pyautogui.dragRel(-distance, 0, duration=0.2)
    pyautogui.press('backspace')


# search()
# # pyautogui.typewrite('10-8')
# # pyautogui.press('enter')
# # sliv(76, data['koordinate10-8'], data['uchastock10-8'])
# # sliv(76, data['koordinate41-1'], data['uchastock41-1'])
# # search()
# # pyautogui.typewrite('44-1')
# # pyautogui.press('enter')
# # sliv(66, data['koordinate44-1'], data['uchastock44-1'])


# выгрузка АТЗ

def loadDT(atz, adress):
    pyautogui.click(396, 88)  # выдачи заливы и сливы
    time.sleep(1)
    pyautogui.click(99, 312)  # окошко поиска
    time.sleep(0.5)
    pyautogui.typewrite(atz)
    pyautogui.press('enter')
    time.sleep(2)
    pyautogui.click(106, adress)  # координаты АТЗ  на мониторе
    time.sleep(1)
    deletename(atz)
    time.sleep(1)
    pyautogui.click(636, 87)  # журнал
    time.sleep(15)
    deletename(atz)
    time.sleep(55)
    pyautogui.click(106, adress)
    time.sleep(1)


def search():  # функция очистки поисковой строки
    pyautogui.click(99, 312)  # окошко поиска
    time.sleep(1)
    distance = 100
    pyautogui.dragRel(-distance, 0, duration=0.2)
    pyautogui.press('backspace')


def deletename(name):  # функция выгрузки
    pyautogui.rightClick(551, 399)
    time.sleep(2)
    pyautogui.click(647, 472)
    time.sleep(1)
    pyautogui.click(694, 404)
    time.sleep(1)
    distance = 270
    pyautogui.dragRel(-distance, 0, duration=0.2)
    pyautogui.press('backspace')
    pyautogui.typewrite(name)
    pyautogui.click(838, 468)


search()
loadDT(data['atz786'], data['koordinate786'])
search()
loadDT(data['atz021'], data['koordinate021'])
search()
loadDT(data['atz523'], data['koordinate523'])
search()
loadDT(data['atz504'], data['koordinate504'])
search()
loadDT(data['atz259'], data['koordinate259'])
search()
loadDT(data['atz685'], data['koordinate685'])
search()
loadDT(data['atz310'], data['koordinate310'])
