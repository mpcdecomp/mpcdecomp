; a part's base is the image position it starts at (image.inc), and a module's
; segment is the paragraph at its anchor label, wherever that part sits.

C0_SEG            equ     (C0_BASE+SEG_C0)/16
C2_SEG            equ     (C2_BASE+SEG_C2)/16
C1_SEG            equ     (C1_BASE+SEG_C1)/16
APP3_SEG          equ     (APP3_BASE+SEG_APP3)/16
APP2_SEG          equ     (RAM_BASE+SEG_APP2)/16
DS_SEG            equ     (CONSTS_BASE+SEG_DS)/16
APPDATA_SEG       equ     (APP2_BASE+APPDATA_ORIGIN)/16
RAM_SEG           equ     (RAM_BASE+SEG_RAM)/16
; ata's anchor: its stock offset, or once its body grows, the low offset of
; the same phase (ata.asm).
        if      FW_VERSION >= 120
ATA_STOCK_LEN   equ     07dfh
        elseif  FW_VERSION >= 114
ATA_STOCK_LEN   equ     05ddh
        elseif  FW_VERSION >= 112
ATA_STOCK_LEN   equ     057bh
        elseif  FW_VERSION >= 110
ATA_STOCK_LEN   equ     0578h
        else
ATA_STOCK_LEN   equ     0577h
        endif
ATA_GREW        equ     ata_body_end <> ATA_STOCK_LEN
ATA_ANCHOR      equ     SEG_ATA+ATA_GREW*((0-SEG_ATA)&0fff0h)
ATA_SEG           equ     (ATA_BASE+ATA_ANCHOR)/16

; app0 and app1 reach app1 and ata near while those sit in segment 0, far
; otherwise.  decided on where the parts would sit with the near forms, not on
; APP1_SEG/ATA_SEG: a far form's extra bytes move the next part a paragraph,
; off segment 0, so a choice made on the result would hold itself up either way
; and the passes could settle on the far one in a stock build.  app1's choice
; keeps ata's far forms in app0 (they sit ahead of it); ata's leaves out both.
XS_APP0_APP1      equ     (xs_app1_call_end-xs_app1_call-3)+(xs_app1_vec_end-xs_app1_vec-5)+(xs_app1_vec2_end-xs_app1_vec2-5)
XS_APP0_ATA       equ     (xs_ata_call_end-xs_ata_call-3)+(xs_ata_vec_end-xs_ata_vec-5)
XS_APP1           equ     (xs_app1_thunk_end-xs_app1_jmp-3)
NEAR_APP0_END     equ     APP0_END-XS_APP0_APP1
NEAR_APP1         equ     NEAR_APP0_END+((0-(NEAR_APP0_END+SEG_APP1))&0fh)
APP1_FAR          equ     (NEAR_APP1+SEG_APP1)/16 <> 0
NEAR_APP0_END_A   equ     NEAR_APP0_END-XS_APP0_ATA
NEAR_APP1_A       equ     NEAR_APP0_END_A+((0-(NEAR_APP0_END_A+SEG_APP1))&0fh)
NEAR_APP1_END     equ     NEAR_APP1_A+APP1_END-XS_APP1
NEAR_ATA          equ     NEAR_APP1_END+((0-(NEAR_APP1_END+SEG_ATA))&0fh)
ATA_FAR           equ     (NEAR_ATA+ATA_ANCHOR)/16 <> 0
APP1_SEG          equ     (APP1_BASE+SEG_APP1)/16
APP0_SEG          equ     APP0_BASE/16

; the CPU reset vector: the boot block, not part of this image.
RESET_SEG         equ     0f000h
RESET_ENTRY       equ     0fff0h
