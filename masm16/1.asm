
;��������дһ�������򣬸ó����������Ļ�����һ����д��ĸA�Ĺ��ܡ����Ըó��򣬲������ʾ�����
code segment
     assume cs:code
start:
      mov al,41h
	  mov dl,al
	  mov ah,02h
	  int 21h
code ends
    end start