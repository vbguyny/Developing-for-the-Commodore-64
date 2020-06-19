; 10 SYS (2064)

*=$0810

chout   = $ffd2         ; Kernel character output sub

main

        ldx #<string    ; String address least significant byte (LSB)
        stx @loop+1     ; Save string pointer LSB
        ldx #>string    ; String address most significant byte (MSB)
        stx @loop+2     ; Save string pointer MSB
        ldy #0          ; Starting string index

@loop
        lda $1000,y     ; Get a character
        beq @done       ; End of string

        jsr chout       ; Print character
        iny             ; Next
        bne @loop

@done
        rts             ; Exit

string  byte "hello world!", $00
