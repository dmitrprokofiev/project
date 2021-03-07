import pyautogui, time
time.sleep(5)

#открытие вкладок
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


#выгрузка отчетов заправки и сливы
data = { 'koordinate29' : 478, 'koordinate40' : 500, 'uchastock29' : "29", 'uchastock40' : "40", 'atz137' : "137",
		'atz223' : "223", 'atz895' : "895", 'koordinate137' : 624, 'koordinate223' : 520, 'koordinate895' : 605,
		'koordinate276' : 520, 'atz276' : "276"}
#значение координат будет меняться по вертикали. По горизонтали статичный пиксель
def sliv(koordinate, name):
	pyautogui.click(76, koordinate) #клик на участке 
	time.sleep(30)
	pyautogui.rightClick(551, 399)
	pyautogui.click(647, 472)
	pyautogui.click(694, 404)
	distance = 270
	pyautogui.dragRel(-distance, 0, duration = 0.2)
	pyautogui.press('backspace')
	pyautogui.typewrite(name)
	pyautogui.click(838, 468)
	time.sleep(5)
	pyautogui.click(76, koordinate) #клик на участке 

def search():    # функция очистки поисковой строки
	pyautogui.click(99, 312) #окошко поиска
	time.sleep(1)
	distance = 100
	pyautogui.dragRel(-distance, 0, duration = 0.2)
	pyautogui.press('backspace')

search()
pyautogui.typewrite('29-1')
pyautogui.press('enter')
sliv(data['koordinate29'], data['uchastock29'])
sliv(data['koordinate40'], data['uchastock40'])

#выгрузка АТЗ

def loadDT(atz, adress):
	pyautogui.click(396, 88) #выдачи заливы и сливы
	time.sleep(1)
	pyautogui.click(99, 312) #окошко поиска
	time.sleep(0.5)
	pyautogui.typewrite(atz)
	pyautogui.press('enter')
	time.sleep(2)
	pyautogui.click(106, adress) #координаты АТЗ  на мониторе
	time.sleep(1)
	deletename(atz)
	time.sleep(1)
	pyautogui.click(636, 87) #журнал
	time.sleep(15)
	deletename(atz)
	time.sleep(55)
	pyautogui.click(106, adress)
	time.sleep(1)


def deletename(name): # функция выгрузки
	pyautogui.rightClick(551, 399)
	time.sleep(2)
	pyautogui.click(647, 472)
	time.sleep(1)
	pyautogui.click(694, 404)
	time.sleep(1)
	distance = 270
	pyautogui.dragRel(-distance, 0, duration = 0.2)
	pyautogui.press('backspace')
	pyautogui.typewrite(name)
	pyautogui.click(838, 468)

search()
loadDT(data['atz137'], data['koordinate137'])
search()
loadDT(data['atz276'], data['koordinate276']) #заменить на 276 Atz