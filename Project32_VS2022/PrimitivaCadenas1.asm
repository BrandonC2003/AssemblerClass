Title PrimitivaCadenas1.asm
;@Author : Brandon Alexander Castro Contreras
;@Country: El Salvador, Centro America
;@eMail  2505022021@mail.utec.edu.sv

Include Irvine32.Inc

.Data
; Poner aqui las variables a utilizar
cad1 byte "Primitivas de cadenas"
;Arr1 
.Code 
Main Proc
    Call ClrScr       ; Limpia la Pantalla
    
    MOV ESI, OffSet cad1
    MOV ECX, LengthOf cad1


    Inicio1:
        LodSB   ;Lod tomma el caracter e incrementa esi.
        Call WriteChar
    lOOP Inicio1
    Call CrLf

    Call CrLf         ; Hace un Salto de linea
    Call WaitMsg      ; Espera a que presionen <ENTER>
    Exit              ; Termina el programa
Main EndP

End Main
