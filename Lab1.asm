;Лабораторна 1 Рішення  рівняння 2a/7-c7/e   на masm32:
.686
.model flat, stdcall
option casemap:none
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
firstfunc PROTO _const1:DWORD,_a1:DWORD,_const2:DWORD,_c1:DWORD,_const3:DWORD,_e1:DWORD
.data   ;2a/7-c7/e
const1 dd 2
a1 dd 14
const2 dd 7
c1 dd 12
const3 dd 7
e1 dd 6
_temp1 dd ?,0
_title db "Лабораторна робота №1. Арифметичні операції",0
strbuf dw ?,0
_text db "Вивід результату 2a/7-c7/e",0ah,"Результат: %d",0ah, 0ah,
"Дощич Ганна КНЕУ  ФІСІТ",0
.code
firstfunc proc _const1:DWORD,_a1:DWORD,_const2:DWORD,_c1:DWORD,_const3:DWORD,_e1:DWORD
; розрахунок виразу 2a/7-c7/e
mov eax, _const1
mul _a1
div _const2
mov _temp1, eax ;збереження цілої частини у temp1
mov eax, _c1
mul _const3
div _e1
sub _temp1, eax ;віднімання від edx цілої частини другого виразу
ret
firstfunc endp

start:
invoke firstfunc, const1,a1,const2,c1,const3,e1
invoke wsprintf, ADDR strbuf, ADDR _text, _temp1
invoke MessageBox, NULL, addr strbuf, addr _title, MB_ICONINFORMATION
invoke ExitProcess, 0
END start
