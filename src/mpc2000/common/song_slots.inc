; SONG records, MPC2000.EXE data -- same shape in v1.50 and v1.72, base
; differs.  TBL_SONGS is SONG_COUNT records back to back, then
; SONG_RECORD_BLANK, one more that delete_song_do_it and
; delete_all_songs_do_it copy from.  PTR_CUR_SONG points at one.

; ---- record, 528 bytes -----------------------------------------------------
SONG_NAME_OFS    equ     0               ; "(Unused)" when empty
SONG_NAME_LEN    equ     16
SONG_STEPS_OFS   equ     SONG_NAME_OFS+SONG_NAME_LEN     ; 0FFh when empty
SONG_STEPS_MAX   equ     250             ; steps/song
SONG_STEP_SIZE   equ     2               ; bytes/step
SONG_STEPS_LEN   equ     SONG_STEPS_MAX*SONG_STEP_SIZE+2 ; +1 end-marker word
SONG_RESV_OFS    equ     SONG_STEPS_OFS+SONG_STEPS_LEN   ; 10 bytes, 0 when empty
SONG_RESV_LEN    equ     10              ;   SONG_USED, SONG_LOOP_* live here
SONG_SLOT_SIZE   equ     SONG_RESV_OFS+SONG_RESV_LEN     ; 210h = 528
SONG_COUNT       equ     20

SONG_EMPTY macro
        db      "(Unused)        "
        db      SONG_STEPS_LEN dup (0ffh)
        db      SONG_RESV_LEN dup (00h)
        endm
