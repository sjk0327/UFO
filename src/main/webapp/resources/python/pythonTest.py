#!/usr/bin/env python
# coding: utf-8

# In[5]:


import matplotlib.pyplot as plt

fruit=['apple','banana','strawberry','orange','grape']
result=[7,6,3,2,2]

explode_value=(0.1, 0,0, 0, 0,)

plt.figure(figsize=(5,5))
plt.pie(result, labels=fruit, autopct='%.1f%%', startangle=90,
       counterclock=False, explode=explode_value, shadow=True)
plt.show()

