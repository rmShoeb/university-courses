.386
.model flat, stdcall
option casemap :none
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.data
	msg db "hello world", 0

.code
main:
	invoke StdOut, addr msg
	invoke ExitProcess, 0
end main