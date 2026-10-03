; EB-16 multi-FX records: same block/offsets in both; container differs
; (2K at PGM_CURRENT+091eh, XL at PGM+08deh). 2 entries each.
; ECHO_TYPE==2: 014Fh max (335 ms), else 029Eh (670 ms). reverb
; block: 2K only.

FXS_ENABLE              equ     005h    ; byte, OR'd with !B_87E6 into
FXS_FIELD_0A            equ     00ah    ; +0Ah..+15h: twelve bytes, all read by
FXS_FIELD_0B            equ     00bh    ;   TEXT1 int46_wrapper, which feeds them to
FXS_FIELD_0C            equ     00ch    ;   the ASIC register window  ?
FXS_FIELD_0D            equ     00dh
FXS_FIELD_0E            equ     00eh
FXS_FIELD_0F            equ     00fh
FXS_FIELD_10            equ     010h
FXS_FIELD_11            equ     011h
FXS_FIELD_12            equ     012h
FXS_FIELD_13            equ     013h
FXS_FIELD_14            equ     014h
FXS_FIELD_15            equ     015h
FXS_MOD_TYPE            equ     016h    ; byte, 0..5.  far_00A70 reads it and
FXS_FIELD_17            equ     017h    ; byte, read with the three below by dsp_00F4F  ?
FXS_MOD_SPEED           equ     018h    ; byte 0..63h.  ":MODULATION" screen
FXS_MOD_DEPTH           equ     019h    ; byte 0..63h, label "Depth:" at (151,31)
FXS_MOD_FEEDBACK        equ     01ah    ; byte -32h..+32h, "Feedback:" at (133,41)
FXS_FIELD_1B            equ     01bh    ; +1Bh..+1Fh: dsp_01053 / dsp_00924's group  ?
FXS_FIELD_1C            equ     01ch
FXS_FIELD_1D            equ     01dh
FXS_FIELD_1E            equ     01eh
FXS_FIELD_1F            equ     01fh
FXS_FIELD_20            equ     020h    ; +20h..+25h: dsp_0111B's group  ?
FXS_FIELD_21            equ     021h
FXS_FIELD_22            equ     022h
FXS_FIELD_23            equ     023h
FXS_FIELD_24            equ     024h
FXS_FIELD_25            equ     025h
FXS_FIELD_26            equ     026h    ; +26h..+2Fh: dsp_00E08's group  ?
FXS_FIELD_28            equ     028h
FXS_FIELD_2A            equ     02ah
FXS_FIELD_2C            equ     02ch
FXS_FIELD_2E            equ     02eh
FXS_FIELD_2F            equ     02fh
FXS_ECHO_TYPE           equ     030h    ; byte.  fn_0458A picks +34h when it is 2 and
FXS_ECHO_LR_OFS         equ     031h    ; byte -32h..+32h.  ":DELAY/ECHO" screen
FXS_ECHO_DELAY          equ     032h    ; word 0..29Eh (670 ms), "Feedback delay:
FXS_ECHO_DELAY2         equ     034h    ; word 0..14Fh (335 ms), same field position,
FXS_ECHO_FEEDBACK       equ     036h    ; byte 0..63h, "Feedback:  %" at (139,11),
FXS_ECHO_HFDAMP         equ     037h    ; byte 14h..42h, "HF damping:   Hz" at
FXS_FIELD_38            equ     038h    ; +38h..+47h: dsp_01204 and dsp_01529's group,
FXS_FIELD_3A            equ     03ah    ;   read through `xlat` level/pan curves and
FXS_FIELD_3B            equ     03bh    ;   multiplied together  ?
FXS_FIELD_3C            equ     03ch
FXS_FIELD_3E            equ     03eh
FXS_FIELD_3F            equ     03fh
FXS_FIELD_40            equ     040h
FXS_FIELD_41            equ     041h
FXS_FIELD_42            equ     042h
FXS_FIELD_43            equ     043h
FXS_FIELD_44            equ     044h
FXS_FIELD_45            equ     045h    ; byte, read straight off the block at five
FXS_FIELD_46            equ     046h    ; byte, the effect type; picks the edit screen's PAINT handler  ?
FXS_FIELD_47            equ     047h    ; byte, `cmp ...,0`  ?
SIZEOF_FXS              equ     048h    ; channel_validate's `imul ax,bx,48h`
FXR_TYPE                equ     000h    ; byte, index into FX_REVERB_LABELS
FXR_PREDELAY            equ     002h    ; word, ms
FXR_FIELD_04            equ     004h    ; ?
FXR_FIELD_06            equ     006h    ; ?
FXR_FIELD_08            equ     008h    ; ?
FXR_FIELD_0A            equ     00ah    ; byte 0..63h, field at (169,31)  ?
FXR_FIELD_0B            equ     00bh    ; byte -32h..+32h, field at (187,31)  ?
SIZEOF_FXR              equ     00ch    ; channel_get_ptr's bx*3 shl 2
