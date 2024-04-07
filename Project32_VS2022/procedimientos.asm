Title Proceimientos2.asm
;@Author : Brandon Alexander Castro Contreras
;@Country: El Salvador, Centro America
;@eMail  2505022021@mail.utec.edu.sv

Include Irvine32.Inc

.Data
; Poner aqui las variables a utilizar
arr1 byte "Test a"
.Code 
Main Proc
    Call ClrScr       ; Limpia la Pantalla
    ; poner codigo del programa
    Mov ESI, offset arr1
    Mov ECX,  lengthOf arr1

    Call LlenarPila

    ;Extraer los valores almacenados en la pila
    Mov ECX,  EAX
Lazo2:
    Pop EAX
    Call WriteChar
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
;Almacena una cadena (Se alamcenaran como DWord).
;recibe: ESI Dirección incial del arreglo.
;      : ECX Cantidad de elementos  a almacenar.
;Retorna: El Arreglo en la pila
;       : EBX La cantidad de caracteres almacenados en la pila EAX
;-----------------------------------------------------------------------------
.data
    valRet  DWord ?
.code
    pop valRet ; Respaldo de la direccion en la pila
    Mov EAX, 0 ; limpio el registro eax
    Mov EBX, 0
Lazo1:
    Mov AL, [ESI] 
    
    Cmp AL, "a"

    JNE Continuar

        Push EAX        ; Almaceno el valor de 8 bits como de 32 bits en la pila
        Inc EBX
    
    Continuar:
        Loop Lazo1
    Push valRet
    ret
LlenarPila EndP

     End Main
