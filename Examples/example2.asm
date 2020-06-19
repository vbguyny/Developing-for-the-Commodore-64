; 10 SYS (49152)
*=$c000

main

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Indirect index
;        ldx #<$0400    ; Address least significant byte (LSB)
;        stx $fb        ; Save pointer LSB
;        ldx #>$0400    ; Address most significant byte (MSB)
;        stx $fc        ; Save pointer MSB
;        ldy #0         ; Starting index
;        lda #'a'       ; Character to print
;@loop
;        sta ($fb),y    ; Print character to screen (6 cycles)
;        iny            ; Next
;        bne @loop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Self-modify code - Direct index
;        ldx #$00       ; Address least significant byte (LSB)
;        stx @loop+1    ; Overwrite pointer LSB in loop sta
;        ldx #$04       ; Address least significant byte (LSB)
;        stx @loop+2    ; Overwrite pointer MSB in loop sta
;        ldy #0         ; Starting index
;        lda #'a'       ; Character to print
;@loop
;        sta $1000,y    ; Print character to screen (5 cycles)
;        iny            ; Next
;        bne @loop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        rts             ; Exit

