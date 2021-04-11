#!/usr/bin/env python
# coding: utf-8

# In[1]:


import xlwings as xw
import pandas as pd
data1 = pd.read_excel("C:\\Users\\Dmitrii\\Desktop\\pandas\\БД ТС Omnicomm.xlsx")
data2 = pd.read_excel("C:\\Users\\Dmitrii\\Desktop\\pandas\\Сводный табель АБ №10-8 МАРТ 2021.xlsx")
data2.drop(data2.columns.difference(['Unnamed: 2', 'Unnamed: 9']), 1, inplace=True)
data2.columns = ['klad', 'g']


# In[2]:


df1 = pd.merge(data1, data2)


# In[ ]:


#TO DO объединить таблицу ГСМ АБ с УМ
# Продолжаем пополнение БД ТС


# In[3]:


df1 = df1.dropna(axis='index', how='any', subset=['g', 'klad']).drop('klad', axis=1)


# In[4]:


data3 = pd.read_excel("C:\\Users\\Dmitrii\\Desktop\\pandas\\omnicomm.xlsx")
data3 = data3.drop([0, 1, 2, 3, 4, 5, 6]) #удалить первых 7 строк
data3 = data3.drop(['Unnamed: 6', 'Unnamed: 7'], axis = 1) # удаляемем ненужные колонки


# In[5]:


result = pd.merge(data3, df1, left_on = 'Unnamed: 0', right_on = 'Omnicomm').drop('Omnicomm', axis=1)


# In[6]:


result


# In[7]:


result.to_excel("value1.xlsx")


# In[ ]:




