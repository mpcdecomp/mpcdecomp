; data segment: initialized data, then BSS (zeroed by entry stub to DATA_END)
; one source for v1.50/v1.72, FW_VERSION controls differences


SEQ_TEMPLATE:                           ; a new sequence's header, copied out
        db      000h, 000h, "Sequen"
        db      63h, 65h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 0b0h, 04h, 01h, 00h
        db      02h, 00h, 04h, 04h, 00h, 00h, 0ffh, 0ffh
D_0020:
        db      01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        SEQ_TRACK_NAMES

; 0x1fad0-0x1fb10, 64 x c0h -- per-track default, track flags (+430h)
D_0430:
        db      040h dup (0c0h)


; 0x1fb10-0x1fb50, 64 x 00h -- per-track default, Pgm OFF (+470h)
D_0470:
        db      040h dup (000h)


; 0x1fb50-0x1fb90, 64 x 64h -- per-track default, Velo% 100 (+4b0h)
FREE_1FB50:
        db      040h dup (064h)


; 0x1fb90-0x1fbd0, 64 x 02h -- per-track default, track flags (+4f0h)
FREE_1FB90:
        db      040h dup (002h)

        db      000h, 000h, "Sequence      " ; ..Sequence      
        db      20h, 20h, 00h, 00h, 0b0h, 04h, 01h, 00h
B_0548:
        db      02h, 00h, 04h, 04h, 00h, 00h, 0ffh, 0ffh, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        SEQ_TRACK_NAMES
        db      040h dup (0c0h)
        db      040h dup (000h)
        db      040h dup (064h)
        db      040h dup (002h)
        db      0c0h, 000h, 000h, 004h, 004h, 000h, 0ffh
        db      "      MPC2000 Ver 1."
        if      FW_VERSION = 172
        db      "72  ", 000h, "  MPC2000  "
D_0A8B:
        db      "May  14,1999 "
        else
        db      "50  ", 000h, "  MPC2000   "
D_0A8B:
        db      "Sep.20,1997 "
        endif
        db      000h, "MPC2000 ALL V1.5"
D_0AA9:
        db      "---------------"
        db      2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 2dh, 00h, 20h, 20h, 20h, 20h, 20h
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
        db      20h, 20h, 20h, 00h, 20h, 20h, 20h, 20h, 20h
D_0AE1:
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 20h, 20h, 20h
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
        db      20h, 20h, 20h, 20h, 20h, 00h
G_CREATE_SIZE:
        db      00h, 00h
G_CREATE_SIZE_HI:
        db      00h, 00h
UI_REDRAW_REQ:
        db      00h
D_0B13:
        db      06h
G_SHIFT_HELD:
        db      00h
B_0B15:
        db      00h
D_0B16:
        db      00h
G_REC_KEY_HELD:
        db      00h
G_ODUB_KEY_HELD:
        db      00h
G_REPEAT_KEYS_HELD:
        db      00h
G_OPEN_WINDOW_HELD:
        db      00h
G_LCD_CONTRAST:
        db      14h
B_0B1C:
        db      01h
B_0B1D:
        db      00h
B_0B1E:
        db      00h
D_0B1F:
        db      00h
SEL_SEQ:
        db      00h
SEL_TRACK:
        db      00h
G_TEMPO_SOURCE_SEQ:
        db      01h
G_MASTER_TEMPO:
        db      0b0h, 04h, 00h, 00h
G_TC_NOTE_VALUE:
        db      03h
B_0B28:
        db      00h
G_TRANSPOSE_AMOUNT:
        db      0ch
G_TRANSPOSE_TRACK:
        db      00h
G_SWING_PCT:
        db      00h
G_SHIFT_TIMING_LATER:
        db      00h
G_SHIFT_TIMING_AMOUNT:
        db      00h
G_COUNT_ENABLE:
        db      01h
G_COUNT_IN_MODE:
        db      01h
D_0B30:
        db      64h
G_METRO_RATE:
        db      00h
G_METRO_IN_PLAY:
        db      00h
G_METRO_IN_REC:
        db      01h
D_0B34:
        db      00h
D_0B35:
        db      00h
G_SOFT_THRU:
        db      01h
G_MIDI_RECEIVE_CH:
        db      00h
G_SUSTAIN_TO_DURATION:
        db      00h
G_MIDI_FILTER_ON:
        db      00h
D_0B3A:
        db      00h, 00h, 00h
D_0B3D:
        db      01h, 00h, 00h, 00h, 00h
G_MIDI_FILTER_SYSEX_PASS:
        db      00h
TBL_MIDI_FILTER_CC_PASS:                ; 1 byte/controller, all pass
        db      080h dup (001h)

G_SYNC_IN_MODE:
        db      000h
G_SYNC_OUT_MODE:
        db      000h
G_SYNC_SHIFT_EARLY:
        db      000h
G_SEND_MMC:
        db      000h
G_FRAME_RATE:
        db      001h
D_0BC8:
        db      000h, 000h, 000h, 000h, 000h
G_SYNC_IN_PORT:
        db      000h
D_0BCE:
        db      000h
D_0BCF:
        db      "Song"
        db      20h, 20h, 20h, 20h, 20h
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h

LOCATE_PT1:
        db      00h, 00h
LOCATE_PT1_HI:
        db      00h, 00h
D_0BE3:
        db      00h, 00h
D_0BE5:
        db      2 dup (0)
LOCATE_PT3:
        db      2 dup (0)
LOCATE_PT3_HI:
        db      2 dup (0)
D_0BEB:
        db      2 dup (0)
P_0BED:
        db      2 dup (0)
D_0BEF:
        db      2 dup (0)
D_0BF1:
        db      2 dup (0)
LOCATE_PT6:
        db      2 dup (0)
LOCATE_PT6_HI:
        db      2 dup (0)
LOCATE_PT7:
        db      2 dup (0)
LOCATE_PT7_HI:
        db      2 dup (0)
LOCATE_PT8:
        db      2 dup (0)
LOCATE_PT8_HI:
        db      2 dup (0)
D_0BFF:
        db      2 dup (0)
D_0C01:
        db      6 dup (0)
G_SONG_LOOP_ON:
        db      1 dup (0)
G_SONG_IGNORE_TEMPO:
        db      3 dup (0)
G_TAP_AVERAGING:
        db      1 dup (0)
B_0C0C:
        db      1 dup (0)
D_0C0D:
        db      1 dup (0)
D_0C0E:
        db      1 dup (0)
D_0C0F:
        db      1 dup (0)
D_0C10:
        db      1 dup (0)
D_0C11:
        db      1 dup (0)
D_0C12:
        db      1 dup (0)
D_0C13:
        db      1 dup (0)
D_0C14:
        db      1 dup (0)
D_0C15:
        db      2 dup (0)
D_0C17:
        db      8 dup (0)
D_0C1F:
        db      257 dup (0)
PANEL_RING_RD:
        db      1 dup (0)
PANEL_RING_WR:
        db      1 dup (0)
D_0D22:
        db      2 dup (0)
G_WHEEL_INC_PENDING:
        db      2 dup (0)
G_WHEEL_DEC_PENDING:
        db      2 dup (0)
D_0D28:
        db      2 dup (0)
G_SLIDER_POS:
        db      1 dup (0)
D_0D2B:
        db      1 dup (0)
D_0D2C:
        db      2 dup (0)
PAD_RING_WR:
        db      1 dup (0)
PAD_RING_RD:
        db      1 dup (0)
PAD_RING_RD_UI:
        db      2 dup (0)
NOTE_RING_WR:
        db      1 dup (0)
NOTE_RING_RD:
        db      1 dup (0)
G_LAST_PAD_NOTE:
        db      1 dup (0)
G_LAST_PAD:
        db      1 dup (0)
G_PAD_BANK_OFS:
        db      1 dup (0)
G_FULL_LEVEL:
        db      1 dup (0)
SIXTEEN_LEVELS_ON:
        db      2 dup (0)
NOTE_VAR_AFTER:
        db      1 dup (0)
B_0D3B:
        db      1 dup (0)
G_UNDO_SEQ_LED:
        db      2 dup (0)
TBL_PAD_VELOCITY:
        db      18 dup (0)
SND_EVENT_RD:
        db      1 dup (0)
SND_EVENT_WR:
        db      1 dup (0)
TBL_KEY_SLOT_OFS:
        db      1 dup (0)

        db      08h, 0ch, 10h, 14h, 18h, 1ch, 44h, 48h, 2ch, 38h, 50h, 54h, 40h, 28h, 24h, 34h
        db      "0<L hlptx|", 080h, 08ch, 090h, 094h, 098h, 084h ; 0<L hlptx|......
        db      64h, 5ch, 58h, 60h, 0a0h, 0a4h, 0a8h, 88h, 9ch
D_0D7C:
        db      8 dup (00h)
D_0D84:
        db      00h, 00h, 00h, 00h
UI_SLOT_F2:
        db      00h, 00h
UI_SLOT_F2_SEG:
        db      00h, 00h
D_0D8C:
        db      00h, 00h, 00h, 00h
D_0D90:
        db      00h, 00h
D_0D92:
        db      00h, 00h
D_0D94:
        db      00h, 00h, 00h, 00h
D_0D98:
        db      44 dup (00h)
W_0DC4:
        db      00h, 00h, 00h, 00h
W_0DC8:
        db      00h, 00h, 00h, 00h
D_0DCC:
        db      00h, 00h
D_0DCE:
        db      00h, 00h
UI_SLOT_OPEN_WINDOW:
        db      00h, 00h, 00h, 00h
D_0DD4:
        db      00h, 00h, 00h, 00h
D_0DD8:
        db      00h, 00h, 00h, 00h
D_0DDC:
        db      00h, 00h, 00h, 00h
D_0DE0:
        db      00h, 00h, 00h, 00h
UI_SLOT_AFTER:
        db      00h, 00h
UI_SLOT_AFTER_SEG:
        db      00h, 00h
D_0DE8:
        db      00h, 00h
W_0DEA:
        db      00h, 00h
D_0DEC:
        db      00h, 00h, 00h, 00h
D_0DF0:
        db      00h, 00h, 00h, 00h
D_0DF4:
        db      00h, 00h, 00h, 00h
D_0DF8:
        db      00h, 00h, 00h, 00h
W_0DFC:
        db      00h, 00h, 00h, 00h
D_0E00:
        db      00h, 00h, 00h, 00h
D_0E04:
        db      00h, 00h, 00h, 00h
D_0E08:
        db      8 dup (00h)
W_0E10:
        db      00h, 00h, 00h, 00h
W_0E14:
        db      00h, 00h, 00h, 00h
D_0E18:
        db      00h, 00h, 00h, 00h
UI_SLOT_BANK:
        db      00h, 00h
UI_SLOT_BANK_SEG:
        db      00h, 00h
UI_SLOT_FULL_LEVEL:
        db      00h, 00h
UI_SLOT_FULL_LEVEL_SEG:
        db      00h, 00h
D_0E24:
        db      00h, 00h, 2ah, 00h
UI_SLOT_WHEEL_INC:
        db      00h, 00h
UI_SLOT_WHEEL_INC_SEG:
        db      00h, 00h
UI_SLOT_WHEEL_DEC:
        db      00h, 00h
UI_SLOT_WHEEL_DEC_SEG:
        db      00h, 00h
D_0E30:
        db      00h, 00h
D_0E32:
        db      00h, 00h
D_0E34:
        db      00h, 00h
D_0E36:
        db      00h, 00h
D_0E38:
        db      00h, 00h, 00h, 00h
D_0E3C:
        db      8 dup (00h)
UI_SLOT_REFRESH:
        db      00h, 00h
D_0E46:
        db      00h, 00h
UI_SLOT_IDLE:
        db      00h, 00h, 00h, 00h
UI_SLOT_EXIT:
        db      00h, 00h, 00h, 00h
UI_SLOT_DIGIT:
        db      00h, 00h, 00h, 00h
D_0E54:
        db      00h, 00h, 00h, 00h
UI_SLOT_PAD_HIT:
        db      00h, 00h
D_0E5A:
        db      00h, 00h, 00h, 00h, 00h, 00h
D_0E60:
        db      00h, 00h, 00h, 00h
D_0E64:
        db      28 dup (00h)
D_0E80:
        db      48 dup (00h)
D_0EB0:
        db      8 dup (00h)
D_0EB8:
        db      24 dup (00h)
D_0ED0:
        db      8 dup (00h)
P_0ED8:
        db      12 dup (00h)
W_0EE4:
        db      12 dup (00h)
UI_REL_SLOT_REC:
        db      00h, 00h, 00h, 00h
UI_REL_SLOT_ODUB:
        db      26 dup (00h)
        db      2ah
        db      61 dup (00h)
D_0F4C:
        db      8 dup (00h)
W_0F54:
        db      00h, 00h
W_0F56:
        db      18 dup (00h)
W_0F68:
        db      00h, 00h, 00h, 00h
D_0F6C:
        db      00h, 00h, 00h, 00h
W_0F70:
        db      00h, 00h
W_0F72:
        db      00h, 00h, 00h, 00h, 00h, 00h
W_0F78:
        db      00h, 00h
W_0F7A:
        db      124 dup (00h)
        db      2ah
        db      61 dup (00h)
D_1034:
        db      00h, 00h
D_1036:
        db      40 dup (00h)
D_105E:
        db      16 dup (00h)
UI_SLOT_REFRESH_SAVE:
        db      00h, 00h
G_TICK_COUNT:
        db      00h, 00h
G_TIMEOUT_TICKS:
        db      00h, 00h
G_BLINK_TIMER:
        db      00h, 00h
G_TAP_TIMER:
        db      00h, 00h
W_1078:
        db      00h, 00h
G_KEY_REPEAT_DELAY:
        db      00h, 00h
G_KEY_REPEAT_TIMER:
        db      00h, 00h
D_107E:
        db      00h
D_107F:
        db      00h
G_BLINK_PERIOD:
        db      0f4h, 01h
G_BLINK_ENABLE:
        db      00h
G_BLINK_PHASE:
        db      00h
FIELD_VAL_SEG:
        db      00h, 00h
FIELD_VAL_PTR:
        db      00h, 00h
FIELD_CHANGE_CB:
        db      00h, 00h
FIELD_MAX_B:
        db      00h
D_108B:
        db      00h
FIELD_MAX_W:
        db      00h, 00h
FIELD_MIN_W:
        db      00h, 00h, 00h, 00h
DIGIT_ENTRY_DONE_CB:
        db      00h, 00h
DIGIT_ENTRY_VALUE:
        db      00h, 00h, 00h, 00h
D_1098:
        db      0a9h, 0ah
D_109A:
        db      10 dup (00h)
        db      "This is MPC2000 System program file $", 00h
        db      1024 dup (00h)
STACK_TOP:
        db      00h, 00h
G_TRACK_SOLO:
        db      00h
G_NEXT_SEQ:
        db      00h
B_14CE:
        db      00h
B_14CF:
        db      00h
G_TAP_HELD:
        db      00h
B_14D1:
        db      00h
B_14D2:
        db      00h
B_14D3:
        db      00h
G_MIDI_IN_RAW_MODE:
        db      00h
B_14D5:
        db      00h
B_14D6:
        db      00h
D_14D7:
        db      00h
NOW_BEAT_IDX:
        db      00h, 00h
NOW_BEAT_CLOCK:
        db      00h, 00h
FP_TIME_EDIT_VALUE:
        db      00h, 00h
TIME_EDIT_VALUE_SEG:
        db      00h, 00h, 00h
COPY_SEQ_DEST:
        db      00h, 00h
TSIG_BAR_FROM:
        db      00h, 00h
TSIG_BAR_TO:
        db      00h, 00h
D_14E7:
        db      03h
INSBARS_AFTER_BAR:
        db      00h, 00h
INSBARS_COUNT:
        db      00h, 00h
DELBARS_FIRST:
        db      00h, 00h
DELBARS_LAST:
        db      00h, 00h
INDEL_SEQ_LAST_BAR:
        db      00h, 00h
CHANGE_BARS_NEW_LEN:
        db      00h, 00h
TC_NOTE_LO:
        db      00h
TC_NOTE_HI:
        db      7fh
TC_IN_PROGRESS:
        db      00h, 00h
D_14F8:
        db      00h
D_14F9:
        db      03h
        db      "24 25 30D30 "
D_1506:
        db      03h
        db      "MASSEQ"
TBL_NOTE_VALUE_NAMES:
        TBL_NOTE_VALUE_NAMES_DATA
D_153F:
        if      FW_VERSION = 172
        db      07h, 45h, 41h, 52h, 4ch
        db      "IERLATER  "
D_154E:
        db      018h, 018h, 010h, 00ch, 008h, 006h
        db      04h
D_1555:
        db      20h, 31h, 41h, 20h, 32h, 41h, 20h, 33h, 41h, 20h, 34h, 41h, 20h, 35h, 41h
        db      20h, 36h, 41h, 20h, 37h, 41h, 20h, 38h, 41h, 20h, 39h, 41h, 31h, 30h, 41h, 31h
        db      31h, 41h, 31h, 32h, 41h, 31h, 33h, 41h, 31h, 34h, 41h, 31h, 35h, 41h, 31h, 36h
        db      41h, 20h, 31h, 42h, 20h, 32h, 42h, 20h, 33h, 42h, 20h, 34h, 42h, 20h, 35h, 42h
        db      20h, 36h, 42h, 20h, 37h, 42h, 20h, 38h, 42h, 20h, 39h, 42h, 31h, 30h, 42h, 31h
        db      31h, 42h, 31h, 32h, 42h, 31h, 33h, 42h, 31h, 34h, 42h, 31h, 35h, 42h, 31h, 36h
        db      42h, 4fh, 46h, 46h
        else
        db      07h, 45h, 41h, 52h, 4ch, 49h, 45h, 52h
        db      "LATER  " ; LATER  ....... 1
D_154E:
        db      000h, 018h, 010h, 00ch, 008h, 006h, 004h
D_1555:
        db      020h, 031h
        db      41h, 20h, 32h, 41h, 20h, 33h, 41h, 20h, 34h



        db      41h, 20h, 35h, 41h, 20h, 36h, 41h                                              ; A 5A 6A
        db      20h, 37h, 41h, 20h, 38h, 41h, 20h, 39h, 41h, 31h, 30h, 41h, 31h, 31h, 41h, 31h ;  7A 8A 9A10A11A1
        db      32h, 41h, 31h, 33h, 41h, 31h, 34h, 41h, 31h, 35h, 41h, 31h, 36h, 41h, 20h, 31h ; 2A13A14A15A16A 1
        db      42h, 20h, 32h, 42h, 20h, 33h, 42h, 20h, 34h, 42h, 20h, 35h, 42h, 20h, 36h, 42h ; B 2B 3B 4B 5B 6B
        db      20h, 37h, 42h, 20h, 38h, 42h, 20h, 39h, 42h, 31h, 30h, 42h, 31h, 31h, 42h, 31h ;  7B 8B 9B10B11B1
        db      "2B13B14B15B16BOF" ; 2B13B14B15B16BOF
        db      46h
        endif
TBL_XS_15B8:
        TBL_XS_15B8_DATA
D_165A:
        db      0fh, 42h, 41h, 52h, 2ch, 42h, 45h, 41h, 54h, 2ch, 43h, 4ch, 4fh
        db      "CK HOUR,MINUTE,S" ; CK HOUR,MINUTE,S
        db      "EC" ; EC(Press ENTER t
D_1679:
        db      "(Press ENTER t"
        db      "o commit.)"                     ; o commit.)

; 0x20d31-0x20d9f, 110 bytes of 00h -- zero-init variables in use
FREE_20D31:
        db      1 dup (0)
SCSI_CDB:
        db      2 dup (0)
D_1694:
        db      10 dup (0)
FP_SCSI_XFER_BUF:
        db      2 dup (0)
SCSI_XFER_BUF_SEG:
        db      2 dup (0)
SCSI_XFER_LEN:
        db      2 dup (0)
SCSI_BLOCK_SIZE:
        db      2 dup (0)
SCSI_SECTORS_PER_BLOCK:
        db      2 dup (0)
SCSI_TARGET_ID_BIT:
        db      1 dup (0)
SCSI_HOST_ID_BIT:
        db      1 dup (0)
SCSI_STATUS_BYTE:
        db      1 dup (0)
SCSI_MSG_IN_BUF:
        db      10 dup (0)
SCSI_MSG_IN_IDX:
        db      1 dup (0)
D_16B6:
        db      20 dup (0)
D_16CA:
        db      2 dup (0)
SCSI_SENSE_KEY:
        db      18 dup (0)
SCSI_FUNC_CODE:
        db      1 dup (0)
SCSI_SECTORS_LEFT:
        db      3 dup (0)
LCD_FB_BASE:                            ; shadow framebuffer base word
        db      00h, 00h
LCD_FB_BASE_SAVED:
        db      00h, 00h
LCD_PLANE_PUSHED:
        db      00h
LCD_ATTR:                               ; glyph attribute byte (0FCh / 000h)
        db      00h
LCD_MSG_OVERLAY:
        db      00h
LCD_PROMPT_ROW:
        db      00h, 00h, 00h
LCD_HILITE_POS:
        db      00h, 00h
LCD_HILITE_SIZE:
        db      00h, 00h, 00h, 00h
        if      FW_VERSION = 150
LCD_PEN_X:
        endif
TBL_BITS_NOTE_NAMES:
        if      FW_VERSION = 150
LCD_PEN_Y                       equ     $+1
L_20DA2                         equ     $+16
        endif
LCD_RECT_W                      equ     $+2
LCD_RECT_H                      equ     $+3
LCD_LINE_X0                     equ     $+4
LCD_LINE_Y0                     equ     $+6
LCD_LINE_X1                     equ     $+8
LCD_LINE_Y1                     equ     $+10
LCD_NUM_NONBLANK                equ     $+12
TBL_OCTAVE_CHARS                equ     $+81
D_174F                          equ     $+93
D_16FF                          equ     $+13
D_1707                          equ     $+21
        TBL_BITS_NOTE_NAMES_DATA
        if      FW_VERSION = 172
LCD_PEN_X                       equ     TBL_BITS_NOTE_NAMES  ; pen X in pixels
LCD_PEN_Y                       equ     TBL_BITS_NOTE_NAMES+1  ; pen Y in pixels
PTR_SAVE_SCREEN_FN:
        db      0b7h, 33h
G_FREE_SPACE:
        db      00h, 00h, 00h, 00h
G_FRAG_SPACE:
        db      00h, 00h, 01h
D_175F:
        db      10h, 4dh, 49h, 44h, 49h
        db      " FILE TYPE 0MIDI"
        db      " FILE TYPE 1"
D_1780:
        db      003h
D_1781:
        db      053h, 04eh, 044h
        db      "WAV"
        else
PTR_SAVE_SCREEN_FN:
        db      0c9h
G_FREE_SPACE                    equ     $+1
        db      32h, 00h, 00h, 00h
G_FRAG_SPACE                    equ     $+1
        db      00h, 00h, 00h, 01h
TBL_MIDI_FILE_TYPE_NAMES:
D_175F:
        TBL_MIDI_FILE_TYPE_NAMES_DATA
        endif
TBL_WITH_SOUNDS_LABELS:
        db      0bh, 57h, 49h
        db      "TH SOUNDS NO  SO"
        db      "UNDS"
STR_DEFAULT_MID_FILENAME:
        db      "SEQUNCE_1       "
        db      2eh, 4dh
        db      "ID"
        db      00h
STR_DEFAULT_ALL_FILENAME:
        db      41h, 4ch
        db      "L_SEQ_SONG1   "
        db      2eh, 41h
        db      "LL"
        db      00h
STR_DEFAULT_APS_FILENAME:
        db      41h, 4ch
        db      "L_PROGRAM    "
        db      " .APS"
        db      00h
P_17DD:
        db      50h, 52h
        db      "OGRAM_01      "
        db      2eh, 50h
        db      "GM"
        db      00h
P_17F2:
        db      20h
        db      "              "
D_1803                          equ     $+2
        db      " .SND"
        db      00h
P_1807:
        db      20 dup (00h)
STR_NO_SOUND_NAME:
        db      20h
        db      "(No so"
        db      75h, 6eh
        db      64h
        db      ")     "
P_182B:
        db      00h, 00h, "(Unused"
        db      29h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      000h, 000h, 000h, 000h, 000h, 000h, 000h, "(Unused) "
        db      020h, 020h, 020h, 020h, 020h, 020h, 020h, 000h, 010h, "Floppy "
        db      "to FloppySCSI   "
        db      "to FloppyFloppy "
        if      FW_VERSION = 172
        db      "to SCSI  ", 00h
        else
L_20F1D:
        db      "to SCSI  "
        endif
P_188E:
        db      00h, 00h
P_1890:
        db      00h, 00h
P_1892:
        db      00h, 00h
P_1894:
        db      00h, 00h
P_1896:
        db      00h, 00h
P_1898:
        dw      NULL_HANDLER_OFS
P_189A:
        db      00h
P_189B:
        db      01h
        if      FW_VERSION = 172
D_189C:
        db      00h
        endif
P_189D:
        db      00h
P_189E:
        db      00h
COPYOS_EXE_SIZE_LO:
        if      FW_VERSION = 172
        db      00h, 00h, 00h, 00h, 00h
        else
        db      00h, 00h, 00h, 00h
        endif
        db      16 dup(0)
FMT_PART_SIZE_MB:
        db      8 dup (00h)
        if      FW_VERSION = 150
P_18BC:
        endif
TBL_DISK_TYPE_NAMES:
        if      FW_VERSION = 150
G_DISK_TYPE_SEL                 equ     $+1
TBL_DISK_TYPE_LABELS            equ     $+2
L_20F5A                         equ     $+8
L_20F5D                         equ     $+11
L_20F6B                         equ     $+25
        endif
        TBL_DISK_TYPE_NAMES_DATA
        if      FW_VERSION = 172
G_DISK_TYPE_SEL                 equ     TBL_DISK_TYPE_NAMES+1
P_18BC                          equ     TBL_DISK_TYPE_NAMES
TBL_DISK_TYPE_LABELS            equ     TBL_DISK_TYPE_NAMES+2
        db      0c5h, 50h, 0c5h, 50h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0c3h
        db      54h, 0c3h, 54h, 00h, 00h, 00h, 00h, 7fh, 00h, 00h
        else
        db      0d5h, 50h, 0d5h, 50h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 0d3h
        db      "T"
L_20F8B:
        db      0d3h, 54h, 00h
L_20F8E:
        db      00h, 00h
        db      00h, 7fh, 00h
L_20F93:
        db      00h
        endif
P_18FE:
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
P_1906:
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 00h

; 0x20fad-0x210ef, 322 bytes of 00h -- zero-init variables in use
FREE_20FAD:
        db      193 dup(0)
P_19D8:
        db      71 dup (0)
D_1A1F:
        db      5 dup (0)
D_1A24:
        db      18 dup (0)
D_1A36:
        db      1 dup (0)
D_1A37:
        db      1 dup (0)
P_1A38:
        db      00h
P_1A39:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_1A52:
        db      00h, 00h
        db      00h, 00h, 00h, 00h, 00h
P_1A59:
        db      0f0h, 7fh, 7fh, 06h, 03h, 0f7h
P_1A5F:
        db      0f0h, 7fh, 7fh, 06h, 01h, 0f7h
P_1A65:
        db      0f0h, 7fh, 7fh, 06h, 44h, 06h, 01h
P_1A6C:
        if      FW_VERSION = 172
        db      00h, 00h, 00h, 00h, 00h, 0f7h, 18h, 19h
        db      01eh, 01eh, ")(!!SPBB", 00ah, 00ah, 00bh, 00bh, 00ah, 00ah
        db      0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah
        db      0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah
        db      0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah
        db      0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah
        db      0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah
        db      0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah
P_1AF0:
        db      0ah, 0ah, 0ah, 0ah
        else
        db      00h, 00h, 00h, 00h, 00h, 0f7h, 18h, 19h, 1eh, 1eh, ")(!"
        db      "!SPBB", 00ah, 00ah, 00bh, 00bh, 00ah, 00ah, 00bh, 00bh, 00ah, 00ah, 00ah
        db      0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh
        db      0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh
        db      0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah
        db      0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh
        db      0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh, 0ah, 0ah, 0bh
        db      0bh, 0ah, 0ah, 0ah, 0bh, 0ah, 0ah, 0bh, 0bh

; 0x21178-0x211e0, 104 x 0ah -- MTC quarter-frame ms table, 25 fps
FREE_21178:
        endif
        db      48 dup (0ah)
        if      FW_VERSION = 150
        db      0ah, 0ah
P_1AF0:
        endif
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah
        if      FW_VERSION = 172
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h
        db      09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h
        db      08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 7eh, 1ah
        db      0e2h, 1ah, 0c6h, 1bh, 4ah, 1bh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      62 dup (0)
D_1C92:
        db      2 dup (0)
        else
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah, 0ah
        db      0ah, 0ah, 0ah, 0ah, 0ah, 0ah

        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h
        db      08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 08h, 08h, 09h, 09h
        db      08h, 08h, 09h, 09h, 08h, 08h, 08h, 09h, 74h, 1ah, 0d8h, 1ah, 0bch, 1bh, 40h, 1bh

; 0x212e0-0x2132e, 78 bytes of 00h -- zero-init variables in use
FREE_212E0:
        db      72 dup(0)
        endif
MIDIIMP_BAR_TICKS:
        if      FW_VERSION = 172
        db      00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        else
        db      00h, 00h, 00h, 00h, 00h, 00h

        db      04h, 04h

; 0x21330-0x213b6, 134 bytes of 00h -- zero-init variables in use
FREE_21330:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_1CB9:
        db      105 dup(0)

        dw      P_7342
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 58h, 14h, 20h, 00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 80h, 01h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 0e8h, 03h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_1D5E:
        db      00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 60h

; 0x21414-0x214ca, 182 bytes of 00h -- zero-init variables in use
FREE_21414:
        endif
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h
        if      FW_VERSION = 172
P_1CB9:
        db      91 dup(0)
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        dw      P_7342
        db      16 dup(0)
        db      00h, 00h, 58h, 14h, 20h, 00h, 01h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      80h, 01h, 04h, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 0e8h, 03h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_1D5E:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 60h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
        endif
P_1D95:
        db      33 dup(0)
P_1DB6:
        db      128 dup(0)

P_1E36:
        db      01h, 30h, 20h, 18h, 10h, 0ch, 08h, "`@0 ", 18h, 10h, 0ch
        db      08h, 00h
NOTE_OFF_QUEUE:
        if      FW_VERSION = 172
        db      516 dup (00h)
D_204A:
        db      00h, 00h
        else
        db      516 dup(0)
        endif
P_204C:
        db      00h, 00h
P_204E:
        db      00h, 00h, 00h, "Seq"
        db      "uence        "
EMPTY_PGM_RECORD:
        db      02h, 00h
STR_UNUSED_PRG_FILENAME:
        db      "(Unused)      "
        db      "  .PRG", 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
P_2081:
        db      00h
P_2082:
        db      00h
P_2083:
        db      00h
P_2084:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_208C:
        db      00h
P_208D:
        db      00h
P_208E:
        db      00h
P_208F:
        db      00h, 00h, 00h, 00h, 00h
P_2094:
        db      44h
P_2095:
        db      08h
P_2096:
        db      40h, 9ch
P_2098:
        db      00h, 00h
P_209A:
        db      18h
P_209B:
        db      9ch, 08h, 0c2h, 0a2h, 10h, 00h, 24h, 44h, 08h
        db      40h, 9ch, 00h, 00h, 25h, 0e5h, 06h, 56h, 82h, 14h, 00h, 30h, 0e3h, 06h, 35h, 82h
        db      0ah, 00h, 30h, 00h
; the songs, empty (common/song_slots.inc), then the blank one the delete
; commands copy over a song
TBL_SONGS:
        rept    SONG_COUNT
        SONG_EMPTY
        endm
SONG_RECORD_BLANK:
        SONG_EMPTY
G_SONG_INDEX:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_4C14:
        db      00h, 00h, 00h, 00h, 00h, 00h
D_4C1A:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h
P_4C26:
        db      00h, 00h, 00h, 00h
P_4C2A:
        db      6 dup (0)
D_4C30:
        db      1010 dup (0)
P_5022:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_502A:
        db      00h, 00h
P_502C:
        db      00h, 00h
P_502E:
        db      00h, 00h
P_5030:
        if      FW_VERSION = 172
        db      1515 dup(0)
        else
        db      1545 dup(0)
        endif
P_561B:
        if      FW_VERSION = 172
        db      527 dup(0)
        else
        db      497 dup(0)
        endif
W_582A:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_5832:
        db      00h, 00h
        db      00h, 00h
G_EDIT_OP:
        db      02h
P_5837:
        db      64h, 00h, 00h, 00h
TBL_REC_MODE_NAMES:
        TBL_REC_MODE_NAMES_DATA
TBL_COUNT_IN_LABELS             equ     TBL_REC_MODE_NAMES
TBL_NOTE_DIV_LABELS             equ     TBL_REC_MODE_NAMES+25
TBL_OUTPUT_LABELS               equ     TBL_REC_MODE_NAMES+82
        db      07h, 49h, 47h, 4eh, 4fh, 52h, 45h, 20h, 52h, 45h, 43h, 45h, 49h, 56h, 45h
TBL_EVENT_TYPE_NAMES:
TBL_EVENT_TYPE_LABELS:
        TBL_EVENT_TYPE_NAMES_DATA
TBL_EDIT_OP_LABELS:
        db      0ah, 41h, 44h, 44h, 20h, 56h, 41h, 4ch
        db      "UE SUB VALUE MUL"
        db      "T VAL% SET TO VA"
        db      4ch
P_5945:
        db      00h
TBL_TRACK_BANK_LABELS:
        db      05h, "01-1617-3233-"
        db      "4849-64(Unused)", 000h
P_5964:
        db      00h, 00h, 00h, 00h
P_5968:
        db      00h, 00h, 00h, 00h, 00h
D_596D:
        db      00h, 00h, 7fh, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h
P_597A:
        db      00h, 00h, 00h, 00h
P_597E:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_5986:
        db      160 dup(0)
P_5A26:
        db      81 dup(0)
P_5A77:
        db      00h, 64h, 00h
G_STEP_EVENT_TYPE:
        db      00h, 02h, 00h, 00h, 00h, 00h, 00h
P_5A81:
        if      FW_VERSION = 172
        db      00h, 00h, 0c0h
        db      0eh, 00h, 00h
        else
        db      00h, 00h, 0dah, 0eh, 00h, 00h
        endif
P_5A87:
        db      01h, 0ffh, 06h, 03h, 04h, 05h, 02h
TBL_EVENT_FILTER_NAMES:
        TBL_EVENT_FILTER_NAMES_DATA
        db      54h
        db      "EMPO CHANGEEXCLU"
        db      "SIVE   "
TBL_STEP_EVENT_LABELS:
        db      0eh, "     NOTE   "
        db      "  NOTE+VARIATION" ;   NOTE+VARIATION
TBL_EVENT_TYPE_NAMES_LONG:
        TBL_EVENT_TYPE_NAMES_LONG_DATA
        db      54h, 45h, 4dh, 50h, 4fh
        db      " CHANGE   EXCLUS"
        db      "IVE       MIXER "
        db      "    "
P_5B88:
        db      084h dup (000h)

        db      3ch, 7fh, 40h, 00h, 00h, 80h, 3ch, 40h, 00h, 00h, 00h, 00h, 3ch, 7fh, 40h, 00h
        db      00h, 0e0h, 00h, 40h, 40h, 00h, 00h, 0b0h, 00h, 00h, 40h, 00h, 00h, 0c0h, 00h, 00h
        db      40h, 00h, 00h, 0d0h, 00h, 00h, 40h, 00h, 00h, 0a0h, 3ch, 00h, 0c1h, 00h, 00h, 0e8h
        db      03h, 00h
P_5C3E:
        db      80h, 00h, 00h, 00h, 00h, 00h
P_5C44:
        if      FW_VERSION = 172
        db      0c2h, 00h, 00h, 00h, 00h, 00h, 80h, 00h, 00h, 09h, 00h, 00h, 08h, 5ch, 0eh, 5ch
        db      1ah, 5ch, 20h, 5ch, 26h, 5ch, 2ch, 5ch, 32h, 5ch, 38h, 5ch, 3eh, 5ch, 4ah, 5ch
        else
        db      0c2h, 00h, 00h, 00h, 00h, 00h, 80h, 00h
        db      00h, 09h, 00h, 00h, 0fah, 5bh, 00h, 5ch, 0ch, 5ch, 12h, 5ch, 18h, 5ch, 1eh, 5ch
        db      24h, 5ch, 2ah, 5ch, 30h, 5ch, 3ch, 5ch
        endif
TBL_NOTE_VAR_PREFIX_LABELS:
        db      04h, "Tun:Dcy"
        db      ":Atk:Flt:"
TBL_NOTE_VAR_SHORT_LABELS:
        db      03h, "TunDcyAtkFlt:"
TBL_MIDI_CC_LABELS:
        db      0ch
TBL_MIDI_CC_NAMES:
        TBL_MIDI_CC_NAMES_DATA
P_5C84                          equ     TBL_MIDI_CC_NAMES
TBL_TC_VELOCITY_LABELS          equ     TBL_MIDI_CC_NAMES+1536
B_629F:
P_629F:
        db      00h
P_62A0:
        if      FW_VERSION = 172
        db      1ch, "   "
        else
        db      1ch, "           "
        endif
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h ;                 
        if      FW_VERSION = 172
        db      "         STEREO "
        db      "LEVEL   N:64/A01"
        db      "   L:STEREO PAN "
        db      20h, 20h, 20h, 20h, 4eh, 3ah, 36h, 34h, 2fh, 41h, 30h, 31h, 20h, 20h, 20h, 50h
        db      3ah
        else
        db      " STEREO LEVEL   " ;  STEREO LEVEL   
        db      "N:64/A01   L:STE" ; N:64/A01   L:STE
        db      "REO PAN     N:64" ; REO PAN     N:64
        db      2fh, 41h, 30h, 31h, 20h, 20h, 20h, 50h, 3ah
        endif
TBL_FXSEND_LEVEL_TEXT:
        TBL_FXSEND_LEVEL_TEXT_DATA
        db      49h, 4eh, 44h, 49h, 56h, 20h, 4ch
        db      "EVEL    N:64/A01"
        db      "   L:", 00h, 00h
G_NOTE_VAR_TYPE:
        db      00h, 00h, 00h
TBL_NOTE_VAR_TYPE_LABELS:
        db      06h, "TUNINGDECAY A"
        db      "TTACKFILTER#", 00h, 00h
P_636A:
        db      00h
P_636B:
        db      00h
TBL_VELO_NOTEVAR_LABELS:
        db      08h, "VELOCIT"
        db      59h, 4eh, 4fh, 54h, 45h, 20h, 56h, 41h, 52h
        if      FW_VERSION = 172
TBL_XS_637D:
        TBL_XS_637D_DATA
P_637D                          equ     TBL_XS_637D
P_6396                          equ     TBL_XS_637D+25
P_63B6                          equ     TBL_XS_637D+57
P_63CC                          equ     TBL_XS_637D+79
P_640A                          equ     TBL_XS_637D+141
P_644A:
        db      80h, 00h, 00h, 09h, 00h, 00h, 0f0h, 47h, 00h, 44h
        db      45h, 01h, 00h, 00h, 0f7h, 00h, 00h, 00h, 0c2h, 00h, 00h, 00h, 00h, 00h
REC_HELD_NOTES:
        db      640 dup (00h)
LCD_FONT:                               ; 5x7 glyph bitmaps, 7 bytes per char
        db      3dh, 25h
        db      25h, 25h, 25h, 25h, 3dh, 11h, 11h, 11h, 11h, 11h, 11h, 11h, 3dh, 21h, 21h, 3dh
        db      05h, 05h, 3dh, 3dh, 21h, 21h, 3dh, 21h, 21h, 3dh, 05h, 15h, 15h, 3dh, 11h, 11h
        db      11h, 3dh, 05h, 05h, 3dh, 21h, 21h, 3dh, 3dh, 05h, 05h, 3dh, 25h, 25h, 3dh, 04h
        db      0ch, 1fh, 3fh, 1fh, 0ch, 04h, 08h, 0ch, 3eh, 3fh, 3eh, 0ch, 08h, 1fh, 11h, 11h
        db      11h, 11h, 11h, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 15h, 0ah, 15h, 0ah, 15h
        db      0ah, 15h, 0ah, 15h, 0ah, 15h, 0ah, 15h, 0ah, 01h, 01h, 15h, 3fh, 15h, 01h, 01h
        db      1ch, 1ch, 1ch, 1ch, 3eh, 1ch, 08h, 08h, 1ch, 3eh, 1ch, 1ch, 1ch, 1ch, 10h, 18h
        db      10h, 17h, 10h, 10h, 38h, 38h, 20h, 20h, 3bh, 08h, 08h, 38h, 3fh, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 30h, 20h, 20h, 20h, 20h, 20h
        db      30h, 01h, 00h, 00h, 00h, 00h, 00h, 01h, 38h, 10h, 10h, 10h, 10h, 10h, 38h, 07h
        db      02h, 02h, 02h, 02h, 02h, 07h, 3ch, 28h, 28h, 28h, 28h, 28h, 3ch, 07h, 02h, 02h
        db      02h, 02h, 02h, 07h, 3ch, 08h, 08h, 08h, 08h, 08h, 1ch, 0fh, 05h, 05h, 05h, 02h
        db      02h, 02h, 00h, 06h, 05h, 04h, 24h, 14h, 0ch, 00h, 0ch, 0ah, 09h, 08h, 08h, 08h
        db      00h, 3eh, 3eh, 3eh, 3eh, 3eh, 00h, 04h, 0ch, 1ch, 3ch, 1ch, 0ch, 04h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 04h, 0ah, 0ah, 0ah, 00h
        db      00h, 00h, 00h, 0ah, 0ah, 1fh, 0ah, 1fh, 0ah, 0ah, 04h, 1eh, 05h, 0eh, 14h, 0fh
        db      04h, 03h, 13h, 08h, 04h, 02h, 19h, 18h, 06h, 09h, 05h, 02h, 15h, 09h, 16h, 06h
        db      04h, 02h, 00h, 00h, 00h, 00h, 08h, 04h, 02h, 02h, 02h, 04h, 08h, 02h, 04h, 08h
        db      08h, 08h, 04h, 02h, 00h, 04h, 15h, 0eh, 15h, 04h, 00h, 00h, 04h, 04h, 1fh, 04h
        db      04h, 00h, 00h, 00h, 00h, 00h, 06h, 04h, 02h, 00h, 00h, 00h, 1fh, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 06h, 06h, 00h, 10h, 08h, 04h, 02h, 01h, 00h, 0eh, 11h
        db      19h, 15h, 13h, 11h, 0eh, 04h, 06h, 04h, 04h, 04h, 04h, 0eh, 0eh, 11h, 10h, 08h
        db      04h, 02h, 1fh, 1fh, 08h, 04h, 08h, 10h, 11h, 0eh, 08h, 0ch, 0ah, 09h, 1fh, 08h
        db      08h, 1fh, 01h, 0fh, 10h, 10h, 11h, 0eh, 0ch, 02h, 01h, 0fh, 11h, 11h, 0eh, 1fh
        db      10h, 08h, 04h, 02h, 02h, 02h, 0eh, 11h, 11h, 0eh, 11h, 11h, 0eh, 0eh, 11h, 11h
        db      0eh, 10h, 08h, 06h, 00h, 06h, 06h, 00h, 06h, 06h, 00h, 00h, 06h, 06h, 00h, 06h
        db      04h, 02h, 08h, 04h, 02h, 01h, 02h, 04h, 08h, 00h, 00h, 1fh, 00h, 1fh, 00h, 00h
        db      02h, 04h, 08h, 10h, 08h, 04h, 02h, 0eh, 11h, 10h, 08h, 04h, 00h, 04h, 0eh, 11h
        db      10h, 16h, 15h, 15h, 0eh, 0eh, 11h, 11h, 11h, 1fh, 11h, 11h, 0fh, 11h, 11h, 0fh
        db      11h, 11h, 0fh, 0eh, 11h, 01h, 01h, 01h, 11h, 0eh, 07h, 09h, 11h, 11h, 11h, 09h
        db      07h, 1fh, 01h, 01h, 0fh, 01h, 01h, 1fh, 1fh, 01h, 01h, 0fh, 01h, 01h, 01h, 0eh
        db      11h, 01h, 1dh, 11h, 11h, 1eh, 11h, 11h, 11h, 1fh, 11h, 11h, 11h, 0eh, 04h, 04h
        db      04h, 04h, 04h, 0eh, 1ch, 08h, 08h, 08h, 08h, 09h, 06h, 11h, 09h, 05h, 03h, 05h
        db      09h, 11h, 01h, 01h, 01h, 01h, 01h, 01h, 1fh, 11h, 1bh, 15h, 15h, 11h, 11h, 11h
        db      11h, 11h, 13h, 15h, 19h, 11h, 11h, 0eh, 11h, 11h, 11h, 11h, 11h, 0eh, 0fh, 11h
        db      11h, 0fh, 01h, 01h, 01h, 0eh, 11h, 11h, 11h, 15h, 09h, 16h, 0fh, 11h, 11h, 0fh
        db      05h, 09h, 11h, 1eh, 01h, 01h, 0eh, 10h, 10h, 0fh, 1fh, 04h, 04h, 04h, 04h, 04h
        db      04h, 11h, 11h, 11h, 11h, 11h, 11h, 0eh, 11h, 11h, 11h, 11h, 11h, 0ah, 04h, 11h
        db      11h, 11h, 15h, 15h, 15h, 0ah, 11h, 11h, 0ah, 04h, 0ah, 11h, 11h, 11h, 11h, 11h
        db      0ah, 04h, 04h, 04h, 1fh, 10h, 08h, 04h, 02h, 01h, 1fh, 0eh, 02h, 02h, 02h, 02h
        db      02h, 0eh, 08h, 08h, 08h, 08h, 08h, 0eh, 07h, 1ch, 10h, 10h, 10h, 10h, 10h, 1ch
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1fh, 02h, 04h
        db      08h, 00h, 00h, 00h, 00h, 00h, 00h, 0eh, 10h, 1eh, 11h, 1eh, 01h, 01h, 0dh, 13h
        db      11h, 11h, 0fh, 00h, 00h, 0eh, 01h, 01h, 11h, 0eh, 10h, 10h, 16h, 19h, 11h, 11h
        db      1eh, 00h, 00h, 0eh, 11h, 1fh, 01h, 0eh, 0ch, 12h, 02h, 07h, 02h, 02h, 02h, 00h
        db      1eh, 11h, 11h, 1eh, 10h, 0eh, 01h, 01h, 0dh, 13h, 11h, 11h, 11h, 04h, 00h, 06h
        db      04h, 04h, 04h, 0eh, 08h, 00h, 0ch, 08h, 08h, 09h, 06h, 01h, 01h, 09h, 05h, 03h
        db      05h, 09h, 06h, 04h, 04h, 04h, 04h, 04h, 0eh, 00h, 00h, 0bh, 15h, 15h, 11h, 11h
        db      00h, 00h, 0dh, 13h, 11h, 11h, 11h, 00h, 00h, 0eh, 11h, 11h, 11h, 0eh, 00h, 00h
        db      0fh, 11h, 0fh, 01h, 01h, 00h, 00h, 16h, 19h, 1eh, 10h, 10h, 00h, 00h, 0dh, 13h
        db      01h, 01h, 01h, 00h, 00h, 0eh, 01h, 0eh, 10h, 0fh, 02h, 02h, 07h, 02h, 02h, 12h
        db      0ch, 00h, 00h, 11h, 11h, 11h, 19h, 16h, 00h, 00h, 11h, 11h, 11h, 0ah, 04h, 00h
        db      00h, 11h, 11h, 15h, 15h, 0ah, 00h, 00h, 11h, 0ah, 04h, 0ah, 11h, 00h, 00h, 11h
        db      11h, 1eh, 10h, 0eh, 00h, 00h, 1fh, 08h, 04h, 02h, 1fh, 08h, 04h, 04h, 02h, 04h
        db      04h, 08h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 02h, 04h, 04h, 08h, 04h, 04h, 02h
        db      00h, 04h, 08h, 1fh, 08h, 04h, 00h, 00h, 04h, 02h, 1fh, 02h, 04h, 00h
P_6A62:
        db      00h, 00h
        else
P_637D:
        db      04h, 09h, 0eh, 13h, 18h, 1dh, 22h, 27h, ",16;@EJ"
        db      "OTY^chmrw|"
P_6396:
        db      07h, 0dh, 13h, 19h, 16h, 1ch
        db      022h, "29?EKRX^d", 007h, 00fh, 019h, 01fh, 027h, 02fh ; "29?EKRX^d....'/
        db      "7?GOW_gow", 7fh
P_63B6:
        db      00h, 07h, 0eh, 14h, 1bh, 22h
        db      "(/6<MJPW^d"                     ; (/6<MJPW^d

; 0x25a58-0x25adc, 132 bytes of 00h -- zero-init variables in use
FREE_25A58:
        db      00h, 00h, 00h, 00h, 00h, 00h
P_63CC:
        db      62 dup(0)
P_640A:
        endif
        db      64 dup(0)
        if      FW_VERSION = 172
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0e0h, 0a0h
        db      0a0h, 0a0h, 0e0h, 40h, 40h, 40h, 40h, 40h, 0e0h, 20h, 0e0h, 80h, 0e0h, 0e0h, 20h, 60h
        db      20h, 0e0h, 80h, 0a0h, 0a0h, 0e0h, 20h, 0e0h, 80h, 0e0h, 20h, 0e0h, 0e0h, 80h, 0e0h, 0a0h
        db      0e0h, 0e0h, 0a0h, 20h, 20h, 20h, 0e0h, 0a0h, 0e0h, 0a0h, 0e0h, 0e0h, 0a0h, 0e0h, 20h, 0e0h
        db      32 dup(0)
        db      00h, 00h, 00h, 40h, 0a0h, 0a0h, 0e0h, 0a0h, 0c0h, 0a0h, 0c0h, 0a0h, 0c0h, 60h, 80h, 80h
        db      80h, 60h, 0c0h, 0a0h, 0a0h, 0a0h, 0c0h, 0e0h, 80h, 0e0h, 80h, 0e0h, 0e0h, 80h, 0c0h, 80h
        db      80h, 0e0h, 80h, 80h, 0a0h, 0e0h, 0a0h, 0a0h, 0e0h, 0a0h, 0a0h, 40h, 40h, 40h, 40h, 40h
        db      20h, 20h, 20h, 0a0h, 40h, 0a0h, 0c0h, 0c0h, 0a0h, 0a0h, 80h, 80h, 80h, 80h, 0e0h, 0a0h
        db      0e0h, 0e0h, 0a0h, 0a0h, 0a0h, 0e0h, 0e0h, 0e0h, 0a0h, 0e0h, 0a0h, 0a0h, 0a0h, 0e0h, 0e0h, 0a0h
        db      0e0h, 80h, 80h, 40h, 0a0h, 0a0h, 0e0h, 60h, 0e0h, 0a0h, 0c0h, 0a0h, 0a0h, 60h, 80h, 0e0h
        db      20h, 60h, 0e0h, 40h, 40h, 40h, 40h, 0a0h, 0a0h, 0a0h, 0a0h, 0e0h, 0a0h, 0a0h, 0a0h, 0a0h
        db      40h, 0a0h, 0a0h, 0e0h, 0e0h, 0a0h, 0a0h, 0a0h, 40h, 0a0h, 0a0h, 0a0h, 0a0h, 40h, 40h, 40h
        db      0e0h, 20h, 40h, 80h, 0e0h
D_6B89:
        db      0ffh, 03h, 0ffh, 0fh, 0ffh, 1fh, 0ffh, 3fh, 0ffh, 7fh, 0ffh
        db      7fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 7fh, 0ffh, 7fh, 0ffh
        db      3fh, 0ffh, 1fh, 0ffh, 0fh, 0ffh, 03h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        else

P_644A:
        db      80h, 00h, 00h, 09h, 00h, 00h, 0f0h, 47h, 00h, 44h, 45h, 01h, 00h, 00h, 0f7h, 00h
        db      00h, 00h, 0c2h

; 0x25aef-0x25d74, 645 bytes of 00h -- unverified, do not assume free
FREE_25AEF:
        db      00h, 00h, 00h, 00h, 00h
REC_HELD_NOTES:
        db      640 dup(0)

LCD_FONT:                               ; 5x7 glyph bitmaps (v1.72: 066E2h)
        db      3dh, 25h, 25h, 25h, 25h, 25h, 3dh, 11h, 11h, 11h, 11h, 11h, 11h, 11h, 3dh, 21h ; =%%%%%=.......=!
        db      21h, 3dh, 05h, 05h, 3dh, 3dh, 21h, 21h, 3dh, 21h, 21h, 3dh, 05h, 15h, 15h, 3dh ; !=..==!!=!!=...=
        db      11h, 11h, 11h, 3dh, 05h, 05h, 3dh, 21h, 21h, 3dh, 3dh, 05h, 05h, 3dh, 25h, 25h ; ...=..=!!==..=%%
        db      3dh, 04h, 0ch, 1fh, 3fh, 1fh, 0ch, 04h, 08h, 0ch, 3eh, 3fh, 3eh, 0ch, 08h, 1fh
        db      11h, 11h, 11h, 11h, 11h, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 1fh, 15h, 0ah, 15h
        db      0ah, 15h, 0ah, 15h, 0ah, 15h, 0ah, 15h, 0ah, 15h, 0ah, 01h, 01h, 15h, 3fh, 15h
        db      01h, 01h, 1ch, 1ch, 1ch, 1ch, 3eh, 1ch, 08h, 08h, 1ch, 3eh, 1ch, 1ch, 1ch, 1ch
        db      10h, 18h, 10h, 17h, 10h, 10h, 38h, 38h, 20h, 20h, 3bh, 08h, 08h, 38h, 3fh, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 30h, 20h, 20h, 20h
        db      20h, 20h, 30h, 01h, 00h, 00h, 00h, 00h, 00h, 01h, 38h, 10h, 10h, 10h, 10h, 10h
        db      38h, 07h, 02h, 02h, 02h, 02h, 02h, 07h, 3ch, 28h, 28h, 28h, 28h, 28h, 3ch, 07h ; 8.......<(((((<.
        db      02h, 02h, 02h, 02h, 02h, 07h, 3ch, 08h, 08h, 08h, 08h, 08h, 1ch, 0fh, 05h, 05h
        db      05h, 02h, 02h, 02h, 00h, 06h, 05h, 04h, 24h, 14h, 0ch, 00h, 0ch, 0ah, 09h, 08h
        db      08h, 08h, 00h, 3eh, 3eh, 3eh, 3eh, 3eh, 00h, 04h, 0ch, 1ch, 3ch, 1ch, 0ch, 04h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 04h, 04h, 04h, 04h, 00h, 00h, 04h, 0ah, 0ah
        db      0ah, 00h, 00h, 00h, 00h, 0ah, 0ah, 1fh, 0ah, 1fh, 0ah, 0ah, 04h, 1eh, 05h, 0eh
        db      14h, 0fh, 04h, 03h, 13h, 08h, 04h, 02h, 19h, 18h, 06h, 09h, 05h, 02h, 15h, 09h
        db      16h, 06h, 04h, 02h, 00h, 00h, 00h, 00h, 08h, 04h, 02h, 02h, 02h, 04h, 08h, 02h
        db      04h, 08h, 08h, 08h, 04h, 02h, 00h, 04h, 15h, 0eh, 15h, 04h, 00h, 00h, 04h, 04h
        db      1fh, 04h, 04h, 00h, 00h, 00h, 00h, 00h, 06h, 04h, 02h, 00h, 00h, 00h, 1fh, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 06h, 06h, 00h, 10h, 08h, 04h, 02h, 01h, 00h
        db      0eh, 11h, 19h, 15h, 13h, 11h, 0eh, 04h, 06h, 04h, 04h, 04h, 04h, 0eh, 0eh, 11h
        db      10h, 08h, 04h, 02h, 1fh, 1fh, 08h, 04h, 08h, 10h, 11h, 0eh, 08h, 0ch, 0ah, 09h
        db      1fh, 08h, 08h, 1fh, 01h, 0fh, 10h, 10h, 11h, 0eh, 0ch, 02h, 01h, 0fh, 11h, 11h
        db      0eh, 1fh, 10h, 08h, 04h, 02h, 02h, 02h, 0eh, 11h, 11h, 0eh, 11h, 11h, 0eh, 0eh
        db      11h, 11h, 0eh, 10h, 08h, 06h, 00h, 06h, 06h, 00h, 06h, 06h, 00h, 00h, 06h, 06h
        db      00h, 06h, 04h, 02h, 08h, 04h, 02h, 01h, 02h, 04h, 08h, 00h, 00h, 1fh, 00h, 1fh
        db      00h, 00h, 02h, 04h, 08h, 10h, 08h, 04h, 02h, 0eh, 11h, 10h, 08h, 04h, 00h, 04h
        db      0eh, 11h, 10h, 16h, 15h, 15h, 0eh, 0eh, 11h, 11h, 11h, 1fh, 11h, 11h, 0fh, 11h
        db      11h, 0fh, 11h, 11h, 0fh, 0eh, 11h, 01h, 01h, 01h, 11h, 0eh, 07h, 09h, 11h, 11h
        db      11h, 09h, 07h, 1fh, 01h, 01h, 0fh, 01h, 01h, 1fh, 1fh, 01h, 01h, 0fh, 01h, 01h
        db      01h, 0eh, 11h, 01h, 1dh, 11h, 11h, 1eh, 11h, 11h, 11h, 1fh, 11h, 11h, 11h, 0eh
        db      04h, 04h, 04h, 04h, 04h, 0eh, 1ch, 08h, 08h, 08h, 08h, 09h, 06h, 11h, 09h, 05h
        db      03h, 05h, 09h, 11h, 01h, 01h, 01h, 01h, 01h, 01h, 1fh, 11h, 1bh, 15h, 15h, 11h
        db      11h, 11h, 11h, 11h, 13h, 15h, 19h, 11h, 11h, 0eh, 11h, 11h, 11h, 11h, 11h, 0eh
        db      0fh, 11h, 11h, 0fh, 01h, 01h, 01h, 0eh, 11h, 11h, 11h, 15h, 09h, 16h, 0fh, 11h
        db      11h, 0fh, 05h, 09h, 11h, 1eh, 01h, 01h, 0eh, 10h, 10h, 0fh, 1fh, 04h, 04h, 04h
        db      04h, 04h, 04h, 11h, 11h, 11h, 11h, 11h, 11h, 0eh, 11h, 11h, 11h, 11h, 11h, 0ah
        db      04h, 11h, 11h, 11h, 15h, 15h, 15h, 0ah, 11h, 11h, 0ah, 04h, 0ah, 11h, 11h, 11h
        db      11h, 11h, 0ah, 04h, 04h, 04h, 1fh, 10h, 08h, 04h, 02h, 01h, 1fh, 0eh, 02h, 02h
        db      02h, 02h, 02h, 0eh, 08h, 08h, 08h, 08h, 08h, 0eh, 07h, 1ch, 10h, 10h, 10h, 10h
        db      10h, 1ch, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 1fh
        db      02h, 04h, 08h, 00h, 00h, 00h, 00h, 00h, 00h, 0eh, 10h, 1eh, 11h, 1eh, 01h, 01h
        db      0dh, 13h, 11h, 11h, 0fh, 00h, 00h, 0eh, 01h, 01h, 11h, 0eh, 10h, 10h, 16h, 19h
        db      11h, 11h, 1eh, 00h, 00h, 0eh, 11h, 1fh, 01h, 0eh, 0ch, 12h, 02h, 07h, 02h, 02h
        db      02h, 00h, 1eh, 11h, 11h, 1eh, 10h, 0eh, 01h, 01h, 0dh, 13h, 11h, 11h, 11h, 04h
        db      00h, 06h, 04h, 04h, 04h, 0eh, 08h, 00h, 0ch, 08h, 08h, 09h, 06h, 01h, 01h, 09h
        db      05h, 03h, 05h, 09h, 06h, 04h, 04h, 04h, 04h, 04h, 0eh, 00h, 00h, 0bh, 15h, 15h
        db      11h, 11h, 00h, 00h, 0dh, 13h, 11h, 11h, 11h, 00h, 00h, 0eh, 11h, 11h, 11h, 0eh
        db      00h, 00h, 0fh, 11h, 0fh, 01h, 01h, 00h, 00h, 16h, 19h, 1eh, 10h, 10h, 00h, 00h
        db      0dh, 13h, 01h, 01h, 01h, 00h, 00h, 0eh, 01h, 0eh, 10h, 0fh, 02h, 02h, 07h, 02h
        db      02h, 12h, 0ch, 00h, 00h, 11h, 11h, 11h, 19h, 16h, 00h, 00h, 11h, 11h, 11h, 0ah
        db      04h, 00h, 00h, 11h, 11h, 15h, 15h, 0ah, 00h, 00h, 11h, 0ah, 04h, 0ah, 11h, 00h
        db      00h, 11h, 11h, 1eh, 10h, 0eh, 00h, 00h, 1fh, 08h, 04h, 02h, 1fh, 08h, 04h, 04h
        db      02h, 04h, 04h, 08h, 04h, 04h, 04h, 04h, 04h, 04h, 04h, 02h, 04h, 04h, 08h, 04h
        db      04h, 02h, 00h, 04h, 08h, 1fh, 08h, 04h, 00h, 00h, 04h, 02h, 1fh, 02h, 04h

; 0x260f3-0x26144, 81 bytes of 00h -- unverified, do not assume free
FREE_260F3:
        db      00h
P_6A62:
        db      80 dup(0)

        db      0e0h, 0a0h, 0a0h, 0a0h, 0e0h, 40h, 40h, 40h, 40h, 40h, 0e0h, 20h, 0e0h, 80h, 0e0h, 0e0h
        db      20h, 60h, 20h, 0e0h, 80h, 0a0h, 0a0h, 0e0h, 20h, 0e0h, 80h, 0e0h, 20h, 0e0h, 0e0h, 80h
        db      0e0h, 0a0h, 0e0h, 0e0h, 0a0h, 20h, 20h, 20h, 0e0h, 0a0h, 0e0h, 0a0h, 0e0h, 0e0h, 0a0h, 0e0h
        db      20h, 0e0h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 40h, 0a0h, 0a0h, 0e0h, 0a0h, 0c0h, 0a0h, 0c0h, 0a0h, 0c0h, 60h
        db      80h, 80h, 80h, 60h, 0c0h, 0a0h, 0a0h, 0a0h, 0c0h, 0e0h, 80h, 0e0h, 80h, 0e0h, 0e0h, 80h
        db      0c0h, 80h, 80h, 0e0h, 80h, 80h, 0a0h, 0e0h, 0a0h, 0a0h, 0e0h, 0a0h, 0a0h, 40h, 40h, 40h
        db      40h, 40h, 20h, 20h, 20h, 0a0h, 40h, 0a0h, 0c0h, 0c0h, 0a0h, 0a0h, 80h, 80h, 80h, 80h
        db      0e0h, 0a0h, 0e0h, 0e0h, 0a0h, 0a0h, 0a0h, 0e0h, 0e0h, 0e0h, 0a0h, 0e0h, 0a0h, 0a0h, 0a0h, 0e0h
        db      0e0h, 0a0h, 0e0h, 80h, 80h, 40h, 0a0h, 0a0h, 0e0h, 60h, 0e0h, 0a0h, 0c0h, 0a0h, 0a0h, 60h
        db      80h, 0e0h, 20h, 60h, 0e0h, 40h, 40h, 40h, 40h, 0a0h, 0a0h, 0a0h, 0a0h, 0e0h, 0a0h, 0a0h
        db      0a0h, 0a0h, 40h, 0a0h, 0a0h, 0e0h, 0e0h, 0a0h, 0a0h, 0a0h, 40h, 0a0h, 0a0h, 0a0h, 0a0h, 40h
        db      40h, 40h, 0e0h, 20h, 40h, 80h, 0e0h
D_6B89:
        db      0ffh, 03h, 0ffh, 0fh, 0ffh, 1fh, 0ffh, 3fh, 0ffh
        db      7fh, 0ffh, 7fh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 7fh, 0ffh
        db      7fh, 0ffh, 3fh, 0ffh, 1fh, 0ffh, 0fh, 0ffh, 03h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        endif
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        if      FW_VERSION = 172
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 0ffh, 0f0h, 0ffh, 0f8h, 0ffh, 0fch
        db      0ffh, 0feh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0feh
        db      0ffh, 0feh, 0ffh, 0fch, 0ffh, 0f8h, 0ffh, 0f0h, 0ffh, 0c0h, 0ffh, 00h, 00h, 0ffh, 03h, 00h
        db      0eh, 00h, 18h, 00h, 30h, 00h, 20h, 00h, 60h, 00h, 40h, 00h, 40h, 00h, 40h, 00h
        db      60h, 00h, 20h, 00h, 30h, 00h, 18h, 00h, 0eh, 0ffh, 03h, 00h, 00h, 00h, 00h, 0ffh
        db      0ffh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0ffh, 0ffh, 00h, 00h, 00h
        db      00h, 0c0h, 0ffh, 70h, 00h, 18h, 00h, 0ch, 00h, 04h, 00h, 06h, 00h, 02h, 00h, 02h
        db      00h, 02h, 00h, 06h, 00h, 04h, 00h, 0ch, 00h, 18h, 00h, 70h, 00h, 0c0h, 0ffh, 00h
        db      00h, 55h, 55h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        else
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0c0h, 0ffh, 0f0h, 0ffh, 0f8h
        db      0ffh, 0fch, 0ffh, 0feh, 0ffh, 0feh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        db      0ffh, 0feh, 0ffh, 0feh, 0ffh, 0fch, 0ffh, 0f8h, 0ffh, 0f0h, 0ffh, 0c0h, 0ffh, 00h, 00h, 0ffh
        db      03h, 00h, 0eh, 00h, 18h, 00h, 30h, 00h, 20h, 00h, 60h, 00h, 40h, 00h, 40h, 00h
        db      40h, 00h, 60h, 00h, 20h, 00h, 30h, 00h, 18h, 00h, 0eh, 0ffh, 03h, 00h, 00h, 00h
        db      00h, 0ffh, 0ffh, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 0ffh, 0ffh, 00h
        db      00h, 00h, 00h, 0c0h, 0ffh, 70h, 00h, 18h, 00h, 0ch, 00h, 04h, 00h, 06h, 00h, 02h
        db      00h, 02h, 00h, 02h, 00h, 06h, 00h, 04h, 00h, 0ch, 00h, 18h, 00h, 70h, 00h, 0c0h
        db      0ffh, 00h, 00h, 55h, 55h, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        endif
        db      0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh, 0ffh
        if      FW_VERSION = 172
        db      0ffh, 55h, 55h
        else
        db      0ffh, 0ffh, 0ffh, 55h, 55h
        endif
BMP_MPC:                                ; 24x21 front panel: a display over the keys
        db      03h, 15h, 7fh, 0ffh, 0f0h, 80h, 00h, 08h, 80h, 00h, 08h, 0afh, 0e7h
        db      0c8h, 88h, 20h, 08h, 0afh, 0e7h, 0c8h, 80h, 00h, 08h, 83h, 00h, 08h, 84h, 80h, 08h
        db      84h, 80h, 08h, 83h, 1bh, 68h, 80h, 1bh, 68h, 83h, 00h, 08h, 0a3h, 1bh, 68h, 0a0h
        db      1bh, 68h, 0aah, 80h, 08h, 0a0h, 1bh, 68h, 0aah, 9bh, 68h, 80h, 00h, 08h, 0ffh, 0ffh
        db      0f8h
BMP_XS_6CB5:
        BMP_XS_6CB5_DATA
BMP_ARROW_BIG_LEFT              equ     BMP_XS_6CB5+478  ; 32x15 solid arrow, pointing left
BMP_ARROW_BIG_RIGHT             equ     BMP_XS_6CB5+416  ; 32x15 solid arrow, pointing right
BMP_ARROW_CURVE                 equ     BMP_XS_6CB5+965  ; 16x19 box with a curve leaving it        ; ?
BMP_ARROW_DOWN                  equ     BMP_XS_6CB5+604  ; 16x13 shaft and head, pointing down
BMP_ARROW_LEFT                  equ     BMP_XS_6CB5+572
BMP_ARROW_LONG                  equ     BMP_XS_6CB5+632  ; 32x18 long shaft, pointing right
BMP_ARROW_RIGHT                 equ     BMP_XS_6CB5+540  ; 16x15 shaft and head, pointing right
BMP_BRACE_HI                    equ     BMP_XS_6CB5+953  ; 8x4 upper half of a range brace          ; ?
BMP_BRACE_LO                    equ     BMP_XS_6CB5+959  ; 8x4 lower half                           ; ?
BMP_CDROM                       equ     BMP_XS_6CB5+251  ; 24x16 disc labelled CD-ROM
BMP_FLASH_ROM                   equ     BMP_XS_6CB5+354  ; 24x20 chip labelled FLASH ROM
BMP_FLOPPY                      equ     BMP_XS_6CB5+3  ; 24x21 floppy disk, blank label
BMP_FLOPPY_DD                   equ     BMP_XS_6CB5+133  ; 24x21 floppy disk labelled DD
BMP_FLOPPY_HD                   equ     BMP_XS_6CB5+68  ; 24x21 floppy disk labelled HD
BMP_HARD_DISK                   equ     BMP_XS_6CB5+198  ; 24x17 drive labelled HD
BMP_KEYS                        equ     BMP_XS_6CB5+765  ; 16x24 the keys alone
BMP_MO                          equ     BMP_XS_6CB5+301  ; 24x17 drive labelled MO
BMP_PAREN_L                     equ     BMP_XS_6CB5+1055  ; 8x16 tall '('
BMP_PAREN_R                     equ     BMP_XS_6CB5+1073  ; 8x16 tall ')'
BMP_PEN_KEYS                    equ     BMP_XS_6CB5+889  ; 16x25 the keys under a diagonal stroke   ; ?
BMP_SLIDER                      equ     BMP_XS_6CB5+1005  ; 16x23 the NV slider
BMP_TRASH                       equ     BMP_XS_6CB5+815  ; 24x24 bin, lid raised                    ; ?
BMP_TRI_DOWN                    equ     BMP_XS_6CB5+947  ; 8x4 solid triangle, apex down
BMP_TRI_UP                      equ     BMP_XS_6CB5+941  ; 8x4 solid triangle, apex up
BMP_WARNING                     equ     BMP_XS_6CB5+706  ; 24x19 triangle around an exclamation mark
        db      00h
P_70F9:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h
TBL_SYNC_MODE_NAMES:
        TBL_SYNC_MODE_NAMES_DATA
TBL_SYNC_MODE_LABELS            equ     TBL_SYNC_MODE_NAMES+1
        if      FW_VERSION = 172
        db      09h, 50h, 4ch, 41h, 59h
        db      " STRT  PLAY     "
        db      "STOP   REC+PLAY "
        db      "ODUB+PLAYREC/PUN"
        db      "CHODUB/PNCH   TA"
        db      "P   PAD BANK  PA"
        db      "D  1   PAD  2   "
        db      "PAD  3   PAD  4 "
        db      "  PAD  5   PAD  "
        db      "6   PAD  7   PAD"
        db      "  8   PAD  9   P"
        db      "AD 10   PAD 11  "
        db      " PAD 12   PAD 13"
        db      "   PAD 14   PAD "
        db      "15   PAD 16     "
        db      46h, 31h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 46h, 32h, 20h, 20h, 20h, 20h, 20h
        db      20h, 20h, 46h, 33h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 46h, 34h, 20h, 20h, 20h
        db      20h, 20h, 20h, 20h, 46h, 35h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 46h, 36h, 20h
        db      "   "
D_7257:
        db      02h, "A B AB"
        else
        db      09h, 50h, 4ch
        db      "AY STRT  PLAY   " ; AY STRT  PLAY   
        db      "  STOP   REC+PLA" ;   STOP   REC+PLA
        db      "Y ODUB+PLAYREC/P" ; Y ODUB+PLAYREC/P
        db      "UNCHODUB/PNCH   " ; UNCHODUB/PNCH   
        db      "TAP   PAD BANK  " ; TAP   PAD BANK  
        db      "PAD  1   PAD  2 " ; PAD  1   PAD  2 
        db      "  PAD  3   PAD  " ;   PAD  3   PAD  
        db      "4   PAD  5   PAD" ; 4   PAD  5   PAD
        db      "  6   PAD  7   P" ;   6   PAD  7   P
        db      "AD  8   PAD  9  " ; AD  8   PAD  9  
        db      " PAD 10   PAD 11" ;  PAD 10   PAD 11
        db      "   PAD 12   PAD " ;    PAD 12   PAD 
        db      "13   PAD 14   PA" ; 13   PAD 14   PA
        db      "D 15   PAD 16   " ; D 15   PAD 16   
        db      20h, 20h, 46h, 31h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 46h, 32h, 20h, 20h, 20h ;   F1       F2   
        db      20h, 20h, 20h, 20h, 46h, 33h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 46h, 34h, 20h ;     F3       F4 
        db      20h, 20h, 20h, 20h, 20h, 20h, 46h, 35h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 46h ;       F5       F
        db      36h, 20h, 20h, 20h, 20h

; 0x268e9-0x26b72, 649 bytes of 00h -- zero-init variables in use
FREE_268E9:
        db      00h
        endif
G_IMPORT_IS_MPC60:
        db      52 dup(0)
P_7292:
        db      00h, 00h
P_7294:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_729E:
        if      FW_VERSION = 172
        db      00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h
        else
        db      468 dup(0)
        endif
P_72A8:
        if      FW_VERSION = 172
        db      84 dup (00h)
P_72FC:
        db      426 dup (00h)
D_74A6:
        db      00h, 00h
D_74A8:
        db      00h, 00h
        else
        db      52 dup(0)
        endif
P_74AA:
        if      FW_VERSION = 172
        db      51 dup (00h)
TBL_SMF_HEADER:
        TBL_SMF_HEADER_DATA
P_74F3                          equ     TBL_SMF_HEADER+22
P_74F5                          equ     TBL_SMF_HEADER+24
P_74FC                          equ     TBL_SMF_HEADER+31
P_74FD                          equ     TBL_SMF_HEADER+32
P_74FE                          equ     TBL_SMF_HEADER+33
P_74FF                          equ     TBL_SMF_HEADER+34
STR_MIDI_MTHD                   equ     TBL_SMF_HEADER+13
        db      20h, 56h, 31h, 2eh, 37h, 32h, 20h, 20h, 20h
        else
        db      32 dup(0)
P_72FC:
        db      32 dup(0)

STR_MIDI_MTHD:
        db      "MThd", 00h, 00h, 00h, 06h, 00h
P_74F3:
        db      00h, 00h
P_74F5:
        db      00h, 00h, "`MT"
        db      72h, 6bh
P_74FC:
        db      00h
P_74FD:
        db      00h
P_74FE:
        db      00h
P_74FF:
        db      40h, 00h, 0ffh, 03h, " MPC200"
        db      "0 V1.50   "
        endif
P_7514:
        db      "   "
TBL_SEQ_LOOP_TEXT:
        TBL_SEQ_LOOP_TEXT_DATA
P_752E                          equ     TBL_SEQ_LOOP_TEXT+23
P_7537                          equ     TBL_SEQ_LOOP_TEXT+32
P_7538                          equ     TBL_SEQ_LOOP_TEXT+33
P_7539                          equ     TBL_SEQ_LOOP_TEXT+34
P_753F                          equ     TBL_SEQ_LOOP_TEXT+40
P_7540                          equ     TBL_SEQ_LOOP_TEXT+41
P_7541                          equ     TBL_SEQ_LOOP_TEXT+42
P_754A                          equ     TBL_SEQ_LOOP_TEXT+51
P_7550                          equ     TBL_SEQ_LOOP_TEXT+57
P_7551                          equ     TBL_SEQ_LOOP_TEXT+58
P_7552                          equ     TBL_SEQ_LOOP_TEXT+59
        db      58h, 04h
P_7557:
        db      00h
P_7558:
        if      FW_VERSION = 172
        db      00h, 18h, 08h, 00h, 0ffh, 54h, 05h
P_755F:
        else
        db      00h, 18h
        db      08h, 00h, 0ffh
TBL_SMF_TRACK_HEADER:
D_7561                          equ     $+4
        TBL_SMF_TRACK_HEADER_DATA
P_755F                          equ     TBL_SMF_TRACK_HEADER+2
P_7560                          equ     TBL_SMF_TRACK_HEADER+3
P_7562                          equ     TBL_SMF_TRACK_HEADER+5
P_7563                          equ     TBL_SMF_TRACK_HEADER+6
P_7569                          equ     TBL_SMF_TRACK_HEADER+12
P_756A                          equ     TBL_SMF_TRACK_HEADER+13
P_756B                          equ     TBL_SMF_TRACK_HEADER+14
P_756C                          equ     TBL_SMF_TRACK_HEADER+15
P_7571                          equ     TBL_SMF_TRACK_HEADER+20
P_7590                          equ     TBL_SMF_TRACK_HEADER+51
P_7591                          equ     TBL_SMF_TRACK_HEADER+52
P_7592                          equ     TBL_SMF_TRACK_HEADER+53
P_7593                          equ     TBL_SMF_TRACK_HEADER+54
P_7594                          equ     TBL_SMF_TRACK_HEADER+55
P_7595                          equ     TBL_SMF_TRACK_HEADER+56
P_7596                          equ     TBL_SMF_TRACK_HEADER+57
P_7597                          equ     TBL_SMF_TRACK_HEADER+58
P_7598                          equ     TBL_SMF_TRACK_HEADER+59
P_7599                          equ     TBL_SMF_TRACK_HEADER+60
STR_MIDI_MTRK                   equ     TBL_SMF_TRACK_HEADER+8
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h

; 0x26c2d-0x26d82, 341 bytes of 00h -- zero-init variables in use
FREE_26C2D:
        endif
        db      00h
        if      FW_VERSION = 172
P_7560:
        db      00h
D_7561:
        db      00h
P_7562:
        db      00h
P_7563:
        db      00h
        db      00h
STR_MIDI_MTRK:
        db      "MTrk"
P_7569:
        db      00h
P_756A:
        db      00h
P_756B:
        db      00h
P_756C:
        db      00h, 00h, 0ffh, 03h, 10h
P_7571:
        db      "   "
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 0ffh, 01h
        db      " TRACK DATA:"
P_7590:
        db      30h
P_7591:
        db      30h
P_7592:
        db      45h
P_7593:
        db      39h
P_7594:
        db      30h
P_7595:
        db      30h
P_7596:
        db      36h
P_7597:
        db      34h
P_7598:
        db      30h
P_7599:
        db      "1          "
        db      20h, 00h
        endif
P_75A6:
        db      00h, 00h
P_75A8:
        db      00h, 00h
P_75AA:
        db      00h, 00h
P_75AC:
        db      00h, 00h
        if      FW_VERSION = 172
D_75AE:
        db      00h, 00h
        endif
G_FROM_FILE_ADDR_LO:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_75BA:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_75C4:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_75CC:
        db      248 dup(0)
P_76C4:
        db      32 dup(0)
P_76E4:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_76FC:
        db      "MPC2000 "
        db      "MPC2000 ", 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
        db      16 dup(0)
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
D_7731:
        db      7fh, 41h
P_7733:
        db      23h, 00h, 00h, 00h, 00h
G_REPLACE_MERGE:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
P_7742:
        db      00h
P_7743:
        db      00h
TBL_REPLACE_MERGE_LABELS:
        db      07h, "REPLACE"
        db      "MERGE  "
TBL_SEMITONE_LABELS:
        if      FW_VERSION = 172
        TBL_TRANSPOSE_NAMES_DATA
D_779F:
        db      3fh, 0ceh
        else
        db      03h, "-12-11-1"
        db      30h, 2dh, 20h, 39h, 2dh, 20h, 38h, 2dh, 20h, 37h, 2dh, 20h, 36h, 2dh, 20h, 35h ; 0- 9- 8- 7- 6- 5
        db      2dh, 20h, 34h, 2dh, 20h, 33h, 2dh, 20h, 32h, 2dh, 20h, 31h, 20h, 20h, 30h, 2bh ; - 4- 3- 2- 1  0+
        db      20h, 31h, 2bh, 20h, 32h, 2bh, 20h, 33h, 2bh, 20h, 34h, 2bh, 20h, 35h, 2bh, 20h ;  1+ 2+ 3+ 4+ 5+ 
        db      36h, 2bh, 20h, 37h, 2bh, 20h, 38h, 2bh, 20h, 39h, 2bh, 31h, 30h, 2bh, 31h, 31h ; 6+ 7+ 8+ 9+10+11
        db      2bh, 31h, 32h
D_779F:
        db      24h, 0cch
        endif
D_77A1:
        db      03h, 00h, 00h
TBL_ERASE_MODE_NAMES:
D_77A7                          equ     $+3
D_7827                          equ     $+131
        TBL_ERASE_MODE_NAMES_DATA
G_ERASE_EVENT_TYPE              equ     TBL_ERASE_MODE_NAMES+3
G_ERASE_MODE                    equ     TBL_ERASE_MODE_NAMES+2
P_77A8                          equ     TBL_ERASE_MODE_NAMES+4
P_77A9                          equ     TBL_ERASE_MODE_NAMES+5
P_77AA                          equ     TBL_ERASE_MODE_NAMES+6
P_7826                          equ     TBL_ERASE_MODE_NAMES+130
TBL_ERASE_EVENT_LABELS          equ     TBL_ERASE_MODE_NAMES+44
TBL_ERASE_MODE_LABELS           equ     TBL_ERASE_MODE_NAMES+7
        db      04h, 00h, 60h, 00h, 04h, 00h, 60h, 00h, 04h, 00h, 60h, 00h
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h
P_7846:
        db      00h, 00h
P_7848:
        db      00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h
        dw      NULL_HANDLER_OFS
        db      00h, 00h, 00h, 00h, 00h, 0f0h, 00h, 00h, 00h, 00h
        db      000h, 000h, 000h, 000h, "ABCDEFGHIJK", 000h
        db      26h, 0ah, 0ah
        dw      BMP_WARNING, DATA_SEG
        db      00h, 00h, 17h, 0ah, 0ah, 02h, 00h, 17h, 0ah, 14h, 03h, 00h, 00h, 17h, 0ah, 1eh
        db      04h, 00h, 00h, 17h, 0ah, 1eh, 01h, 00h, 00h, 48h
        dw      load_screen_enter
        db      00h, 00h, 00h, 00h, "# ERROR ", 00h, 00h
        dw      NULL_HANDLER_OFS
        db      00h
G_DISK_DEVICE:
        db      00h, 00h, 00h, 00h
FROM_DEL_SEL:                           ; F-ROM delete selection                   ; ?
        db      00h
D_78AD:
        db      00h
P_78AE:
        db      00h, 00h, 00h, 00h, 00h, 00h
P_78B4:
        db      12 dup (00h)
G_FILE_TYPE:
        db      00h, 00h
P_78C2:
        db      00h, 00h, 00h, 20h, 00h, 20h, 00h
BUF_NAME_ENTRY:
        db      17 dup (00h)
BUF_NAME_ENTRY_EXT:
        db      00h, 00h, 00h, 00h
BUF_RENAME_NAME:
        db      21 dup (00h)
P_78F3:
        db      14 dup (00h)
STR_LOADING_MSG:
        db      "Loading  "
BUF_LOADING_NAME:
        db      20 dup (20h)
        db      00h, 00h
D_7920:
        db      22 dup (00h)
TBL_DISK_FORMAT_NAMES:                  ; its label table                          ; ?
        db      08h
        db      "No disk ??????? 1.44M   720K    1.44M   790K    "
        db      "MPC2000 MPC2000 S3000   S3000   S1000   S1000   "
        db      "640K                                    ??????? "
        db      "PC      MPC2000 PC      S3000   S1000           "
        db      "??????? AKAI    EIII    Roland                  "
        db      "                No F-ROM??????? MPC2000 "
; BC_16_LEVELS_6: bitmap and index data per level
TBL_16_LEVELS_BMP_A:
        dw      BMP_XS_6CB5+3, BMP_XS_6CB5+3, BMP_XS_6CB5+44h, BMP_XS_6CB5+85h
        dw      BMP_XS_6CB5+44h, BMP_XS_6CB5+85h, BMP_XS_6CB5+44h, BMP_XS_6CB5+85h
        dw      BMP_XS_6CB5+44h, BMP_XS_6CB5+85h, BMP_XS_6CB5+44h, BMP_XS_6CB5+85h
        dw      BMP_XS_6CB5+85h, BMP_XS_6CB5+3, BMP_XS_6CB5+3, BMP_XS_6CB5+3
TBL_16_LEVELS_FLAGS:
        db      00h, 00h, 00h, 01h, 00h, 01h, 00h, 01h, 00h, 01h, 00h, 01h, 01h, 00h, 00h, 00h
TBL_16_LEVELS_BMP_B:
        dw      BMP_XS_6CB5+0c6h, BMP_XS_6CB5+41dh, BMP_XS_6CB5+41dh, BMP_XS_6CB5+41dh
        dw      BMP_XS_6CB5+0fbh, BMP_XS_6CB5+0fbh, BMP_XS_6CB5+41dh, BMP_XS_6CB5+12dh
        dw      BMP_XS_6CB5+41dh, BMP_XS_6CB5+41dh
TBL_DEVICE_FILETYPE_NAMES:
        TBL_DEVICE_FILETYPE_NAMES_DATA
TBL_DISK_DEVICE_LABELS          equ     TBL_DEVICE_FILETYPE_NAMES
TBL_FILE_EXTENSIONS             equ     TBL_DEVICE_FILETYPE_NAMES+143
TBL_FILE_TYPE_LABELS            equ     TBL_DEVICE_FILETYPE_NAMES+61
TBL_DRUM_NOTE_LABELS:
        db      0fh, 48h, 49h, 48h, 54h, 20h, 43h
        db      "LSD (A01)HIHT ME"
        db      "DM (A01)HIHT OPE"
        db      "N (A01)SNR1     "
        db      " (A02)SNR2      "
        db      "(A03)BASS      ("
        db      "A04)TOM1      (A"
        db      "05)TOM2      (A0"
        db      "6)TOM3      (A07"
        db      ")TOM4      (A08)"
        db      "RID1      (A09)R"
        db      49h, 44h, 32h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 41h, 31h, 30h, 29h, 43h, 52h
        db      "S1      (A11)CRS"
        db      "2      (A12)PRC1"
        db      "      (A13)PRC2 "
        db      "     (A14)PRC3  "
        db      "    (A15)PRC4   "
        db      20h, 20h, 20h, 28h, 41h, 31h, 36h, 29h, 44h, 52h, 30h, 31h, 20h, 20h, 20h, 20h
        db      20h, 20h, 28h, 42h, 30h, 31h, 29h, 44h, 52h, 30h, 32h, 20h, 20h, 20h, 20h, 20h
        db      20h, 28h, 42h, 30h, 32h, 29h, 44h, 52h, 30h, 33h, 20h, 20h, 20h, 20h, 20h, 20h
        db      28h, 42h, 30h, 33h, 29h, 44h, 52h, 30h, 34h, 20h, 20h, 20h, 20h, 20h, 20h, 28h
        db      42h, 30h, 34h, 29h, 44h, 52h, 30h, 35h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h
        db      30h, 35h, 29h, 44h, 52h, 30h, 36h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h, 30h
        db      36h, 29h, 44h, 52h, 30h, 37h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h, 30h, 37h
        db      29h, 44h, 52h, 30h, 38h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h, 30h, 38h, 29h
        db      44h, 52h, 30h, 39h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h, 30h, 39h, 29h, 44h
        db      52h, 31h, 30h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h, 31h, 30h, 29h, 44h, 52h
        db      31h, 31h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h, 31h, 31h, 29h, 44h, 52h, 31h
        db      32h, 20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h, 31h, 32h, 29h, 44h, 52h, 31h, 33h
        db      20h, 20h, 20h, 20h, 20h, 20h, 28h, 42h, 31h, 33h, 29h, 44h, 52h, 31h, 34h, 20h
        db      20h, 20h, 20h, 20h, 20h, 28h, 42h, 31h, 34h, 29h, 44h, 52h, 31h, 35h, 20h, 20h
        db      20h, 20h, 20h, 20h, 28h, 42h, 31h, 35h, 29h, 44h, 52h, 31h, 36h, 20h, 20h, 20h
        db      "   (B16)"
CONV_NOTE_SEL:
P_7D3C:
        db      00h
P_7D3D:
        db      "*R.&%$0/-+3517E"
        db      "68'9:;<=>?@ABCDF" ; 68'9:;<=>?@ABCDF
        db      "GHI"
TBL_NOFASTER_YES_LABELS:
        db      0ah, "NO(F"
        db      "ASTER)YES       "
P_7D74:
        if      FW_VERSION = 172
        db      00h, 01h, 06h, 01h, 0ch, 01h, 12h, 01h, 18h, 01h, 1eh, 01h, 24h, 01h, 2ah, 01h
        db      30h, 01h, 36h, 01h, 3ch, 01h, 42h, 01h, 48h, 01h, 4eh, 01h, 54h, 01h, 5ah, 01h
        db      60h, 01h, 66h, 01h, 6ch, 01h, 71h, 01h, 76h, 01h, 7bh, 04h, 80h, 09h, 87h, 11h
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
        db      "       "
        else
        db      00h, 01h, 06h, 01h, 0ch, 01h, 12h, 01h
        db      18h, 01h, 1eh, 01h, 24h, 01h, 2ah, 01h, 30h, 01h, 36h, 01h, 3ch, 01h, 42h, 01h
        db      48h, 01h, 4eh, 01h, 54h, 01h, 5ah, 01h, 60h, 01h, 66h, 01h, 6ch, 01h, 71h, 01h ; H.N.T.Z.`.f.l.q.
        db      76h, 01h, 7bh, 04h, 80h, 09h, 87h, 11h, 20h ; v.{.....        
D150_7D8B:
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h
        db      "               "
        endif
P_7DBB:
        db      "         "
        db      20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 00h
        db      00h, 00h, 00h, 00h

        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (00h)
        endif

; BSS: zeroed by entry stub from BSS_START to DATA_END
; all names are offsets from BSS_START (shift if initialized data grows)
BSS_START:
P_7DD8                          equ     BSS_START+00000h
P_7DDA                          equ     BSS_START+00002h
P_7DDB                          equ     BSS_START+00003h
P_7DDD                          equ     BSS_START+00005h
P_7DE0                          equ     BSS_START+00008h
P_7DE1                          equ     BSS_START+00009h
P_7DE3                          equ     BSS_START+0000Bh
P_7DFC                          equ     BSS_START+00024h
P_7DFF                          equ     BSS_START+00027h
P_7DE8                          equ     BSS_START+00010h
P_7DF8                          equ     BSS_START+00020h
P_7E18                          equ     BSS_START+00040h
P_7ED8                          equ     BSS_START+00100h
P_7FD8                          equ     BSS_START+00200h
P_8DD8                          equ     BSS_START+01000h
P_8DE3                          equ     BSS_START+0100Bh
P_9CD8                          equ     BSS_START+01F00h
P_9DB8                          equ     BSS_START+01FE0h
P_9DC8                          equ     BSS_START+01FF0h
P_9DD0                          equ     BSS_START+01FF8h
P_9DD8                          equ     BSS_START+02000h
P_9DDC                          equ     BSS_START+02004h
P_9DDE                          equ     BSS_START+02006h
        if      FW_VERSION = 150
FREE_2ADE4                      equ     BSS_START+03986h
        endif
P_BDD8                          equ     BSS_START+04000h
BUF_MIDI_IN1_EVENTS             equ     BSS_START+04800h
P_C5DA                          equ     BSS_START+04802h
BUF_MIDI_IN2_EVENTS             equ     BSS_START+04900h
P_C6DA                          equ     BSS_START+04902h
P_C7D8                          equ     BSS_START+04A00h
P_C7DA                          equ     BSS_START+04A02h
BUF_MIDI_OUT1_RING              equ     BSS_START+04B00h
BUF_MIDI_OUT2_RING              equ     BSS_START+04D00h
P_CCD8                          equ     BSS_START+04F00h
P_CD58                          equ     BSS_START+04F80h
BUF_PANEL_EVENT_RING            equ     BSS_START+05000h
SND_EVENT_RING                  equ     BSS_START+05100h
P_CEDA                          equ     BSS_START+05102h
BUF_PAD_EVENT_RING              equ     BSS_START+05200h
NOTE_EVENT_RING                 equ     BSS_START+05300h
P_D1D6                          equ     BSS_START+053FEh
P_D1D8                          equ     BSS_START+05400h
P_D9A8                          equ     BSS_START+05BD0h
LCD_PLANE_A                     equ     BSS_START+05FB8h
LCD_PLANE_B                     equ     BSS_START+06738h
LCD_PLANE_C                     equ     BSS_START+06EB8h
P_F190                          equ     BSS_START+073B8h
LCD_PLANE_D                     equ     BSS_START+07638h
P_F58C                          equ     BSS_START+077B4h
P_F5A8                          equ     BSS_START+077D0h
LCD_PLANE_E                     equ     BSS_START+07A34h
LCD_PLANE_F                     equ     BSS_START+07E30h
        db      0804Ch dup (0)

DATA_END:

; disk drivers' words: isr_2c runs INT 2Ch with DS=0F000h
; offsets in F000h (fixed, not DATA); sector buffer onwards differs per version
        if      FW_VERSION = 172
BUF_DISK_SECTOR                 equ     0A000h
P_A003                          equ     0A003h
BPB_BYTES_PER_SECTOR            equ     0A00Bh
BPB_SECTORS_PER_CLUSTER         equ     0A00Dh
BPB_RESERVED_SECTORS            equ     0A00Eh
BPB_FAT_COUNT                   equ     0A010h
BPB_ROOT_ENTRIES                equ     0A011h
BPB_TOTAL_SECTORS16             equ     0A013h
BPB_SECTORS_PER_FAT             equ     0A016h
BPB_TOTAL_SECTORS32             equ     0A020h
BPB_TOTAL_SECTORS32_HI          equ     0A022h
P_A036                          equ     0A036h
P_A040                          equ     0A040h
P_A044                          equ     0A044h
P_A0B0                          equ     0A0B0h
MBR_PART1_TYPE                  equ     0A1C2h
P_E010                          equ     0E010h
P_E020                          equ     0E020h
P_E028                          equ     0E028h
        else
BUF_DISK_SECTOR                 equ     0B800h
P_A003                          equ     0B803h
BPB_BYTES_PER_SECTOR            equ     0B80Bh
BPB_SECTORS_PER_CLUSTER         equ     0B80Dh
BPB_RESERVED_SECTORS            equ     0B80Eh
BPB_FAT_COUNT                   equ     0B810h
BPB_ROOT_ENTRIES                equ     0B811h
BPB_TOTAL_SECTORS16             equ     0B813h
BPB_SECTORS_PER_FAT             equ     0B816h
BPB_TOTAL_SECTORS32             equ     0B820h
BPB_TOTAL_SECTORS32_HI          equ     0B822h
P_A036                          equ     0B836h
P_A040                          equ     0B840h
P_A044                          equ     0B844h
P_A0B0                          equ     0B8B0h
MBR_PART1_TYPE                  equ     0B9C2h
P_E010                          equ     0A010h
P_E020                          equ     0A020h
P_E028                          equ     0A028h
        endif
HD_HDR_BUF                      equ     00000h          ; where a mount reads a disk's header sectors
FD_WRITE_PROTECT                equ     0F890h
FD_HIGH_DENSITY                 equ     0F891h
FD_AKAI_FORMAT                  equ     0F892h
FD_FILE_MODE                    equ     0F893h
FD_MOTOR_ON                     equ     0F894h
W_F896                          equ     0F896h
FD_RETRY_COUNT                  equ     0F898h
FD_FAT_BYTES                    equ     0F89Ah
FD_DATA_CLUSTERS                equ     0F89Ch
FD_FAT_OFFSET                   equ     0F89Eh
FD_DIRENT_PTR                   equ     0F8A0h
FD_ROOT_START                   equ     0F8A2h
FD_ROOT_END                     equ     0F8A4h
FD_CACHE_LBA_START              equ     0F8A6h
FD_CACHE_LBA_END                equ     0F8A8h
FD_DATA_SECTOR                  equ     0F8AAh
FD_CLUSTER_SECTORS              equ     0F8ACh
FD_SECTOR_BYTES                 equ     0F8AEh
FD_CLUSTER_SECT_LEFT            equ     0F8B0h
FD_CUR_SECTOR                   equ     0F8B2h
FD_FILE_REMAIN_LO               equ     0F8B4h
FD_FILE_REMAIN_HI               equ     0F8B6h
FD_CUR_CLUSTER                  equ     0F8B8h
FD_BUF_BYTES_LEFT               equ     0F8BAh
FD_BUF_PTR                      equ     0F8BCh
FD_WRITE_DIRENT                 equ     0F8BEh
FD_WBUF_START                   equ     0F8C0h
W_F8C2                          equ     0F8C2h
FD_WBUF_PTR                     equ     0F8C4h
FD_WBUF_BYTES_LEFT              equ     0F8C6h
FD_WRITE_LBA                    equ     0F8C8h
W_F8CA                          equ     0F8CAh
FDC_CMD_LEN                     equ     0F8E1h
FDC_CMD                         equ     0F8E2h
FDC_CMD_HD_US                   equ     0F8E3h
FDC_CMD_CYL                     equ     0F8E4h
FDC_CMD_HEAD                    equ     0F8E5h
FDC_CMD_SECTOR                  equ     0F8E6h
FDC_CMD_N                       equ     0F8E7h
FD_TRACK_SECTORS                equ     0F8E8h
FDC_CMD_GPL                     equ     0F8E9h
FDC_CMD_DTL                     equ     0F8EAh
FD_FMT_720K                     equ     0F8EBh
FDC_FMT_CMD_LEN                 equ     0F8ECh
FDC_FMT_CMD                     equ     0F8EDh
FDC_FMT_HD_US                   equ     0F8EEh
FDC_FMT_N                       equ     0F8EFh
FDC_FMT_SC                      equ     0F8F0h
FDC_FMT_GAP                     equ     0F8F1h
FDC_FMT_FILL                    equ     0F8F2h
FD_FMT_TRACK                    equ     0F8F3h
FDC_RESULT                      equ     0F8F4h
FDC_IRQ_FLAG                    equ     0F8FCh
HD_MOUNT_STATUS                 equ     0F903h
HD_AKAI_PART                    equ     0F904h
HD_FAT_BITS                     equ     0F965h
HD_SCSI_DEV_TYPE                equ     0F966h
HD_PART_COUNT                   equ     0F97Ch
HD_CAPACITY_LO                  equ     0F97Dh
HD_CAPACITY_HI                  equ     0F97Fh
HD_PART_SIZE_LO                 equ     0F981h
HD_PART_SIZE_HI                 equ     0F983h
HD_PART_LBA                     equ     0F985h
HD_PART_LBA_HI                  equ     0F987h
HD_CLUSTER_BYTES                equ     0F989h
HD_CLUSTERS                     equ     0F98Bh
HD_CLUSTER_SECTORS              equ     0F98Dh
HD_FAT_START                    equ     0F98Fh
HD_FAT2_START                   equ     0F991h
HD_FAT_SECTORS                  equ     0F993h
HD_DATA_START                   equ     0F995h
HD_FILE_MODE                    equ     0F997h
HD_FAT_CACHE_SECT               equ     0F998h
W_F999                          equ     0F999h
HD_FAT_CACHE                    equ     0F99Bh          ; 2 sectors
HD_ROOT_START                   equ     0FD9Bh
HD_ROOT_ENTRIES                 equ     0FD9Dh
HD_DIR_INDEX                    equ     0FD9Fh
HD_DIR_BUF_SECT                 equ     0FDA1h
HD_DIRENT_PTR                   equ     0FDA3h
HD_DIR_BUF                      equ     0FDA5h          ; 1 sector
HD_FILE_REMAIN_LO               equ     0FFA5h
HD_FILE_REMAIN_HI               equ     0FFA7h
HD_CUR_CLUSTER                  equ     0FFA9h
HD_BUF_BYTES_LEFT               equ     0FFABh
HD_BUF_PTR                      equ     0FFADh
HD_WBUF_OFS                     equ     0FFAFh
W_FFB1                          equ     0FFB1h
W_FFB3                          equ     0FFB3h
W_FFB5                          equ     0FFB5h
W_FFB7                          equ     0FFB7h
W_FFB9                          equ     0FFB9h
W_FFBB                          equ     0FFBBh
W_FFBD                          equ     0FFBDh
HD_EMU_LBA_LO                   equ     0FFBFh
HD_EMU_LBA_HI                   equ     0FFC1h
W_FFC3                          equ     0FFC3h
