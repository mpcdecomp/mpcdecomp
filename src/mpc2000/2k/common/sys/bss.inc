; BSS from ../sys_bss.inc: the communal variables, LINK's paragraph-aligned
; c_common, on the first paragraph past the modules' _BSS (DS:4F40h v1.50,
; 5180h v1.72).  the version stamp, written over the image's last 16 bytes
; after LINK, covers its first 16 (v1.50) or 12 bytes; boot sweep (text1
; X_003EA, B_4EB0) zeroes them. BSS_END = first byte past sweep,
; SYS stack base, end of last object rounded to paragraph boundary.
; features' DATA tail (feat/defs.inc) starts here.
        if      FW_VERSION = 172

BSS_BASE                        equ     SYS_STAMP_END-12
        else
BSS_BASE                        equ     SYS_STAMP_END-16
        endif
_bss    set     BSS_BASE
        ifdef   GROWTH_PROOF
        BSS_GAP GROWTH_PROOF
        endif
        BSS     PTR_SAMPLE_DATA, 4                     ; SND, the sound list's head sentinel
        BSS     SMEM_POOL, 2
        BSS     SMEM_POOL_BASE_HI, 2
        BSS     SMEM_POOL_LEN, 2
        BSS     SMEM_POOL_LEN_HI, 2
        BSS     SMEM_POOL_NEXT, 514h
        BSS     SMEM_POOL_TAIL_NEXT, 2
        BSS     SMEM_POOL_USED, 2
        BSS     SMEM_POOL_FREE, 2
        BSS     W_56A6, 2
        BSS     W_56A8, 2
        BSS     B_56AA, 1
        BSS     P_56AB, 13h
        BSS     B_56BE, 1
        BSS_GAP 1
        BSS     B_56C0, 1
        BSS     G_MPC60_PAD_IDX, 1
        BSS     FP_56C2, 2
        BSS     W_56C4, 2
        BSS     W_56C6, 2
        BSS     W_56C8, 2
        BSS     W_56CA, 2
        BSS     W_56CC, 2
        BSS     VOICE_HOLD, 40h
        BSS     VOICE_TIMER, 40h
        BSS     TBL_574E, 40h
        BSS     TBL_578E, 40h
        BSS     G_WAVE_VALID, 2
        BSS     G_WAVE_COLS_DONE, 2
        BSS     G_WAVE_SMEM_START, 2
        BSS     G_WAVE_SMEM_START_HI, 2
        BSS     G_WAVE_SMEM_END, 2
        BSS     G_WAVE_SMEM_END_HI, 2
        BSS     TBL_WAVE_NEG_PEAK, 2
        BSS     TBL_WAVE_POS_PEAK, 3d2h
        BSS     W_5BAE, 2
        BSS     W_5BB0, 2
        BSS     G_METER_L_LEVEL, 2
        BSS     G_METER_L_PEAK, 2
        BSS     G_METER_R_LEVEL, 2
        BSS     G_METER_R_PEAK, 2
        BSS     G_SMEM_STATE_A, 1
        BSS     G_SMEM_STATE_B, 1
        BSS     W_5BBC, 2
        BSS     W_5BBE, 2
        BSS     TBL_MPC60_SND_HDR, 12h
        BSS     TBL_MPC60_SND_OFS, 2
        BSS     TBL_MPC60_SND_OFS_HI, 2
        BSS     TBL_MPC60_SND_LEN, 2
        BSS     TBL_MPC60_SND_LEN_HI, 2
        BSS     TBL_5BDA, 2
        BSS     TBL_5BDC, 6
        BSS     TBL_MPC60_SND_START, 2                 ; x28h = SND_START
        BSS     TBL_MPC60_SND_END, 2                   ; x28h = SND_END
        BSS     P_5BE6, 2
        BSS     P_5BE8, 2
        BSS     P_5BEA, 2
        BSS     TBL_MPC60_SND_LEVEL, 1                 ; SND_LEVEL if G_SMEM_STATE_B = 1; 100 if not
        BSS     TBL_5BED, 3
        BSS     P_5BF0, 2
        BSS     P_5BF2, 3
        BSS     TBL_5BF5, 1
        BSS     TBL_5BF6, 7a0h
        BSS     P_6396, 1
        BSS     TBL_MPC60_PAD_SND, 22h
        BSS     P_63B9, 0a0h
        BSS     TBL_6459, 20h
        BSS     TBL_6479, 20h
        BSS     TBL_6499, 20h
        BSS     G_MPC60_PAD_SEL, 1
        BSS     W_64BA, 2
        BSS     W_64BC, 2
        BSS     W_64BE, 2
        BSS     W_64C0, 2
        BSS     W_64C2, 2
        BSS     W_64C4, 2
        BSS     W_64C6, 2
        BSS     W_64C8, 2
        BSS     W_64CA, 2
        BSS     W_64CC, 2
        BSS     W_64CE, 2
        BSS     W_64D0, 2
        BSS     W_64D2, 2
        BSS     W_64D4, 2
        BSS     G_EDIT_FIELD_VAL, 2
        BSS     G_EDIT_FIELD_VAL_HI, 2
        BSS     P_64DA, 79ch
        BSS     G_ZONE_LEN, 2
        BSS     G_ZONE_LEN_HI, 2
        BSS     P_6C7A, 28h
        BSS     TBL_6CA2, 2
        BSS     TBL_6CA4, 1ad6h
        BSS     P_877A, 28h
        BSS     W_87A2, 2
        BSS     W_87A4, 2
        BSS_GAP 0ah
        BSS     P_87B0, 36h
        BSS     B_87E6, 1
        BSS_GAP 1
        BSS     G_ZONE_START, 2
        BSS     G_ZONE_START_HI, 2
        BSS     PTR_DMA_STATE, 4                       ; DMA state
        BSS     G_PGM_RETURN_PARAMS, 2
; per MIDI note, stride 3: a count pad_note_trigger bumps as the note sounds,
; then the ALT1/ALT2 notes a SIMULT pad adds; pad_note_release, if the count is
; set, clears it and cuts all three.
        BSS     NOTE_HELD, 1
        BSS     NOTE_HELD_ALT1, 1
        BSS     NOTE_HELD_ALT2, 17eh
        BSS     B_8972, 1
        BSS_GAP 1
        BSS     BUF_SYSEX_RX, 80h
        BSS     G_SYSEX_RX_LEN, 1
        BSS     G_SYSEX_RX_ACTIVE, 1
        BSS     G_FX_EFFECT_SEL, 2
        BSS     P_89F8, 12h
        BSS     G_COPY_SRC_PGM, 1
        BSS     G_COPY_SRC_NOTE, 1
        BSS     G_COPY_DST_PGM, 1
        BSS     G_COPY_DST_NOTE, 1
        BSS     B_8A0E, 1
        BSS_GAP 18fh
        BSS     P_8B9E, 100h
        BSS     G_MIDI_IN_RING_WR, 1
        BSS     G_MIDI_IN_RING_RD, 1
; the field a window edits, one record; field_register fills it
        BSS     WIN_FIELD_CHANGE_FN, 2
        BSS     WIN_FIELD_CHANGE_FN_SEG, 2
        BSS     WIN_FIELD_DRAW_FN, 2
        BSS     WIN_FIELD_DRAW_FN_SEG, 2
        BSS     G_FLAG_8CA8, 1
        BSS     WIN_FIELD_DIGITS, 1
        BSS     G_SEQ_MODE, 1
        BSS     B_8CAB, 1
        BSS     WIN_FIELD_X, 1
        BSS     EDIT_FIELD_Y, 1
        BSS     EDIT_CURSOR_X, 1
        BSS     EDIT_CURSOR_Y, 1
        BSS     WIN_FIELD_BOX_W, 1                     ; cursor box width, px = digits*6
        BSS     EDIT_CURSOR_H, 1
        BSS     WIN_FIELD_BOX_R, 1                     ; its right cell, x + box - 6
        BSS     WIN_FIELD_BOX_B, 1                     ; its bottom, y + 8
        BSS     WIN_FIELD_MODE, 2                      ; 0 u8 / 1 s8 / 2 u16 / 3 s16 / 4 u32
        BSS     WIN_FIELD_VAR, 4                       ; far ptr to the value being edited
        BSS     NUM_ENTRY_MIN, 2
        BSS     NUM_ENTRY_MIN_HI, 2
        BSS     NUM_ENTRY_MAX, 2
        BSS     NUM_ENTRY_MAX_HI, 2
        BSS     NUM_ENTRY_VALUE, 2
        BSS     NUM_ENTRY_VALUE_HI, 2
        BSS     NAME_EDIT_CHANGE_FN, 4
        BSS     BUF_NAME_EDIT, 0fh
        BSS     BUF_NAME_EDIT_LAST, 1
        BSS     B_8CDA, 1
        BSS     NAME_EDIT_CASE, 1
        BSS     NAME_EDIT_LAST_PAD, 2

; selects 1 of 4 channel/bank register windows for voice driver.
; `add al,[G_DSP_CHAN]` offsets MPC-ASIC register before `out 0A2h`.
; indexes T_DSP_CHAN (20-byte stride). range 0..3.  ?
        BSS     G_DSP_CHAN, 1                          ; 0..3
        BSS     B_8CDF, 1

; base MIDI note for 64 pad assignments. read then subtract 23h;
; rewritten as 23h unless result <= 3Fh. clamped to notes 35..98
; (4 banks x 16 pads). live value 23h.
        BSS     G_PAD_NOTE_BASE, 1                     ; clamped 23h..62h
        BSS     G_VELOCITY_MAX, 1                      ; 127

; G_PAD_BANK*16 + G_PAD_INDEX = pad 0..63. cursor keys move pair;
; each reads G_PAD_INDEX twice, masks 3 for column and 0Ch for row,
; refuses edge step. 4x4 grid packed row<<2|col. `and byte ptr
; [G_PAD_INDEX], 0Fh` also appears. index->note via `mov bl,[G_PAD_INDEX]
; / les di,[PTR_TRACK_DATA] / mov al,es:[bx+di] / sub ax,PGM_NOTE_BASE`.
        BSS     G_PAD_INDEX, 1                         ; 0..15 within the bank
        BSS     G_PAD_BANK, 1                          ; 0..3; `inc al / and al,3` cycles.
                                                       ; `add al,41h` prints A..D.
                                                       ; `shl ax,4` reaches pad offset.
        BSS     G_NOTE_IN, 1                           ; record[1] to G_PAD_NOTE_BASE
        BSS     G_VELOCITY_IN, 1                       ; velocity from record[2]. 7Fh field
                                                       ; next to G_VELOCITY_MAX  ?
        BSS     G_NOTE_CAPTURE, 2                      ; guard latch: `cmp [G_NOTE_CAPTURE],0
                                                       ; / je skip`  ?
        BSS     SDS_RX_PORT, 1
        BSS     SDS_TX_PORT, 1
        BSS     SDS_EXCL_CH, 1
        BSS     SDS_STEREO_SIDE, 1
        BSS     SDS_REQUEST_NUM, 1
        BSS     B_8CED, 1
        BSS     PTR_LCD_STATE, 4                       ; SND far ptr
        BSS     P_8CF2, 14h
        BSS     W_8D06, 2
        BSS     W_8D08, 2
        BSS     SDS_LOOP_END, 2
        BSS     SDS_LOOP_END_HI, 2
        BSS     SDS_SAMPLE_LEN, 2
        BSS     SDS_SAMPLE_LEN_HI, 2
        BSS     SDS_LOOP_LEN, 2
        BSS     SDS_LOOP_LEN_HI, 2
        BSS     SDS_LOOP_ON, 2
        BSS     SDS_SAMPLE_RATE, 0ah
        BSS     SDS_RX_SND_SLOT, 2
        BSS     W_8D24, 2
        BSS     W_8D26, 2
        BSS     SDS_RX_PACKET, 2
        BSS     SDS_TX_PACKET, 4
        BSS     SDS_SAMPLE_NUM, 2
        BSS     SDS_STATE, 2
        BSS     SDS_TX_ADDR, 2
        BSS     SDS_TX_ADDR_HI, 2
        BSS     SDS_RX_ADDR, 2
        BSS     SDS_RX_ADDR_HI, 2
        BSS     SDS_PACKET_COUNT, 2
        BSS     SDS_PKT_WORDS, 2
        BSS     SDS_TX_TIME, 2
        BSS     SDS_TX_TIMEOUT, 2
        BSS     B_8D42, 1
        BSS     B_8D43, 1
        BSS     P_8D44, 2
        BSS     P_8D46, 1feh
        BSS     PTR_MIDI_STATE, 4                      ; MIDI state
        BSS     W_8F48, 2
        BSS     W_8F4A, 2
        BSS     W_8F4C, 2
        BSS     P_8F4E, 11h
        BSS     B_8F5F, 1
        BSS     B_8F60, 1
        BSS     B_8F61, 1
        BSS     P_8F62, 12h
        BSS     G_ZONE_END, 2
        BSS     ZONE_END_HI, 2
        BSS     P_8F78, 40h
        BSS     W_8FB8, 2
        BSS     G_PENDING_DMA_MASK, 2
        BSS     TBL_SOUND_NAMES, 0eh
        BSS     B_8FCA, 1
        BSS     B_8FCB, 1
        BSS     B_8FCC, 1
        BSS     P_8FCD, 0eh
        BSS     B_8FDB, 1
        BSS     B_8FDC, 1
        BSS     B_8FDD, 1
        BSS_GAP 85eh
        BSS     W_983C, 2
        BSS     W_983E, 2
        BSS     ASIC_REG181_SHADOW, 2
        BSS     P_9842, 200h
        BSS     W_9A42, 2
        BSS     W_9A44, 2
        BSS     W_9A46, 2
        BSS     W_9A48, 2
        if      FW_VERSION = 172
        BSS     W_9A4A, 2
        BSS     B_9A4C, 1
        BSS_GAP 1
        else
        BSS     B_980A_V150, 1
        BSS     B_980B_V150, 1
        endif
        BSS     P_9A4E, 10h
        BSS     P_9A5E, 10h
        BSS     VOICE_TABLE, 0ch                       ; 32 x 12h; +0 the note sounding, 0FFh none
        BSS     P_9A7A, 2
        BSS     P_9A7C, 2
        BSS     P_9A7E, 230h
        BSS     SND_CURRENT, 4                         ; SND far ptr, the selected sound

; programs in compacting paragraph-granular arena at segment 5A00h.
; every table pointer has offset 0 with varying segment.
        BSS     PGM_TABLE, 60h                         ; 24 far pointers, stride 4
                                                       ; stock writes [bx-634Eh]
        BSS     PGM_CURRENT, 4                         ; selected program (far ptr).
                                                       ; program_select is only writer;
                                                       ; stores PGM_TABLE[slot] here
        BSS     PTR_TRACK_DATA, 4                      ; pad -> note map: PGM_CURRENT+PGM_PADMAP, or P_8F78
        BSS     PAD_INPUT_MODE, 2
        BSS     B_9D1C, 1
        BSS_GAP 1
        BSS     W_9D1E, 2
        BSS     SMEM_SIZE, 2
        BSS     SMEM_SIZE_HI, 2
        BSS     REC_PEAK_L, 2
        BSS     REC_PEAK_R, 2
        BSS     REC_PEAK_MONO, 2
        BSS     REC_TRIG_PEAK, 2
        BSS     REC_RING_POS, 2
        BSS     G_SAMPLE_MODE, 1                       ; 0,1,2
        BSS     G_SAMPLE_MODE_PREV, 1
        BSS     REC_PREREC_LEN, 2
        BSS     REC_LENGTH, 2
        BSS     REC_LENGTH_HI, 2
        BSS     REC_BUF_ADDR, 2
        BSS     REC_BUF_ADDR_HI, 2
        BSS     REC_DMA_POS, 2
        BSS     W_9D3C, 2
        BSS     W_9D3E, 2
        BSS     P_9D40, 2
        BSS     P_9D42, 12h
        BSS     PTR_SAMPLE_BUF, 4                      ; sample buffer
        BSS     W_9D58, 2
        BSS     B_9D5A, 1
        BSS     W_9D5B, 2
        BSS     W_9D5D, 2
        BSS     P_9D5F, 10h
        BSS     B_9D6F, 1
        BSS     PGM_SLOT, 1                            ; its slot number, 0..23 (program_select)
        BSS     MIX_STEREO_SOURCE, 1
        BSS     MIX_INDIV_SOURCE, 2
        BSS     RECORD_MIX_CHANGES, 3
        BSS     B_9D77, 1
        BSS     MIDI_VOLUME_VAL, 1
        BSS     SAMPLE_TIME, 2
        BSS     SAMPLE_INPUT, 1
        BSS     G_REC_MODE, 1                          ; 0,1,2
        BSS     SAMPLE_MONITOR, 1
        BSS     SAMPLE_THRESHOLD, 1
        BSS     SAMPLE_PREREC, 1
        BSS     PLAY_X_MODE, 1
        BSS     ZONE_EDIT_ACTION, 1
        BSS     TRIM_LEN_FIX, 1
        BSS     LOOP_LEN_FIX, 1
        BSS     ZONE_LEN_FIX, 1
        BSS     SND_EDIT_VIEW, 1
        BSS     MIDI_VOLUME_RX, 1
        BSS     PGM_CHANGE_RX, 1
        BSS     MIDI_LOCAL_MODE, 1
        BSS     P_9D89, 2
        BSS     G_STATE_9D8B, 1
        if      FW_VERSION = 172
        BSS     B_9D8C, 1
        BSS_GAP 1
        endif
        BSS     P_9D8E, 12h
        BSS     P_9DA0, 182h
        BSS     P_9F22, 2
        BSS     BUF_XFER, 1ah
        BSS     P_9F3E, 2
        BSS     P_9F40, 1e4h
        BSS     P_A124, 200h
        BSS     P_A324, 400h
        BSS     P_A724, 2
        BSS     P_A726, 2
BSS_TOP                         equ     _bss
BSS_END                         equ     (BSS_TOP+15)/16*16

        include "bss_check.inc"
