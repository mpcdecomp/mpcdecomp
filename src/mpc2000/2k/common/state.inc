; MPC_STATE structure behind sequencer-state far pointer: v1.50
; SND_CURRENT 09A6Ch, v1.72 09CAEh. same field layout on both.
; R/W counts are v1.72 values per field.

MPC_STATE       STRUCT

reserved_00     DB      17 DUP (?)  ; +0x0000..0x0010  ?

flag_11         DB      ?           ; +0x0011: 1R/0W
flag_12         DB      ?           ; +0x0012: 3R/0W
flag_13         DB      ?           ; +0x0013: 5R/0W, tested often

; offsets 14h-23h: four 32-bit pairs, sequencer state; 57-75 refs each  ?
time_lo         DW      ?           ; +0x0014: 40R/17W  time/position LSW  ?
time_hi         DW      ?           ; +0x0016: 42R/16W
pos_lo          DW      ?           ; +0x0018: 53R/22W  cursor/playhead LSW  ?
pos_hi          DW      ?           ; +0x001A: 53R/17W
range_lo        DW      ?           ; +0x001C: 25R/1W   range/length LSW  ?
range_hi        DW      ?           ; +0x001E: 25R/1W
param_lo        DW      ?           ; +0x0020: 28R/8W
param_hi        DW      ?           ; +0x0022: 28R/8W

mode            DB      ?           ; +0x0024: 3R/0W  mode/bank selector  ?
status          DB      ?           ; +0x0025: 2R/0W
ptr_lo          DW      ?           ; +0x0026: 2R/0W
ref_lo          DW      ?           ; +0x0028: 1R/0W
ref_hi          DW      ?           ; +0x002A: 1R/0W

reserved_2c     DB      4 DUP (?)   ; +0x002C..0x002F  ?

cache_lo        DW      ?           ; +0x0030: 10R/0W
output_lo       DW      ?           ; +0x0032: 0R/7W, write-only
output_hi       DW      ?           ; +0x0034: 0R/5W, write-only

MPC_STATE       ENDSTRUCT           ; MPC_STATE_LEN = 0x36, 54 bytes minimum
