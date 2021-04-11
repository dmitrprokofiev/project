#!/usr/bin/env python
# coding: utf-8

# In[1]:


import os
import win32com.client

#копирование данных для 40го участка заправки и сливы #ЗАПИХНУТЬ  В ФУНКЦИЮ 
xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 40-1\\Заправки и сливы 40.xlsm")
xl.Application.Run("copy40")
wb.Close(SaveChanges=True)
xl.Quit()

#копирование данных для 29го участка заправки и сливы
xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 29-1\\Заправки и сливы 29.xlsm")
xl.Application.Run("copy29")
wb.Close(SaveChanges=True)
xl.Quit()

#копирование данных для 40го участка Отчет ГСМ
xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 40-1\\Отчет ГСМ Уч.40-3 МАКРОСЫ.xlsm")
xl.Application.Run("part895copy")
wb.Close(SaveChanges=True)
#wb.SaveAs("C:\\Users\\Dmitrii\\Downloads\\Заправки и сливы 40.xlsm")
#wb.Close()
xl.Quit()

#копирование данных для 29го участка Отчет ГСМ
xl = win32com.client.Dispatch("Excel.Application")
wb = xl.Workbooks.Open("C:\\Users\\Dmitrii\\Desktop\\Работа\\ОТЧЕТЫ\\Уч 29-1\\Отчет ГСМ Уч.29-1 МАКРОСЫ.xlsm")
xl.Application.Run("part137copy")
xl.Application.Run("part137end")
#xl.Application.Run("part223copy")
#xl.Application.Run("part223end")
xl.Application.Run("importdata137")
#xl.Application.Run("importdata223")
wb.Close(SaveChanges=True)
xl.Quit()


# In[ ]:




