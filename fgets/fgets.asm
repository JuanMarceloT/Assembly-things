
.model small
.stack

.data
    buffer db 128 dup('$')   
    filename db 'file.txt$', 0 ; Name of the file to read
.code
.startup

    mov ah, 3Dh          ; open file
    mov al, 0            ; Read mode
    lea dx, filename     
    int 21h              
    mov bx, ax           

    ; Check if file opened 
    cmp ax, 0FFh         ; check 0FFh (error code)
    je exit              

    mov ah, 3Fh          ; read from file
    mov cx, 128          ; Number of bytes to read
    lea dx, buffer       
    int 21h              

    mov ah, 09h          ; Print string function
    lea dx, buffer       
    int 21h              

    mov ah, 3Eh          ; Close file
    int 21h              
.exit


exit: end
