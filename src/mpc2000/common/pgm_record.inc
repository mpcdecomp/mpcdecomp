; program record: 09DEh bytes each, 24 total.
; =============================================================================
; arena at 5A00h (paragraph-granular); one record per slot.
; PGM_TABLE[slot] far ptr (offset 0), indexed by PGM_SLOT into
; PGM_CURRENT. program_select copies [slot] to PGM_CURRENT.
; four arrays contiguous: (1) header+name+PADMAP
; [far_memop_handler_1]; (2) note[0..3Fh] [loop_05AA2,
; calls 3-5]; (3) MIX 64x6 [far_memop_str_1 DATA:1DB6h];
; (4) FXS 2x48h [_memcpy_3 FXS_DEFAULT]; (5) FXR 4x0Ch
; [far_memop_str_2 FXR_DEFAULT]. XL: note 018h vs 01Dh, 0100h gap.

; ---- header, 000h..01Dh -----------------------------------------------------
PGM_BLK_PARA            equ     000h    ; dw: arena block size PARAGRAPHS;
                                        ;   smem_io_helper chains 24 slots:
                                        ;   [bp-2]+=es:[bx] per segment
PGM_BLK_FREE            equ     2       ; dw, this or below marks the slot unused;
                                        ; sequence_get_info shows DATA:26EDh
                                        ; "(no program)    " instead of name
PGM_COUNT               equ     24      ; PGM_TABLE's slots, "Prog. directory full(24 max)"
PGM_ALLOC_PARA          equ     09eh    ; int38_call_9e: 9Eh*10h=09E0h
                                        ; = SIZEOF_PGM rounded up
PGM_NAME                equ     002h    ; 16 chars + NUL; default DATA:1DC0h
                                        ; "NEW_PROGRAM_    " with ASCII slot+1
                                        ; digits at +0Ch/+0Dh
PGM_NAME_LEN            equ     16
PGM_NAME_NUL            equ     012h
PGM_HDR_NOTE            equ     013h    ; db MIDI note; 0 init, set to di+23h
                                        ;   by sample-set loader  ?
PGM_HDR_14              equ     014h    ; db, 088h at init  ?
PGM_HDR_15              equ     015h    ; db, 078h at init  ?
PGM_HDR_16              equ     016h    ; db, 00Ch at init  ?
PGM_HDR_17              equ     017h    ; db, 02Dh at init  ?
PGM_HDR_18              equ     018h    ; db, 000h at init  ?
PGM_HDR_19              equ     019h    ; db, 014h at init  ?
PGM_HDR_1A              equ     01ah    ; db, 0CEh at init  ?
PGM_HDR_1B              equ     01bh    ; db, 032h at init  ?
PGM_MIDI_PGM            equ     01ch    ; db 0-based; program_close draws +1 in
                                        ;   3-digit (169,37). Init=slot.
                                        ;   Under "MIDI program change:"
                                        ;   (49,37)
PGM_HDR_1D              equ     01dh    ; db, 023h init = PGM_NOTE_BASE;
                                        ;   unreferenced  ?

; 64 entries x01Dh, MIDI note 023h..062h. two idioms: raw note * stride
;   + PGM_PAD_NOTE0 (=-3D9h) or note-23h with +PGM_PADS. loop_05AA2
;   copies entry 0 forward until [bp-1]==40h. every note: lea
;   ax,[si-23h]/cmp ax,3fh/ja.
PGM_PAD_STRIDE          equ     01dh    ; 29.  21 stride multiplies
PGM_NOTE_BASE           equ     023h
PGM_NOTE_MAX            equ     062h    ; 023h + 63
PGM_PADS_PER_BANK       equ     16      ; four banks A..D

; program_record.inc skeleton needs SIZEOF_FXS/SIZEOF_FXR from
; fx_record.inc; include AFTER sys_records.inc.
SIZEOF_PGM_NOTE         equ     PGM_PAD_STRIDE
PGM_FX_GAP              equ     0
        include "program_record.inc"
PGM_PADS                equ     PGM_NOTES       ; PGM_PADS alias, 21 sites
PGM_PAD_BIAS            equ     PGM_NOTE_BASE*PGM_PAD_STRIDE-PGM_PADS   ; raw note * stride - this = pad offset
PGM_PAD_NOTE0           equ     -PGM_PAD_BIAS   ; where note 0's pad entry would sit: [rec+note*stride+PGM_PAD_NOTE0]

PGM_PAD_SND             equ     000h    ; dd: SND far ptr (0=none); pushed
                                        ;   to timer_value_read_4, which
                                        ;   prints sound name
PGM_PAD_SND_SEG         equ     002h
PGM_PAD_FIELD_04        equ     004h    ; db, no reference found  ?
PGM_PAD_MODE            equ     005h    ; db 0..3: NORMAL/SIMULT/VEL SW/
                                        ;   DCY SW (DATA:1DE4h +7 bytes).
                                        ;   Field (38,39), label (8,39)
                                        ;   on DATA:1F1Eh
PGM_PAD_SW1             equ     006h    ; db <=063h if MODE=3. (146,30)
                                        ;   "If over:   , use:" (98,30)
PGM_PAD_ALT1            equ     007h    ; db MIDI note, drawn as note name @
                                        ;   (200,30) ", use:" or
                                        ;   "  Also play note:" in SIMULT
PGM_PAD_SW2             equ     008h    ; db <=064h if MODE=3. (146,39)
PGM_PAD_ALT2            equ     009h    ; db, a MIDI note, note name at (200,39)
PGM_PAD_VOICE           equ     00ah    ; db 0..2: POLY/MONO/NOTE OFF
                                        ;   (DATA:20EEh +9). (190,40)
                                        ;   under "Voice Overlap:"
                                        ;   (190,22)/(190,31)
PGM_PAD_MUTE1           equ     00bh    ; db MIDI note (guarded cmp vs 23h);
                                        ;   track_calc_offset2 fetches that
                                        ;   note's sound name. ":Mute Assign"
                                        ;   first row DATA:2480h.
PGM_PAD_MUTE2           equ     00ch    ; db, a MIDI note, second row
PGM_PAD_TUNE            equ     00dh    ; dw signed. (220,12) beside
                                        ;   "Tune:" (190,12) DATA:214Ch;
                                        ;   again @":Velo>>Pitch"
PGM_PAD_ATTACK          equ     00fh    ; db 3-digit (44,22);
                                        ;   "Attack:" (2,22) under
                                        ;   "<Envelope>" (2,12)
PGM_PAD_DECAY           equ     010h    ; db, 3 digits at (44,31), "Decay:" (8,31)
PGM_PAD_DCY_MODE        equ     011h    ; db 0..1: "END  "/"START"
                                        ;   (DATA:20E2h +6). (44,40)
                                        ;   "Dcy md:" (2,40)
PGM_PAD_FLT_FREQ        equ     012h    ; db 3-digit (164,25);
                                        ;   "Freq:" (134,25) under
                                        ;   "<Filter>" (134,14)
PGM_PAD_FLT_RES         equ     013h    ; db 2-digit (170,36);
                                        ;   "Reson:" (134,36)
PGM_PAD_FENV_ATTACK     equ     014h    ; db 3-digit (61,23)
                                        ;   ":Velo/Env>>filter" DATA:2308h
                                        ;   "Attack:" (19,23)
PGM_PAD_FENV_DECAY      equ     015h    ; db, (61,33), "Decay:" at (25,33)
PGM_PAD_FENV_AMOUNT     equ     016h    ; db, (61,43), "Amount:" at (25,43)
PGM_PAD_V_LEVEL         equ     017h    ; db (103,43) DATA:224Eh;
                                        ;   ":Velocity Modulation"
                                        ;   "Velo> Level:" (31,43)
                                        ;   Loader default 064h
PGM_PAD_V_ATTACK        equ     018h    ; db (103,23) "Velo>Attack:"
                                        ;   (31,23). Loader default 0
PGM_PAD_V_START         equ     019h    ; db (103,33) "Velo> Start:"
                                        ;   (31,33). Loader default 0
PGM_PAD_V_FREQ          equ     01ah    ; db, (211,28), "Velo>Freq:" at (151,28)
PGM_PAD_FIELD_1B        equ     01bh    ; db=1 by sample-set loader,
                                        ;   unreferenced  ?
PGM_PAD_V_PITCH         equ     01ch    ; db signed -78h..+78h,
                                        ;   3-digit (205,28);
                                        ;   "Velo>Pitch:" (139,28)

; mix array 75Eh..8DDh: 64 entries x6, same MIDI index, same
;   two idioms (PGM_NOTE6 biased base). note_clamp: 23h..62h,
;   `base+note*6-PGM_MIX_BIAS`. far_memop_str_1 fills from
;   DATA:1DB6h = 64h 32h 64h 00 00 00. Fields drawn by
;   ":Channel Settings" (DATA:2CE4h), coords DATA:2D6Ah.
PGM_MIX_BIAS            equ     000d2h  ; = PGM_NOTE_BASE * SIZEOF_PGM_MIX
PGM_NOTE6               equ     0068ch  ; = PGM_MIX - PGM_MIX_BIAS

PGM_MIX_VOL             equ     000h    ; db 0..64h default 64h. (61,32)
                                        ;   "Vol:" (37,32) under
                                        ;   "STEREO" (37,22)
PGM_MIX_PAN             equ     001h    ; db 0..64h, default 32h; drawn as
                                        ;   value-32h at (61,41), "Pan:" (37,41)
PGM_MIX_IVOL            equ     002h    ; db 0..64h, default 64h; (121,32),
                                        ; "Vol:" at (91,32) under "INDIV" (115,22)
PGM_MIX_IOUT            equ     003h    ; low nib selects output from DATA:2A9Ah
                                        ; (4-byte stride)
                                        ; strings: " - ", " 1 "..." 8 "
                                        ; stereo pairs: "1+2"..."7+8"
                                        ; display (121,41), "Out:" (91,41)
                                        ; bit 7: stereo toggle shown at (187,31)
                                        ; YES/NO from DATA:2A8Ah at (199,41)
                                        ; toggle: `and ..,7fh` / `or ..,80h`
PGM_MIX_IOUT_MASK       equ     00fh
PGM_MIX_IOUT_FOLLOW     equ     080h
PGM_MIX_FX_LEVEL        equ     004h    ; db, 3 digits at (154,32), under "FX"
                                        ;   at (157,22)  ?
PGM_MIX_FX_BUS          equ     005h    ; db 0-4: DATA:2CA2h, 3 bytes apart:
                                        ; "--" "M1" "M2" "R1" "R2"
                                        ; 2 FXS, 4 FXR at (157,41)
                                        ; `cmp ..,4`:inc, `cmp ..,0`:dec

; ----- the pad map: 8DEh..91Dh
; 64 bytes, pad index -> MIDI note, 23h..62h
; PTR_TRACK_DATA points here, or to MASTER
; copy at DATA:8F78h when B_9D77 is set
; (draws PROGRAM/MASTER from DATA:1DD4h)
; both seeded from DATA:1D76h, `cx=20h/rep movsw`
; access: es:[bx+di] with pad index, no displacement
; no sub-fields in this array

; ----- EB-16 blocks: 91Eh..9DDh
; channel_validate: `imul ax,bx,48h / add ax,91eh`
; channel_get_ptr: `bx*3 shl 2 / add ax,9aeh`
; fields in fx_record.inc; bases & SIZEOF_PGM from
; program_record.inc; PGM_ALLOC_PARA leaves 2 bytes
; spare at paragraph boundary

; field values, in their label tables' order
PAD_MODE_NORMAL         equ     0       ; PGM_PAD_MODE, TBL_PAD_MODE_LABELS
PAD_MODE_SIMULT         equ     1       ;   ALT1/ALT2 play too
PAD_MODE_VEL_SW         equ     2
PAD_MODE_DCY_SW         equ     3
PAD_VOICE_POLY          equ     0       ; PGM_PAD_VOICE, TBL_VOICE_OVERLAP_LABELS
PAD_VOICE_MONO          equ     1
PAD_VOICE_NOTE_OFF      equ     2
DCY_MODE_END            equ     0       ; PGM_PAD_DCY_MODE, TBL_DECAY_MODE_LABELS
DCY_MODE_START          equ     1
FX_BUS_NONE             equ     0       ; PGM_MIX_FX_BUS, TBL_FX_BUS_LABELS
FX_BUS_M1               equ     1
FX_BUS_M2               equ     2
FX_BUS_R1               equ     3
FX_BUS_R2               equ     4
