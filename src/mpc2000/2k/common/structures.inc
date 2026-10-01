; MPC2000.SYS -- the four DATA-segment structures reached through far
; pointers.  same field layout in v1.50 and v1.72; only the pointer's own
; address moves.  R/W counts are v1.72's.

MPC_SECONDARY       STRUCT
reserved_00         DW      ?           ; +0x0000
state_word          DW      ?           ; +0x0002: the hot field
reserved_04         DB      36 DUP (?)  ; +0x0004..0x0027
ptr1_lo             DW      ?           ; +0x0028  far pointer LSW
ptr1_hi             DW      ?           ; +0x002A
ptr2_lo             DW      ?           ; +0x002C  far pointer LSW
ptr2_hi             DW      ?           ; +0x002E
MPC_SECONDARY       ENDSTRUCT           ; MPC_SECONDARY_LEN = 0x30, 48 bytes min

MPC_SAMPLE          STRUCT
reserved_00         DW      ?           ; +0x0000
status              DW      ?           ; +0x0002
reserved_04         DB      25 DUP (?)  ; +0x0004..0x001B
range_lo            DW      ?           ; +0x001C  range LSW  ?
range_hi            DW      ?           ; +0x001E
reserved_20         DB      8 DUP (?)   ; +0x0020..0x0027
data_lo             DW      ?           ; +0x0028: the hot field
data_hi             DW      ?           ; +0x002A
buffer_lo           DW      ?           ; +0x002C
buffer_hi           DW      ?           ; +0x002E
MPC_SAMPLE          ENDSTRUCT           ; MPC_SAMPLE_LEN = 0x30, 48 bytes min

; MPC_TRACK -- [PTR_TRACK_DATA] = 09D16h (v1.50 09AD4h), 28 LES/LDS sites
MPC_TRACK           STRUCT
reserved_00         DB      3 DUP (?)   ; +0x0000..0x0002
flag_03             DB      ?           ; +0x0003: 2R/0W  track flag  ?
reserved_04         DB      ?           ; +0x0004
flag_05             DB      ?           ; +0x0005: 2R/0W  mode/state  ?
MPC_TRACK           ENDSTRUCT           ; MPC_TRACK_LEN = 0x06

; MPC_LCD -- [PTR_LCD_STATE] = 08CEEh (v1.50 08AAEh), 5 LES/LDS sites
MPC_LCD             STRUCT
reserved_00         DB      19 DUP (?)  ; +0x0000..0x0012
flag_13             DB      ?           ; +0x0013: 3R/0W  display enable  ?
reserved_14         DB      8 DUP (?)   ; +0x0014..0x001B
coord_x             DW      ?           ; +0x001C: 2R/0W  X  ?
coord_y             DW      ?           ; +0x001E: 3R/0W  Y  ?
reserved_20         DB      16 DUP (?)  ; +0x0020..0x002F
buffer_ptr          DW      ?           ; +0x0030: 1R/0W  ?
MPC_LCD             ENDSTRUCT           ; MPC_LCD_LEN = 0x32, 50 bytes min
