; MPC_STATE: offset names at es:bx sites whose base is not traced to a record.
; same layout as the sound (sound_record.inc); a site whose base is a sound
; uses the SND_* name.

MPC_STATE       STRUCT

reserved_00     DB      17 DUP (?)  ; +0x0000..0x0010  ?

flag_11         DB      ?           ; +0x0011
flag_12         DB      ?           ; +0x0012
flag_13         DB      ?           ; +0x0013

time_lo         DW      ?           ; +0x0014
time_hi         DW      ?           ; +0x0016
pos_lo          DW      ?           ; +0x0018
pos_hi          DW      ?           ; +0x001A
range_lo        DW      ?           ; +0x001C
range_hi        DW      ?           ; +0x001E
param_lo        DW      ?           ; +0x0020
param_hi        DW      ?           ; +0x0022

mode            DB      ?           ; +0x0024
status          DB      ?           ; +0x0025
ptr_lo          DW      ?           ; +0x0026
ref_lo          DW      ?           ; +0x0028
ref_hi          DW      ?           ; +0x002A

reserved_2c     DB      4 DUP (?)   ; +0x002C..0x002F  ?

cache_lo        DW      ?           ; +0x0030
output_lo       DW      ?           ; +0x0032
output_hi       DW      ?           ; +0x0034

MPC_STATE       ENDSTRUCT           ; MPC_STATE_LEN = 0x36, 54 bytes minimum
