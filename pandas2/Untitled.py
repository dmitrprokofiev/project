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


data = pd.read_excel("C:\\Users\\Dmitrii\\Desktop\\pandas\\Сводный табель УМ №10-8 МАРТ 2021.xlsx")


# In[3]:


data


# In[ ]:




