;; Contains tests for:
;; SUB s
;; These tests are functional ALU tests, i.e. they test the ALU more than they
;; test the microcode. These are result tests.
;;
;; ZNHC
;;
SECTION "rom", ROM0[$0000]

main:
    ; Setup stack
    ld SP, $c040

    ; Z flag
    ld A, $00
    ld B, $00
    sub B
    push AF
    pop HL
    ld B, H
    
    ; C, H flags
    ld A, $11
    ld C, $ff
    sub C
    push AF
    pop HL
    ld C, H
    
    ; C flag only
    ld A, $1f
    ld D, $f0
    sub D
    push AF
    pop HL
    ld D, H
    
    ; H flag only
    ld A, $f1
    ld E, $0f
    sub E
    push AF
    pop HL
    ld E, H
    
    ; No flags (N flag always set however)
    ld A, $ff
    ld L, $01
    sub L
    
    halt
