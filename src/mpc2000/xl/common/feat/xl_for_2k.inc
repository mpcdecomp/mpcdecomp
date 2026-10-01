; SPDX-License-Identifier: PolyForm-Noncommercial-1.0.0
; Noncommercial use only; see LICENSE.txt.
;
; Required Notice: Copyright 2026 Brock Rockman
;
; XL_FOR_2K -- XL OS on base MPC2000 hardware.  each macro is one hook site:
; the stock bytes without XL_FOR_2K, the arm with it, the same size either way.
; the app1 routines are the bodies only; the cave they sit in, and the stock
; fragments each span re-emits, are the version's own (flash/app1.asm).
; near branches between app0 and app1 name the other part's label; CS = 0 for
; both, and the displacement wraps the 64KB segment.

; ---- app0
; page map: base's DRAM window is at 60h, not 40h.  (v1.20 0x0056C)
XL2K_PAGE_MAP   macro
        ifdef   XL_FOR_2K
        mov     ax, 60h
        else
        mov     ax, 40h
        endif
        endm

; ICU OCW1, written to port 0C022h by the `b0 xx / ee` pair around it.  04h
; drops the IR1 mask bit the XL keeps set; IR1 is live on base.  (0x00653)
XL2K_OCW1       macro
        ifdef   XL_FOR_2K
        db      04h
        else
        db      06h
        endif
        endm

; main loop -> wheel_drain, which repeats this call and then drains one
; pending wheel step.  (0x00785, 3 bytes)
XL2K_MAIN_LOOP  macro
        ifdef   XL_FOR_2K
        call    ATA_BASE+WHEEL_DRAIN-SEGBASE
        else
        call    fn_04328
        endif
        endm

; panel tag chain -> wheel_isr, which repeats the displaced MOV, takes wheel
; tags 82h/83h, and rejoins at br_00B7F.  (0x00B7B, 4 bytes)
XL2K_TAG_CHAIN  macro   {GLOBALSYMBOLS}
        ifdef   XL_FOR_2K
        jmp     ATA_BASE+WHEEL_ISR-SEGBASE ; the wheel decoder, ISR side
        nop
        else
        mov     ah, byte ptr [A0_B_001B8]
        endif
br_00B7F:
        endm

; LED ports -- base wires these indicators to 14Ah and 14Ch, not 160h and 16Eh.
; (0x01187, 0x01195)
XL2K_LED_A      macro
        ifdef   XL_FOR_2K
        mov     dx, 14ah
        else
        mov     dx, 160h
        endif
        endm
XL2K_LED_B      macro
        ifdef   XL_FOR_2K
        mov     dx, 14ch
        else
        mov     dx, 16eh
        endif
        endm

; PAD BANK indicator branch table, four arms (one per bank), each driving four
; lines -- one selected, three not.  ports only:  (0x01206-0x01245)
;       selected    16Ah 164h 16Ch 162h  ->  164h 160h 162h 14Eh
;       not sel.    17Ah 174h 17Ch 172h  ->  174h 170h 172h 15Eh
XL2K_BANK_LEDS  macro   {GLOBALSYMBOLS}
        ifdef   XL_FOR_2K
        mov     dx, 164h
        out     dx, al
        mov     dx, 170h
        out     dx, al
        mov     dx, 172h
        out     dx, al
        mov     dx, 15eh
        out     dx, al
        ret
br_01216:
        mov     dx, 174h
        out     dx, al
        mov     dx, 160h
        out     dx, al
        mov     dx, 172h
        out     dx, al
        mov     dx, 15eh
        out     dx, al
        ret
br_01227:
        mov     dx, 174h
        out     dx, al
        mov     dx, 170h
        out     dx, al
        mov     dx, 162h
        out     dx, al
        mov     dx, 15eh
        out     dx, al
        ret
br_01238:
        mov     dx, 174h
        out     dx, al
        mov     dx, 170h
        out     dx, al
        mov     dx, 172h
        out     dx, al
        mov     dx, 14eh
        out     dx, al
        ret
        else
        mov     dx, 16ah
        out     dx, al
        mov     dx, 174h
        out     dx, al
        mov     dx, 17ch
        out     dx, al
        mov     dx, 172h
        out     dx, al
        ret
br_01216:
        mov     dx, 17ah
        out     dx, al
        mov     dx, 164h
        out     dx, al
        mov     dx, 17ch
        out     dx, al
        mov     dx, 172h
        out     dx, al
        ret
br_01227:
        mov     dx, 17ah
        out     dx, al
        mov     dx, 174h
        out     dx, al
        mov     dx, 16ch
        out     dx, al
        mov     dx, 172h
        out     dx, al
        ret
br_01238:
        mov     dx, 17ah
        out     dx, al
        mov     dx, 174h
        out     dx, al
        mov     dx, 17ch
        out     dx, al
        mov     dx, 162h
        out     dx, al
        ret
        endif
        endm

; floppy DMA descriptor is at 18FCh on base, not 1904h; the four words it
; points at are the DMA buffer's address/count pair.  (0x017CD)
XL2K_FDC_DMA    macro
        ifdef   XL_FOR_2K
        mov     si, 18fch
        else
        mov     si, 1904h
        endif
        endm

; SCSI DMA descriptor; both channels share base's one buffer.  (0x017F5)
XL2K_SCSI_DMA   macro
        ifdef   XL_FOR_2K
        mov     si, 18fch
        else
        mov     si, 190ch
        endif
        endm

; head of the "allowed while playing" key gate; hand it to the extended copy,
; play_gate.  the rest of the stock gate stays, unreached.  (0x040B0, 5 bytes)
XL2K_PLAY_GATE  macro
        ifdef   XL_FOR_2K
        jmp     ATA_BASE+PLAY_GATE-SEGBASE
        nop
        nop
        else
        cmp     ax, 3ch
        je      br_040CC
        endif
        endm

; the four PAD BANK thunks are 8-byte VM records: `cd 96`, dw tag, dw target,
; dw 0.  their targets are the four setters XL2K_BANK_SETTERS spans, bank
; A/B/C/D = pad_bank_b-6, pad_bank_b, +6, +0Ch.  XL_FOR_2K points A, C and D at
; pad_bank_b, the one cycling routine; B already points there.
XL2K_BANK_THUNK macro   stock
        ifdef   XL_FOR_2K
        dw      pad_bank_b
        else
        dw      stock
        endif
        endm

; the four PAD BANK setters collapse into one cycling routine -- base has a
; single PAD BANK button, so all four thunks call pad_bank_b and it advances
; the bank.  stock is four one-liners, `mov byte ptr [A0_B_PAD_BANK],
; 00h/10h/20h/30h / retf` = bank A/B/C/D; the arm overwrites B and C, A and D
; stay intact but unreached.  (0x04412, 11 bytes)
XL2K_BANK_SETTERS macro {GLOBALSYMBOLS}
pad_bank_b:
pad_bank_a      equ     pad_bank_b-6
pad_bank_c      equ     pad_bank_b+6
pad_bank_d      equ     pad_bank_b+0ch
        ifdef   XL_FOR_2K
        add     byte ptr [A0_B_PAD_BANK], 010h   ; next bank
        and     byte ptr [A0_B_PAD_BANK], 030h   ; 40h wraps back to bank A
        retf
        else
        mov     byte ptr [A0_B_PAD_BANK], 10h
        retf
        mov     byte ptr [A0_B_PAD_BANK], 20h
        endif
        endm

; ---- app1
; defeat the ATA/CF probe.  stock reads the ATA alternate status register at
; 1EAh; the lines below read all-ones as "no device", so return the
; floating-bus value without touching the bus.  the rest of the probe becomes
; the cave the routines below live in.  no CF/IDE.  (v1.20 0x0F6DD, 4 bytes)
XL2K_ATA_PROBE  macro
        ifdef   XL_FOR_2K
        mov     ax, 0ffffh
        nop
        else
        mov     dx, 1eah
        in      ax, dx
        endif
        endm

; data-wheel decoder, ISR side.  entered by the XL2K_TAG_CHAIN JMP, which
; displaced `mov ah,[01b8h]`; takes wheel tags 82h/83h, jumps back to br_00B7F
; for anything else.  [01B8h] = panel message tag, AL = message byte 2 = base's
; running wheel tick counter.  54 bytes and its state byte.
XL2K_WHEEL_ISR  macro   {GLOBALSYMBOLS}
wheel_isr:
        mov     ah, byte ptr [A0_B_001B8] ; instruction the tag-chain hook took
        cmp     ah, 082h                ; wheel counter-clockwise
        je      wi_ccw
        cmp     ah, 083h                ; wheel clockwise
        je      wi_cw
        jmp     APP0_BASE+BR_00B7F-SEGBASE ; not ours: back into the stock tag chain
wi_ccw:
        mov     dl, 0ffh                ; direction = -1
        jmp     wi_have_dir
wi_cw:
        mov     dl, 1                   ; direction = +1
wi_have_dir:
        sub     al, 1
        jae     wi_ck
        mov     al, 0
wi_ck:
        or      al, al
        jne     wi_delta
        call    wheel_disarm            ; wheel at rest
wi_delta:
        db      088h, 0c7h              ; mov bh, al (d=0; ASL emits 8A F8)
        xchg    byte ptr cs:[SEGBASE+last_ticks], bh ; swap in the previous tick count
        sub.d0  al, bh                  ; AL = ticks since last time
        jae     wi_ck2
        mov     al, 0
wi_ck2:
        or      al, al
        je      wi_done
        call    wheel_arm               ; accumulate one dispatch
wi_done:
        ret
last_ticks:
        db      000h                    ; STATE: previous raw tick count
        endm

; clear the "dispatch pending" flag when the wheel is still.  called by
; wheel_isr.  4 bytes.
XL2K_WHEEL_DISARM macro {GLOBALSYMBOLS}
wheel_disarm:
        mov     byte ptr cs:[SEGBASE+armed], 0
        ret
        endm

; data-wheel decoder, main-loop side.  entered by the XL2K_MAIN_LOOP call;
; repeats that call, then drains at most one pending wheel step per pass into
; a panel event.  pending_step is shared with wheel_arm.  24 bytes and its
; state byte.
XL2K_WHEEL_DRAIN macro {GLOBALSYMBOLS}
wheel_drain:
        call    APP0_BASE+FN_04328-SEGBASE ; main-loop call the hook took
        mov     al, 0
        xchg    byte ptr cs:[SEGBASE+pending_step], al ; take and clear it
        mov     bx, 03394h              ; event descriptor for "wheel +"
        or      al, al
        jg      wd_go
        je      wd_out                  ; nothing pending
        mov     bx, 0339ah              ; event descriptor for "wheel -"
wd_go:
        call    APP0_BASE+FN_03F5C-SEGBASE ; dispatch panel event, BX = descriptor
wd_out:
        ret
pending_step:
        db      000h                    ; STATE: accumulated signed step
        endm

; one dispatch per twist.  called by wheel_isr on every tick change; latches at
; most one step until the wheel stops (base's wheel emits many ticks per
; detent).  owns the armed flag (cleared by wheel_disarm), writes the
; pending_step byte that wheel_drain drains.  18 bytes and its state byte.
XL2K_WHEEL_ARM  macro   {GLOBALSYMBOLS}
wheel_arm:
        cmp     byte ptr cs:[SEGBASE+armed], 0
        jne     wa_out                  ; already armed: swallow this tick
        mov     byte ptr cs:[SEGBASE+armed], 1
        add     byte ptr cs:[SEGBASE+pending_step], dl ; DL = +1 / -1 from the ISR
wa_out:
        ret
armed:
        db      000h                    ; STATE: a step is pending
        endm

; relocated "allowed while playing" key gate -- the stock gate verbatim plus
; two codes with no room in place.  entered from the XL2K_PLAY_GATE arm, jumps
; back to br_040CC.  AX = panel button code; while the transport runs
; ([04371h] != 0) only the listed codes pass.  40 bytes.
XL2K_PLAY_GATE_BODY macro {GLOBALSYMBOLS}
play_gate:
        cmp     ax, 03ch
        je      pg_pass
        cmp     ax, 036h
        je      pg_pass
        cmp     ax, 04eh
        je      pg_pass
        cmp     ax, 01eh
        je      pg_pass
        cmp     ax, 0f0h                ; NEW: SHIFT + FULL LEVEL -> TRACK MUTE
        je      pg_pass
        cmp     ax, 012ch               ; NEW: SHIFT + GO TO     -> NEXT SEQ
        je      pg_pass
        cmp     byte ptr [04371h], 0    ; not running: everything passes
        je      pg_pass
        ret
pg_pass:
        jmp     APP0_BASE+BR_040CC-SEGBASE ; stock dispatch
        endm

; ---- app3
; the two XL-only panel keys rebound to SHIFT chords base can send -- slot*6 =
; 0F0h SHIFT + FULL LEVEL and 012Ch SHIFT + GO TO, the two codes play_gate
; admits.  MUTE and NEXT are the two handlers.  (v1.20 0x26915, 0x2691D)
XL2K_TRANSPORT_KEYS macro mute,next
        ifdef   XL_FOR_2K
        KEY_SHIFTED     28h, mute, APP3_SEG     ; TRACK MUTE -> SHIFT + FULL LEVEL
        KEY_SHIFTED     32h, next, APP3_SEG     ; NEXT SEQ -> SHIFT + GO TO
        else
        KEY_DOWN        2eh, mute, APP3_SEG
        KEY_DOWN        2fh, next, APP3_SEG
        endif
        endm

; ---- c0
; base's port C0h monitor bit, not the XL's.  (v1.20 0x35A4x)
XL2K_MON_BIT    macro
        ifdef   XL_FOR_2K
        or      al, 80h
        else
        or      al, 10h
        endif
        endm

; ---- c2
; monitor-output routing: base wires port 0C0h differently, so every mask and
; literal touching it is remapped.  all arms in-place and length-neutral.
;       2-bit monitor select  bits 6:7 -> 3:4    flag  bit 3 -> 5
;       flag                  bit 5    -> 6      bit 2 unchanged
; (v1.20 0x4904F/51, 0x4905B, 0x490AF/B3/B7, 0x49154, 0x49162/64, 0x491C0/C2)
XL2K_MON_ROUTE  macro
        ifdef   XL_FOR_2K
        and     al, 0e7h
        or      al, 20h
        else
        and     al, 3fh
        or      al, 8
        endif
        endm

; both forms are the sign-extended 83h encoding, 3 bytes.
XL2K_MON_KEEP   macro
        ifdef   XL_FOR_2K
        and     si, 0ffdfh
        else
        and     si, 0fff7h
        endif
        endm

; L / R / stereo codes: base hardware takes the 2-bit select in bits 3:4, not 6:7.
XL2K_MON_CODES  macro
        ifdef   XL_FOR_2K
        mov     byte ptr [bp-6], 8
        mov     byte ptr [bp-5], 10h
        mov     byte ptr [bp-4], 18h
        else
        mov     byte ptr [bp-6], 40h
        mov     byte ptr [bp-5], 80h
        mov     byte ptr [bp-4], 0c0h
        endif
        endm

XL2K_MON_CLEAR  macro
        ifdef   XL_FOR_2K
        and     al, 0e3h
        else
        and     al, 3bh
        endif
        endm

XL2K_MON_BOTH   macro
        ifdef   XL_FOR_2K
        and     al, 0a7h
        or      al, 24h
        else
        and     al, 1fh
        or      al, 0ch
        endif
        endm

XL2K_MON_SET    macro
        ifdef   XL_FOR_2K
        and     al, 0e3h
        or      al, 20h
        else
        and     al, 3bh
        or      al, 8
        endif
        endm
