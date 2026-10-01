; bytecode screens drawn identically in v1.50 and v1.72, byte for byte.
; each macro: one uninterrupted bytecode run; version sources invoke from
; x86 code. data whose address moved between versions: symbol here, equ in
; each version's symbols.inc.

; --------------------------------------------------------------------------
; MAIN SEQUENCE, the bottom bar
; --------------------------------------------------------------------------

PANE_BOTROW_DITHER_L     macro          ; 30x7 dither on the soft-key row             ; ?
        BC_UI_5C 0, 52, 30, 7
        BC_MEM_COPY 1, 53, 28
        BC_MEM_COPY 2, 54, 27
        BC_MEM_COPY 1, 55, 28
        BC_MEM_COPY 2, 56, 27
        BC_MEM_COPY 1, 57, 28
        endm

PANE_BOTROW_DITHER_M     macro          ; 30x7 dither on the soft-key row             ; ?
        BC_UI_5C 105, 52, 30, 7
        BC_MEM_COPY 106, 53, 28
        BC_MEM_COPY 107, 54, 27
        BC_MEM_COPY 106, 55, 28
        BC_MEM_COPY 107, 56, 27
        BC_MEM_COPY 106, 57, 28
        endm

PANE_BOTROW_DITHER_R     macro          ; 30x7 dither on the soft-key row             ; ?
        BC_UI_5C 217, 52, 30, 7
        BC_MEM_COPY 218, 53, 28
        BC_MEM_COPY 219, 54, 27
        BC_MEM_COPY 218, 55, 28
        BC_MEM_COPY 219, 56, 27
        BC_MEM_COPY 218, 57, 28
        endm

SCR_NEXT_SQ_BAR          macro          ; bottom bar carrying Next Sq:
        BC_PLANE_C
        BC_CLEAR_RECT 0, 51, 248, 9
        BC_UI_5E 51, 51, 115, 9
        BC_PLANE_A
        BC_CLEAR_RECT 0, 51, 248, 9
        BC_STATUS 4, 52, "Next Sq:"
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

DLG_SMPTE_TEST           macro
        BC_CLEAR
        BC_PLANE_A
        BC_TEST_MODE 18, 5, 210, 45, "[ SMPTE TEST ]"
        BC_STATUS 72, 21, "   HH MM SS FF"
        BC_STATUS 72, 29, "RX[  :  :  :  ]"
        BC_STATUS 72, 37, "TX[  :  :  :  ]"
        endm

DLG_DELETE_SONG          macro
        BC_FILE_DIALOG 50, 6, 190, 54, "Delete Song"
        BC_STATUS 58, 17, "Song:##-"
        BC_STATUS 70, 31, "Pressing DO^IT will"
        BC_STATUS 70, 40, "erase this song!!"
        BC_WAIT 210, 24, BMP_PEN_KEYS
        BC_SOFTKEY 3, BC_SK_BOX,   "ALL SG"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_DELETE_ALL_SONG      macro
        BC_FILE_DIALOG 50, 6, 190, 54, "Delete ALL Song"
        BC_WAIT 60, 22, BMP_WARNING
        BC_WAIT 217, 28, BMP_PEN_KEYS
        BC_STATUS 82, 20, "Pressing DO^IT will erase"
        BC_STATUS 82, 29, "ALL songs!!"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_COPY_SONG            macro
        BC_FILE_DIALOG 50, 6, 190, 54, "Copy Song"
        BC_STATUS 70, 16, "Song:##-"
        BC_STATUS 70, 40, "Song:##-"
        BC_WAIT 130, 25, BMP_ARROW_DOWN
        BC_STATUS 146, 27, "COPY"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        BC_UI_CTRL 99, 15, 118, 9
        endm

DLG_IGNORE_TEMPO_CHANGE  macro          ; titled "Tempo change"
        BC_FILE_DIALOG 16, 2, 216, 58, "Tempo change"
        BC_PLANE_A
        BC_STATUS 44, 16, "Ignore tempo change events"
        BC_STATUS 44, 26, "in sequence:"
        BC_UI_CTRL 115, 25, 20, 9
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        endm

DLG_LOOP_STEPS           macro          ; titled "Loop", in steps
        BC_PLANE_A
        BC_FILE_DIALOG 16, 2, 216, 58, "Loop"
        BC_STATUS 60, 11, "     First step:##"
        BC_STATUS 60, 33, "      Last step:##"
        BC_STATUS 60, 42, "Number of steps:##"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_UI_5C 90, 24, 11, 4
        BC_UI_5E 100, 24, 11, 4
        BC_UI_5E 120, 24, 11, 4
        BC_UI_5C 130, 24, 11, 4
        BC_UI_5C 140, 24, 11, 4
        BC_WAIT 101, 20, BMP_TRI_DOWN
        BC_WAIT 122, 28, BMP_TRI_UP
        BC_WAIT 110, 22, BMP_BRACE_HI
        BC_WAIT 110, 26, BMP_BRACE_LO
        BC_WAIT 119, 22, BMP_BRACE_HI
        BC_WAIT 119, 26, BMP_BRACE_LO
        endm

DLG_CONVERT_SONG_TO_SEQ  macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Convert Song to Seq"
        BC_PLANE_A
        BC_STATUS 26, 16, "  From song:##-"
        BC_STATUS 26, 40, "To sequence:##-"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_WAIT 114, 25, BMP_ARROW_DOWN
        BC_STATUS 130, 27, "CONVERT"
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

DLG_PASTE_EVENT          macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Paste Event"
        BC_STATUS 48, 20, "Pressing DO IT will paste"
        BC_STATUS 48, 30, "events from clipboard."
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

SCR_NV_SLIDER_ASSIGN     macro          ; panes and labels
        BC_PLANE_A
        BC_CLEAR
        BC_MEM_ALLOC 0, 0, 216
        BC_MEM_COPY 0, 10, 216
        BC_MEM_ALLOC 216, 10, 33
        BC_MEM_ALLOC 0, 48, 248
        BC_MEM_ALLOC 1, 49, 247
        BC_MEM_FREE 0, 0, 48
        BC_MEM_FREE 216, 0, 11
        BC_MEM_FREE 217, 1, 10
        BC_MEM_FREE 246, 10, 38
        BC_MEM_FREE 247, 11, 37
        BC_STATUS 7, 20, "Parameter:"
        BC_STATUS 132, 14, "High range:"
        BC_STATUS 132, 24, "Low  range:"
        BC_STATUS 6, 36, "Assign NV slider to ctrl change:"
        BC_WAIT 110, 12, BMP_SLIDER
        endm

SCR_AUTO_PUNCH           macro          ; the two range markers
        BC_CLEAR
        BC_STATUS 1, 1, "Auto punch:PUNCH"
        BC_WAIT 73, 32, BMP_TRI_DOWN
        BC_WAIT 169, 32, BMP_TRI_DOWN
        BC_SOFTKEY 6, BC_SK_BOX,   "TurnON"
        endm

SCR_TAP_AVERAGE_CONTRAST macro          ; second OTHER page
        BC_UI_5C 0, 0, 247, 49
        BC_MEM_ALLOC 1, 49, 247
        BC_MEM_FREE 247, 1, 49
        BC_MEM_COPY 0, 20, 247
        BC_STATUS 4, 3, "  Tap averaging:"
        BC_STATUS 4, 23, "Display contrast"
        BC_STATUS 4, 32, "    Hold SHIFT and turn jog(anytime)"
        BC_BUFFER 0, 2, 2, 0, 0, 0
        endm

SCR_INIT_ALL_PARAMETERS  macro
        BC_REFRESH
        BC_BUFFER 0, 2, 2, 0, 0, 0
        BC_UI_5C 0, 0, 247, 49
        BC_MEM_ALLOC 1, 49, 247
        BC_MEM_FREE 247, 1, 49
        BC_STATUS 12, 12, "Initialize ALL PARAMETERS"
        BC_STATUS 12, 32, "Pressing DO IT will initialize!!"
        endm

PANE_FULLSCREEN_BOX      macro          ; full-width box with a shadow
        BC_REFRESH
        BC_BUFFER 2, 2, 0, 0, 0, 0
        BC_UI_5C 0, 0, 247, 49
        BC_MEM_ALLOC 1, 49, 247
        BC_MEM_FREE 247, 1, 49
        endm

SCR_SYNC_IN_OUT          macro
        BC_CLEAR
        BC_UI_5C 0, 0, 122, 48
        BC_MEM_ALLOC 1, 48, 121
        BC_MEM_FREE 122, 1, 48
        BC_MEM_COPY 0, 10, 122
        BC_UI_5C 124, 0, 122, 48
        BC_MEM_ALLOC 125, 48, 121
        BC_MEM_FREE 246, 1, 48
        BC_MEM_COPY 124, 10, 122
        BC_STATUS 4, 2, "Sync In"
        BC_STATUS 4, 12, "Mode:"
        BC_STATUS 4, 38, "Receive MMC:"
        BC_STATUS 128, 2, "Sync Out"
        BC_STATUS 128, 12, "Mode:"
        BC_STATUS 128, 38, "Send MMC:"
        BC_SOFTKEY 1, BC_SK_PLAIN, "SYNC"
        BC_SOFTKEY 2, BC_SK_FILL,  "DUMP"
        BC_SOFTKEY 3, BC_SK_FILL,  "MIDIsw"
        endm

SCR_MIDI_SW              macro
        BC_CLEAR
        BC_UI_5C 0, 0, 247, 48
        BC_MEM_ALLOC 1, 48, 246
        BC_MEM_FREE 247, 1, 48
        BC_MEM_COPY 0, 10, 246
        BC_STATUS 9, 2, "Switch 1"
        BC_STATUS 71, 2, "Switch 2"
        BC_STATUS 133, 2, "Switch 3"
        BC_STATUS 195, 2, "Switch 4"
        BC_STATUS 5, 15, "Ctrl:"
        BC_STATUS 67, 15, "Ctrl:"
        BC_STATUS 129, 15, "Ctrl:"
        BC_STATUS 191, 15, "Ctrl:"
        BC_STATUS 5, 25, "Function:"
        BC_STATUS 67, 25, "Function:"
        BC_STATUS 129, 25, "Function:"
        BC_STATUS 191, 25, "Function:"
        BC_MEM_FREE 62, 1, 47
        BC_MEM_FREE 124, 1, 47
        BC_MEM_FREE 186, 1, 47
        BC_SOFTKEY 1, BC_SK_FILL,  "SYNC"
        BC_SOFTKEY 2, BC_SK_FILL,  "DUMP"
        BC_SOFTKEY 3, BC_SK_PLAIN, "MIDIsw"
        endm

SCR_MIDI_SW_FIELDS       macro          ; the four Function: values
        BC_CTRL_FIELD 221, 15
        BC_STATUS_A 5, 35, D_0C0E, TBL_MIDISW_FUNC
        BC_STATUS_A 67, 35, D_0C10, TBL_MIDISW_FUNC
        BC_STATUS_A 129, 35, D_0C12, TBL_MIDISW_FUNC
        BC_STATUS_A 191, 35, D_0C14, TBL_MIDISW_FUNC
        endm

DLG_TEMPO_CHANGE_LIST    macro          ; titled "Tempo Change"
        BC_FILE_DIALOG 16, 2, 216, 58, "Tempo Change"
        BC_MEM_COPY 21, 19, 206
        BC_STATUS 26, 11, "Tempo change:OFF                 "
        BC_SOFTKEY 2, BC_SK_BOX,   "DELETE"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_SOFTKEY 5, BC_SK_BOX,   "INSERT"
        endm

; --------------------------------------------------------------------------
; ERASE, and the test modes
; --------------------------------------------------------------------------

DLG_ERASE                macro
        BC_FILE_DIALOG 16, 2, 216, 58, "ERASE"
        BC_STATUS 26, 13, "Track:  -"
        BC_STATUS 182, 13, "(0=all)"
        BC_STATUS 26, 13, "Track:  -"
        BC_STATUS 26, 23, " Time:          -"
        BC_STATUS 26, 33, "Erase:"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_PAD_TEST             macro
        BC_TEST_MODE 18, 5, 210, 45, "[ PAD TEST ]"
        BC_STATUS 30, 21, "    PAD:          SLIDER:      "
        BC_STATUS 30, 35, "Velocty       After touch      "
        BC_MEM_COPY 25, 30, 198
        BC_UI_5C 72, 33, 24, 11
        BC_UI_5C 180, 33, 24, 11
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

PANE_FROM_DELETE         macro          ; DELETE, an arrow and the keys               ; ?
        BC_CLEAR_RECT 96, 20, 86, 31
        BC_STATUS 120, 21, "DELETE"
        BC_WAIT 129, 30, BMP_ARROW_RIGHT
        BC_WAIT 158, 21, BMP_KEYS
        BC_STATUS_A 42, 39, FROM_DEL_SEL, TBL_DISK_FORMAT_NAMES
        BC_BUFFER 2, 2, 2, 0, 0, 1
        endm

PANE_FROM_ICONS          macro          ; boxes and the keys                          ; ?
        BC_CLEAR_RECT 36, 9, 120, 20
        BC_PLANE_A
        BC_CLEAR_RECT 158, 21, 19, 12
        BC_CLEAR_RECT 158, 21, 18, 24
        BC_WAIT 158, 21, BMP_KEYS
        BC_FLUSH
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

PANE_CANCEL_GO_BAR       macro          ; CANCEL and GO, top right
        BC_CLEAR_RECT 166, 0, 82, 9
        BC_UI_5C 166, 0, 39, 9
        BC_UI_5C 207, 0, 39, 9
        BC_STATUS 168, 1, "CANCEL"
        BC_STATUS 221, 1, "GO"
        endm

DLG_LOCATE               macro
        BC_FILE_DIALOG 10, 2, 228, 58, "Locate"
        BC_STATUS 37, 11, "Pressing 1-9 Key will locate."
        BC_MEM_COPY 21, 19, 206
        BC_STATUS 20, 22, "7:"
        BC_STATUS 20, 32, "4:"
        BC_STATUS 20, 42, "1:"
        BC_STATUS 92, 22, "8:"
        BC_STATUS 92, 32, "5:"
        BC_STATUS 92, 42, "2:"
        BC_STATUS 164, 22, "9:"
        BC_STATUS 164, 32, "6:"
        BC_STATUS 164, 42, "3:"
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

SCR_MAIN_SEQUENCE        macro          ; the header fields
        BC_PLANE_A
        BC_STATUS 6, 2, "Sq:  -"
        BC_STATUS 168, 1, "Now:   .  .  "
        BC_STATUS 6, 13, " \\:   . (   )  Timing:        Tsig:  /  "
        BC_STATUS 6, 26, "Tr:  -                 On:YES"
        BC_STATUS 6, 36, "    :     Velo%:100   Pgm:"
        BC_STATUS 180, 22, " BARS:"
        BC_STATUS 190, 31, " Loop:"
        BC_STATUS 190, 40, "Count:"
        endm

PANE_MAIN_SEQUENCE_FRAME macro          ; its panes
        BC_CLEAR
        BC_PLANE_B
        BC_MEM_ALLOC 0, 0, 139
        BC_MEM_COPY 0, 10, 139
        BC_MEM_ALLOC 138, 10, 109
        BC_MEM_ALLOC 0, 48, 248
        BC_MEM_ALLOC 1, 49, 247
        BC_MEM_FREE 0, 0, 48
        BC_MEM_FREE 139, 0, 11
        BC_MEM_FREE 140, 1, 10
        BC_MEM_FREE 246, 10, 38
        BC_MEM_FREE 247, 11, 37
        BC_UI_5C 2, 22, 180, 24
        BC_MEM_ALLOC 2, 23, 180
        BC_MEM_FREE 3, 24, 21
        BC_MEM_COPY 2, 34, 138
        BC_MEM_FULL 140, 24, 12
        BC_PLANE_A
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

DLG_DELETE_SEQUENCE      macro
        BC_FILE_DIALOG 50, 6, 190, 54, "Delete Sequence"
        BC_STATUS 70, 17, "Sq:##-"
        BC_STATUS 60, 31, "Pressing DO IT will^erase"
        BC_STATUS 60, 40, "this sequence!!"
        BC_WAIT 210, 24, BMP_PEN_KEYS
        BC_SOFTKEY 3, BC_SK_BOX,   "ALL SQ"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_DELETE_ALL_SEQUENCES macro
        BC_FILE_DIALOG 50, 6, 190, 54, "Delete ALL Sequences"
        BC_WAIT 60, 22, BMP_WARNING
        BC_WAIT 217, 28, BMP_PEN_KEYS
        BC_STATUS 83, 20, "Pressing DO IT will^erase"
        BC_STATUS 83, 30, "ALL sequences!!"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_COPY_SEQUENCE        macro
        BC_FILE_DIALOG 50, 6, 190, 54, "Copy Sequence"
        BC_STATUS 70, 16, "Sq:##-"
        BC_STATUS 70, 40, "Sq:##-"
        BC_WAIT 130, 25, BMP_ARROW_DOWN
        BC_STATUS 146, 27, "COPY"
        BC_SOFTKEY 3, BC_SK_BOX,   "PARAM"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_TIME_DISPLAY         macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Time Display"
        BC_STATUS 26, 13, " Display style:"
        BC_STATUS 26, 23, "    Start time:  h  m  s  f  "
        BC_STATUS 26, 33, "    Frame rate:"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        endm

DLG_CHANGE_TSIG_CONFIRM  macro          ; body only, the frame is already drawn
        BC_STATUS 51, 16, "Bar:### - ###  > New Tsig:##/##"
        BC_MEM_COPY 47, 26, 193
        BC_STATUS 60, 30, "Pressing DO IT will truncate"
        BC_STATUS 60, 39, "or add space in each bar."
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_CHANGE_BARS          macro
        BC_FILE_DIALOG 41, 6, 205, 54, "Change Bars"
        BC_STATUS 60, 16, "Current= ###   > New Bars:###"
        BC_MEM_COPY 47, 26, 193
        BC_SOFTKEY 3, BC_SK_FILL,  "IN/DEL"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        BC_UI_CTRL 215, 15, 19, 9
        endm

DLG_CHANGE_BARS_INSDEL   macro          ; INSERT/DELETE page, with both range brackets
        BC_PLANE_A
        BC_FILE_DIALOG 16, 2, 216, 58, "Change Bars"
        BC_STATUS 24, 11, "     After bar:###  First bar:###"
        BC_STATUS 24, 33, "Number of bars:###   Last bar:###"
        BC_SOFTKEY 2, BC_SK_BOX,   "INSERT"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_SOFTKEY 5, BC_SK_BOX,   "DELETE"
        BC_UI_5C 51, 24, 11, 4
        BC_UI_5C 61, 24, 11, 4
        BC_UI_5C 71, 24, 11, 4
        BC_UI_5C 91, 24, 11, 4
        BC_UI_5C 101, 24, 11, 4
        BC_WAIT 73, 20, BMP_TRI_DOWN
        BC_WAIT 83, 26, BMP_TRI_UP
        BC_MEM_FULL 138, 11, 40
        BC_UI_5C 144, 24, 11, 4
        BC_UI_5E 155, 24, 11, 4
        BC_UI_5E 175, 24, 11, 4
        BC_UI_5C 185, 24, 11, 4
        BC_UI_5C 195, 24, 11, 4
        BC_WAIT 157, 20, BMP_TRI_DOWN
        BC_WAIT 177, 28, BMP_TRI_UP
        BC_WAIT 165, 22, BMP_BRACE_HI
        BC_WAIT 165, 26, BMP_BRACE_LO
        BC_WAIT 174, 22, BMP_BRACE_HI
        BC_WAIT 174, 26, BMP_BRACE_LO
        endm

KEYS_TRACK_DELETE_COPY   macro          ; TRACK soft keys
        BC_STATUS_B 54, 40, 24
        BC_SOFTKEY 2, BC_SK_BOX,   "DELETE"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_SOFTKEY 5, BC_SK_BOX,   " COPY "
        BC_MEM_COPY 26, 26, 196
        endm

DLG_DELETE_TRACK         macro
        BC_FILE_DIALOG 50, 6, 190, 54, "Delete track"
        BC_STATUS 70, 17, "Tr:##-"
        BC_STATUS 70, 31, "Pressing DO^IT will^erase"
        BC_STATUS 70, 40, "this track !!"
        BC_WAIT 216, 24, BMP_PEN_KEYS
        BC_SOFTKEY 3, BC_SK_BOX,   "ALL Tr"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        BC_UI_CTRL 87, 16, 115, 9
        endm

DLG_COPY_TRACK           macro
        BC_FILE_DIALOG 50, 6, 190, 54, "Copy Track"
        BC_STATUS 70, 16, "Tr:##-"
        BC_STATUS 70, 40, "Tr:##-"
        BC_WAIT 130, 25, BMP_ARROW_DOWN
        BC_STATUS 146, 27, "COPY"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        BC_UI_CTRL 86, 15, 118, 9
        endm

DLG_MIDI_INPUT           macro
        BC_FILE_DIALOG 16, 2, 216, 58, "MIDI Input"
        BC_STATUS 32, 13, "Soft thru:     Receive ch:"
        BC_STATUS 32, 22, "Sustain pedal to Duration:"
        BC_STATUS 32, 34, "MIDI filter:"
        BC_STATUS 32, 42, "Type:                  Pass?:"
        BC_SOFTKEY 2, BC_SK_BOX,   "REC 16"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_SOFTKEY 5, BC_SK_BOX,   "PANIC"
        BC_MEM_COPY 26, 31, 196
        endm

DLG_REC_ALL_16_WARN      macro          ; the erase warning
        BC_FILE_DIALOG 50, 6, 195, 54, "Record ALL 16 Channels"
        BC_STATUS 70, 15, "Sq=##-"
        BC_STATUS 70, 23, " \\=120.0(   )     Tsig=  /  "
        BC_MEM_COPY 56, 32, 183
        BC_STATUS 70, 34, "Pressing PROCED will erase"
        BC_STATUS 70, 42, "existing sequence!!"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_FILL,  "PROCED"
        BC_STATUS_A 124, 23, G_TEMPO_SOURCE_SEQ, D_1506
        endm

DLG_REC_ALL_16_ACTIVE    macro          ; the recording screen
        BC_FILE_DIALOG 50, 6, 195, 54, "Record ALL 16 Channels"
        BC_STATUS 64, 16, "Sq:##-"
        BC_STATUS 64, 26, " \\:120.0(   )     Tsig:  /  "
        BC_STATUS 172, 34, "Bars:001"
        BC_STATUS 70, 46, "Now:001.01.00"
        BC_MEM_ALLOC 60, 14, 139
        BC_MEM_COPY 60, 24, 139
        BC_MEM_ALLOC 198, 24, 39
        BC_MEM_ALLOC 60, 42, 176
        BC_MEM_ALLOC 61, 43, 175
        BC_MEM_FREE 60, 14, 28
        BC_MEM_FREE 199, 14, 11
        BC_MEM_FREE 200, 15, 10
        BC_MEM_FREE 236, 24, 20
        BC_MEM_FREE 237, 25, 19
        BC_STATUS_A 118, 26, G_TEMPO_SOURCE_SEQ, D_1506
        endm

DLG_EDIT_VELOCITY        macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Edit Velocity"
        BC_UI_CTRL 167, 34, 19, 9
        BC_MEM_COPY 24, 32, 200
        BC_STATUS 26, 16, "Edit type:              Value:   "
        BC_STATUS 26, 34, " Time:          -"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_PROGRAM_CHANGE       macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Program change"
        BC_UI_CTRL 131, 34, 19, 9
        BC_STATUS 48, 24, "Transmit program changes"
        BC_STATUS 48, 35, "in this track:"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        endm

DLG_LOOP_BARS            macro          ; titled "Loop", in bars
        BC_FILE_DIALOG 16, 2, 216, 58, "Loop"
        BC_STATUS 60, 11, "      First bar:###"
        BC_STATUS 60, 33, "       Last bar:###"
        BC_STATUS 60, 42, "Number of  bars:###"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_UI_5C 90, 24, 11, 4
        BC_UI_5E 100, 24, 11, 4
        BC_UI_5E 120, 24, 11, 4
        BC_UI_5C 130, 24, 11, 4
        BC_UI_5C 140, 24, 11, 4
        BC_WAIT 101, 20, BMP_TRI_DOWN
        BC_WAIT 123, 28, BMP_TRI_UP
        BC_WAIT 110, 22, BMP_BRACE_HI
        BC_WAIT 110, 26, BMP_BRACE_LO
        BC_WAIT 119, 22, BMP_BRACE_HI
        BC_WAIT 119, 26, BMP_BRACE_LO
        endm

DLG_COUNT_METRONOME      macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Count/Metronome"
        BC_STATUS 28, 11, "Count IN:            Rate:"
        BC_STATUS 46, 20, "In play:        Volume:"
        BC_STATUS 46, 29, "In rec :        Output:"
        BC_STATUS 22, 42, " Wait for key:"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_MEM_COPY 24, 40, 200
        BC_WAIT 24, 20, BMP_ARROW_CURVE
        endm

PANE_COPY_ARROW          macro          ; two panes and the arrow between them
        BC_UI_5C 0, 0, 128, 49
        BC_MEM_ALLOC 1, 49, 127
        BC_MEM_FREE 128, 1, 49
        BC_UI_5C 138, 0, 109, 49
        BC_MEM_ALLOC 139, 49, 108
        BC_MEM_FREE 247, 1, 48
        BC_CLEAR_RECT 127, 7, 20, 9
        BC_STATUS 123, 8, "COPY"
        BC_WAIT 120, 3, BMP_ARROW_LONG
        BC_MEM_COPY 1, 11, 120
        BC_MEM_COPY 153, 11, 93
        endm

SCR_COPY_EVENTS_FIELDS   macro          ; field labels
        BC_CLEAR
        BC_STATUS 4, 3, "From  Sq:    Tr:         To Sq:    Tr:  "
        BC_STATUS 4, 13, "Time:"
        BC_STATUS 64, 22, "-"
        BC_STATUS 4, 31, "Notes:"
        BC_STATUS 148, 13, "  Mode:"
        BC_STATUS 148, 22, " Start:"
        BC_STATUS 148, 31, "Copies:"
        endm

DLG_COPY_EVENTS          macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Copy Events"
        BC_STATUS 32, 15, "COPY"
        BC_WAIT 38, 25, BMP_ARROW_DOWN
        BC_MEM_COPY 56, 29, 170
        BC_STATUS 68, 11, "Sq:  -"
        BC_STATUS 68, 19, "Tr:  -"
        BC_STATUS 68, 31, "Sq:  -"
        BC_STATUS 68, 39, "Tr:  -"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        endm

SCR_COPY_BARS_FIELDS     macro          ; field labels
        BC_CLEAR
        BC_BUFFER 2, 0, 2, 2, 2, 1
        BC_STATUS 4, 3, "From  Sq:                To Sq:"
        BC_STATUS 4, 14, "   First bar:###         After bar:###"
        BC_STATUS 4, 36, "    Last bar:###            Copies:"
        endm

PANE_COPY_BARS_RANGES    macro          ; the two range brackets
        BC_UI_5C 31, 26, 11, 4
        BC_UI_5E 41, 26, 11, 4
        BC_UI_5E 61, 26, 11, 4
        BC_UI_5C 71, 26, 11, 4
        BC_UI_5C 81, 26, 11, 4
        BC_WAIT 43, 22, BMP_TRI_DOWN
        BC_WAIT 63, 30, BMP_TRI_UP
        BC_WAIT 51, 24, BMP_BRACE_HI
        BC_WAIT 51, 28, BMP_BRACE_LO
        BC_WAIT 60, 24, BMP_BRACE_HI
        BC_WAIT 60, 28, BMP_BRACE_LO
        BC_UI_5C 165, 26, 11, 4
        BC_UI_5C 175, 26, 11, 4
        BC_UI_5C 195, 26, 11, 4
        BC_UI_5C 205, 26, 11, 4
        BC_UI_5C 215, 26, 11, 4
        BC_WAIT 177, 22, BMP_TRI_DOWN
        BC_WAIT 187, 28, BMP_TRI_UP
        endm

DLG_COPY_BARS            macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Copy Bars"
        BC_STATUS 32, 15, "COPY"
        BC_WAIT 38, 25, BMP_ARROW_DOWN
        BC_MEM_COPY 56, 29, 170
        BC_STATUS 68, 11, "Sq:  -"
        BC_STATUS 68, 31, "Sq:  -"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        endm

SCR_SELECT_TRACK_TO_MOVE macro
        BC_CLEAR
        BC_PLANE_B
        BC_MEM_ALLOC 0, 0, 139
        BC_MEM_COPY 0, 10, 139
        BC_MEM_ALLOC 138, 10, 109
        BC_MEM_ALLOC 0, 48, 248
        BC_MEM_ALLOC 1, 49, 247
        BC_MEM_FREE 0, 0, 48
        BC_MEM_FREE 139, 0, 11
        BC_MEM_FREE 140, 1, 10
        BC_MEM_FREE 246, 10, 38
        BC_MEM_FREE 247, 11, 37
        BC_PLANE_A
        BC_STATUS 6, 2, "Sq:  -"
        BC_MEM_FULL 102, 10, 37
        BC_STATUS 22, 20, "Select track"
        BC_STATUS 22, 30, "to move."
        BC_BUFFER 2, 2, 0, 2, 2, 1
        endm

DLG_TRANSPOSE_PERMANENT  macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Transpose permanent"
        BC_STATUS 36, 16, "Pressing DO IT will transpose"
        BC_STATUS 36, 26, "note data parmanently"
        BC_SOFTKEY 4, BC_SK_FILL,  "CLOSE"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

; --------------------------------------------------------------------------
; MAIN screen defaults
; --------------------------------------------------------------------------

SCR_MAIN_SCREEN_DEFAULTS macro          ; MAIN SEQUENCE drawn from the stored defaults
        BC_PLANE_B
        BC_CLEAR_RECT 138, 0, 109, 11
        BC_MEM_ALLOC 0, 0, 157
        BC_MEM_FREE 157, 0, 11
        BC_MEM_FREE 158, 1, 10
        BC_MEM_ALLOC 156, 10, 91
        BC_MEM_COPY 0, 10, 157
        BC_PLANE_A
        BC_STATUS 6, 2, "Main screen user defaults"
        BC_STATUS 6, 13, " \\:   . (SEQ)                 Tsig:  /  "
        BC_STATUS 6, 36, "    :     Velo%:      Pgm:"
        BC_STATUS 186, 22, "BARS:"
        BC_STATUS 186, 31, "Loop:"
        BC_SOFTKEY 6, BC_SK_PLAIN, " "
        BC_BUFFER 2, 2, 2, 2, 0, 0
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

SCR_DISK_LOAD_VIEW       macro          ; file list, LOAD
        BC_UI_CTRL 0, 0, 0, 0
        BC_CLEAR
        BC_PLANE_A
        BC_STATUS 0, 1, "View:"
        BC_STATUS 0, 9, "File:"
        BC_MEM_COPY 0, 18, 248
        BC_STATUS 0, 21, "Device:"
        BC_STATUS 0, 39, "  Type="
        BC_STATUS 176, 9, "Size=      K"
        BC_STATUS 182, 21, "Free memory"
        BC_STATUS 182, 30, "snd=      K"
        BC_STATUS 182, 39, "seq=      K"
        endm

DLG_LOAD_A_SEQUENCE      macro
        BC_SEQ_INIT
        BC_FILE_DIALOG 16, 2, 216, 58, "Load a Sequence"
        BC_STATUS 36, 16, "File:"
        BC_STATUS 36, 34, " Load into:  -"
        BC_SOFTKEY 3, BC_SK_BOX,   "PLAY"
        BC_SOFTKEY 4, BC_SK_FILL,  "DSCARD"
        BC_SOFTKEY 5, BC_SK_BOX,   "KEEP"
        BC_UI_CTRL 101, 33, 13, 9
        endm

DLG_LOAD_ALL_FILE        macro
        BC_SEQ_INIT
        BC_FILE_DIALOG 29, 2, 190, 58, "Load ALL file"
        BC_STATUS 38, 12, "This^will^replace all^existing"
        BC_STATUS 38, 21, "sequence & songs!"
        BC_STATUS 38, 30, "<SEQ> will^load a single"
        BC_STATUS 38, 39, "sequence."
        BC_SOFTKEY 3, BC_SK_BOX,   "<SEQ>"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "LOAD"
        endm

DLG_LOAD_A_SEQUENCE_NUM  macro          ; file by number
        BC_FILE_DIALOG 29, 2, 190, 58, "Load a sequence"
        BC_STATUS 37, 16, "     File:##-"
        BC_STATUS 37, 38, "Load into:##-"
        BC_SOFTKEY 3, BC_SK_BOX,   "PLAY"
        BC_SOFTKEY 4, BC_SK_FILL,  "DSCARD"
        BC_SOFTKEY 5, BC_SK_BOX,   "KEEP"
        endm

SCR_LOAD_ALL_FILE_BODY   macro          ; same body, the frame is already drawn
        BC_SEQ_INIT
        BC_STATUS 38, 12, "This^will^replace all^existing"
        BC_STATUS 38, 21, "sequence & songs!"
        BC_STATUS 38, 30, "<SEQ> will^load a single"
        BC_STATUS 38, 39, "sequence."
        BC_SOFTKEY 3, BC_SK_BOX,   "<SEQ>"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "LOAD"
        endm

DLG_LOAD_A_SEQUENCE_NAME macro          ; file by name
        BC_FILE_DIALOG 29, 2, 190, 58, "Load a sequence"
        BC_STATUS 37, 16, "File:  -"
        BC_STATUS 181, 16, ".SEQ"
        BC_STATUS 37, 38, "Load into:  -"
        BC_SOFTKEY 3, BC_SK_BOX,   "PLAY"
        BC_SOFTKEY 4, BC_SK_FILL,  "DSCARD"
        BC_SOFTKEY 5, BC_SK_BOX,   "KEEP"
        endm

SCR_LOAD_PROGRAM_REPLACE macro          ; the CLEAR/LOAD choice
        BC_SOFTKEY 3, BC_SK_BOX,   "CLEAR"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "LOAD"
        BC_STATUS 40, 12, "Replace same sound in memory"
        BC_STATUS 88, 22, ":"
        BC_STATUS 40, 32, "[CLEAR]^erases^existing P^&^S"
        BC_STATUS 40, 40, "[^LOAD^]^adds^to^existing P^&^S"
        BC_UI_CTRL 93, 21, 61, 9
        endm

DLG_LOAD_A_SET           macro
        BC_FILE_DIALOG 29, 2, 190, 58, "Load a SET"
        BC_SOFTKEY 3, BC_SK_BOX,   "SOUND"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "SET"
        BC_STATUS 40, 19, "[SET]   load a SET file"
        BC_STATUS 40, 32, "[SOUND] load one sound from"
        BC_STATUS 40, 40, "        the SET file"
        BC_UI_CTRL 0, 0, 0, 0
        endm

DLG_LOAD_APS_FILE        macro
        BC_FILE_DIALOG 29, 2, 190, 58, "Load APS file"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "LOAD"
        BC_STATUS 40, 20, "This^will^replace^all^existing"
        BC_STATUS 40, 28, "programs & samples"
        endm

DLG_DELETE_FILE          macro
        BC_FILE_DIALOG 29, 6, 190, 54, "Delete file"
        BC_WAIT 39, 22, BMP_WARNING
        BC_STATUS 70, 22, "Pressing DO IT will"
        BC_STATUS 70, 31, "   delete immediately!!"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

DLG_DELETE_FROM_SOUND    macro          ; titled "Delete F-ROM Sound"
        BC_FILE_DIALOG 29, 6, 190, 54, "Delete F-ROM Sound"
        BC_STATUS 70, 18, "This sound is in use."
        BC_STATUS 70, 27, "Pressing DO IT will"
        BC_STATUS 70, 36, "   delete immediately!!"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

; --------------------------------------------------------------------------
; --------------------------------------------------------------------------

SCR_WIPE_DISK_WARN       macro          ; the warning line
        BC_CLEAR
        BC_STATUS 0, 1, " Device:"
        BC_MEM_COPY 0, 27, 248
        BC_STATUS 42, 36, "THIS WILL ERASE THE WHOLE DISK!!"
        BC_WAIT_LOAD
        endm

DLG_CONVERSION_TABLE     macro
        BC_FILE_DIALOG 16, 2, 216, 58, "Conversion table"
        BC_WAIT 38, 25, BMP_ARROW_DOWN
        BC_STATUS 68, 15, "MPC60 pad:"
        BC_STATUS 68, 35, "Becomes note:"
        BC_MEM_COPY 56, 29, 170
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "LOAD"
        endm

SCR_DISK_SAVE_VIEW       macro          ; file list, SAVE
        BC_CLEAR
        BC_UI_CTRL 0, 0, 0, 0
        BC_PLANE_A
        BC_STATUS 0, 1, "Type:"
        BC_STATUS 0, 9, "File:"
        BC_STATUS 170, 9, " Size=      K"
        BC_MEM_COPY 0, 18, 248
        BC_STATUS 164, 21, "Device:"
        BC_STATUS 107, 21, "SAVE"
        BC_WAIT 111, 30, BMP_ARROW_RIGHT
        BC_WAIT 78, 22, BMP_MPC
        BC_WAIT_LOAD
        endm

DLG_WIPE_DISK            macro
        BC_FILE_DIALOG 29, 2, 190, 58, "Wipe Disk"
        BC_WAIT 40, 20, BMP_WARNING
        BC_STATUS 70, 20, "This will erase disk"
        BC_STATUS 70, 30, "contents !!"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "WIPE"
        endm

DLG_FILE_EXISTS          macro
        BC_FILE_DIALOG 29, 2, 190, 58, "File Exists"
        BC_WAIT 40, 20, BMP_WARNING
        BC_STATUS 70, 20, "File name exists!"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "RENAME"
        endm

SCR_COPY_OS              macro          ; COPY OPERATING SYSTEM
        BC_UI_CTRL 28, 0, 160, 9
        BC_CLEAR_RECT 0, 9, 248, 40
        BC_MEM_COPY 0, 18, 248
        BC_STATUS 30, 1, "Copy Operating System               "
        BC_STATUS 6, 21, "Only floppy disk is used as copy source."
        BC_STATUS 6, 30, "Insert OS disk and press DO IT."
        endm

DLG_SELECT_DESTINATION   macro
        BC_FILE_DIALOG 29, 2, 190, 58, "Select destination"
        BC_UI_CTRL 171, 15, 37, 9
        BC_MEM_FULL 94, 14, 40
        BC_STATUS 38, 16, "OS file="
        BC_STATUS 38, 26, "Ver.="
        BC_STATUS 38, 36, "Size=000K"
        endm

DLG_NOT_ENOUGH_MEMORY    macro
        BC_FILE_DIALOG 29, 2, 190, 58, "Not enough memory !"
        BC_STATUS 55, 16, "Coping os file requires"
        BC_STATUS 55, 25, "more free memory."
        BC_STATUS 55, 34, "Please erase something."
        BC_SOFTKEY 5, BC_SK_BOX,   "O.K."
        endm

PANE_COPY_IN_OUT         macro          ; copy direction label
        BC_MEM_COPY 76, 37, 97
        BC_MEM_COPY 77, 38, 96
        BC_MEM_COPY 76, 39, 97
        BC_MEM_COPY 77, 40, 96
        BC_STATUS 103, 1, "IN OUT  "
        endm

PANE_COPY_IN_ONLY        macro          ; copy direction label
        BC_MEM_COPY 76, 37, 142
        BC_MEM_COPY 77, 38, 141
        BC_MEM_COPY 76, 39, 142
        BC_MEM_COPY 77, 40, 141
        BC_STATUS 103, 1, "IN ONLY "
        endm

PANE_COPY_OUT_ONLY       macro          ; copy direction label
        BC_MEM_COPY 31, 37, 142
        BC_MEM_COPY 32, 38, 141
        BC_MEM_COPY 31, 39, 142
        BC_MEM_COPY 32, 40, 141
        BC_STATUS 103, 1, "OUT ONLY"
        endm

; --------------------------------------------------------------------------
; SONG mode
; --------------------------------------------------------------------------

SCR_SONG                 macro
        BC_CLEAR
        BC_PLANE_A
        BC_STATUS 6, 2, "Song:  -                "
        BC_STATUS 168, 1, "Now:         "
        BC_STATUS 6, 13, "TEMPO:MAS   Step      Sequence      Reps"
        BC_STATUS 6, 21, "    \\:120.0"
        BC_STATUS 6, 36, " LOOP:OFF"
        BC_MEM_ALLOC 0, 0, 151
        BC_MEM_COPY 0, 10, 151
        BC_MEM_ALLOC 150, 10, 98
        BC_MEM_ALLOC 0, 48, 248
        BC_MEM_ALLOC 1, 49, 247
        BC_MEM_FREE 0, 0, 48
        BC_MEM_FREE 151, 0, 11
        BC_MEM_FREE 152, 1, 10
        BC_MEM_FREE 246, 10, 38
        BC_MEM_FREE 247, 11, 37
        BC_MEM_COPY 75, 21, 172
        BC_MEM_FULL 75, 11, 38
        BC_MEM_FULL 103, 11, 38
        BC_MEM_FULL 219, 11, 38
        BC_SOFTKEY 3, 3,           "    "   ; 3 has no arm, draws as PLAIN
        BC_SOFTKEY 4, BC_SK_BOX,   "CONVRT"
        BC_SOFTKEY 5, BC_SK_BOX,   "DELETE"
        BC_SOFTKEY 6, BC_SK_BOX,   "INSERT"
        endm

DLG_ARRANGE_FROM         macro          ; titled "Arrange F-ROM"
        BC_FILE_DIALOG 29, 2, 190, 58, "Arrange F-ROM"
        BC_WAIT 46, 26, BMP_WARNING
        BC_STATUS 36, 15, "THIS PROCESS WILL TAKA WHILE!"
        BC_STATUS 78, 27, "IT'S NOT POSIIBLE TO"
        BC_STATUS 78, 37, "ABORT,ONCE INITIATED!"
        BC_SOFTKEY 4, BC_SK_FILL,  "CANCEL"
        BC_SOFTKEY 5, BC_SK_BOX,   "DO IT"
        endm

SCR_PAD_BANK             macro          ; PAD BANK header
        BC_PLANE_B
        BC_CLEAR_RECT 2, 22, 180, 24
        BC_WAIT 4, 29, BMP_PAREN_L
        BC_WAIT 29, 29, BMP_PAREN_R
        BC_PLANE_A
        BC_STATUS 6, 2, "Sq:  -"
        BC_STATUS 6, 13, "Tr:"
        BC_STATUS 9, 29, "BANK"
        BC_STATUS 168, 1, "Now:   .  .  "
        endm

; --------------------------------------------------------------------------
; the service screens
; --------------------------------------------------------------------------

KEYS_STEP_DUMP_RUN       macro          ; soft-label row                              ; ?
        BC_UI_5E 0, 51, 248, 9
        BC_LCD_TEXT 2, 034h, "STEP"
        BC_LCD_TEXT 41, 034h, "DUMP"
        BC_LCD_TEXT 82, 034h, "RUN"
        BC_FLUSH
        BC_PLANE_POP
        endm

KEYS_SEG_DIVISORS        macro          ; soft-label row                              ; ?
        BC_CLEAR_RECT 0, 0, 240, 60
        BC_UI_5E 0, 51, 248, 9
        BC_LCD_TEXT 4, 034h, "SEG"
        BC_LCD_TEXT 45, 034h, "1000"
        BC_LCD_TEXT 86, 034h, "100"
        BC_LCD_TEXT 127, 034h, "8"
        BC_LCD_TEXT 168, 034h, "1"
        BC_LCD_TEXT 209, 034h, " 6 "
        endm
