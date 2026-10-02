; FIXUPS: first 'F' file on OS disk. v1.2 ROM loader (35CFh) reads 'F' files
; to 83B4h; this redirects it to load OS_NAME to 1000:0000, move to 0:0, enter
; 0:40h. including image sets OS_NAME; phase 83B4h.

ROM_VERSION     equ     0fch            ; the running system's version record: "X.X" in ROM v1.2
ROM_BLOCK_WALK  equ     2d05h           ; the jb closing the loader's block-walk loop
ROM_SET_DEST    equ     3604h           ; loader: 'F' files go to 0:83B4h
ROM_READ        equ     360ah           ; loader, past that
ROM_RUN_F       equ     363bh           ; loader: jmp 83B4h after the read
ROM_LOAD_FILE   equ     35cfh           ; al = type, dx -> 10-character name
ROM_DEST_OFF    equ     29c2h           ; load address, offset
ROM_DEST_SEG    equ     29c4h           ; load address, segment

fx_entry:
        pusha
        test    byte ptr [ROM_VERSION], 80h
        jne     fx_decline
        cmp     byte ptr [ROM_VERSION+1], 31h
        jne     fx_patch
        cmp     byte ptr [ROM_VERSION+3], 30h   ; 1.0 and 1.1 are left alone: the patch sites are v1.2's
        je      fx_decline
        cmp     byte ptr [ROM_VERSION+3], 31h
        je      fx_decline
fx_patch:
        mov     byte ptr [ROM_BLOCK_WALK], 0e3h ; jb -> jcxz
        mov     byte ptr [ROM_SET_DEST], 0eah   ; jmpf 0:fx_dest
        mov     word ptr [ROM_SET_DEST+1], fx_dest
        mov     word ptr [ROM_SET_DEST+3], 0
        mov     byte ptr [ROM_RUN_F], 0c3h      ; ret: the loader returns here instead
        mov     al, 46h
        mov     dx, fx_name
        nop
        call    ROM_LOAD_FILE
        mov     ax, 2000h                       ; the stub runs from 2000:0, clear of the 64 KB it moves
        mov     es, ax
        mov     di, 0
        mov     si, fx_stub
        nop
        mov     cx, fx_stub_end-fx_stub
        nop
        rep movsb
        jmpf    2000h:0
fx_decline:
        popa
        stc
        ret

fx_dest:
        mov     word ptr [ROM_DEST_OFF], 0
        mov     word ptr [ROM_DEST_SEG], 1000h
        jmp     ROM_READ
fx_name:
        db      OS_NAME

; copied to 2000:0 and run there
fx_stub:
        xor     ax, ax
        mov     si, ax
        mov     di, ax
        mov     es, ax
        mov     ax, 1000h
        mov     ds, ax
        mov     cx, 8000h
        rep movsw
        jmpf    0:os_entry
fx_stub_end:
        db      0
