#!/usr/bin/env python
# coding: utf-8

# In[133]:


import xlwings as xw
import pandas as pd
data1 = pd.read_excel("C:\\Users\\Dmitrii\\Downloads\\10-8.xlsx")
klad = pd.read_excel("C:\\Users\Dmitrii\\Downloads\\Сводный табель АБ №10-8 МАРТ 2021.xlsx")
data1 = data1.drop([0, 1, 2, 3, 4, 5, 6]) #удалить первых 7 строк
data1 = data1.drop(['Unnamed: 6', 'Unnamed: 7'], axis = 1) # удаляемем ненужные колонки
klad = klad.drop([0])
klad.drop(klad.columns.difference(['Unnamed: 1', 'Unnamed: 21']), 1, inplace=True) # удаляем все кроме нужных столбцов


# In[134]:


data1.columns = ['Unnamed: 1', 'a', 'b', 'c', 'd', 'e']
klad.columns = ['Unnamed: 1', 'Unnamed: 21']


# In[135]:


result = data1.merge(klad, how = 'left', left_on='Unnamed: 1', right_on='Unnamed: 1')


# In[137]:


result


# In[136]:


result.to_excel("value1.xlsx")


# In[ ]:


# TO DO сделать для УМ
# Сделать отдельную таблицу для техники де будет сопоставление названий техники кладовщика с названием техники из Omnicomm

