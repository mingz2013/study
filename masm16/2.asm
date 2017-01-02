;从键盘输入一行字符，统计字母、空格、数字、其他字符的个数，并显示
;用80x86汇编语言编程如下：
;---------------------------------------------------
DATA SEGMENT
    PARS  DB 100                ;准备接收100个字符.
    NNN   DB ?                  ;用于存放实际输入的个数.
    III   DB 100 DUP(?)         ;100字节的空间.

    N_N   DB ?
    S_N   DB ?
    C_N   DB ?
    O_N   DB ?

    MESG1  DB  13, 10, 'Input STR  : $   ' ;用于提示.
    MES_C  DB  13, 10, 'Char  N is : $   ' ;用于提示.
    MES_S  DB  13, 10, 'Space N is : $   ' ;用于提示.
    MES_N  DB  13, 10, 'Num   N is : $   ' ;用于提示.
    MES_O  DB  13, 10, 'Other N is : $   ' ;用于提示.
    MES_T  DB  13, 10, 'All   N is : $   ' ;用于提示.
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
    MOV  AH, 9               ;9号功能调用，显示提示.
    INT  21H
    MOV  DX, OFFSET PARS
    MOV  AH, 10              ;10号功能调用，接收键盘输入.
    INT  21H
;---------------------------------------------------
    MOV  CL, NNN             ;收到字符的个数.
    MOV  CH, 0
    CMP  CX, 0
    JNZ  DO_IT
    JMP  EXIT
DO_IT:
    LEA  SI, III             ;收到字符的起始地址.
;----------------------------下面开始循环统计.
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
    INC  N_N                 ;数字个数加一.
    JMP  NEXT
N_C_B:
    CMP  AL, '['             ;- '['
    JNC  N_C                 ;> 'Z'
    CMP  AL, 'A'
    JC   N_C                 ;< 'A'
    INC  C_N                 ;大写，加一.
    JMP  NEXT
N_C:
    CMP  AL, '{'             ;- '{'
    JNC  OTHER               ;> 'z'
    CMP  AL, 'a'
    JC   OTHER               ;< 'a'
    INC  C_N                 ;小写，加一.
    JMP  NEXT
OTHER:
    INC  O_N                 ;其它.
NEXT:
    INC  SI
    LOOP AGAIN
;----------------------------统计结束
    MOV  DX, OFFSET MES_N 
    MOV  AH, 9               ;9号功能调用，显示提示.
    INT  21H
    MOV  AL, N_N
    CALL DISP_AL

    MOV  DX, OFFSET MES_S
    MOV  AH, 9               ;9号功能调用，显示提示.
    INT  21H
    MOV  AL, S_N
    CALL DISP_AL

    MOV  DX, OFFSET MES_C 
    MOV  AH, 9               ;9号功能调用，显示提示.
    INT  21H
    MOV  AL, C_N
    CALL DISP_AL

    MOV  DX, OFFSET MES_O 
    MOV  AH, 9               ;9号功能调用，显示提示.
    INT  21H
    MOV  AL, O_N
    CALL DISP_AL

    MOV  DX, OFFSET MES_T
    MOV  AH, 9               ;9号功能调用，显示提示.
    INT  21H
    MOV  AL, NNN
    CALL DISP_AL
;----------------------------显示结束.
EXIT:
    MOV  AH, 4CH
    INT  21H
;============================
DISP_AL:  ;以3位十进制数形式显示AL中的内容.
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
提问者对于答案的评价：谢谢
;============================================

