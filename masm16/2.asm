;�Ӽ�������һ���ַ���ͳ����ĸ���ո����֡������ַ��ĸ���������ʾ
;��80x86������Ա�����£�
;---------------------------------------------------
DATA SEGMENT
    PARS  DB 100                ;׼������100���ַ�.
    NNN   DB ?                  ;���ڴ��ʵ������ĸ���.
    III   DB 100 DUP(?)         ;100�ֽڵĿռ�.

    N_N   DB ?
    S_N   DB ?
    C_N   DB ?
    O_N   DB ?

    MESG1  DB  13, 10, 'Input STR  : $   ' ;������ʾ.
    MES_C  DB  13, 10, 'Char  N is : $   ' ;������ʾ.
    MES_S  DB  13, 10, 'Space N is : $   ' ;������ʾ.
    MES_N  DB  13, 10, 'Num   N is : $   ' ;������ʾ.
    MES_O  DB  13, 10, 'Other N is : $   ' ;������ʾ.
    MES_T  DB  13, 10, 'All   N is : $   ' ;������ʾ.
DATA ENDS
;---------------------------------------------------
CODE SEGMENT
    ASSUME  CS:CODE, DS:DATA
START:
    MOV  AX, DATA
    MOV  DS, AX

    MOV  N_N, 0
    MOV  S_N, 0
    MOV  C_N, 0
    MOV  O_N, 0

    MOV  DX, OFFSET MESG1
    MOV  AH, 9               ;9�Ź��ܵ��ã���ʾ��ʾ.
    INT  21H
    MOV  DX, OFFSET PARS
    MOV  AH, 10              ;10�Ź��ܵ��ã����ռ�������.
    INT  21H
;---------------------------------------------------
    MOV  CL, NNN             ;�յ��ַ��ĸ���.
    MOV  CH, 0
    CMP  CX, 0
    JNZ  DO_IT
    JMP  EXIT
DO_IT:
    LEA  SI, III             ;�յ��ַ�����ʼ��ַ.
;----------------------------���濪ʼѭ��ͳ��.
AGAIN:
    MOV  AL, [SI]
    CMP  AL, ' '             ;- ' '
    JNZ  N_num               ;
    INC  S_N
    JMP  NEXT
N_num:
    CMP  AL, ':'             ;- ':'
    JNC  N_C_B               ;> '9'
    CMP  AL, '0'
    JC   N_C_B               ;< '0'
    INC  N_N                 ;���ָ�����һ.
    JMP  NEXT
N_C_B:
    CMP  AL, '['             ;- '['
    JNC  N_C                 ;> 'Z'
    CMP  AL, 'A'
    JC   N_C                 ;< 'A'
    INC  C_N                 ;��д����һ.
    JMP  NEXT
N_C:
    CMP  AL, '{'             ;- '{'
    JNC  OTHER               ;> 'z'
    CMP  AL, 'a'
    JC   OTHER               ;< 'a'
    INC  C_N                 ;Сд����һ.
    JMP  NEXT
OTHER:
    INC  O_N                 ;����.
NEXT:
    INC  SI
    LOOP AGAIN
;----------------------------ͳ�ƽ���
    MOV  DX, OFFSET MES_N 
    MOV  AH, 9               ;9�Ź��ܵ��ã���ʾ��ʾ.
    INT  21H
    MOV  AL, N_N
    CALL DISP_AL

    MOV  DX, OFFSET MES_S
    MOV  AH, 9               ;9�Ź��ܵ��ã���ʾ��ʾ.
    INT  21H
    MOV  AL, S_N
    CALL DISP_AL

    MOV  DX, OFFSET MES_C 
    MOV  AH, 9               ;9�Ź��ܵ��ã���ʾ��ʾ.
    INT  21H
    MOV  AL, C_N
    CALL DISP_AL

    MOV  DX, OFFSET MES_O 
    MOV  AH, 9               ;9�Ź��ܵ��ã���ʾ��ʾ.
    INT  21H
    MOV  AL, O_N
    CALL DISP_AL

    MOV  DX, OFFSET MES_T
    MOV  AH, 9               ;9�Ź��ܵ��ã���ʾ��ʾ.
    INT  21H
    MOV  AL, NNN
    CALL DISP_AL
;----------------------------��ʾ����.
EXIT:
    MOV  AH, 4CH
    INT  21H
;============================
DISP_AL:  ;��3λʮ��������ʽ��ʾAL�е�����.
    MOV  AH, 0

    MOV  BL, 100
    DIV  BL
    ADD  AL, 30H
    MOV  DL, AL
    MOV  BH, AH
    MOV  AH, 2
    INT  21H

    MOV  AH, 0
    MOV  AL, BH
    MOV  BL, 10
    DIV  BL
    ADD  AL, 30H
    MOV  DL, AL
    MOV  BH, AH
    MOV  AH, 2
    INT  21H

    ADD  BH, 30H
    MOV  DL, BH
    MOV  AL, AH
    MOV  AH, 2
    INT  21H

    RET
;============================
CODE  ENDS
    END  START
;----------------------------
�����߶��ڴ𰸵����ۣ�лл
;============================================

