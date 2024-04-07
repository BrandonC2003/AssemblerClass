Title Proceimientos.asm
;@Author : Brandon Alexander Castro Contreras
;@Country: El Salvador, Centro America
;@eMail  2505022021@mail.utec.edu.sv

Include Irvine32.Inc

.Data
; Poner aqui las variables a utilizar
arr1 byte 10,20,30,40,50
arr2 Word 60, 70, 80
arr3 DWord 90, 100, 110, 120, 130
.Code
Main Proc
    Call ClrScr       ; Limpia la Pantalla
    ; poner codigo del programa
    Mov ESI, offset arr1
    Mov ECX,  lengthOf arr1
    Mov EBX, Type arr1

    Call LlenarPila

    Mov ESI, offset arr2
    Mov ECX, lengthOf arr2
    Mov EBX, Type arr2

    Call LlenarPila

    Mov ESI, offset arr3
    Mov ECX, lengthOf arr3
    Mov EBX, Type arr3

    Call LlenarPila

    ;Extraer los valores almacenados en la pila
    Mov ECX,  lengthOf Arr1
    Add ECX, lengthOf Arr2
    Add ECX, lengthOf Arr3
Lazo2:
    Pop EAX
    Call WriteDec
    Call CrLf
    Loop Lazo2
    

    Call CrLf         ; Hace un Salto de linea
    Call WaitMsg      ; Espera a que presionen <ENTER>
    Exit              ; Termina el programa
Main EndP

;Aqui pueden ir mas procedimientos

;------------------------------------------------------------------------------
LlenarPila Proc
;
;Almacena un arreglo de 8 bit en la pila (Se alamcenaran como DWord).
;recibe: ESI Dirección incial del arreglo.
;      : ECX Cantidad de elementos  a almacenar.
;      : EBX Tipo de dato del arreglo a recibir 
;Retorna: El Arreglo en la pila
;-----------------------------------------------------------------------------
.data
    valRet  DWord ?
.code
    pop valRet ; Respaldo de la direccion en la pila
    Mov EAX, 0 ; limpio el registro eax
Lazo1:
    Cmp EBX, Byte
    JE EsByte
    Cmp EBX, Word
    JE EsWord
    JNE EsDWord
    EsByte:
        Mov AL, [ESI]   ; Almaceno el valor del arrego en EAX
        Jmp Continue
    EsWord:
        Mov AX, [ESI]   ; Almaceno el valor del arrego en EAX
        Jmp Continue
    EsDWord:
        Mov EAX, [ESI]
        Jmp Continue
    Continue:
    Push EAX        ; Almaceno el valor de 8 bits como de 32 bits en la pila
    Add ESI, EBX    ; Incrementa a ESI el tipo de dato
    Loop Lazo1

    Push valRet
    ret
LlenarPila EndP

     End Main

