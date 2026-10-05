; EB-16 multi-FX records: same block/offsets in both; container differs
; (2K at PGM_CURRENT+091eh, XL at PGM+08deh). 2 entries each.
; ECHO_TYPE==2: 014Fh max (335 ms), else 029Eh (670 ms). reverb
; block: 2K only.

FXS_RING_FREQ           equ     000h    ; word, Hz: DISTORTION/RINGMOD <RINGMOD> "Freq:"
FXS_RING_DEPTH          equ     002h    ; byte, "Depth:  %"
FXS_DIST_GAIN           equ     003h    ; byte, <DISTORTION> "Gain:"
FXS_DIST_LEVEL          equ     004h    ; byte, "Level:"
FXS_ENABLE              equ     005h    ; byte, OR'd with !B_87E6 into
                                        ;   the Effect Mixer's "Direct sig:"
; +06h..+15h: the 4-BAND FILTER and the DIST/EQ mix, read by TEXT1
; int46_wrapper, which feeds them to the ASIC register window.  frequencies
; are indexes, 20 to a decade; gains signed dB
FXS_FLT_LOW_FREQ        equ     006h
FXS_FLT_LOW_GAIN        equ     007h
FXS_FLT_MID2_FREQ       equ     008h
FXS_FLT_MID2_GAIN       equ     009h
FXS_FLT_MID2_Q          equ     00ah
FXS_FLT_MID1_FREQ       equ     00bh
FXS_FLT_MID1_GAIN       equ     00ch
FXS_FLT_MID1_Q          equ     00dh
FXS_FLT_HIGH_FREQ       equ     00eh
FXS_FLT_HIGH_GAIN       equ     00fh
FXS_FLT_MID2_FMOD_SPEED equ     010h    ; tenths of a Hz
FXS_FLT_MID2_FMOD_DEPTH equ     011h
FXS_FLT_MID1_FMOD_SPEED equ     012h
FXS_FLT_MID1_FMOD_DEPTH equ     013h
FXS_MIX_DIST_LEVEL      equ     014h    ; Effect Mixer "Dist/EQ:" Lev
FXS_MIX_DIST_PAN        equ     015h    ;   Pan
FXS_MOD_TYPE            equ     016h    ; byte, 0..5.  far_00A70 reads it and
FXS_FIELD_17            equ     017h    ; byte, read with the three below by dsp_00F4F  ?
FXS_MOD_SPEED           equ     018h    ; byte 0..63h.  ":MODULATION" screen
FXS_MOD_DEPTH           equ     019h    ; byte 0..63h, label "Depth:" at (151,31)
FXS_MOD_FEEDBACK        equ     01ah    ; byte -32h..+32h, "Feedback:" at (133,41)
FXS_ROT_SPEED1          equ     01bh    ; byte, tenths: ROTARY SPEAKERS "Speed1:   Hz"
FXS_ROT_SPEED2          equ     01ch    ; byte, tenths, "Speed2:   Hz"
FXS_ROT_ACCEL           equ     01dh    ; byte, tenths, "Acceleration:   s"
FXS_ROT_DEPTH           equ     01eh    ; byte, "Depth:"
FXS_ROT_MIDI_CC         equ     01fh    ; byte, "MIDI control #:"
FXS_FMOD_SPEED          equ     020h    ; byte, tenths: <F-MOD> "Speed:   Hz" at (6Dh,15h)
FXS_FMOD_DEPTH          equ     021h    ; byte, "Depth:" (6Dh,1Fh)
FXS_FMOD_FEEDBACK       equ     022h    ; byte, "Feedback:" (6Dh,29h)
FXS_APAN_SPEED          equ     023h    ; byte, tenths: <AUTOPAN> "Speed:" (0C1h,15h)
FXS_APAN_DEPTH          equ     024h    ; byte, "Depth:" (0C1h,1Fh)
FXS_APAN_MODE           equ     025h    ; byte, FX_PAN_LABELS: PAN, L>R, R>L, TERM
FXS_PITCH_TUNE_L        equ     026h    ; word, PITCH SHIFT "Left   Right" / "Tune:"
FXS_PITCH_TUNE_R        equ     028h    ; word
FXS_PITCH_DELAY_L       equ     02ah    ; word, ms; PITCH+FEEDBACK only (G_FX_EFFECT_SEL 6)
FXS_PITCH_DELAY_R       equ     02ch    ; word, ms
FXS_PITCH_FDBK_L        equ     02eh    ; byte, "Feedback:"
FXS_PITCH_FDBK_R        equ     02fh    ; byte
FXS_ECHO_TYPE           equ     030h    ; byte.  fn_0458A picks +34h when it is 2 and
FXS_ECHO_LR_OFS         equ     031h    ; byte -32h..+32h.  ":DELAY/ECHO" screen
FXS_ECHO_DELAY          equ     032h    ; word 0..29Eh (670 ms), "Feedback delay:
FXS_ECHO_DELAY2         equ     034h    ; word 0..14Fh (335 ms), same field position,
FXS_ECHO_FEEDBACK       equ     036h    ; byte 0..63h, "Feedback:  %" at (139,11),
FXS_ECHO_HFDAMP         equ     037h    ; byte 14h..42h, "HF damping:   Hz" at
; +38h..+44h: the stereo delay and the rest of the Effect Mixer; dsp_01204
; and dsp_01529 read them through `xlat` level/pan curves
FXS_ST_DELAY_L          equ     038h    ; word, ms, 0..14Fh: "Feedback delay:" Left
FXS_ST_FDBK_L           equ     03ah    ; byte, "Feedback:   %"
FXS_ST_HFDAMP_L         equ     03bh    ; byte, "HF damping:   Hz"
FXS_ST_DELAY_R          equ     03ch    ; word, ms, Right
FXS_ST_FDBK_R           equ     03eh
FXS_ST_HFDAMP_R         equ     03fh
FXS_MIX_MOD_LEVEL       equ     040h    ; Effect Mixer "Mod/Echo:" Lev
FXS_MIX_MOD_PAN         equ     041h    ;   Pan
FXS_MIX_MOD_WIDTH       equ     042h    ;   Wid
FXS_MIX_REV_LEVEL       equ     043h    ; "Reverb:" Lev
FXS_MIX_REV_PAN         equ     044h    ;   Pan
FXS_SECTIONS            equ     045h    ; byte, the sections that are on, one bit each:
FXS_SEC_DIST            equ     020h    ;   drawn filled on the FX screens' section row
FXS_SEC_FILTER          equ     010h
FXS_SEC_MOD             equ     008h
FXS_SEC_ECHO            equ     004h
FXS_SEC_REVERB          equ     002h
FXS_SEC_MIX             equ     001h
FXS_ROUTE               equ     046h    ; byte, FX_ROUTE_LABELS; picks the FX screen's PAINT
                                        ;   handler and section order
FXS_FIELD_47            equ     047h    ; byte, `cmp ...,0`  ?
FXS_ECHO_DELAY_MAX      equ     29eh    ; 670 ms
FXS_ECHO_DELAY2_MAX     equ     14fh    ; 335 ms, ECHO_TYPE 2
SIZEOF_FXS              equ     048h    ; channel_validate's `imul ax,bx,48h`
FXR_TYPE                equ     000h    ; byte, index into FX_REVERB_LABELS
FXR_SECTIONS            equ     001h    ; byte, as FXS_SECTIONS: the on bits
FXR_PREDELAY            equ     002h    ; word, ms
FXR_NEAR                equ     004h    ; byte, "Near:", types 0-3
FXR_LF_DAMP             equ     005h    ; byte, "LF damping:   Hz", types 0-3
FXR_HF_DAMP             equ     006h    ; byte, "HF damping:   Hz", types 0-3
FXR_TIME                equ     007h    ; byte, "Time:", types 0-3
FXR_DIFFUSE             equ     008h    ; byte, "Diffuse:"
FXR_GATE_TIME           equ     009h    ; byte, "Time:", GATED 1/2 and REVERSE
FXR_MIX_LEVEL           equ     00ah    ; byte 0..63h, Effect Mixer "Reverb:" Lev
FXR_MIX_PAN             equ     00bh    ; byte -32h..+32h, Pan
SIZEOF_FXR              equ     00ch    ; channel_get_ptr's bx*3 shl 2
