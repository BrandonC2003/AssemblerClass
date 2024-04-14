Title cadenas14042034.asm
;@Author : Brandon Alexander Castro Contreras
;@Country: El Salvador, Centro America
;@eMail  2505022021@mail.utec.edu.sv

Include Irvine32.Inc

.Data
; Poner aqui las variables a utilizar
Arr1 Word 1,10,20,30,40
    Word 2, 50,60,70,80
    Word 3,90,100,110,120
    nLen1 = ($-Arr1) / Type Arr1

.Code 
Main Proc
    Call ClrScr       ; Limpia la Pantalla
    
    Mov ESI, OffSet Arr1
    Mov ECX, nLen1          ; Cantidad de valores
    Mov EBX, LengthOf Arr1  ; Cantidad de valores por fila

    Mov EAX, nLen1
    Mov EDX, 0
    Div EBX                 ; Cantidad de filas
    Mov ECX, EBX

    Mov ECX, nLen1
    Mov EAX, 0

Inicio1:
    LodSW
    Call WriteDec
    Mov AL, " "
    Call WriteChar
    Loop Inicio1

    Call CrLf
    Call CrLf
    Mov ESI, Offset Arr1
    Mov ECX, 4
    Mov EAX, 0

Inicio2:
    Push  ECX
    Mov ECX, 5
    Loop  Inicio2



    Call CrLf         ; Hace un Salto de linea
    Call WaitMsg      ; Espera a que presionen <ENTER>
    Exit              ; Termina el programa
Main EndP

End Main
