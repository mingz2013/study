'''
Created on 2013-6-25

@author: root
'''
import tkinter

if __name__ == '__main__':
    pass
s = tkinter.Scrollbar()
L = tkinter.Listbox()
s.pack(side = tkinter.RIGHT, fill = tkinter.Y)
L.pack(side = tkinter.LEFT, fill = tkinter.Y)
s.config(command = L.yview())
L.config(yscrollcommand = s.set)
for i in range(30):L.insert(tkinter.END, str(i)*3)
tkinter.mainloop()
