; DATA-segment objects, same shape v1.50/v1.72; anchors
; src/mpc2000/2k/common/sys/data.asm labels; counts, field layout, error
; codes defined here; from assembled images

; =============================================================================
; =============================================================================
; ERR_MSG_COUNT (20) far pointers, DATA_SEG-relative; G_ERRNO clamped,
; scaled 4, pushed as far pointer. v1.50 clamps 13h, v1.72 clamps 14h
; (past table); code 14h written reads G_ERRNO + SYS_BUILD_DATE start

ERR_MSG_COUNT            equ    20
ERR_MSG_LAST             equ    ERR_MSG_COUNT-1
ERR_MSG_ENTRY            equ    4       ; dd far pointer

ERR_UNKNOWN              equ     0      ; "Unknown error"  (v1.50: "Unkown")
ERR_NO_MEMORY            equ     1      ; "not enough memory"
ERR_DISK_READ            equ     2      ; "disk read error"
ERR_DISK_WRITE           equ     3      ; "disk write error"
ERR_FILE_DAMAGED         equ     4      ; "File is damaged"
ERR_INTERNAL             equ     5      ; "Internal error"
ERR_NEWER_OS             equ     6      ; "Disk requires newer OS!"
ERR_UNKNOWN_FILE_TYPE    equ     7      ; "Unknown file type"
ERR_NAME_IN_USE          equ     8      ; "Name already used"
ERR_SOUND_DIR_FULL       equ     9      ; "Sound directory full(128max)"
ERR_PROG_DIR_FULL        equ    10      ; "Prog. directory full(24 max)"
ERR_NO_DIGITAL_CARRIER   equ    11      ; "No digital signal carrier"
ERR_CANT_OPEN            equ    12      ; "Can't open file"
ERR_FILE_EXISTS          equ    13      ; "File already exists"
ERR_CANT_REMOVE          equ    14      ; "Can't remove file"
ERR_WRITE_PROTECTED      equ    15      ; "Disk is write protected"
ERR_NO_DISK_SPACE        equ    16      ; "Insufficient disk space"
ERR_WRONG_DISK_FORMAT    equ    17      ; "Wrong disk format"
ERR_UNKNOWN_FILE_FORMAT  equ    18      ; "Unknown file format"  (v1.50: "Unkown")
ERR_UNKNOWN_19           equ    19      ; "Unknown error" again -- the spare slot

; =============================================================================
; =============================================================================
;   ERR_MSG_TABLE + 50h : G_ERRNO           dw
;                  + 52h : SYS_BUILD_DATE   db 21 dup, pad
;                  + 68h : SYS_PRODUCT_NAME db 16, space padded
; SYS_BUILD_DATE: v1.72 "May 14 1999 18:46:30",
;                 v1.50 "Sep 19 1997 20:12:51"
; strcpy to 09F24h, push to cmd_dispatch_1E for version screen

SYS_BUILD_DATE_LEN equ  22              ; 20 characters, NUL, one pad byte
SYS_PRODUCT_NAME_LEN equ 16             ; "MPC2000         "

; =============================================================================
; =============================================================================
; seven far-pointer tables of effect names; same region, move
; together: v1.72 = v1.50 +7Eh each. addresses per-revision, counts
; here; dd[count], DATA_SEG-relative

FX_TYPE_COUNT        equ    4           ; MULTI FX1, MULTI FX2, REVERB 1, REVERB 2
FX_SECTION_COUNT     equ   10           ; R1, M1, FX1 DIST/FLT ... FX2 REVERB
FX_MOD_TYPE_COUNT    equ    7           ; PHASE SHIFT ... PITCH+FEEDBACK
FX_PAN_COUNT         equ    4           ; PAN, L>R, R>L, TERM
FX_OUT_MODE_COUNT    equ    4           ; MONO LEFT, MONO L+R, XOVER L&R, STEREO
FX_REVERB_COUNT      equ    7           ; LARGE HALL ... REVERSE
FX_ROUTE_COUNT       equ    3           ; MOD/ECHO>REV, REV>MOD/ECHO, MOD/ECHO+REV
FX_OUT_PAIR_COUNT    equ    5           ; MASTER, 1/2, 3/4, 5/6, 7/8 -- v1.72 only

; FX_SECTION_LABELS unreferenced in code; reached via DATA pointer; named as
; landmark for other six tables in same region

; =============================================================================
; =============================================================================
; CREDITS_TABLE: scrolling development-team list, 35 far pointers;
; most same empty, pushed [bx+CREDITS_TABLE+2]/[bx+CREDITS_TABLE].
; entry 5: "        MPC2000 development Team!"

CREDITS_COUNT    equ    35
