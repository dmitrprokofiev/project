import os
import win32com.client

data = {'10-8' : ["C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 10-8\\Заправки и сливы 10-8.xlsm", 'copy10'],
        '41-1' : ["C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 41-1\\Заправки и сливы 41-1.xlsm", 'copy41'],
        '44-1' : ["C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 44-1\\Заправки и сливы 44-1.xlsm", 'copy44'],
        '29-1' : ["C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 29-1\\Заправки и сливы 29.xlsm", 'copy29'],
        '40-1' : ["C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 40-1\\Заправки и сливы 40.xlsm", 'copy40']}

def zapravki(path, runMacros):
    xl = win32com.client.Dispatch("Excel.Application")
    wb = xl.Workbooks.Open(path)
    xl.Application.Run(runMacros)
    wb.Close(SaveChanges=True)
    xl.Quit()

# Отчет заправки и сливы
zapravki(data['10-8'][0], data['10-8'][1])
zapravki(data['29-1'][0], data['29-1'][1])
zapravki(data['40-1'][0], data['40-1'][1])
# zapravki(data['41-1'][0], data['41-1'][1])
# zapravki(data['44-1'][0], data['44-1'][1])


# ГСМ 10-8
xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 10-8\\Отчет ГСМ Уч.10-8 МАКРОСЫ.xlsm")
xl.Application.Run("deleteFil")
xl.Application.Run("part523copy")
xl.Application.Run("part523end")
# xl.Application.Run("part5557copy")
# xl.Application.Run("part5557end")
xl.Application.Run("part786copy")
wb.Application.DisplayAlerts=False # убирает всплывающее окно
atz = ['523', '5557', '786']
for i in atz:
    try:
        wb.Worksheets(i).Delete()
    except:
        pass
xl.Application.Run("importdata523") # добавить проверку на существование листа и удалять его если существует
# xl.Application.Run("importdata5557")
xl.Application.Run("importdata786")
wb.Close(SaveChanges=True)
xl.Quit()


# ГСМ 41-1
xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 41-1\\Отчет ГСМ Уч.41-1 МАКРОСЫ.xlsm")
xl.Application.Run("deleteFil")
xl.Application.Run("part504copy")
wb.Application.DisplayAlerts=False # убирает всплывающее окно
atz = ['504']
for i in atz:
    try:
        wb.Worksheets(i).Delete()
    except:
        pass
xl.Application.Run("importdata504")
wb.Close(SaveChanges=True)
xl.Quit()


# ГСМ 44-1 НАПИСАТЬ ФУНКЦИЮ ДЛЯ УДОБСТВА КОДА. Функция для одного АТЗ и трех атз
xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 44-1\\Отчет ГСМ Уч.44-1 МАКРОСЫ.xlsm")
xl.Application.Run("deleteFil")
xl.Application.Run("part259copy")
xl.Application.Run("part259end")
xl.Application.Run("part685copy")
xl.Application.Run("part685end")
xl.Application.Run("part310copy")
wb.Application.DisplayAlerts=False # убирает всплывающее окно
atz = ['259', '685', '310']
for i in atz:
    try:
        wb.Worksheets(i).Delete()
    except:
        pass
xl.Application.Run("importdata259") 
xl.Application.Run("importdata685")
xl.Application.Run("importdata310")
wb.Close(SaveChanges=True)
xl.Quit()

# ГСМ 29-1

xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 29-1\\Отчет ГСМ Уч.29-1 МАКРОСЫ.xlsm")
xl.Application.Run("deleteFil")
xl.Application.Run("part137copy")
try:
    wb.Worksheets(u'137').Delete()
except:
    pass
xl.Application.Run("importdata137")
wb.Close(SaveChanges=True)
xl.Quit()

# ГСМ 40-1

xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 40-1\\Отчет ГСМ Уч.40-3 МАКРОСЫ.xlsm")
xl.Application.Run("deleteFil")
try:
    wb.Worksheets(u'276').Delete()
except:
    pass
xl.Application.Run("part276copy")
wb.Close(SaveChanges=True)
xl.Quit()


