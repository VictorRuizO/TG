from tkinter import *
import pandas as pd
import numpy as np

def neg():
    df.at[n, 'sentiment'] = -1
    upd()

def neu():
    df.at[n, 'sentiment'] = 0
    upd()

def pos():
    df.at[n, 'sentiment'] = 1
    upd()

def corregir():
    global n
    if (n==0): return
    
    n-=2
    upd()

def upd():
    df.to_csv('output.csv', sep=',',index=False)
    df.to_csv('datos.csv', sep=',',index=False,encoding= 'unicode_escape')
    #print(df['geo'])
    global n
    n+=1
    id.config(text=df['id'][n])
    user.config(text="@"+df['username'][n])
    text.configure(state='normal')
    text.delete(1.0,END)
    text.insert(1.0, df['text'][n])
    text.configure(state='disabled')

df = pd.read_csv('datos.csv',sep=',',encoding= 'unicode_escape')

n = df['sentiment'].isnull()
n = df[n]
n=n.index.values[0]
print(n)
print(df['sentiment'][n-3:n+3])
window = Tk()


window.title("Clasificador de tweets")
window.geometry('800x460')
window.resizable(0,0)

lbl = Label(window, text="id:")
lbl.config(font=("Arial", 13))
lbl.place(x=30,y=10)

id = Label(window, text=df['id'][n])
id.config(font=("Arial", 13))
id.place(x=120,y=10)


lbl = Label(window, text="Autor:")
lbl.config(font=("Arial", 13))
lbl.place(x=30,y=60)

user = Label(window, text="@"+df['username'][n])
user.config(font=("Arial", 13))
user.place(x=120,y=60)


lbl = Label(window, text="Texto:")
lbl.config(font=("Arial", 13))
lbl.place(x=30,y=110)

v = StringVar()
text = Text(window,height=10, width=70)
text.config(font=("Arial", 13),wrap=WORD)
text.insert(1.0,df['text'][n])
text.configure(state='disabled')
text.place(x=120,y=115)

btn = Button(window, text="Negativo", command=neg, height=2, width=15)
btn.place(x=100,y=350)
btn.config(font=("Arial", 13))

btn = Button(window, text="Neutro/No aplica", command=neu, height=2, width=15)
btn.place(x=300,y=350)
btn.config(font=("Arial", 13))

btn = Button(window, text="Positivo", command=pos, height=2, width=15)
btn.place(x=500,y=350)
btn.config(font=("Arial", 13))

btn = Button(window, text="<-- Corregir", command=corregir, height=1, width=10)
btn.place(x=30,y=420)
btn.config(font=("Arial", 9))

window.mainloop()