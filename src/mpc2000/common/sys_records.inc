; MPC2000.SYS -- base+displacement record layouts, as equates.  v1.50 and v1.72
; share one text (src/mpc2000/2k/common/sys/), so both use these; layouts are
; identical.
;
; `?` in a comment: offset and width certain, meaning inferred.  `*_FIELD_NN`:
; meaning unknown.  a name applies only where the base register points at that
; record: `[si+1ch]` is SND_LENGTH only when SI is a sound node.

; =============================================================================
; SND -- the sound-directory node, 36h bytes.  "the sound", 128 max.
; =============================================================================
; TEXT2 far_074EE builds the pool: 128 nodes at DS:6C7Ah, stride 36h, linked
; into a free list at [PTR_SAMPLE_BUF].  [PTR_SAMPLE_DATA] = 877Ah and
; [PTR_DMA_STATE] = 87B0h are the head and tail sentinels of the live list,
; right after the pool.  128 = "Sound directory full(128max)" (DATA:246h).
;
; doubly linked, +28h next, +2Ch prev (sample_validate_ptr,
; sample_delete_flagged); walk is `si = head->[28h]` until [PTR_DMA_STATE].
; the 36h stride is also every `mov cx,1Bh / rep movsw|stosw` node copy/clear.
;
; MPC_STATE (state.inc) is this record and SND_CURRENT (09CAEh) the selected
; sound.  state.inc's names map: flag_13 = SND_STEREO, time = SND_START,
; pos = SND_END, range = SND_LENGTH, param = SND_LOOP, ptr_lo = SND_RATE
; (0AC44h = 44100), ref = SND_NEXT, reserved_2c = SND_PREV,
; cache_lo = SND_POOL_IDX.

; +14h/+18h/+20h: zone_action_delete fixes all three up like positions in
; SND_LENGTH units.  START/END/LOOP (`?`) from the file-header load order
; (text1 br_091AA: hdr+1Eh/22h/2Ch) and br_08633's `+20h = +18h` clamp.
SIZEOF_SND              equ     036h

; =============================================================================
; FXS -- an EB-16 multi-FX section block, 48h bytes, TWO per program
; =============================================================================
; TEXT2 channel_validate(i): index clamped 0..1, stride 48h, PGM_CURRENT+91Eh,
; between PGM_PADMAP and channel_get_ptr's array.  its editors index it with
; G_STATE_9D8B, the 0..3 selector of FX_TYPE_LABELS ("MULTI FX1".."REVERB 2",
; DATA:12C2h).  TEXT1 L_0187B hands the same block to the dsp_* writers.

; =============================================================================
; FXR -- an EB-16 reverb block, 0Ch bytes, FOUR per program
; =============================================================================
; TEXT2 channel_get_ptr(i): index 0..3, stride 0Ch, PGM_CURRENT+9AEh, right after
; the FXS array.  :REVERB (text1 L_0489A) reads +0 as the FX_REVERB_LABELS index
; and +2 as "Predelay:" at (97,21).


; =============================================================================
; DSPC -- T_DSP_CHAN's per-channel control block, stride 14h
; =============================================================================
; offsets TEXT1 dsp_00924 / dsp_01053 write after `mov si,T_DSP_CHAN / add si,ax`.

DSPC_FIELD_0A           equ     00ah    ; word  ?
DSPC_FIELD_0C           equ     00ch    ; word  ?
DSPC_FIELD_0E           equ     00eh    ; word  ?
DSPC_FIELD_10           equ     010h    ; word  ?
DSPC_FIELD_12           equ     012h    ; word  ?
SIZEOF_DSPC             equ     014h    ; = T_DSP_CHAN_STRIDE

; ---- the sound record, shared with the XL ----------------------------------
SND_HDR         equ     0               ; the 2K's record starts at the name
        include "sound_record.inc"

; ---- the EB-16 records, shared with the XL ----------------------------------
        include "fx_record.inc"

; Where this OS keeps them: inside the PROGRAM record, as the XL does, based at
; PGM_CURRENT (program_select stores PGM_TABLE[slot] there).  FXS at +091Eh,
; FXR at +09AEh, contiguous with PGM_PADMAP (pgm_record.inc).

