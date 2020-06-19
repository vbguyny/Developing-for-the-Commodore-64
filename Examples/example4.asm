; 10 SYS (2064)
*=$0801
        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $30, $36, $34, $29, $00, $00, $00

*=$0810

chout   = $ffd2         ; Kernel character output sub

main

        ldx #<string    ; String address least significant byte (LSB)
        ldy #>string    ; String address most significant byte (MSB)
        jsr print       ; Call subroutine

        rts

print
        stx @loop+1     ; Save string pointer LSB
        sty @loop+2     ; Save string pointer MSB
        ldy #0          ; Starting string index

@loop
        lda $1000,y     ; Get a character
        beq @done       ; End of string

        jsr chout       ; Print character
        iny             ; Next
        bne @loop

@done
        rts             ; Return

string  byte "hello world!", $00
