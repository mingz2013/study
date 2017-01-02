
;　　　编写一个汇编程序，该程序完成在屏幕上输出一个大写字母A的功能。调试该程序，并输出显示结果。
code segment
     assume cs:code
start:
      mov al,41h
	  mov dl,al
	  mov ah,02h
	  int 21h
code ends
    end start