; 10 SYS (2064)
*=$0801
        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $30, $36, $34, $29, $00, $00, $00

*=$0810

chout   = $ffd2         ; Kernel character output sub
newline = $0d           ; Newline character

main

        ldx #<str1      
        ldy #>str1
        jsr print       ; Print str1

;        jsr println     ; Print new line

;        lda #newline
;        jsr chout       ; Print new line

;        printnewline     ; Print new line

        ldx #<str2
        ldy #>str2
        jsr print       ; Print str2

        rts             ; Exit

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

;println
;        ldx #<newln
;        ldy #>newln
;        jsr print       ; Print string
;        rts

;defm    printnewline
;        lda #newline
;        jsr chout       ; Print new line
;endm

str1    byte "the commodore 64", $00
str2    byte "rocks!!!", $00
newln   byte $0D

