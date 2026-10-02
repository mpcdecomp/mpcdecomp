; app0 -- MPC2000XL flash from 0x00000: IVT, init, SCSI, panel.
; v1.20 to 0x0a9aa (43434 bytes), v1.14 to 0x0a9a6 (43430 bytes),
; v1.12 to 0x0a868 (43112 bytes), v1.11 to 0x0a812 (43026 bytes),
; v1.10 to 0x0a812 (43026 bytes), v1.07 to 0x0a7e0 (42976 bytes).
; IVT to 0x00400; OS entry; hw init (page map, ICU, timer); panel message ring;
; LED/pad-bank ports 014xh-017xh; SCSI SPC ports 00h-1Ch; ASIC DMA 0c030h-0c03fh.

; ---- XL_FOR_2K
; XL OS on base MPC2000 hardware: base's DRAM window and ICU config, base's LED
; and pad-bank ports, base's floppy/SCSI DMA buffer, one cycling PAD BANK
; button, hooks into app1's data-wheel decoder and playback key gate.
; every arm is in-place and length-neutral, one XL2K_ macro per site
; (common/feat/xl_for_2k.inc).

TBL_IVT:                                ; interrupt vector table, 256 far pointers; ivt_default_isr is the default stub
        dw      xl_divide_error_handler, 0       ; [0]
        dw      isr_09751, 0                     ; [1]
        dw      ivt_default_isr, 0               ; [2]
        dw      xl_exception_monitor, 0          ; [3]
        dw      ivt_default_isr, 0               ; [4]
        dw      ivt_default_isr, 0               ; [5]
        dw      isr_09749, 0                     ; [6]
        dw      isr_09B7F, 0                     ; [7]
        dw      ivt_default_isr, 0               ; [8]
        dw      ivt_default_isr, 0               ; [9]
        dw      ivt_default_isr, 0               ; [10]
        dw      ivt_default_isr, 0               ; [11]
        dw      ivt_default_isr, 0               ; [12]
        dw      ivt_default_isr, 0               ; [13]
        dw      ivt_default_isr, 0               ; [14]
        dw      ivt_default_isr, 0               ; [15]
        dw      ivt_default_isr, 0               ; [16]
        dw      ivt_default_isr, 0               ; [17]
        dw      ivt_default_isr, 0               ; [18]
        dw      ivt_default_isr, 0               ; [19]
        dw      ivt_default_isr, 0               ; [20]
        dw      ivt_default_isr, 0               ; [21]
        dw      ivt_default_isr, 0               ; [22]
        dw      ivt_default_isr, 0               ; [23]
        dw      ivt_default_isr, 0               ; [24]
        dw      ivt_default_isr, 0               ; [25]
        dw      ivt_default_isr, 0               ; [26]
        dw      ivt_default_isr, 0               ; [27]
        dw      ivt_default_isr, 0               ; [28]
        dw      ivt_default_isr, 0               ; [29]
        dw      ivt_default_isr, 0               ; [30]
        dw      ivt_default_isr, 0               ; [31]
        dw      isr_08046, 0                     ; [32]
        dw      ivt_default_isr, 0               ; [33]
        dw      ivt_default_isr, 0               ; [34]
        dw      isr_00FD4, 0                     ; [35]
        dw      isr_00B04, 0                     ; [36]
        dw      xl_os_timer_isr, 0               ; [37]
        dw      isr_00E29, 0                     ; [38]
        dw      isr_00DD3, 0                     ; [39]
xl_word_registers_a0:
        dw      xl_os_entry, 0                   ; [40]
        dw      C0_BASE+isr_35B10-C0_SEG*16, C0_SEG ; [41]
        dw      isr_00461, 0                     ; [42]
        dw      isr_01767, 0                     ; [43]
        dw      isr_01769, 0                     ; [44]
        dw      ram_stamp, RAM_SEG               ; [45]
        dw      APP2_BASE+isr_1BAEF-APP2_SEG*16, APP2_SEG ; [46]
        dw      APP1_BASE+isr_0F4EA-APP1_SEG*16, APP1_SEG ; [47]
xl_hw_control_latch:
        dw      APP1_BASE+isr_0F312-APP1_SEG*16, APP1_SEG ; [48]
        dw      ivt_default_isr, 0               ; [49]
        dw      isr_00724, 0                     ; [50]
        dw      APP1_BASE+isr_0F54A-APP1_SEG*16, APP1_SEG ; [51]
        dw      APP1_BASE+isr_0F5C7-APP1_SEG*16, APP1_SEG ; [52]
        dw      ivt_default_isr, 0               ; [53]
        dw      ivt_default_isr, 0               ; [54]
        dw      APP1_BASE+isr_0F58E-APP1_SEG*16, APP1_SEG ; [55]
        dw      ivt_default_isr, 0               ; [56]
        dw      ivt_default_isr, 0               ; [57]
        dw      APP1_BASE+isr_0F3A2-APP1_SEG*16, APP1_SEG ; [58]
        dw      ivt_default_isr, 0               ; [59]
        dw      ivt_default_isr, 0               ; [60]
        dw      ivt_default_isr, 0               ; [61]
        dw      ivt_default_isr, 0               ; [62]
        dw      APP1_BASE+isr_0F59E-APP1_SEG*16, APP1_SEG ; [63]
        dw      APP1_BASE+isr_0F52A-APP1_SEG*16, APP1_SEG ; [64]
        dw      ivt_default_isr, 0               ; [65]
        dw      APP1_BASE+isr_0F5AE-APP1_SEG*16, APP1_SEG ; [66]
        dw      APP1_BASE+isr_0F4B6-APP1_SEG*16, APP1_SEG ; [67]
        dw      ivt_default_isr, 0               ; [68]
        dw      APP3_BASE+isr_30E5F-APP3_SEG*16, APP3_SEG ; [69]
        dw      ivt_default_isr, 0               ; [70]
        dw      ivt_default_isr, 0               ; [71]
xl_boot_port_120:
        dw      isr_06B59, 0                     ; [72]
        dw      ivt_default_isr, 0               ; [73]
        dw      APP1_BASE+isr_0F5DF-APP1_SEG*16, APP1_SEG ; [74]
        dw      APP1_BASE+isr_0F53C-APP1_SEG*16, APP1_SEG ; [75]
        dw      ivt_default_isr, 0               ; [76]
        dw      APP2_BASE+isr_1D58A-APP2_SEG*16, APP2_SEG ; [77]
        dw      ivt_default_isr, 0               ; [78]
        dw      ivt_default_isr, 0               ; [79]
        dw      ivt_default_isr, 0               ; [80]
        dw      ivt_default_isr, 0               ; [81]
        dw      ivt_default_isr, 0               ; [82]
        dw      ivt_default_isr, 0               ; [83]
        dw      ivt_default_isr, 0               ; [84]
        if      FW_VERSION >= 110
        dw      isr_01547, 0                     ; [85]
        dw      isr_015A1, 0                     ; [86]
        else
        dw      ivt_default_isr, 0               ; [85]
        dw      ivt_default_isr, 0               ; [86]
        endif
        dw      isr_02E83, 0                     ; [87]
        dw      isr_02EA2, 0                     ; [88]
        dw      APP1_BASE+isr_0E31A-APP1_SEG*16, APP1_SEG ; [89]
        dw      APP1_BASE+isr_0F664-APP1_SEG*16, APP1_SEG ; [90]
        dw      ATA_BASE+isr_0F68C-ATA_SEG*16, ATA_SEG ; [91]
        dw      ram_0B1C, RAM_SEG                ; [92]
        dw      ram_0B1C, RAM_SEG                ; [93]
        dw      ram_0B1C, RAM_SEG                ; [94]
        dw      ram_0B1C, RAM_SEG                ; [95]
        dw      ram_0ADC, RAM_SEG                ; [96]
        dw      ram_0ADC, RAM_SEG                ; [97]
        dw      ram_0ADC, RAM_SEG                ; [98]
        dw      ram_0ADC, RAM_SEG                ; [99]
        dw      ram_066C, RAM_SEG                ; [100]
        dw      isr_01CD5, 0                     ; [101]
        dw      isr_01D0B, 0                     ; [102]
        dw      ivt_default_isr, 0               ; [103]
        dw      isr_019A5, 0                     ; [104]
        dw      isr_01374, 0                     ; [105]
        dw      isr_0502D, 0                     ; [106]
        dw      isr_04388, 0                     ; [107]
        dw      isr_04218, 0                     ; [108]
        dw      isr_00AE2, 0                     ; [109]
        dw      isr_00AF3, 0                     ; [110]
        dw      isr_00AD3, 0                     ; [111]
        dw      isr_041AB, 0                     ; [112]
        dw      isr_01A3A, 0                     ; [113]
        dw      C0_BASE+isr_33E12-APP3_SEG*16, APP3_SEG ; [114]
        dw      isr_02504, 0                     ; [115]
        dw      isr_00819, 0                     ; [116]
        dw      isr_00DC3, 0                     ; [117]
        dw      isr_07D78, 0                     ; [118]
        dw      isr_0169B, 0                     ; [119]
        dw      isr_07B27, 0                     ; [120]
        dw      isr_0105D, 0                     ; [121]
        dw      isr_01049, 0                     ; [122]
        dw      isr_01012, 0                     ; [123]
        dw      isr_00FF9, 0                     ; [124]
        dw      isr_04427, 0                     ; [125]
        dw      isr_04463, 0                     ; [126]
        dw      isr_044A5, 0                     ; [127]
        dw      isr_01BF3, 0                     ; [128]
        dw      isr_07AAD, 0                     ; [129]
        dw      isr_07AB8, 0                     ; [130]
        dw      isr_07A95, 0                     ; [131]
        dw      isr_07AA1, 0                     ; [132]
        dw      isr_079F2, 0                     ; [133]
        dw      isr_07A02, 0                     ; [134]
        dw      isr_04E53, 0                     ; [135]
        dw      isr_04FFC, 0                     ; [136]
        dw      isr_04924, 0                     ; [137]
        dw      isr_04945, 0                     ; [138]
        dw      isr_01530, 0                     ; [139]
        dw      isr_01483, 0                     ; [140]
        dw      isr_012FC, 0                     ; [141]
        dw      isr_00E7F, 0                     ; [142]
        dw      RAM_BASE+xl_display_service-APP2_SEG*16, APP2_SEG ; [143]
        if      FW_VERSION >= 110
        dw      APP2_BASE+isr_1AA16-APP2_SEG*16, APP2_SEG ; [144]
        else
        dw      RAM_BASE+isr_1AA16-APP2_SEG*16, APP2_SEG ; [144]
        endif
        dw      ivt_default_isr, 0               ; [145]
        dw      isr_00FE3, 0                     ; [146]
        dw      isr_0A044, 0                     ; [147]
        dw      isr_00EBC, 0                     ; [148]
        dw      isr_014B1, 0                     ; [149]
        dw      isr_04796, 0                     ; [150]
        dw      isr_047C4, 0                     ; [151]
        dw      isr_047F2, 0                     ; [152]
        dw      isr_04820, 0                     ; [153]
        dw      isr_04851, 0                     ; [154]
        dw      isr_007F1, 0                     ; [155]
        dw      isr_0487C, 0                     ; [156]
        dw      isr_04885, 0                     ; [157]
        dw      isr_0488D, 0                     ; [158]
        dw      isr_04896, 0                     ; [159]
        dw      isr_0489F, 0                     ; [160]
        dw      isr_048E2, 0                     ; [161]
        dw      isr_04906, 0                     ; [162]
        dw      isr_041BD, 0                     ; [163]
        dw      isr_04249, 0                     ; [164]
        dw      isr_03E9A, 0                     ; [165]
        dw      isr_048CC, 0                     ; [166]
        dw      isr_00969, 0                     ; [167]
        dw      isr_00989, 0                     ; [168]
        dw      isr_04200, 0                     ; [169]
        dw      isr_009A1, 0                     ; [170]
        dw      isr_042D6, 0                     ; [171]
        dw      isr_04D28, 0                     ; [172]
        dw      isr_0503B, 0                     ; [173]
        dw      isr_009DE, 0                     ; [174]
        dw      isr_007E3, 0                     ; [175]
        dw      isr_012D0, 0                     ; [176]
        dw      APP1_BASE+isr_0EBAB-APP1_SEG*16, APP1_SEG ; [177]
        dw      isr_012EE, 0                     ; [178]
        dw      isr_0132D, 0                     ; [179]
        dw      xl_wait_dialog, 0                ; [180]
        dw      APP1_BASE+isr_0ECA9-APP1_SEG*16, APP1_SEG ; [181]
        dw      isr_01681, 0                     ; [182]
        dw      isr_04966, 0                     ; [183]
        dw      isr_014E9, 0                     ; [184]
        dw      xl_panel_ring_buffer_isr_b9, 0   ; [185]
        dw      isr_0135C, 0                     ; [186]
        dw      isr_04225, 0                     ; [187]
        dw      ivt_default_isr, 0               ; [188]
        dw      isr_07D88, 0                     ; [189]
        dw      isr_07A85, 0                     ; [190]
        dw      isr_07B0F, 0                     ; [191]
        dw      isr_07D4F, 0                     ; [192]
        dw      isr_0109A, 0                     ; [193]
        dw      isr_010E2, 0                     ; [194]
        dw      isr_010F2, 0                     ; [195]
        dw      isr_010FD, 0                     ; [196]
        dw      isr_01068, 0                     ; [197]
        dw      isr_05EE2, 0                     ; [198]
        dw      isr_010B3, 0                     ; [199]
        dw      isr_09DA3, 0                     ; [200]
        dw      isr_01793, 0                     ; [201]
        dw      isr_017BB, 0                     ; [202]
        dw      isr_017E3, 0                     ; [203]
        dw      isr_0176B, 0                     ; [204]
        dw      APP3_BASE+isr_2FE41-APP3_SEG*16, APP3_SEG ; [205]
        dw      isr_01FF0, 0                     ; [206]
        dw      isr_020AA, 0                     ; [207]
        dw      isr_023BC, 0                     ; [208]
        dw      isr_018A7, 0                     ; [209]
        dw      isr_01933, 0                     ; [210]
        dw      isr_01A8C, 0                     ; [211]
        dw      isr_01AB9, 0                     ; [212]
        dw      isr_01AD1, 0                     ; [213]
        dw      isr_01B59, 0                     ; [214]
        dw      isr_01C3A, 0                     ; [215]
        dw      isr_08270, 0                     ; [216]
        dw      isr_08287, 0                     ; [217]
        dw      isr_01249, 0                     ; [218]
        dw      isr_01280, 0                     ; [219]
        dw      isr_009E9, 0                     ; [220]
        dw      isr_009B5, 0                     ; [221]
        dw      isr_01CAE, 0                     ; [222]
        dw      isr_07D67, 0                     ; [223]
        dw      C0_BASE+isr_35594-APP3_SEG*16, APP3_SEG ; [224]
        dw      C0_BASE+isr_355E2-APP3_SEG*16, APP3_SEG ; [225]
        dw      C0_BASE+isr_35610-APP3_SEG*16, APP3_SEG ; [226]
        dw      C0_BASE+isr_3566F-APP3_SEG*16, APP3_SEG ; [227]
        dw      C0_BASE+isr_356E9-APP3_SEG*16, APP3_SEG ; [228]
        dw      isr_03D47, 0                     ; [229]
        dw      isr_01C90, 0                     ; [230]
        dw      isr_0180B, 0                     ; [231]
        dw      isr_01838, 0                     ; [232]
        dw      isr_01B19, 0                     ; [233]
        dw      isr_01D2C, 0                     ; [234]
        dw      isr_01D0C, 0                     ; [235]
        dw      isr_0821E, 0                     ; [236]
        dw      isr_08D0B, 0                     ; [237]
        dw      isr_0876F, 0                     ; [238]
        dw      isr_091F9, 0                     ; [239]
        dw      isr_01E04, 0                     ; [240]
        dw      isr_01E2A, 0                     ; [241]
        dw      isr_036B5, 0                     ; [242]
        dw      isr_03DFD, 0                     ; [243]
        dw      isr_03E65, 0                     ; [244]
        dw      isr_01E50, 0                     ; [245]
        dw      isr_01035, 0                     ; [246]
        dw      isr_00456, 0                     ; [247]
        dw      isr_02530, 0                     ; [248]
        dw      isr_0242B, 0                     ; [249]
        dw      isr_07FD2, 0                     ; [250]
        dw      isr_06D9E, 0                     ; [251]
        dw      isr_06DD9, 0                     ; [252]
        dw      isr_028AC, 0                     ; [253]
        dw      isr_007FF, 0                     ; [254]
        dw      isr_07E55, 0                     ; [255]
ivt_default_isr:
        iret
xl_divide_error_handler:
        mov     bp, RAM_SEG
        mov     ds, bp
        DISP_MSG        "       Error at     :    "
        DISP_ERASE      86h, 17h, 36h, 07h
        pop     ax
        DISP_HEX16      0a4h, 17h
        pop     ax
        DISP_HEX16      86h, 17h
        DISP_TEXT       9eh, 17h, ":"
        DISP_INVERT     86h, 17h, 36h, 07h
        DISP_FLUSH
        db      0fbh
loop_00448:
        int     0b9h
        test    ah, 80h
        jne     loop_00448
        cmp     ax, 0
        je      loop_00448
        if      FW_VERSION < 120
        int 3
        endif
        jmp     loop_00448
isr_00456:
        mov     bp, resume_0045C
        retxa   2Ch
resume_0045C:
        jmpf    RESET_SEG:RESET_ENTRY
isr_00461:
        dec     bp
        push    ax
        inc     bx
        xor     dh, byte ptr [bx+si]
        xor     byte ptr [bx+si], dh
        pop     ax
        dec     sp
        if      FW_VERSION < 120
        nop
        endif
xl_os_entry:
        mov     bp, ax
        cli
        mov     ax, cs
        cmp     ax, 0c000h
        je      br_00491
        cmp     ax, 8000h
        je      br_00491
        cmp     ax, 0
        jne     br_00481
        jmp     br_00551
br_00481:
        mov     dx, 645h
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     ah, 9
        int     21h
        mov     ah, 4ch
        int     21h
br_00491:
        mov     ax, 0
        mov     es, ax
        mov     ax, cs
        mov     ds, ax
        mov     si, 0
        mov     di, 0
        mov     cx, 8000h
        rep movsw
        mov     ax, 1000h
        mov     es, ax
        mov     ax, cs
        add     ax, 1000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        mov     ax, 2000h
        mov     es, ax
        mov     ax, cs
        add     ax, 2000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        mov     ax, 3000h
        mov     es, ax
        mov     ax, cs
        add     ax, 3000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        mov     ax, 4000h
        mov     es, ax
        mov     ax, cs
        add     ax, 4000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        mov     ax, 5000h
        mov     es, ax
        mov     ax, cs
        add     ax, 5000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        mov     ax, 6000h
        mov     es, ax
        mov     ax, cs
        add     ax, 6000h
        mov     ds, ax
        mov     cx, 8000h
        mov     si, 0
        mov     di, 0
        rep movsw
        mov     ax, 7000h
        mov     es, ax
        mov     ax, cs
        add     ax, 7000h
        mov     ds, ax
        mov     cx, 4000h
        mov     si, 0
        mov     di, 0
        rep movsw
        cli
        cld
        mov     di, bp
        mov     bx, cs
        if      FW_VERSION >= 120
        db      0eah, 81h, 05h, 00h, 00h
        else
        db      0eah, 83h, 05h, 00h, 00h
        endif
br_00551:
        cli
        cld
        mov     di, bp
        mov     bp, resume_0055B
        retxa   2Ch
resume_0055B:
        mov     dx, 0ff00h
        mov     ax, 0
        mov     cx, 20h
tgt_00564:
        out     dx, ax
        inc     ax
        add     dx, 2
        loop    tgt_00564
        if      FW_VERSION >= 114
        XL2K_PAGE_MAP
        else
        mov     ax, 40h
        endif
        mov     cx, 20h
tgt_00571:
        out     dx, ax
        inc     ax
        add     dx, 2
        loop    tgt_00571
        mov     bp, resume_0057E
        brkxa   2Bh
resume_0057E:
        mov     bx, 0
        mov     ax, RAM_SEG
boot_set_segs:
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        mov     ax, 0a7ch
        mov     sp, ax
        push    di
        call    fn_016CD
        mov     dx, 0fffeh
        mov     al, 10h
        out     dx, al
        mov     dx, 0fff1h
        mov     al, 0
        out     dx, al
        mov     dx, 0fffdh
        mov     al, 0fh
        out     dx, al
        mov     dx, 0fff2h
        mov     al, 90h
        out     dx, al
        mov     dx, 0ffeah
        mov     al, 0
        out     dx, al
        mov     dx, 0ffedh
        mov     al, 0
        out     dx, al
        mov     dx, 0fff3h
        mov     al, 75h
        out     dx, al
        mov     dx, 0ffech
        mov     al, 1
        out     dx, al
        mov     dx, 0ffebh
        mov     al, 11h
        out     dx, al
        mov     dx, 0fff4h
        mov     al, 11h
        out     dx, al
        mov     dx, 0fff5h
        mov     al, 31h
        out     dx, al
        mov     dx, 0fff6h
        mov     al, 11h
        out     dx, al
        mov     dx, 0fffch
        mov     al, 0c0h
        out     dx, al
        mov     dx, 0fff8h
        mov     al, 0
        out     dx, al
        mov     dx, 0fff9h
        mov     al, 10h
        out     dx, al
        mov     dx, 0fffah
        mov     al, 20h
        out     dx, al
        mov     dx, 0fffbh
        mov     al, 30h
        out     dx, al
        mov     dx, 0fff0h
        mov     al, 3
        out     dx, al
        mov     dx, 0c016h
        mov     al, 30h
        out     dx, al
        mov     dx, 0c010h
        mov     al, 0ffh
        out     dx, al
        mov     dx, 0c010h
        mov     al, 0ffh
        out     dx, al
        mov     dx, 0c016h
        mov     al, 78h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 3
        out     dx, al
        mov     dx, 0c004h
        mov     al, 4fh
        out     dx, al
        mov     dx, 0c002h
        mov     al, 35h
        out     dx, al
        mov     dx, 0c006h
        mov     al, 2
        out     dx, al
        mov     al, 8
        mov     dx, 0ffe9h
        mov     al, al
        out     dx, al
        mov     dx, 0c020h
        mov     al, 13h
        out     dx, al
        mov     dx, 0c022h
        mov     al, 20h
        out     dx, al
        mov     dx, 0c022h
        mov     al, 3
        out     dx, al
        mov     dx, 0c022h
        db      0b0h                    ; mov al, imm8
        if      FW_VERSION >= 114
        XL2K_OCW1
        else
        db      06h
        endif
        out     dx, al
        mov     dx, 0c020h
        mov     al, 2bh
        out     dx, al
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        if      FW_VERSION >= 120
        mov     al, 1
        else
        mov     al, 0
        endif
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 0
        out     dx, al
        mov     dx, 182h
        mov     al, 40h
        out     dx, al
        mov     dx, 186h
        mov     al, 0d7h
        out     dx, al
        mov     dx, 184h
        mov     al, 1
        out     dx, al
        mov     dx, 182h
        mov     al, 4fh
        out     dx, al
        mov     dx, 182h
        mov     al, 15h
        out     dx, al
        mov     dx, 1a2h
        mov     al, 0
        out     dx, al
        mov     dx, 1a2h
        mov     al, 0
        out     dx, al
        mov     dx, 1a2h
        mov     al, 0
        out     dx, al
        mov     dx, 1a2h
        mov     al, 40h
        out     dx, al
        mov     dx, 1a6h
        mov     al, 0d7h
        out     dx, al
        mov     dx, 1a4h
        mov     al, 1
        out     dx, al
        mov     dx, 1a2h
        mov     al, 4fh
        out     dx, al
        mov     dx, 1a2h
        mov     al, 15h
        out     dx, al
        mov     al, 2
        out     0c0h, al
        if      FW_VERSION >= 114
        mov     word ptr [269ah], midirx_0279A
        mov     word ptr [2e26h], fn_03071
        elseif  FW_VERSION >= 110
        mov     word ptr [267eh], loop_0279A
        mov     word ptr [2e0ah], fn_03071
        else
        mov     word ptr [2660h], loop_0279A
        mov     word ptr [2dech], fn_03071
        endif
        sti
        callf   APP3_SEG:(APP3_BASE+APP3_HEAD-APP3_SEG*16)
        mov     word ptr [54h], ax
        mov     word ptr [56h], bx
        mov     word ptr [58h], cx
        callf   EP_GOTO_MAIN_SCREEN_SEG:EP_GOTO_MAIN_SCREEN_OFF
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        call    fn_007B3
        int     0b4h
        int     0f8h
        mov     dx, 120h
        mov     al, byte ptr [78h]
        out     dx, al
        mov     al, 9
        call    xl_device_select
        mov     bl, 1
        int     91h
        if      FW_VERSION >= 120
        mov     cx, 3e8h
        call    xl_ms_wait
        endif
        call    fn_00E9F
        pop     ax
        mov     ah, byte ptr [61h]
        callf   APP2_SEG:(APP2_BASE+xl_boot_device_select-APP2_SEG*16)
        int     29h
isr_00724:
        cli
        cld
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        mov     ax, 0a7ch
        mov     sp, ax
        mov     word ptr [5eh], sp
        push    dx
        mov     dx, 0c000h
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 180h
        in      al, dx
        pop     dx
        push    dx
        mov     dx, 1a0h
        in      al, dx
        pop     dx
        mov     dx, 180h
        mov     al, 0
        out     dx, al
        mov     dx, 1a0h
        mov     al, 0
        out     dx, al
        sti
        DISP_PLANE0
        mov     al, byte ptr [84h]
        mov     ah, byte ptr [85h]
        callf   EP_X_1D595_SEG:EP_X_1D595_OFF
main_restart:                           ; app1's isr_0F664 rejoins here
        mov     byte ptr [62h], 1
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        mov     es, word ptr [5ah]
        sub     di, di
        sub     ax, ax
        mov     cx, 2000h
        rep stosw
        int     0fah
loop_0077F:
        call    fn_03EC9
        call    fn_041DB
        if      FW_VERSION >= 114
        XL2K_MAIN_LOOP
        else
        call    fn_04328
        endif
        call    fn_0430B
        call    fn_043C0
        call    fn_04399
        call    fn_007A2
        call    fn_007AC
        call    fn_007B3
        call    fn_007CB
xs_app1_call:
        if      APP1_FAR = 0
        call    APP1_BASE+fn_0F4B1      ; near while app1 is in segment 0
        else
        callf   APP1_SEG:(APP1_BASE+fn_0F4B1_far-APP1_SEG*16)
        endif
xs_app1_call_end:
        jmp     loop_0077F
fn_007A2:
        mov     ax, word ptr [A0_W_MS_TICKS]
        mov     bx, P_310C
        call    fn_03F76
        ret
        ifdef   GROWTH_PROOF
        db      GROWTH_PROOF dup (90h)
        endif
fn_007AC:
        mov     bx, A0_W_031A2
        call    fn_03F76
        ret
fn_007B3:
        mov     al, 0
        xchg    al, byte ptr [A0_B_REDRAW_REQ]
        cmp     al, 0
        jne     br_007BE
        ret
br_007BE:
        call    fn_0113B
        mov     bx, P_3106
        call    fn_03F76
        DISP_FLUSH
        db      0c3h
fn_007CB:
        mov     al, 0
        xchg    al, byte ptr [64h]
        cmp     al, 0
        jne     isr_007D6
        ret
isr_007D6:
        call    fn_0113B
        mov     bx, A0_W_03124
        call    fn_03F76
        DISP_FLUSH
        db      0c3h
isr_007E3:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, P_3130
        call    fn_03F5C
        pop     ds
        iret
isr_007F1:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, P_312A
        call    fn_03F5C
        pop     ds
        iret
isr_007FF:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, 78h
        mov     bl, byte ptr [A0_B_001B7]
        mov     bh, 0
        mov     word ptr [bx+0b6h], ax
        add     byte ptr [A0_B_001B7], 2
        pop     ds
        iret
isr_00819:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        sub     dx, dx
        sub     cx, cx
        mov     ax, word ptr [1ch]
        sub     ax, 7bch
        shl     al, 1
        mov     dl, byte ptr [1eh]
        shl     dx, 5
        or      dh, al
        or      dl, byte ptr [1fh]
        mov     ch, byte ptr [20h]
        shl     ch, 3
        mov     cl, 0
        mov     al, byte ptr [21h]
        mov     ah, 0
        shl     ax, 5
        or      cx, ax
        pop     ds
        iret
xl_os_timer_isr:
        pusha
        push    es
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        push    dx
        mov     dx, 0c022h
        in      al, dx
        pop     dx
        or      al, 20h
        mov     dx, 0c022h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 0ffh
        out     dx, al
        mov     dx, 0c012h
        mov     al, 0ffh
        out     dx, al
        sti
        call    fn_008FB
        call    xl_tcu_read_time_base
        cmp     byte ptr [62h], 0
        je      isr_00887
        call    fn_05046
        call    fn_0269F
        call    fn_02F74
        call    fn_009F7
isr_00887:
        cmp     byte ptr [67h], 0
        je      isr_0089D
        mov     ax, word ptr [A0_W_MS_TICKS]
        mov     bh, 0
        mov     ch, 0
        sub     dx, dx
        mov     bl, 1
        push    ds
        int     35h
        pop     ds
isr_0089D:
        mov     dx, 0c012h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 3
        out     dx, al
        push    dx
        mov     dx, 0c022h
        in      al, dx
        pop     dx
        and     al, 0dfh
        mov     dx, 0c022h
        out     dx, al
        pop     ds
        pop     es
        popa
        iret
xl_tcu_read_time_base:
        cli
        mov     dx, 0c016h
        mov     al, 0
        out     dx, al
        push    dx
        mov     dx, 0c010h
        in      al, dx
        pop     dx
        mov     ah, al
        push    dx
        mov     dx, 0c010h
        in      al, dx
        pop     dx
        sti
        xchg    ah, al
        mov     bx, ax
        xchg    ax, word ptr [0b86h]
        sub     ax, bx
        add     word ptr [0b88h], ax
        mov     ax, 0
loop_008E0:
        cmp     word ptr [0b88h], 3e8h
        jb      br_008FA
        inc     ax
        push    ax
        if      FW_VERSION < 110
        call    fn_03745
        endif
        call    fn_081A0
        inc     word ptr [A0_W_MS_TICKS]
        sub     word ptr [0b88h], 3e8h
        pop     ax
        jmp     loop_008E0
br_008FA:
        ret
fn_008FB:
        sub     ax, ax
        cmp     ax, word ptr [A0_W_00B96]
        je      br_00907
        dec     word ptr [A0_W_00B96]
br_00907:
        cmp     ax, word ptr [0b98h]
        je      br_00911
        dec     word ptr [0b98h]
br_00911:
        cmp     ax, word ptr [0b94h]
        je      br_0091B
        dec     word ptr [0b94h]
br_0091B:
        cmp     ax, word ptr [A0_W_00B90]
        je      br_00925
        dec     word ptr [A0_W_00B90]
br_00925:
        cmp     ax, word ptr [A0_W_00B92]
        je      br_0092F
        dec     word ptr [A0_W_00B92]
br_0092F:
        cmp     al, byte ptr [0b9ah]
        je      br_00939
        dec     byte ptr [0b9ah]
br_00939:
        cmp     al, byte ptr [0b9bh]
        je      br_00943
        dec     byte ptr [0b9bh]
br_00943:
        cmp     ax, word ptr [0b8ch]
        je      br_0094D
        dec     word ptr [0b8ch]
br_0094D:
        inc     word ptr [0b8eh]
        cmp     word ptr [0b8eh], 0c8h
        jb      br_00968
        mov     word ptr [0b8eh], 0
        mov     byte ptr [68h], 1
        inc     byte ptr [69h]
br_00968:
        ret
isr_00969:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, 0
        xchg    al, byte ptr [68h]
        cmp     al, 0
        je      isr_0097A
        stc
isr_0097A:
        mov     al, byte ptr [69h]
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
isr_00989:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [0b8eh], 0
        mov     byte ptr [68h], 0
        mov     byte ptr [69h], 0
        pop     ds
        iret
isr_009A1:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     al, 2
        je      isr_009B0
        mov     byte ptr [6ch], al
        pop     ds
        iret
isr_009B0:
        mov     al, byte ptr [6ch]
        pop     ds
        iret
isr_009B5:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     al, 2
        je      isr_009CE
        mov     byte ptr [A0_B_0437B], al
        cmp     al, 0
        je      isr_009CC
        mov     word ptr [A0_W_SEQ_SEGMENT], 8000h
isr_009CC:
        pop     ds
        iret
isr_009CE:
        mov     al, byte ptr [A0_B_0437B]
        mov     bl, al
        les     si, [50h]
        or      ax, word ptr es:[si+0abh]
        pop     ds
        iret
isr_009DE:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [A0_B_0437A], al
        pop     ds
        iret
isr_009E9:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [62h], al
        mov     byte ptr [67h], al
        pop     ds
        iret
fn_009F7:
        mov     bx, word ptr [2ceh]
        cmp     bx, word ptr [A0_W_002CC]
        jne     br_00A02
        ret
br_00A02:
        mov     ax, word ptr [bx+1cch]
        mov     cx, word ptr [bx+1ceh]
        mov     dl, ch
        mov     dh, ah
        shr     dh, 6
        add     byte ptr [2ceh], 4
        cmp     al, 23h
        jae     br_00A1B
        ret
br_00A1B:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     di, word ptr [A0_W_CUR_TRACK]
        mov     bh, ah
        mov     bl, 0
        mov     ah, byte ptr es:[di+5c0h]
        mov     ch, byte ptr es:[di+580h]
        cmp     byte ptr [65h], 0
        je      br_00A39
        ret
br_00A39:
        cmp     byte ptr [A0_B_PLAY_STATE], 2
        jne     br_00A53
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        je      br_00A53
        pusha
        push    es
        mov     bx, 0aeh
        int     0a9h
        pop     es
        popa
        jae     br_00A53
        ret
br_00A53:
        cmp     cl, 0
        je      br_00A85
        push    bx
        mov     bl, al
        and     bx, 7fh
        shl     bx, 2
        add     bx, 2d4h
        mov     si, bx
        pop     bx
        cmp     byte ptr [6ah], 0
        je      br_00A76
        cmp     ah, 0
        jne     br_00A76
        mov     ah, 1
br_00A76:
        mov     byte ptr [si], ah
        mov     byte ptr [si+1], ch
        mov     byte ptr [si+3], bh
        or      ah, 90h
        call    fn_06CF0
        ret
br_00A85:
        push    bx
        mov     bl, al
        and     bx, 7fh
        shl     bx, 2
        add     bx, 2d4h
        mov     cx, word ptr [bx]
        mov     word ptr [bx], 0
        mov     ah, cl
        mov     cl, 0
        pop     bx
        or      ah, 90h
        call    fn_06CF0
        ret
fn_00AA4:
        mov     al, 0
        mov     si, 2d4h
loop_00AA9:
        mov     cx, word ptr [si]
        mov     bx, word ptr [si+2]
        cmp     cx, 0
        je      br_00AC9
        mov     word ptr [si], 0
        pusha
        mov     ah, cl
        mov     cl, 0
        mov     dh, 0
        mov     dl, 40h
        mov     bl, 0
        or      ah, 90h
        call    fn_06CF0
        popa
br_00AC9:
        add     si, 4
        inc     al
        cmp     al, 80h
        jne     loop_00AA9
        ret
isr_00AD3:
        push    ds
        push    bp
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [1b9h], 1
        pop     bp
        pop     ds
        iret
isr_00AE2:
        push    ds
        push    bp
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [84h], al
        mov     byte ptr [85h], ah
        pop     bp
        pop     ds
        iret
isr_00AF3:
        push    ds
        push    bp
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, byte ptr [84h]
        mov     ah, byte ptr [85h]
        pop     bp
        pop     ds
        iret
isr_00B04:
        pusha
        push    ds
        push    es
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_00B62
        call    fn_00B22
        call    fn_00B42
        call    fn_00B62
        call    fn_00B22
        call    fn_00B42
        pop     es
        pop     ds
        popa
        iret
fn_00B22:
        push    dx
        mov     dx, 182h
        in      al, dx
        pop     dx
        test    al, 2
        jne     br_00B2D
        ret
br_00B2D:
        push    dx
        mov     dx, 180h
        in      al, dx
        pop     dx
        mov     bx, word ptr [A0_W_022FA]
        mov     byte ptr [bx+A0_B_021FA], al
        inc     bl
        mov     word ptr [A0_W_022FA], bx
        ret
fn_00B42:
        push    dx
        mov     dx, 1a2h
        in      al, dx
        pop     dx
        test    al, 2
        jne     br_00B4D
        ret
br_00B4D:
        push    dx
        mov     dx, 1a0h
        in      al, dx
        pop     dx
        mov     bx, word ptr [A0_W_02ACE]
        mov     byte ptr [bx+A0_B_029CE], al
        inc     bl
        mov     word ptr [A0_W_02ACE], bx
        ret
fn_00B62:
        push    dx
        mov     dx, 0c002h
        in      al, dx
        pop     dx
        test    al, 2
        jne     br_00B6D
        ret
br_00B6D:
        push    dx
        mov     dx, 0c000h
        in      al, dx
        pop     dx
        test    al, 80h
        je      br_00B7B
        mov     byte ptr [A0_B_001B8], al
        ret
br_00B7B:
        if      FW_VERSION >= 114
        XL2K_TAG_CHAIN
        else
        mov     ah, byte ptr [A0_B_001B8]
        endif
        cmp     ah, 0ffh
        jne     br_00B87
        jmp     br_00D28
br_00B87:
        cmp     ah, 80h
        jne     br_00B8E
        jmp     br_00BC8
br_00B8E:
        cmp     ah, 81h
        jne     br_00B95
        jmp     br_00C0A
br_00B95:
        mov     cl, 0
        cmp     ah, 84h
        jne     br_00B9F
        jmp     br_00C4C
br_00B9F:
        mov     cl, 80h
        cmp     ah, 85h
        jne     br_00BA9
        jmp     br_00C4C
br_00BA9:
        cmp     ah, 86h
        jne     br_00BB1
        jmp     br_00C68
br_00BB1:
        cmp     ah, 0a0h
        jae     br_00BBF
        cmp     ah, 90h
        jb      L_00BBA
        jmp     pad_strike
L_00BBA:
        ret
br_00BBF:
        cmp     ah, 0b0h
        jae     br_00BC7
        jmp     br_00D14
br_00BC7:
        ret
br_00BC8:
        inc     word ptr [1c2h]
        sub     ah, ah
        cmp     ah, byte ptr [0b9ah]
        je      br_00BD5
        ret
br_00BD5:
        mov     bl, 64h
        mov     bh, bl
        xchg    bh, byte ptr [0b9bh]
        sub     bl, bh
        cmp     bl, 28h
        jae     br_00BFF
        mov     bx, word ptr [1beh]
        mov     ax, 8010h
        mul     bx
        shl     dx, 1
        mov     word ptr [1beh], dx
        sub     dx, 1000h
        shr     dx, 1
        inc     dx
        add     word ptr [1bch], dx
        ret
br_00BFF:
        add     word ptr [1bch], ax
        mov     word ptr [1beh], 1000h
        ret
br_00C0A:
        inc     word ptr [1c0h]
        sub     ah, ah
        cmp     ah, byte ptr [0b9bh]
        je      br_00C17
        ret
br_00C17:
        mov     bl, 64h
        mov     bh, bl
        xchg    bh, byte ptr [0b9ah]
        sub     bl, bh
        cmp     bl, 28h
        jae     br_00C41
        mov     bx, word ptr [1beh]
        mov     ax, 8010h
        mul     bx
        shl     dx, 1
        mov     word ptr [1beh], dx
        sub     dx, 1000h
        shr     dx, 1
        inc     dx
        add     word ptr [1bah], dx
        ret
br_00C41:
        add     word ptr [1bah], ax
        mov     word ptr [1beh], 1000h
        ret
br_00C4C:
        mov     bl, al
        mov     bh, 0
        shl     bx, 1
        mov     ax, word ptr [bx+0a7eh]
        or      ah, cl
        mov     bl, byte ptr [A0_B_001B7]
        mov     bh, 0
        mov     word ptr [bx+0b6h], ax
        add     byte ptr [A0_B_001B7], 2
        ret
br_00C68:
        cmp     al, byte ptr [1c9h]
        jne     br_00C6F
        ret
br_00C6F:
        mov     byte ptr [1c9h], al
        mov     byte ptr [1c8h], al
        ret
pad_strike:
        and     ah, 0fh
        mov     bl, ah
        mov     cl, 76h
        cmp     al, cl
        jb      br_00C83
        mov     al, cl
br_00C83:
        mov     ah, 7fh
        mul     ah
        div     cl
        cmp     al, 0
        je      pad_release_event
        or      al, byte ptr [A0_B_FULL_LEVEL]
        mov     cl, al
        mov     ch, 0
        mov     bh, 0
        mov     byte ptr [bx+4deh], al
        or      bl, byte ptr [4d5h]
        call    fn_00D38
        mov     al, byte ptr es:[bx+si]
        mov     ah, bl
        and     bl, 0fh
        call    levels16_transform
        mov     byte ptr [bx+4eeh], al
        mov     byte ptr [bx+4feh], ah
        mov     byte ptr [bx+50eh], dh
        mov     byte ptr [bx+51eh], dl
        mov     byte ptr [bx+52eh], cl
        cmp     byte ptr [6ch], 0
        je      pad_event_post
        cmp     byte ptr [A0_B_PLAY_STATE], 2
        jne     pad_event_post
        ret
pad_release_event:
        mov     cl, 0
        mov     ch, 0
        mov     bh, 0
        mov     byte ptr [bx+A0_TBL_004DE], al
        mov     al, byte ptr [bx+4eeh]
        mov     ah, byte ptr [bx+4feh]
resume_00CE2:
        mov     byte ptr [bx+4eeh], 0
        mov     byte ptr [bx+4feh], 0
        cmp     byte ptr [6ch], 0
        je      pad_event_post
        cmp     byte ptr [A0_B_PLAY_STATE], 2
        jne     pad_event_post
        ret
pad_event_post:
        mov     bx, word ptr [A0_W_002CC]
        shl     dh, 6
resume_00D02:
        or      ah, dh
        mov     ch, dl
        mov     word ptr [bx+1cch], ax
        mov     word ptr [bx+1ceh], cx
        add     byte ptr [A0_W_002CC], 4
        ret
br_00D14:
        and     ah, 0fh
        mov     bl, ah
        mov     bh, 0
        cmp     al, 0
        je      br_00D23
        or      al, byte ptr [A0_B_FULL_LEVEL]
br_00D23:
        mov     byte ptr [bx+A0_TBL_004DE], al
        ret
br_00D28:
        mov     si, word ptr [A0_W_00643]
        cmp     byte ptr [si], 0
        je      br_00D37
        mov     byte ptr [si], al
        inc     word ptr [A0_W_00643]
br_00D37:
        ret
fn_00D38:
        push    ax
        les     si, [50h]
        mov     si, word ptr es:[si+2]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     al, byte ptr es:[si+5c0h]
        sub     al, 1
        jae     br_00D50
        mov     al, 0
br_00D50:
        mov     ah, 0
        shl     ax, 2
        add     ax, 180h
        mov     si, ax
        mov     ax, word ptr cs:[si]
        mov     es, word ptr cs:[si+2]
        mov     si, ax
        pop     ax
        ret
levels16_transform:
        cmp     byte ptr [A0_B_16_LEVELS_V11X], 0
        je      br_00DB9
        cmp     word ptr [P_3106], L_04A6F
        je      br_00DB9
        and     bx, 0fh
        mov     al, byte ptr [A0_B_004D7]
        mov     ah, byte ptr [4d8h]
        cmp     byte ptr [A0_B_004D9], 0
resume_00D83:
        jne     br_00D8E
        mov     cl, byte ptr [bx+0b65h]
        mov     dh, 0
        mov     dl, 40h
        ret
br_00D8E:
        mov     dh, byte ptr [4dah]
        mov     si, 0b55h
        cmp     dh, 1
        jae     br_00DB6
        cmp     dh, 2
        jae     br_00DB6
        mov     si, 0b75h
        cmp     dh, 3
        je      br_00DB6
        mov     si, 0b3ch
        push    bx
        mov     bl, 9
        sub     bl, byte ptr [A0_B_004DB]
        mov     bh, 0
        add     si, bx
        pop     bx
br_00DB6:
        mov     dl, byte ptr [bx+si]
resume_00DB8:
        ret
br_00DB9:
        push    ax
        push    bx
        push    cx
        call    fn_06A24
        pop     cx
        pop     bx
        pop     ax
        ret
isr_00DC3:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [50h], si
        mov     word ptr [52h], dx
        pop     ds
        iret
isr_00DD3:
        pusha
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bl, byte ptr [0ea2h]
        cmp     bl, byte ptr [0ea3h]
        je      isr_00E06
        mov     bh, 0
        mov     dx, 180h
        mov     al, byte ptr [bx+0da2h]
        out     dx, al
        inc     bl
        inc     byte ptr [0ea2h]
        cmp     bl, byte ptr [0ea3h]
        jne     isr_00E26
        mov     bx, word ptr [0d9ch]
        cmp     bx, word ptr [0d9eh]
        je      isr_00E1C
        jmp     isr_00E26
isr_00E06:
        mov     bx, word ptr [0d9ch]
        mov     dx, 180h
        mov     al, byte ptr [bx+0b9ch]
        out     dx, al
        inc     bx
        and     bh, 1
        cmp     bx, word ptr [0d9eh]
        jne     L_00E22
isr_00E1C:
        mov     dx, 186h
        mov     al, 0d7h
        out     dx, al
L_00E22:
        mov     word ptr [0d9ch], bx
isr_00E26:
        pop     ds
        popa
        iret
isr_00E29:
        pusha
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bl, byte ptr [11ach]
        cmp     bl, byte ptr [11adh]
        je      isr_00E5C
        mov     bh, 0
        mov     dx, 1a0h
        mov     al, byte ptr [bx+10ach]
        out     dx, al
        inc     bl
        inc     byte ptr [11ach]
        cmp     bl, byte ptr [11adh]
        jne     isr_00E7C
        mov     bx, word ptr [10a6h]
        cmp     bx, word ptr [10a8h]
        je      isr_00E72
        jmp     isr_00E7C
isr_00E5C:
        mov     bx, word ptr [10a6h]
        mov     dx, 1a0h
        mov     al, byte ptr [bx+0ea6h]
        out     dx, al
        inc     bx
        and     bh, 1
        cmp     bx, word ptr [10a8h]
        jne     isr_00E78
isr_00E72:
        mov     dx, 1a6h
        mov     al, 0d7h
        out     dx, al
isr_00E78:
        mov     word ptr [10a6h], bx
isr_00E7C:
        pop     ds
        popa
        iret
isr_00E7F:
        push    dx
        mov     ah, 0
        shl     ax, 2
        shl     ax, 1
        mov     dx, ax
        add     dx, 0ff00h
        mov     bp, resume_00E93
        retxa   2Ch
resume_00E93:
        in      ax, dx
        mov     bp, resume_00E9A
        brkxa   2Bh
resume_00E9A:
        shr     ax, 2
        pop     dx
        iret
fn_00E9F:
        mov     dx, 182h
        mov     al, 17h
        out     dx, al
        mov     byte ptr [61h], 1
xs_ata_call:
        if      ATA_FAR = 0
        call    ATA_BASE+xl_ata_probe   ; near while ata is in segment 0
        else
        callf   ATA_SEG:(ATA_BASE+ata_probe_far-ATA_SEG*16)
        endif
xs_ata_call_end:
        jb      br_00EB0
        ret
br_00EB0:
        mov     dx, 182h
        mov     al, 15h
        out     dx, al
        mov     byte ptr [61h], 0
        ret
isr_00EBC:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_00ED2
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_00ED2:
        cmp     ah, 0
        jne     br_00ED9
        jmp     xl_device_select
br_00ED9:
        cmp     ah, 1
        jne     br_00EE0
        jmp     loop_00F55
br_00EE0:
        ret
xl_device_select:
        cmp     al, 0ah
        if      FW_VERSION >= 110
        jb      br_00EE7
        else
        jb      L_00EE6
        endif
        mov     al, 0
        if      FW_VERSION < 110
L_00EE6:
        mov     byte ptr [11b0h], al
        endif
br_00EE7:
        if      FW_VERSION >= 110
        mov     byte ptr [11b0h], al
        endif
        mov     bl, al
        mov     bh, 0
        shl     bx, 1
        mov     bp, word ptr cs:[bx+xl_device_slot_vectors]
        mov     word ptr cs:[244h], bp
xs_app1_vec2:
        if      APP1_FAR = 0
        mov     word ptr cs:[246h], cs  ; app1 is in segment 0 with app0
        else
        mov     word ptr cs:[246h], APP1_SEG
        endif
xs_app1_vec2_end:
        cmp     al, 9
        je      br_00F3E
        sub     al, 1
        jb      br_00F19
        push    ax
        int     0cbh
        mov     bp, isr_0A044
        mov     word ptr cs:[24ch], bp
        mov     word ptr cs:[24eh], cs
        pop     ax
        ret
br_00F19:
        int     0cah
        cmp     byte ptr [61h], 0
        jne     br_00F23
        ret
br_00F23:
        mov     bp, APP1_BASE+isr_0BDBE-APP1_SEG*16
        mov     word ptr cs:[244h], bp
xs_app1_vec:
        if      APP1_FAR = 0
        mov     word ptr cs:[246h], cs  ; app1 is in segment 0 with app0
        else
        mov     word ptr cs:[246h], APP1_SEG
        endif
xs_app1_vec_end:
        mov     bp, ATA_BASE+isr_0F698-ATA_SEG*16
        mov     word ptr cs:[24ch], bp
xs_ata_vec:
        if      ATA_FAR = 0
        mov     word ptr cs:[24eh], cs  ; ata is in segment 0 with app0
        else
        mov     word ptr cs:[24eh], ATA_SEG
        endif
xs_ata_vec_end:
        ret
br_00F3E:
        int     0c9h
        ret
xl_device_slot_vectors:                 ; INT 91h per device slot: floppy, SCSI 1-8, ATA (APP1_SEG)
        dw      APP1_BASE+xl_floppy_service-APP1_SEG*16
        rept    8
        dw      APP1_BASE+isr_0BDBE-APP1_SEG*16
        endm
        dw      APP1_BASE+isr_0E31A-APP1_SEG*16
loop_00F55:
        cmp     byte ptr [11b0h], 9
        jne     br_00F5E
        jmp     br_00F8C
br_00F5E:
        cmp     byte ptr [11b0h], 0
        jne     br_00F6C
        cmp     byte ptr [61h], 0
        je      br_00F8C
br_00F6C:
        mov     bl, 0
        int     93h
        jae     br_00F73
        ret
br_00F73:
        mov     bl, 9
        int     93h
        jae     br_00F9E
        mov     al, byte ptr [11b0h]
        dec     al
        mov     bl, 1
        int     93h
        mov     bl, 8
        int     93h
        mov     bl, 8
        int     93h
        jb      br_00FAC
br_00F8C:
        mov     bl, 1
        int     91h
        jb      br_00FAC
        mov     bl, byte ptr [11b0h]
        pusha
        push    es
        int     0a5h
        pop     es
        popa
        clc
        ret
br_00F9E:
        mov     al, 10h
loop_00FA0:
        mov     bl, byte ptr [11b0h]
        pusha
        push    es
        int     0a5h
        pop     es
        popa
        stc
        ret
br_00FAC:
        cmp     al, 1dh
        jne     br_00FB2
        jmp     loop_00F55
br_00FB2:
        if      FW_VERSION >= 110
        cmp     al, 35h
        je      br_00FBA
        endif
        cmp     al, 4
        jne     loop_00FA0
        if      FW_VERSION >= 110
br_00FBA:
        endif
        mov     ah, 1
        mov     al, 5
        mov     bl, byte ptr [11b0h]
        sub     cx, cx
        sub     dx, dx
        sub     di, di
        push    ds
        pop     es
        mov     si, 0
        pusha
        push    es
        int     0a5h
        pop     es
        popa
        ret
isr_00FD4:
        push    ds
        push    bp
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [11afh], 1
        pop     bp
        pop     ds
        iret
isr_00FE3:
        push    ds
        push    bp
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     al, 0
        jne     isr_00FF3
        mov     byte ptr [11afh], 0
isr_00FF3:
        mov     al, byte ptr [11afh]
        pop     bp
        pop     ds
        iret
isr_00FF9:
        sti
        push    ds
        push    es
        push    si
        push    bx
        mov     bx, RAM_SEG
        mov     ds, bx
        call    fn_00D38
        mov     bl, ah
        mov     bh, 0
        mov     al, byte ptr es:[bx+si]
        pop     bx
        pop     si
        pop     es
        pop     ds
        iret
isr_01012:
        sti
        push    ds
        push    es
        push    si
        push    bx
        mov     bx, RAM_SEG
        mov     ds, bx
        call    fn_00D38
        mov     bx, 0
isr_01022:
        cmp     al, byte ptr es:[bx+si]
        je      isr_0102E
        inc     bl
        cmp     bl, 40h
        jne     isr_01022
isr_0102E:
        mov     ah, bl
        pop     bx
        pop     si
        pop     es
        pop     ds
        iret
isr_01035:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bl, al
        mov     bh, 0
        mov     al, byte ptr [bx+A0_TBL_004DE]
        mov     bl, byte ptr [1c8h]
        pop     ds
        iret
isr_01049:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     al, 0
        je      isr_01058
        push    ax
        call    fn_00AA4
        pop     ax
isr_01058:
        mov     byte ptr [65h], al
        pop     ds
        iret
isr_0105D:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [66h], al
        pop     ds
        iret
isr_01068:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        les     si, [50h]
        mov     si, word ptr es:[si+2]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     al, byte ptr es:[si+5c0h]
        sub     al, 1
        jae     isr_01085
        mov     al, 0
isr_01085:
        mov     ah, 0
        shl     ax, 2
        add     ax, 170h
        mov     si, ax
        mov     ax, word ptr cs:[si]
        mov     es, word ptr cs:[si+2]
        mov     si, ax
        pop     ds
        iret
isr_0109A:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        xor     byte ptr [A0_B_AFTER_ON], 1
        mov     al, byte ptr [A0_B_AFTER_ON]
        mov     ah, al
        xor     ah, 1
        and     byte ptr [A0_B_16_LEVELS], ah
        pop     ds
        iret
isr_010B3:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     al, 2
        je      isr_010DD
        mov     byte ptr [A0_B_16_LEVELS_V11X], al
        cmp     al, 0
        je      isr_010DD
        mov     byte ptr [A0_B_AFTER_ON], 0
        mov     byte ptr [A0_B_004D7], bl
        mov     byte ptr [4d8h], bh
        mov     byte ptr [A0_B_004D9], cl
        mov     byte ptr [4dah], ch
        mov     byte ptr [A0_B_004DB], dl
isr_010DD:
        mov     al, byte ptr [A0_B_16_LEVELS_V11X]
        pop     ds
        iret
isr_010E2:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        xor     byte ptr [A0_B_FULL_LEVEL], 7fh
        mov     al, byte ptr [A0_B_FULL_LEVEL]
        pop     ds
        iret
isr_010F2:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, byte ptr [A0_B_PAD_BANK]
        pop     ds
        iret
isr_010FD:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_01108
        pop     ds
        iret
fn_01108:
        cmp     al, 0
        je      br_01119
        cmp     al, 1
        je      br_0111D
        cmp     al, 2
        je      br_0112D
        cmp     al, 3
        je      br_01135
        ret
br_01119:
        mov     al, byte ptr [A0_B_0437C]
        ret
br_0111D:
        xor     byte ptr [A0_B_0437C], 1
        mov     al, byte ptr [A0_B_0437C]
        cmp     al, 0
        jne     br_0112A
        ret
br_0112A:
        int     0fbh
        ret
br_0112D:
        mov     byte ptr [A0_B_0437C], 1
        int     0fbh
        ret
br_01135:
        mov     byte ptr [A0_B_0437C], 0
        ret
fn_0113B:
        call    fn_011F6
        mov     al, byte ptr [A0_B_REC_ACTIVE]
        and     al, byte ptr [A0_B_REC_REPLACE_V11X]
        mov     dx, 142h
        cmp     al, 0
        jne     br_0114F
        or      dl, 10h
br_0114F:
        out     dx, al
        mov     al, byte ptr [A0_B_REC_ACTIVE]
        cmp     byte ptr [A0_B_0436E], 1
        jne     br_0115C
        mov     al, 1
br_0115C:
        mov     ah, byte ptr [A0_B_REC_REPLACE_V11X]
        xor     ah, 1
        and     al, ah
        mov     dx, 148h
        cmp     al, 0
        jne     br_0116F
        or      dl, 10h
br_0116F:
        out     dx, al
        mov     al, byte ptr [A0_B_FULL_LEVEL]
        cmp     word ptr [P_313C], L_04BB6
        jne     br_01186
        mov     bx, cs
        cmp     bx, word ptr [P_313E]
        jne     br_01186
        mov     al, byte ptr [P_37A8]
br_01186:
        if      FW_VERSION >= 114
        XL2K_LED_A
        else
        mov     dx, 160h
        endif
        cmp     al, 0
        if      FW_VERSION >= 120
        jne     br_01190
        or      dl, 10h
br_01190:
        out     dx, al
        mov     al, byte ptr [A0_B_16_LEVELS]
        XL2K_LED_B
        cmp     al, 0
        endif
        jne     br_0119E
        or      dl, 10h
br_0119E:
        if      FW_VERSION < 120
        out     dx, al
        mov     al, byte ptr [A0_B_16_LEVELS]
        mov     dx, 16eh
        cmp     al, 0
        jne     L_0119A
        or      dl, 10h
L_0119A:
        endif
        out     dx, al
        mov     al, byte ptr [A0_B_PLAY_STATE]
        mov     dx, 146h
        cmp     al, 0
        jne     br_011AC
        or      dl, 10h
br_011AC:
        out     dx, al
        mov     al, byte ptr [A0_B_AFTER_ON]
        mov     dx, 140h
        cmp     al, 0
        jne     br_011BA
        or      dl, 10h
br_011BA:
        out     dx, al
        mov     al, 0
        cmp     byte ptr [A0_B_UNDO_SEQ_MARK], 5ah
        je      br_011C6
        mov     al, 1
br_011C6:
        mov     dx, 144h
        cmp     al, 0
        jne     br_011D0
        or      dl, 10h
br_011D0:
        out     dx, al
        mov     al, byte ptr [A0_B_0437A]
        mov     dx, 166h
        cmp     al, 0
        jne     br_011DE
        or      dl, 10h
br_011DE:
        out     dx, al
        mov     al, 0
        cmp     byte ptr [A0_B_0436E], 4
        jne     br_011EA
        mov     al, 1
br_011EA:
        mov     dx, 168h
        cmp     al, 0
        jne     L_011F0
        or      dl, 10h
L_011F0:
        out     dx, al
        ret
fn_011F6:
        mov     al, byte ptr [4d5h]
        cmp     al, 10h
        je      br_01216
        cmp     al, 20h
        je      br_01227
        cmp     al, 30h
        je      br_01238
        if      FW_VERSION >= 120
        XL2K_BANK_LEDS
        else
        mov     dx, 16ah
        out     dx, al
        mov     dx, 174h
        out     dx, al
        mov     dx, 17ch
        out     dx, al
        mov     dx, 172h
        out     dx, al
        ret
br_01216:
        mov     dx, 17ah
        out     dx, al
        mov     dx, 164h
        out     dx, al
        mov     dx, 17ch
        out     dx, al
        mov     dx, 172h
        out     dx, al
        ret
br_01227:
        mov     dx, 17ah
        out     dx, al
        mov     dx, 174h
        out     dx, al
        mov     dx, 16ch
        out     dx, al
        mov     dx, 172h
        out     dx, al
        ret
br_01238:
        mov     dx, 17ah
        out     dx, al
        mov     dx, 174h
        out     dx, al
        mov     dx, 17ch
        out     dx, al
        mov     dx, 162h
        out     dx, al
        ret
        endif
isr_01249:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        push    ax
        push    cx
        mov     dx, 0
        mov     es, dx
        les     si, cs:[0b4h]
        mov     dx, es
        mov     ah, 0bh
        cmp     al, 2
        jne     isr_01265
        mov     ah, 4
isr_01265:
        pop     cx
        mov     bl, 5
        int     90h
        pop     ax
        cmp     al, 1
        jne     isr_0127E
        mov     dx, ds
        mov     cl, 54h
        mov     ch, 14h
        mov     si, 10h
        mov     ah, 0ch
        mov     bl, 5
        int     90h
isr_0127E:
        pop     ds
        iret
isr_01280:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     dx, ds
        mov     cl, 3ch
        mov     ch, 27h
        mov     si, 22h
        mov     ah, 19h
        mov     bl, 5
        int     90h
        DISP_TEXT       6ch, 1eh, "Boot ROM:"
        cli
        mov     bp, resume_012AB
        retxa   2Ch
resume_012AB:
        mov     dx, 0fc00h
        mov     es, dx
        mov     si, word ptr es:[0a8h]
        add     dx, word ptr es:[0aah]
        add     si, 14h
        mov     cl, 0a2h
isr_012BF:
        mov     ch, 1eh
        mov     ah, 4
        mov     bl, 5
        int     90h
        mov     bp, resume_012CD
        brkxa   2Bh
resume_012CD:
        sti
        pop     ds
        iret
isr_012D0:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [A0_B_03758], cl
        mov     byte ptr [A0_B_03759], ch
        mov     byte ptr [A0_B_0375A], al
        dec     cl
        dec     ch
        mov     ah, 9
        mov     bl, 15h
        int     90h
        pop     ds
        iret
isr_012EE:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, P_3106
        call    fn_03F5C
        pop     ds
        iret
isr_012FC:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [64h], 1
        pop     ds
        iret
xl_panel_ring_buffer_isr_b9:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    xl_panel_ring_buffer_isr_b3
        pop     ds
        iret
xl_panel_ring_buffer_isr_b3:
        sub     ax, ax
        mov     bl, byte ptr [1b6h]
        cmp     bl, byte ptr [1b7h]
        jne     br_01321
        ret
br_01321:
        mov     bh, 0
        mov     ax, word ptr [bx+0b6h]
        add     byte ptr [1b6h], 2
        ret
isr_0132D:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_01338
        pop     ds
        iret
fn_01338:
        sub     ax, ax
        mov     bl, byte ptr [1b6h]
        cmp     bl, byte ptr [1b7h]
        jne     br_01345
        ret
br_01345:
        mov     bh, 0
        mov     ax, word ptr [bx+0b6h]
        add     byte ptr [1b6h], 2
        test    ah, 80h
        jne     br_01356
        ret
br_01356:
        call    xl_panel_event_dispatch
        sub     ax, ax
        ret
isr_0135C:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_01367
        pop     ds
        iret
fn_01367:
        sub     ax, ax
        mov     cx, ax
        xchg    ax, word ptr [1bah]
        xchg    cx, word ptr [1bch]
        ret
isr_01374:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, 0
        mov     cx, 0
        xchg    ax, word ptr [1c0h]
        xchg    cx, word ptr [1c2h]
        pop     ds
        iret
        db      "MPC2KXL         .SYS"
        sti
        mov     al, byte ptr [11b0h]
        call    xl_device_select
        mov     bl, 1
        int     91h
        jae     br_013AE
        jmp     br_0147D
br_013AE:
        mov     ax, cs
        mov     es, ax
        mov     si, STR_MPC2KXL_SYS_A0
        mov     bl, 4
        int     91h
        mov     ax, 0ch
        jae     br_013C1
        jmp     br_0147D
br_013C1:
        mov     cx, 0e2a0h
        mov     es, cx
        mov     cx, 200h
        mov     di, 0
        push    es
        push    di
        mov     bl, 6
        int     91h
        pop     di
        pop     es
        cmp     word ptr es:[di], 5a4dh
        mov     ax, 0ch
        je      br_013E1
        jmp     br_0147D
br_013E1:
        mov     cx, word ptr es:[di+8]
        shl     cx, 4
        sub     cx, 200h
        je      br_01405
        cmp     cx, 8000h
        mov     ax, 22h
        jb      br_013FA
        jmp     br_0147D
br_013FA:
        mov     di, 200h
        push    es
        push    di
        mov     bl, 6
        int     91h
        pop     di
        pop     es
br_01405:
        mov     dx, 3800h
        mov     es, dx
loop_0140A:
        push    es
        sub     di, di
        mov     cx, 8000h
        mov     bl, 6
        int     91h
        pop     es
        cmp     ax, 8000h
        jne     br_01424
        mov     bx, es
        add     bx, 800h
        mov     es, bx
        jmp     loop_0140A
br_01424:
        sub     ax, 10h
        jae     br_01431
        and     ax, 0fh
        mov     bx, es
        dec     bx
        mov     es, bx
br_01431:
        mov     si, ax
        mov     di, 0
        mov     bx, ds
        mov     ax, es
        mov     ds, ax
        mov     es, bx
        mov     cx, 10h
        rep movsb
        mov     ds, bx
        mov     bl, 0ah
        int     91h
        mov     dx, 3800h
        mov     ax, 0e2a0h
        mov     es, ax
        mov     si, word ptr es:[18h]
        mov     cx, word ptr es:[6]
        jcxz    br_01472
tgt_0145D:
        mov     di, word ptr es:[si]
        mov     ax, word ptr es:[si+2]
        push    es
        add     ax, dx
        mov     es, ax
        add     word ptr es:[di], dx
        add     si, 4
        pop     es
        loop    tgt_0145D
br_01472:
        add     word ptr es:[16h], dx
        cli
        db      26h, 0ffh, 2eh, 14h, 00h
br_0147D:
        or      al, 80h
        call    fn_014B6
        ret
isr_01483:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        sub     ax, ax
        mov     word ptr [A0_W_023FE], ax
        mov     word ptr [A0_W_02400], ax
        mov     word ptr [A0_W_02504], ax
        mov     word ptr [A0_W_02506], ax
        mov     word ptr [A0_W_0260A], ax
        mov     word ptr [A0_W_0260C], ax
        mov     word ptr [A0_W_02BD2], ax
        mov     word ptr [A0_W_02BD4], ax
        mov     word ptr [A0_W_02CD8], ax
        mov     word ptr [A0_W_02CDA], ax
        mov     word ptr [A0_W_02DDE], ax
        mov     word ptr [A0_W_02DE0], ax
        pop     ds
        iret
isr_014B1:
        sti
        call    fn_014B6
        iret
fn_014B6:
        pusha
        push    ds
        push    es
        mov     dx, RAM_SEG
        mov     ds, dx
        push    ax
        and     al, 7fh
        mov     ah, 1dh
        mul     ah
        mov     si, ax
        add     si, 11b1h
        mov     bl, 6
        int     90h
        DISP_FLUSH
        mov     cx, 3e8h
        call    xl_ms_wait
        pop     ax
        test    al, 80h
        jne     isr_014E7
        DISP_PLANE0
        DISP_FLUSH
        pop     es
        pop     ds
        popa
        ret
isr_014E7:
        jmp     isr_014E7
isr_014E9:
        sti
        call    X_014EE
        iret
X_014EE:
        mov     bp, 1
loop_014F1:
        shl     di, 1
        rcl     si, 1
        jb      br_01502
        inc     bp
        cmp     bp, 20h
        jne     loop_014F1
        sub     di, di
        sub     si, si
        ret
br_01502:
        rcr     si, 1
        rcr     di, 1
        sub     cx, cx
        sub     bx, bx
loop_0150A:
        push    bp
        push    dx
        push    ax
        sub     ax, di
        sbb     dx, si
        jb      br_01518
        pop     bp
        pop     bp
        stc
        jmp     br_0151B
br_01518:
        pop     ax
        pop     dx
        clc
br_0151B:
        rcl     bx, 1
        rcl     cx, 1
        shr     si, 1
        rcr     di, 1
        pop     bp
        dec     bp
        jne     loop_0150A
        mov     di, ax
        mov     si, dx
        mov     ax, bx
        mov     dx, cx
        ret
isr_01530:
        call    fn_01534
        iret
fn_01534:
        mov     bp, dx
        mul     cx
        mov     di, ax
        mov     si, dx
        mov     ax, bp
        mul     cx
        add     si, ax
        mov     dx, si
        mov     ax, di
        ret
        if      FW_VERSION >= 110
isr_01547:
        sti
        push    ds
        mov     cx, RAM_SEG
        mov     ds, cx
        call    fn_0155E
        mov     ax, word ptr [A0_W_017EC]
        mov     dx, word ptr [A0_W_017EE]
        mov     cx, word ptr [A0_W_017F0]
        pop     ds
        iret
        endif
fn_0155E:
        sub     cx, cx
        sub     bx, bx
        mov     word ptr [A0_W_017EC], cx
        mov     word ptr [A0_W_017EE], cx
        mov     word ptr [A0_W_017F0], cx
        mov     word ptr [A0_W_017F2], cx
        shr     dx, 1
        rcr     ax, 1
        rcr     cx, 1
        mov     bp, 20h
loop_0157B:
        shl     di, 1
        rcl     si, 1
        jae     br_01584
        call    fn_01590
br_01584:
        shr     dx, 1
        rcr     ax, 1
        rcr     cx, 1
        rcr     bx, 1
        dec     bp
        jne     loop_0157B
        ret
fn_01590:
        add     word ptr [A0_W_017EC], bx
        adc     word ptr [A0_W_017EE], cx
        adc     word ptr [A0_W_017F0], ax
        adc     word ptr [A0_W_017F2], dx
        ret
        if      FW_VERSION >= 110
isr_015A1:
        sti
        push    ds
        push    ax
        mov     ax, RAM_SEG
        mov     ds, ax
        pop     ax
        call    fn_015B6
        mov     ax, word ptr [A0_W_01802]
        mov     dx, word ptr [A0_W_01800]
        pop     ds
        iret
        endif
fn_015B6:
        mov     word ptr [A0_W_017F4], 0
        mov     word ptr [A0_W_017F6], bp
        mov     word ptr [A0_W_017F8], si
        mov     word ptr [A0_W_017FA], di
        mov     bp, 1
loop_015CB:
        shl     word ptr [A0_W_017FA], 1
        rcl     word ptr [A0_W_017F8], 1
        rcl     word ptr [A0_W_017F6], 1
        rcl     word ptr [A0_W_017F4], 1
        jae     br_01637
        rcr     word ptr [A0_W_017F4], 1
        rcr     word ptr [A0_W_017F6], 1
        rcr     word ptr [A0_W_017F8], 1
        rcr     word ptr [A0_W_017FA], 1
        mov     word ptr [A0_W_017FC], 0
        mov     word ptr [A0_W_017FE], 0
        mov     word ptr [A0_W_01800], 0
        mov     word ptr [A0_W_01802], 0
loop_01605:
        push    ax
        push    bx
        push    cx
        push    dx
        call    fn_01654
        jae     br_0164D
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        clc
loop_01613:
        rcl     word ptr [A0_W_01802], 1
        rcl     word ptr [A0_W_01800], 1
        rcl     word ptr [A0_W_017FE], 1
        rcl     word ptr [A0_W_017FC], 1
        shr     word ptr [A0_W_017F4], 1
        rcr     word ptr [A0_W_017F6], 1
        rcr     word ptr [A0_W_017F8], 1
        rcr     word ptr [A0_W_017FA], 1
        dec     bp
        jne     loop_01605
        ret
br_01637:
        inc     bp
        cmp     bp, 40h
        jne     loop_015CB
        mov     word ptr [A0_W_017FC], ax
        mov     word ptr [A0_W_017FE], bx
        mov     word ptr [A0_W_01800], cx
        mov     word ptr [A0_W_01802], dx
        ret
br_0164D:
        pop     si
        pop     si
        pop     si
        pop     si
        stc
        jmp     loop_01613
fn_01654:
        sub     dx, word ptr [A0_W_017FA]
        sbb     cx, word ptr [A0_W_017F8]
        sbb     bx, word ptr [A0_W_017F6]
        sbb     ax, word ptr [A0_W_017F4]
        ret
xl_wait_dialog:
        sti
        push    ds
        BUSY_BANNER
        pop     ds
        iret
isr_01681:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    xl_ms_wait
        pop     ds
        iret
xl_ms_wait:
        mov     bx, word ptr [A0_W_MS_TICKS]
loop_01691:
        mov     ax, word ptr [A0_W_MS_TICKS]
        sub     ax, bx
        cmp     ax, cx
        jb      loop_01691
        ret
isr_0169B:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, word ptr [A0_W_MS_TICKS]
        pop     ds
        iret
match_inline:                           ; ES:SI against the ASCIIZ after the call; CF = no match
        pop     bp
        mov     dx, si
loop_016A9:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        je      br_016C8
        mov     ah, byte ptr es:[si]
        inc     si
        cmp     ah, al
        je      loop_016A9
loop_016BA:
        mov     al, byte ptr cs:[bp]
        inc     bp
        or      al, al
        jne     loop_016BA
        mov     si, dx
        stc
        jmp     bp
br_016C8:
        mov     si, dx
        clc
        jmp     bp
fn_016CD:
        push    bx
        call    fn_016E6
        call    fn_01733
        call    fn_01743
        call    fn_01753
        pop     bx
        cmp     bx, 0c000h
        jne     br_016E2
        ret
br_016E2:
        call    isr_01865
        ret
fn_016E6:
        mov     ax, ds
        mov     es, ax
        mov     di, A0_TBL_01884
        mov     ax, 0
        call    FN_0172B
        mov     bp, resume_016F9
        retxa   2Ch
resume_016F9:
        mov     dx, 0ff40h
        in      ax, dx
        mov     bp, resume_01703
        brkxa   2Bh
resume_01703:
        call    FN_0172B
        mov     ax, 80h
        call    FN_0172B
        mov     ax, 0c0h
        call    FN_0172B
        mov     ax, 100h
        call    FN_0172B
        mov     ax, 140h
        call    FN_0172B
        mov     ax, 180h
        call    FN_0172B
        mov     ax, 1c0h
        call    FN_0172B
        ret
FN_0172B:
        mov     cx, 20h
tgt_0172E:
        stosw
        inc     ax
        loop    tgt_0172E
        ret
fn_01733:
        mov     ax, ds
        mov     es, ax
        mov     di, A0_W_01804
        mov     si, A0_TBL_01884
        mov     cx, 40h
        rep movsw
        ret
fn_01743:
        mov     ax, ds
        mov     es, ax
        mov     di, A0_TBL_0208E
        mov     cx, 100h
        mov     ax, 0
        rep stosb
        ret
fn_01753:
        mov     ax, ds
        mov     es, ax
        mov     di, A0_TBL_0218E
        mov     cx, 64h
        mov     al, 5ah
        rep stosb
        mov     byte ptr [A0_B_020E8], 1
        ret
isr_01767:
        jmp     bp
isr_01769:
        jmp     bp
isr_0176B:
        push    ds
        push    es
        pusha
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bp, resume_01779
        retxa   2Ch
resume_01779:
        mov     dx, 0ff78h
        mov     si, A0_W_0206A
        mov     cx, 4
isr_01782:
        lodsw
        out     dx, ax
        add     dx, 2
        loop    isr_01782
        mov     bp, resume_0178F
        brkxa   2Bh
resume_0178F:
        popa
        pop     es
        pop     ds
        iret
isr_01793:
        push    ds
        push    es
        pusha
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bp, resume_017A1
        retxa   2Ch
resume_017A1:
        mov     dx, 0ff78h
        mov     si, A0_W_018FC
        mov     cx, 4
isr_017AA:
        lodsw
        out     dx, ax
        add     dx, 2
        loop    isr_017AA
        mov     bp, resume_017B7
        brkxa   2Bh
resume_017B7:
        popa
        pop     es
        pop     ds
        iret
isr_017BB:
        push    ds
        push    es
        pusha
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bp, resume_017C9
        retxa   2Ch
resume_017C9:
        mov     dx, 0ff78h
        if      FW_VERSION >= 114
        XL2K_FDC_DMA
        else
        mov     si, A0_W_018E8
        endif
        mov     cx, 4
isr_017D2:
        lodsw
        out     dx, ax
        add     dx, 2
        loop    isr_017D2
        mov     bp, resume_017DF
        brkxa   2Bh
resume_017DF:
        popa
        pop     es
        pop     ds
        iret
isr_017E3:
        push    ds
        push    es
        pusha
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bp, resume_017F1
        retxa   2Ch
resume_017F1:
        mov     dx, 0ff78h
        if      FW_VERSION >= 114
        XL2K_SCSI_DMA
        else
        mov     si, A0_W_018F0
        endif
        mov     cx, 4
isr_017FA:
        lodsw
        out     dx, ax
        add     dx, 2
        loop    isr_017FA
        mov     bp, resume_01807
        brkxa   2Bh
resume_01807:
        popa
        pop     es
        pop     ds
        iret
isr_0180B:
        push    ds
        push    es
        pusha
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [67h], 0
        mov     bp, resume_0181E
        retxa   2Ch
resume_0181E:
        mov     dx, 0ff1ch
        mov     si, A0_W_01914
        mov     cx, 12h
isr_01827:
        lodsw
        out     dx, ax
        add     dx, 2
        loop    isr_01827
        mov     bp, resume_01834
        brkxa   2Bh
resume_01834:
        popa
        pop     es
        pop     ds
        iret
isr_01838:
        push    ds
        push    es
        pusha
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bp, resume_01846
        retxa   2Ch
resume_01846:
        mov     dx, 0ff1ch
        mov     si, A0_W_018A0
        mov     cx, 12h
isr_0184F:
        lodsw
        out     dx, ax
        add     dx, 2
        loop    isr_0184F
        mov     bp, resume_0185C
        brkxa   2Bh
resume_0185C:
        mov     byte ptr [67h], 1
        popa
        pop     es
        pop     ds
        iret
isr_01865:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bp, resume_01871
        retxa   2Ch
resume_01871:
        mov     si, A0_W_01804+20h
        mov     dx, 0ff20h
        mov     cx, 30h
isr_0187A:
        lodsw
        out     dx, ax
        add     dx, 2
        loop    isr_0187A
        mov     bp, resume_01887
        brkxa   2Bh
resume_01887:
        pop     ds
        ret
        mov     si, A0_TBL_0208E+5bh
loop_0188C:
        lodsb
        cmp     al, 0
        je      br_01899
        cmp     si, A0_TBL_0208E+0ffh
        jne     loop_0188C
        stc
        ret
br_01899:
        mov     ax, si
        sub     ax, A0_TBL_0208E
        clc
        ret
        mov     bh, 0
        mov     byte ptr [bx+A0_TBL_0208E], al
        ret
isr_018A7:
        push    ds
        push    ax
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, ax
        mov     byte ptr [A0_B_0437B], 0
        mov     word ptr [A0_W_SEQ_SEGMENT], 8000h
        mov     al, byte ptr [bx+A0_TBL_0218E]
        call    isr_01DE6
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        push    ds
        mov     dx, 0ec00h
        mov     ds, dx
        mov     cx, 1400h
        sub     di, di
        sub     si, si
        rep movsw
        mov     dx, word ptr es:[10h]
        mov     bp, 0e000h
        sub     bp, dx
        mov     es, bp
        mov     cx, 180h
        cmp     dx, cx
        jae     isr_018EA
        mov     cx, dx
isr_018EA:
        push    cx
        shl     cx, 3
        sub     di, di
        rep movsw
        pop     cx
        pop     ds
isr_018F4:
        sub     dx, cx
        je      isr_0192A
        mov     bx, es
        add     bx, cx
        mov     si, ax
        mov     al, byte ptr [si+A0_TBL_0208E]
        cmp     al, 1
        je      isr_0192A
        pusha
        call    isr_01DE6
        popa
        mov     es, bx
        push    ds
        mov     di, 0ec00h
        mov     ds, di
        mov     cx, 400h
        cmp     dx, cx
        jae     isr_0191C
        mov     cx, dx
isr_0191C:
        push    cx
        shl     cx, 3
        sub     di, di
        sub     si, si
        rep movsw
        pop     cx
        pop     ds
        jmp     isr_018F4
isr_0192A:
        mov     ax, bp
        mov     bl, 7
        int     87h
        pop     ax
        pop     ds
        iret
isr_01933:
        push    ds
        push    ax
        mov     bp, RAM_SEG
        mov     ds, bp
        push    ax
        call    fn_019B3
        call    fn_01A0F
        call    fn_01AEF
        pop     bx
        jb      isr_0199C
        mov     byte ptr [bx+A0_TBL_0218E], al
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     dx, word ptr es:[10h]
        add     dx, 280h
        add     dx, 3ffh
        shr     dx, 0ah
        mov     bp, word ptr [A0_W_SEQ_SEGMENT]
isr_01963:
        pusha
        call    isr_01DE6
        popa
        push    ds
        mov     ds, bp
        mov     cx, 0ec00h
        mov     es, cx
        sub     si, si
        sub     di, di
        mov     cx, 2000h
        rep movsw
        pop     ds
        dec     dx
        je      isr_0198E
        push    ax
        call    fn_01AEF
        pop     bx
        jb      isr_0199C
        mov     byte ptr [bx+A0_TBL_0208E], al
        add     bp, 400h
        jmp     isr_01963
isr_0198E:
        pop     ax
        clc
isr_01990:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
isr_0199C:
        pop     ax
        int     0d3h
        mov     ax, 19h
        stc
        jmp     isr_01990
isr_019A5:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_019B3
        call    fn_01A0F
        pop     ds
        iret
fn_019B3:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, word ptr es:[30h]
        shl     si, 2
        add     si, 1500h
        mov     bx, word ptr es:[si]
        mov     cx, word ptr es:[si+2]
        mov     ch, 0
        mov     si, 2800h
loop_019CF:
        cmp     byte ptr es:[si+4], 0ffh
        je      br_019EB
        mov     ax, word ptr es:[si]
        mov     dl, byte ptr es:[si+2]
        and     dx, 0fh
        sub     ax, bx
        sbb     dx, cx
        jae     br_019EB
        call    fn_06C09
        jmp     loop_019CF
br_019EB:
        mov     ax, es
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     word ptr es:[3ah], si
        mov     word ptr es:[3ch], ax
        sub     ax, word ptr [A0_W_SEQ_SEGMENT]
        shr     si, 4
        add     ax, si
        mov     al, ah
        shr     al, 2
        mov     ah, 0
        mov     word ptr es:[3eh], ax
        ret
fn_01A0F:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, word ptr es:[32h]
        inc     si
        jne     br_01A20
        mov     si, word ptr es:[1ah]
br_01A20:
        shl     si, 2
        add     si, 1500h
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     dh, 0
        mov     word ptr es:[40h], ax
        mov     word ptr es:[42h], dx
        ret
isr_01A3A:
        push    ds
        push    ax
        mov     bp, RAM_SEG
        mov     ds, bp
        push    ax
        call    fn_01AEF
        pop     bx
        jb      isr_01A83
        mov     byte ptr [bx+A0_TBL_0218E], al
        pusha
        call    isr_01DE6
        popa
        mov     ds, word ptr [A0_W_SEQ_SEGMENT]
        mov     cx, 0ec00h
        mov     es, cx
        sub     si, si
        sub     di, di
        mov     cx, 2000h
        rep movsw
        mov     word ptr es:[10h], 1
        mov     di, 2800h
        mov     ax, 0ffffh
        mov     cx, 8
        rep stosw
        pop     ax
        clc
isr_01A77:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
isr_01A83:
        pop     ax
        int     0d3h
        mov     ax, 19h
        stc
        jmp     isr_01A77
isr_01A8C:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, ax
        mov     al, byte ptr [bx+A0_TBL_0218E]
        mov     byte ptr [bx+A0_TBL_0218E], 5ah
        call    fn_01AA2
        pop     ds
        iret
fn_01AA2:
        cmp     al, 5ah
        jne     BR_01AA7
        ret
BR_01AA7:
        mov     bh, 0
loop_01AA9:
        mov     bl, al
        mov     al, byte ptr [bx+A0_TBL_0208E]
        mov     byte ptr [bx+A0_TBL_0208E], 0
        cmp     al, 1
        jne     loop_01AA9
        ret
isr_01AB9:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_01743
        call    fn_01753
        mov     byte ptr [A0_B_UNDO_SEQ_MARK], 5ah
        mov     byte ptr [A0_B_02069], 5ah
        pop     ds
        iret
isr_01AD1:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     si, A0_W_020E9
        mov     ax, 0
isr_01ADD:
        cmp     byte ptr [si], 0
        jne     isr_01AE3
        inc     ax
isr_01AE3:
        inc     si
        if      FW_VERSION >= 114
        cmp     si, 218eh
        elseif  FW_VERSION >= 110
        cmp     si, 2172h
        else
        cmp     si, 2154h
        endif
        jne     isr_01ADD
        mov     si, A0_TBL_0208E
        pop     ds
        iret
fn_01AEF:
        mov     si, A0_W_020E9
loop_01AF2:
        cmp     byte ptr [si], 0
        je      br_01B0F
        inc     si
        if      FW_VERSION >= 114
        cmp     si, 218eh
        elseif  FW_VERSION >= 110
        cmp     si, 2172h
        else
        cmp     si, 2154h
        endif
        jne     loop_01AF2
        mov     al, 5ah
        xchg    al, byte ptr [A0_B_UNDO_SEQ_MARK]
        cmp     al, 5ah
        je      br_01B0D
        call    fn_01AA2
        jmp     fn_01AEF
br_01B0D:
        stc
        ret
br_01B0F:
        mov     byte ptr [si], 1
        mov     ax, si
        if      FW_VERSION >= 114
        sub     ax, 208eh
        elseif  FW_VERSION >= 110
        sub     ax, 2072h
        else
        sub     ax, 2054h
        endif
        clc
        ret
isr_01B19:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, 0
        mov     di, si
isr_01B25:
        mov     al, byte ptr [bx+A0_TBL_0218E]
        mov     ah, 0
        push    bx
        call    isr_01DE6
        push    ds
        mov     dx, 0ec00h
        mov     ds, dx
        mov     si, 0
        mov     cx, 8
        rep movsw
        mov     ax, 0
        cmp     byte ptr [12h], 0
        je      isr_01B4D
        mov     ax, word ptr [10h]
        add     ax, 280h
isr_01B4D:
        stosw
        pop     ds
        pop     bx
        inc     bl
        cmp     bl, 63h
        jne     isr_01B25
        pop     ds
        iret
isr_01B59:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, byte ptr [A0_B_UNDO_SEQ_MARK]
        call    fn_01AA2
        mov     al, byte ptr [A0_B_02069]
        call    fn_01AA2
        mov     byte ptr [A0_B_UNDO_SEQ_MARK], 5ah
        mov     byte ptr [A0_B_02069], 5ah
        push    word ptr [A0_W_SEQ_TICK_LO]
        push    word ptr [A0_W_SEQ_TICK_HI]
        call    fn_01BDA
        les     si, [50h]
        mov     ax, word ptr es:[si]
        push    ax
        mov     bx, ax
        mov     bl, byte ptr [bx+A0_TBL_0218E]
        mov     byte ptr [A0_B_UNDO_SEQ_MARK], bl
        pop     ax
        int     0d2h
        mov     byte ptr [A0_B_02069], 5ah
        pop     dx
        pop     ax
        jb      isr_01BCE
        push    ax
        push    dx
        les     si, [50h]
        mov     ax, word ptr es:[si]
        mov     si, A0_W_056F1
        call    fn_082A6
        pop     dx
        pop     ax
        call    fn_0759C
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, 700h
        call    fn_07C3B
        les     si, [50h]
        mov     ax, word ptr es:[si]
        int     0d8h
        clc
isr_01BCE:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_01BDA:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[12h], 0
        jne     br_01BE7
        ret
br_01BE7:
        mov     ax, 0ffffh
        mov     dx, ax
        call    fn_0759C
        call    fn_01BFE
        ret
isr_01BF3:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_01BFE
        pop     ds
        iret
fn_01BFE:
        les     di, [A0_FP_EVT_WRITE_PTR]
        call    fn_01C26
        test    di, 0fh
        je      br_01C0E
        call    fn_01C26
br_01C0E:
        shr     di, 4
        mov     ax, es
        add     ax, di
        mov     bx, word ptr [A0_W_SEQ_SEGMENT]
        mov     es, bx
        add     bx, 280h
        sub     ax, bx
        mov     word ptr es:[10h], ax
        ret
fn_01C26:
        mov     al, 0ffh
        mov     cx, 8
        rep stosb
        or      di, di
        je      br_01C32
        ret
br_01C32:
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        ret
isr_01C3A:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_01C46
        pop     ds
        iret
fn_01C46:
        les     si, [50h]
        mov     bx, word ptr es:[si]
        cmp     byte ptr [A0_B_UNDO_SEQ_MARK], 5ah
        je      br_01C6E
        push    bx
        mov     al, byte ptr [bx+A0_TBL_0218E]
        mov     byte ptr [A0_B_02069], al
        mov     al, byte ptr [A0_B_UNDO_SEQ_MARK]
        mov     byte ptr [bx+A0_TBL_0218E], al
        mov     byte ptr [A0_B_UNDO_SEQ_MARK], 5ah
        pop     ax
        int     0d1h
        int     0d8h
        ret
br_01C6E:
        cmp     byte ptr [A0_B_02069], 5ah
        jne     br_01C76
        ret
br_01C76:
        mov     al, byte ptr [bx+A0_TBL_0218E]
        mov     byte ptr [A0_B_UNDO_SEQ_MARK], al
        push    bx
        mov     al, byte ptr [A0_B_02069]
        mov     byte ptr [bx+A0_TBL_0218E], al
        mov     byte ptr [A0_B_02069], 5ah
        pop     ax
        int     0d1h
        int     0d8h
        ret
isr_01C90:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, byte ptr [A0_B_UNDO_SEQ_MARK]
        call    fn_01AA2
        mov     al, byte ptr [A0_B_02069]
        call    fn_01AA2
        mov     byte ptr [A0_B_UNDO_SEQ_MARK], 5ah
        mov     byte ptr [A0_B_02069], 5ah
        pop     ds
        iret
isr_01CAE:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, ax
        mov     bl, byte ptr [bx+A0_TBL_0218E]
        shl     bx, 1
        mov     ax, word ptr [bx+A0_TBL_01884]
        mov     bp, resume_01CC6
        retxa   2Ch
resume_01CC6:
        mov     dx, 0ff76h
        out     dx, ax
        mov     bp, resume_01CD0
        brkxa   2Bh
resume_01CD0:
        mov     dx, 0ec00h
        pop     ds
        iret
isr_01CD5:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, ax
        shr     bx, 0ah
        shl     bx, 1
        mov     dx, word ptr [bx+A0_W_01804]
        shl     dx, 6
        mov     ch, dl
        mov     dl, dh
        mov     dh, 0
        mov     bx, 0
        and     ax, 3ffh
        shl     ax, 1
        rcl     bx, 1
        shl     ax, 1
        rcl     bx, 1
        shl     ax, 1
        rcl     bx, 1
        shl     ax, 1
        rcl     bx, 1
        add     ax, cx
        add     dx, bx
        pop     ds
        iret
isr_01D0B:
        iret
isr_01D0C:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     si, A0_TBL_0218E
        mov     bx, 0
        mov     ah, 0
isr_01D1A:
        mov     al, byte ptr [bx+si]
        cmp     al, 5ah
        je      isr_01D28
        inc     bx
        cmp     bl, 63h
        jne     isr_01D1A
        mov     bl, 62h
isr_01D28:
        mov     al, bl
        pop     ds
        iret
isr_01D2C:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     si, A0_TBL_0218E
isr_01D35:
        mov     al, byte ptr [si]
        cmp     al, 5ah
        je      isr_01D54
        push    si
        mov     ah, 0
        call    fn_01D6F
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     dx, word ptr es:[10h]
        add     dx, 280h
        call    fn_01DB9
        pop     si
        jb      isr_01D5C
isr_01D54:
        inc     si
        if      FW_VERSION >= 114
        cmp     si, 21f1h
        elseif  FW_VERSION >= 110
        cmp     si, 21d5h
        else
        cmp     si, 21b7h
        endif
        jne     isr_01D35
        clc
isr_01D5C:
        pushf
        push    ax
        call    fn_01D9C
        pop     ax
        popf
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_01D6F:
        mov     bp, resume_01D75
        retxa   2Ch
resume_01D75:
        mov     dx, 0ff40h
        mov     cx, 14h
tgt_01D7B:
        mov     ah, 0
        push    ax
        mov     bx, ax
        shl     bx, 1
        mov     ax, word ptr [bx+A0_TBL_01884]
        out     dx, ax
        add     dx, 2
        pop     bx
        mov     al, byte ptr [bx+A0_TBL_0208E]
        cmp     al, 1
        je      br_01D95
        loop    tgt_01D7B
br_01D95:
        mov     bp, resume_01D9B
        brkxa   2Bh
resume_01D9B:
        ret
fn_01D9C:
        mov     bp, resume_01DA2
        retxa   2Ch
resume_01DA2:
        mov     dx, 0ff40h
        mov     si, A0_W_018C4
        mov     cx, 14h
tgt_01DAB:
        lodsw
        out     dx, ax
        add     dx, 2
        loop    tgt_01DAB
        mov     bp, resume_01DB8
        brkxa   2Bh
resume_01DB8:
        ret
fn_01DB9:
        sub     si, si
        cmp     dx, 800h
        jb      br_01DDC
        mov     cx, 8000h
        push    es
        push    dx
        mov     bl, 9
        int     91h
        pop     dx
        pop     es
        jae     br_01DCF
        ret
br_01DCF:
        mov     ax, es
        add     ax, 800h
        mov     es, ax
        sub     dx, 800h
        jmp     fn_01DB9
br_01DDC:
        mov     cx, dx
        shl     cx, 4
        mov     bl, 9
        int     91h
        ret
isr_01DE6:
        pusha
        mov     bx, ax
        shl     bx, 1
        mov     ax, word ptr [bx+A0_TBL_01884]
        mov     word ptr [A0_W_0187A], ax
        mov     bp, resume_01DF8
        retxa   2Ch
resume_01DF8:
        mov     dx, 0ff76h
        out     dx, ax
        mov     bp, resume_01E02
        brkxa   2Bh
resume_01E02:
        popa
        ret
isr_01E04:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, ax
        dec     bx
isr_01E0D:
        inc     bx
        cmp     byte ptr [bx+A0_TBL_0218E], 5ah
        clc
        jne     isr_01E1C
        cmp     bx, 62h
        jne     isr_01E0D
        stc
isr_01E1C:
        mov     ax, bx
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
isr_01E2A:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, ax
        inc     bx
isr_01E33:
        dec     bx
        cmp     byte ptr [bx+A0_TBL_0218E], 5ah
        clc
        jne     isr_01E42
        cmp     bx, 0
        jne     isr_01E33
        stc
isr_01E42:
        mov     ax, bx
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
isr_01E50:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [A0_W_021F2], 6
        push    dx
        mov     dx, 1a2h
        in      al, dx
        pop     dx
        and     al, 0
        call    fn_01E73
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_01E73:
        call    fn_01FE3
        mov     cx, word ptr [A0_W_021F2]
        mov     ax, 40h
tgt_01E7D:
        push    ax
        push    cx
        call    fn_01F22
        call    fn_01EC3
        call    fn_01ED9
        pop     cx
        pop     ax
        add     ax, 20h
        call    fn_01F22
        loop    tgt_01E7D
        mov     cx, 3e8h
        int     0b6h
        call    fn_01FE3
        mov     cx, word ptr [A0_W_021F2]
        mov     ax, 40h
        call    fn_01F71
tgt_01EA4:
        push    ax
        push    cx
        call    fn_01F71
        call    fn_01EC3
        call    fn_01EF8
        pop     cx
        pop     ax
        jae     br_01EB4
        ret
br_01EB4:
        add     ax, 20h
        call    fn_01F71
        loop    tgt_01EA4
        mov     cx, 3e8h
        int     0b6h
        clc
        ret
fn_01EC3:
        push    ds
        pop     es
        mov     si, ax
        shl     si, 1
        if      FW_VERSION >= 114
        add     si, 1884h
        elseif  FW_VERSION >= 110
        add     si, 1868h
        else
        add     si, 184ah
        endif
        mov     di, A0_W_01844
        mov     cx, 20h
        rep movsw
        call    isr_01865
        ret
fn_01ED9:
        mov     ax, 8000h
        mov     es, ax
        mov     cx, 8
tgt_01EE1:
        push    cx
        sub     di, di
        mov     cx, 8000h
tgt_01EE7:
        call    fn_01FC0
        stosw
        loop    tgt_01EE7
        pop     cx
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        loop    tgt_01EE1
        ret
fn_01EF8:
        mov     ax, 8000h
        mov     es, ax
        mov     cx, 8
tgt_01F00:
        push    cx
        mov     cx, 8000h
        sub     si, si
tgt_01F06:
        call    fn_01FC0
        cmp     ax, word ptr es:[si]
        jne     br_01F1F
        add     si, 2
        loop    tgt_01F06
        pop     cx
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        loop    tgt_01F00
        clc
        ret
br_01F1F:
        pop     cx
        stc
        ret
fn_01F22:
        pusha
        push    ax
        DISP_MSG        "     Memory write     %"
        pop     ax
        sub     ax, 40h
        mov     bx, 64h
        mul     bx
        mov     bx, word ptr [A0_W_021F2]
        shl     bx, 5
        div     bx
        DISP_NUM        96h, 17h, 03h
        DISP_INVERT     96h, 17h, 05h, 07h
        DISP_INVERT     9ch, 17h, 05h, 07h
        DISP_INVERT     0a2h, 17h, 05h, 07h
        DISP_FLUSH
        popa
        ret
fn_01F71:
        pusha
        push    ax
        DISP_MSG        "     Memory read      %"
        pop     ax
        sub     ax, 40h
        mov     bx, 64h
        mul     bx
        mov     bx, word ptr [A0_W_021F2]
        shl     bx, 5
        div     bx
        DISP_NUM        96h, 17h, 03h
        DISP_INVERT     96h, 17h, 05h, 07h
        DISP_INVERT     9ch, 17h, 05h, 07h
        DISP_INVERT     0a2h, 17h, 05h, 07h
        DISP_FLUSH
        popa
        ret
fn_01FC0:
        push    bx
        push    cx
        mov     ax, word ptr [A0_W_021F4]
        mov     bx, word ptr [A0_W_021F6]
        mov     cl, bl
        shr     cl, 3
        and     cl, 1
        xor     cl, al
        shr     cl, 1
        rcr     bx, 1
        rcr     ax, 1
        mov     word ptr [A0_W_021F4], ax
        mov     word ptr [A0_W_021F6], bx
        pop     cx
        pop     bx
        ret
fn_01FE3:
        mov     word ptr [A0_W_021F4], 5a5ah
        mov     word ptr [A0_W_021F6], 5a5ah
        ret
isr_01FF0:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [A0_B_021F8], 1
        call    fn_02001
        pop     ds
        iret
fn_02001:
        mov     ax, 3800h
        mov     es, ax
        mov     cx, 20h
        mov     ax, 8000h
tgt_0200C:
        push    ax
        push    cx
        call    isr_023A8
        push    ds
        mov     ax, 0ec00h
        mov     ds, ax
        mov     si, 0
        mov     di, 0
        mov     cx, 2000h
        rep movsw
        pop     ds
        mov     ax, es
        add     ax, 400h
        mov     es, ax
        pop     cx
        pop     ax
        add     ax, 400h
        loop    tgt_0200C
        DISP_CLEAR
        DISP_MSG        "JP20 Change P-ROM ==> F-ROM"
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "GO"
        DISP_FLUSH
loop_0205E:
        int     0b9h
        cmp     ax, 7eh
        jne     loop_0205E
        mov     bp, resume_0206B
        retxa   2Ch
resume_0206B:
        call    xl_flash_id_probe
        jae     br_02072
        jmp     br_0209E
br_02072:
        mov     bp, resume_02078
        brkxa   2Bh
resume_02078:
        call    fn_020BB
        jb      br_0209E
        DISP_MSG        "FROM Boot write complete !!"
loop_0209C:
        jmp     loop_0209C
br_0209E:
        mov     byte ptr es:[0], 0ffh
        sti
        or      al, 80h
        int     95h
        ret
isr_020AA:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [A0_B_021F8], 0
        call    fn_020BB
        pop     ds
        iret
fn_020BB:
        if      FW_VERSION >= 114
        cmp     byte ptr [21f9h], 0
        jne     br_020C5
        jmp     br_02155
br_020C5:
        DISP_MSG        "Flash block 1-7 erase !"
        mov     ax, 8000h
loop_020E3:
        push    ax
        call    isr_023A8
        mov     ax, 0ec00h
        call    xl_flash_block_erase
        jae     br_020F2
        jmp     br_02395
br_020F2:
        pop     ax
        add     ax, 1000h
        cmp     ax, 0f000h
        jne     loop_020E3
        DISP_MSG        "Flash block 8-16 erase !"
        mov     ax, 0f000h
loop_0211A:
        push    ax
        call    isr_023A8
        mov     ax, 0ec00h
        call    xl_flash_block_erase
        jae     br_02129
        jmp     br_02395
br_02129:
        mov     ax, 0ec00h
        add     ax, 200h
        call    xl_flash_block_erase
        jae     br_02137
        jmp     br_02395
br_02137:
        pop     ax
        add     ax, 400h
        mov     cx, 20h
        jae     br_02143
        jmp     BR_02281
br_02143:
        cmp     byte ptr [A0_B_021F8], 0
        jne     loop_0211A
        cmp     ax, 0fc00h
        jb      loop_0211A
        mov     cx, 1eh
        jmp     BR_02281
br_02155:
        endif
        DISP_MSG        "Flash memory block1 erase !"
        mov     ax, 8000h
        call    isr_023A8
        mov     ax, 0ec00h
        call    xl_flash_block_erase
        if      FW_VERSION >= 110
        jae     br_02185
        else
        jae     L_020BA
        endif
        jmp     br_02395
        if      FW_VERSION < 110
L_020BA:
br_02185                        equ     $+19
        else
br_02185:
        endif
        DISP_MSG        "Flash memory block2 erase !"
        mov     ax, 0a000h
        call    isr_023A8
        mov     ax, 0ec00h
        call    xl_flash_block_erase
        jae     br_021B5
        jmp     br_02395
br_021B5:
        DISP_MSG        "Flash memory block3 erase !"
        mov     ax, 0c000h
        call    isr_023A8
        mov     ax, 0ec00h
        call    xl_flash_block_erase
        jae     br_021E5
        jmp     br_02395
br_021E5:
        DISP_MSG        "Flash memory block4 erase !"
        mov     ax, 0e000h
        call    isr_023A8
        mov     ax, 0ec00h
        call    xl_flash_block_erase
        jae     br_02215
        jmp     br_02395
br_02215:
        DISP_MSG        " Parameter   block  erase !"
        mov     ax, 0f800h
        call    isr_023A8
        mov     ax, 0ec00h
        call    xl_flash_block_erase
        jae     br_02245
        jmp     br_02395
br_02245:
        mov     cx, 1eh
        cmp     byte ptr [A0_B_021F8], 0
        je      BR_02281
        DISP_MSG        "   Boot   block  erase !  "
        mov     ax, 0fc00h
        call    isr_023A8
        mov     ax, 0ec00h
        call    xl_flash_block_erase
        jae     L_0227E
        jmp     br_02395
L_0227E:
        mov     cx, 20h
BR_02281:
        mov     ax, 8000h
        mov     bx, 3800h
tgt_02287:
        push    ax
        push    cx
        push    bx
        call    fn_022BE
        pop     bx
        pop     cx
        pop     ax
        jae     br_02295
        jmp     br_02395
br_02295:
        add     ax, 400h
        add     bx, 400h
        loop    tgt_02287
        DISP_MSG        "  Flash memory write 100% "
        clc
        ret
fn_022BE:
        push    bx
        push    ax
        call    isr_023A8
        DISP_MSG        "  Flash memory write    % "
        pop     ax
        sub     ah, 80h
        mov     al, 64h
        mul     ah
        mov     bl, 78h
        cmp     byte ptr [A0_B_021F8], 0
        je      br_022F4
        mov     bl, 80h
br_022F4:
        div     bl
        mov     ah, 0
        DISP_NUM        0a8h, 17h, 03h
        DISP_INVERT     0a8h, 17h, 05h, 07h
        DISP_INVERT     0aeh, 17h, 05h, 07h
        DISP_INVERT     0b4h, 17h, 05h, 07h
        DISP_FLUSH
        pop     bx
        mov     dx, 0ec00h
        sub     di, di
        sub     si, si
        mov     cx, 4000h
        if      FW_VERSION >= 114
        cmp     byte ptr [21f9h], 0
        jne     br_0235A
        endif
tgt_02328:
        cli
        mov     es, bx
        mov     al, byte ptr es:[si]
        mov     es, dx
        mov     byte ptr es:[di], 40h
        mov     byte ptr es:[di], al
        sti
        call    FN_0262A
        jb      br_02395
        inc     si
        inc     di
        loop    tgt_02328
        mov     byte ptr es:[0], 0ffh
        push    ds
        mov     ds, bx
        mov     es, dx
        sub     di, di
        sub     si, si
        mov     cx, 4000h
        repe cmpsb
        pop     ds
        if      FW_VERSION >= 114
        jne     br_02395
        clc
        ret
br_0235A:
        shr     cx, 1
tgt_0235C:
        cli
        mov     es, bx
        mov     ax, word ptr es:[si]
        mov     es, dx
        mov     word ptr es:[di], 40h
        mov     word ptr es:[di], ax
        sti
        call    FN_0262A
        jb      br_02395
        inc     si
        inc     si
        inc     di
        inc     di
        loop    tgt_0235C
        mov     word ptr es:[0], 0ffffh
        push    ds
        mov     ds, bx
        mov     es, dx
        sub     di, di
        sub     si, si
        mov     cx, 2000h
        repe cmpsw
        pop     ds
        mov     ax, 26h
        endif
        jne     br_02395
        clc
        ret
br_02395:
        mov     byte ptr es:[0], 0ffh
        sti
        or      al, 80h
        int     95h
        ret
        mov     al, 0ch
        or      al, 80h
        int     95h
        ret
isr_023A8:
        mov     bp, resume_023AE
        retxa   2Ch
resume_023AE:
        shr     ax, 0ah
        mov     dx, 0ff76h
        out     dx, ax
        mov     bp, resume_023BB
        brkxa   2Bh
resume_023BB:
        ret
isr_023BC:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_023D2
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_023D2:
        mov     cx, 1eh
        mov     ax, 8000h
tgt_023D8:
        push    ax
        push    cx
        call    isr_023A8
        mov     ax, 0ec00h
        mov     es, ax
        mov     si, 0
        mov     cx, 4000h
        mov     bl, 9
        int     91h
        pop     cx
        pop     bx
        jae     br_023F1
        ret
br_023F1:
        mov     ax, bx
        add     ax, 400h
        loop    tgt_023D8
        mov     ax, 0e2a0h
        mov     es, ax
        mov     di, 0
        mov     ax, 0
        mov     cx, 2000h
        rep stosw
        mov     si, 0
        mov     cx, 4000h
        mov     bl, 9
        int     91h
        jae     br_02415
        ret
br_02415:
        mov     ax, 0fc00h
        call    isr_023A8
        mov     ax, 0ec00h
        mov     es, ax
        mov     si, 0
        mov     cx, 4000h
        mov     bl, 9
        int     91h
        ret
isr_0242B:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     es, bp
        cmp     byte ptr [62h], 0
        je      isr_0247B
        mov     di, 96h
        mov     si, 76h
        mov     cx, 20h
        repe cmpsb
        je      isr_0247B
        mov     di, 96h
        mov     si, 76h
        mov     cx, 20h
        rep movsb
        mov     bp, resume_02458
        retxa   2Ch
resume_02458:
        mov     al, byte ptr [62h]
        mov     ah, byte ptr [67h]
        push    ax
        mov     byte ptr [62h], 0
        mov     byte ptr [67h], 0
        call    fn_0247D
        pop     ax
        mov     byte ptr [62h], al
        mov     byte ptr [67h], ah
        mov     bp, isr_0247B
        brkxa   2Bh
isr_0247B:
        pop     ds
        iret
fn_0247D:
        call    xl_flash_id_probe
        jae     xl_settings_log_scan_and_append
        ret
xl_settings_log_scan_and_append:
        mov     ax, 0f800h
        mov     es, ax
        mov     di, 0
loop_0248B:
        mov     ax, word ptr es:[di]
        cmp     ax, 0ffffh
        je      br_024AA
        cmp     ax, 20h
        jne     br_024A0
        add     di, ax
        cmp     di, 2000h
        jne     loop_0248B
br_024A0:
        mov     ax, es
        push    es
        call    xl_flash_block_erase
        pop     es
        mov     di, 0
br_024AA:
        mov     si, 76h
        mov     cx, 20h
        push    si
        push    di
        push    cx
        if      FW_VERSION >= 114
        cmp     byte ptr [21f9h], 0
        je      br_024D6
        shr     cx, 1
tgt_024BC:
        mov     ax, word ptr [si]
        mov     byte ptr es:[di], 40h
        mov     word ptr es:[di], ax
        sti
        call    FN_0262A
        cli
        jb      br_024FA
        add     si, 2
        add     di, 2
        loop    tgt_024BC
        jmp     br_024EA
        endif
br_024D6:
        mov     al, byte ptr [si]
        mov     byte ptr es:[di], 40h
        mov     byte ptr es:[di], al
        sti
        call    FN_0262A
        cli
        jb      br_024FA
        inc     si
        inc     di
        loop    br_024D6
        if      FW_VERSION >= 114
br_024EA:
        endif
        mov     byte ptr es:[0], 0ffh
        pop     cx
        pop     di
        pop     si
        repe cmpsb
        mov     al, 26h
        jne     br_02503
        ret
br_024FA:
        mov     byte ptr es:[0], 0ffh
        pop     cx
        pop     di
        pop     si
br_02503:
        ret
isr_02504:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [80h], al
        mov     byte ptr [81h], ah
        mov     byte ptr [82h], dl
        mov     byte ptr [83h], dh
        mov     byte ptr [7eh], cl
        mov     byte ptr [7fh], ch
        mov     word ptr [7ah], bx
        mov     word ptr [7ch], si
        mov     ax, di
        mov     byte ptr [79h], al
        pop     ds
        iret
isr_02530:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bp, resume_0253C
        retxa   2Ch
resume_0253C:
        call    fn_02547
        mov     bp, resume_02545
        brkxa   2Bh
resume_02545:
        pop     ds
        iret
fn_02547:
        call    xl_flash_id_probe
        jae     br_0254D
        ret
br_0254D:
        mov     ax, 0f800h
        mov     es, ax
        mov     si, 0
loop_02555:
        mov     ax, word ptr es:[si]
        cmp     ax, 0ffffh
        je      br_0256B
        cmp     ax, 20h
        jne     br_025B5
        add     si, 20h
        cmp     si, 2000h
        jne     loop_02555
br_0256B:
        sub     si, 20h
        jae     br_02571
        ret
br_02571:
        mov     cx, 10h
        mov     di, 76h
        mov     bx, 96h
loop_0257A:
        mov     ax, word ptr es:[si]
        mov     word ptr [di], ax
        mov     word ptr [bx], ax
        add     si, 2
        add     di, 2
        add     bx, 2
        loop    loop_0257A
        mov     al, byte ptr [79h]
        mov     ah, 0
        mov     di, ax
        mov     al, byte ptr [80h]
        mov     ah, byte ptr [81h]
        mov     dl, byte ptr [82h]
        mov     dh, byte ptr [83h]
        mov     cl, byte ptr [7eh]
        mov     ch, byte ptr [7fh]
        mov     bx, word ptr [7ah]
        mov     si, word ptr [7ch]
        int     72h
        ret
br_025B5:
        mov     ax, 0f800h
        call    xl_flash_block_erase
        ret
xl_flash_id_probe:
        mov     ax, 0fc00h
        mov     es, ax
        mov     al, byte ptr es:[0]
        mov     byte ptr es:[0], 90h
        mov     al, byte ptr es:[0]
        mov     byte ptr es:[0], 90h
        mov     ah, byte ptr es:[2]
        mov     byte ptr es:[0], 0ffh
        if      FW_VERSION >= 114
        mov     byte ptr [21f9h], 0
        mov     byte ptr es:[0], 0ffh
        endif
        cmp     ax, 7089h
        jne     br_025F1
        ret
br_025F1:
        cmp     ax, 9c89h
        if      FW_VERSION >= 114
        jne     br_025F7
        ret
br_025F7:
        mov     word ptr es:[0], 90h
        mov     ax, word ptr es:[0]
        mov     bx, word ptr es:[2]
        mov     word ptr es:[0], 0ffffh
        mov     byte ptr [21f9h], 1
        cmp     ax, 89h
        jne     br_02626
        cmp     bx, 8892h
        jne     br_0261F
        ret
br_0261F:
        cmp     bx, 88c0h
        endif
        jne     br_02626
        ret
br_02626:
        mov     al, 24h
        stc
        ret
FN_0262A:
        mov     ah, al
        mov     word ptr [0b8ch], 0bb8h
loop_02632:
        mov     al, byte ptr es:[di]
        test    al, 80h
        jne     br_02642
        cmp     word ptr [0b8ch], 0
        je      br_02650
        jmp     loop_02632
br_02642:
        test    al, 8
        jne     br_0264C
        test    al, 10h
        jne     br_02650
        clc
        ret
br_0264C:
        mov     al, 27h
        stc
        ret
br_02650:
        mov     al, 26h
        stc
        ret
xl_flash_block_erase:
        mov     es, ax
        mov     byte ptr es:[0], 20h
        mov     byte ptr es:[0], 0d0h
        mov     word ptr [0b8ch], 2710h
        mov     byte ptr es:[0], 70h
loop_0266E:
        mov     al, byte ptr es:[0]
        test    al, 80h
        jne     br_0267F
        cmp     word ptr [0b8ch], 0
        je      br_02697
        jmp     loop_0266E
br_0267F:
        test    al, 8
        jne     br_02693
        mov     ah, al
        and     ah, 30h
        cmp     ah, 30h
        je      br_0269B
        test    al, 20h
        jne     br_02697
        clc
        ret
br_02693:
        mov     al, 27h
        stc
        ret
br_02697:
        mov     al, 25h
        stc
        ret
br_0269B:
        mov     al, 28h
        stc
        ret
fn_0269F:
        mov     bx, word ptr [A0_W_022FC]
        cmp     bx, word ptr [A0_W_022FA]
        je      br_026B8
        mov     al, byte ptr [bx+A0_B_021FA]
        inc     bl
        mov     word ptr [A0_W_022FC], bx
        call    fn_026E3
        jmp     fn_0269F
br_026B8:
        call    fn_067EF
        cmp     byte ptr [A0_B_MIDI1_SYSEX_ACTIVE], 0
        jne     L_026C3
        ret
L_026C3:
        int     77h
        mov     word ptr [A0_W_0267A], ax
loop_026C8:
        mov     bx, word ptr [A0_W_022FC]
        cmp     bx, word ptr [A0_W_022FA]
        jne     fn_0269F
        int     77h
        sub     ax, word ptr [A0_W_0267A]
        cmp     ax, 1eh
        jb      loop_026C8
        mov     al, 0f7h
        call    fn_02AE8
        ret
fn_026E3:
        cmp     byte ptr [A0_B_0436E], 5
        jne     br_026ED
        jmp     br_027A1
br_026ED:
        cmp     byte ptr [6bh], 0
        je      br_026F5
        ret
br_026F5:
        cmp     al, 0f0h
        jb      br_026FC
        jmp     br_029C4
br_026FC:
        test    al, 80h
        jne     br_02710
        mov     bl, byte ptr [A0_B_0269E]
        and     bx, 0fh
        mov     byte ptr [bx+A0_W_028ED], 1
        jmp     word ptr [A0_W_MIDI1_RX_STATE]
br_02710:
        cmp     byte ptr [A0_B_MIDI1_SYSEX_ACTIVE], 0
        je      br_0271E
        push    ax
        mov     al, 0f7h
        call    fn_02AE8
        pop     ax
br_0271E:
        mov     byte ptr [A0_B_0269E], al
        les     si, [50h]
        mov     ah, byte ptr es:[si+22h]
        mov     byte ptr [A0_B_026A3], ah
        mov     bl, al
        and     bx, 0fh
        mov     byte ptr [bx+A0_W_028ED], 1
        cmp     byte ptr es:[si+27h], 0
        je      br_02744
        mov     cl, byte ptr es:[bx+si+28h]
        jmp     br_02757
br_02744:
        mov     cl, byte ptr [A0_W_CUR_TRACK]
        inc     cl
        mov     ah, byte ptr es:[si+23h]
        sub     ah, 1
        jb      br_02757
        cmp     ah, bl
        jne     loop_0279A
br_02757:
        mov     ch, 0
        cmp     cl, 0
        je      br_02773
        mov     word ptr [A0_B_MIDI1_RX_TRACK], cx
        mov     di, cx
        dec     di
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ch, byte ptr es:[di+580h]
        mov     cl, byte ptr es:[di+5c0h]
br_02773:
        mov     byte ptr [P_26A6], ch
        mov     byte ptr [A0_B_026A7], cl
        mov     bl, al
        and     bx, 70h
        shr     bl, 3
        mov     ax, word ptr cs:[bx+TBL_MIDI_CHAN_STATE]
        mov     word ptr [A0_W_MIDI1_RX_STATE], ax
        ret
TBL_MIDI_CHAN_STATE:
        dw      midi_rx_note_off, midi_rx_note_on, midi_rx_poly_press, midi_rx_control
        dw      midi_rx_program, midi_rx_chan_press, midi_rx_pitch_bend
loop_0279A:
midirx_0279A:
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_0279A
midi_rt_ignore:
        ret
br_027A1:
        push    ds
        mov     ah, 0
        int     4fh
        pop     ds
        ret
fn_027A8:
        mov     ax, ds
        mov     es, ax
        mov     di, A0_W_026A8
        mov     al, 0
        mov     cx, 10h
        rep stosb
        mov     di, A0_W_02E34
        mov     al, 0
        mov     cx, 10h
        rep stosb
        ret
midi_rx_note_off:
midirx_027C1:
        mov     byte ptr [A0_B_MIDI1_RX_DATA1], al
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_027CB
        ret
midirx_027CB:
        mov     cl, 0
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_027C1
        jmp     SHORT br_027E7
midi_rx_note_on:
        mov     byte ptr [A0_B_MIDI1_RX_DATA1], al
        mov     word ptr [A0_W_MIDI1_RX_STATE], P_27DF
        ret
P_27DF:
        db      8ah, 0c8h
        mov     word ptr [A0_W_MIDI1_RX_STATE], midi_rx_note_on
br_027E7:
        call    fn_02D0C
        je      br_027F4
        cmp     byte ptr es:[si+4ah], 0
        jne     br_027F4
        ret
br_027F4:
        mov     ah, byte ptr [A0_B_0269E]
        mov     al, byte ptr [A0_B_MIDI1_RX_DATA1]
        mov     dh, byte ptr [P_26A6]
        mov     dl, byte ptr [A0_B_026A7]
        mov     bx, ax
        shl     bl, 1
        and     bh, 0fh
        shl     bx, 1
        mov     si, bx
        mov     es, word ptr [5ah]
        cmp     cl, 0
        je      br_0284C
        mov     bp, word ptr es:[si]
        or      bp, word ptr es:[si+2]
        je      br_02829
        pusha
        push    es
        mov     cl, 0
        call    fn_02861
        pop     es
        popa
br_02829:
        mov     word ptr es:[si], dx
        mov     di, word ptr [A0_B_MIDI1_RX_TRACK]
        or      di, 100h
        mov     word ptr es:[si+2], di
        mov     ch, byte ptr [A0_B_MIDI1_RX_TRACK]
        call    fn_02DEA
        call    fn_02D16
        call    fn_02DF4
        call    fn_02E48
        call    fn_02F1E
        ret
br_0284C:
        call    fn_02E48
        mov     bl, ah
        and     bx, 0fh
        cmp     byte ptr [bx+A0_W_026A8], 0
        je      fn_02861
        or      byte ptr es:[si+3], 2
        ret
fn_02861:
        push    es
        push    si
        mov     ch, byte ptr [A0_B_MIDI1_RX_TRACK]
        call    fn_02DEA
        call    fn_02D16
        call    fn_02DF4
        call    fn_02F1E
        pop     si
        pop     es
        sub     ax, ax
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], ax
        ret
midi_rx_program:
        call    fn_02D0C
        je      br_0288C
        cmp     byte ptr es:[si+4ch], 0
        jne     br_0288C
        ret
br_0288C:
        mov     cl, al
        inc     cl
        mov     byte ptr [A0_B_0294D], cl
        mov     ah, byte ptr [A0_B_0269E]
        mov     cl, 0
        call    fn_02D5D
        mov     ch, byte ptr [A0_B_026A7]
        call    fn_02DC9
        mov     ch, byte ptr [A0_B_MIDI1_RX_TRACK]
        call    fn_02EF4
        ret
isr_028AC:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, 0
        xchg    al, byte ptr [A0_B_0294D]
        cmp     al, 64h
        jb      isr_028BE
        mov     al, 0
isr_028BE:
        pop     ds
        iret
midi_rx_chan_press:
        call    fn_02D0C
        je      br_028CD
        cmp     byte ptr es:[si+4dh], 0
        jne     br_028CD
        ret
br_028CD:
        mov     ah, byte ptr [A0_B_0269E]
        mov     cl, 0
        call    fn_02D5D
        mov     ch, byte ptr [A0_B_MIDI1_RX_TRACK]
        call    fn_02EF4
        ret
midi_rx_poly_press:
midirx_028DE:
        mov     byte ptr [A0_B_MIDI1_RX_DATA1], al
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_028E8
        ret
midirx_028E8:
        mov     cl, al
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_028DE
        call    fn_02D0C
        je      br_028FD
        cmp     byte ptr es:[si+4eh], 0
        jne     br_028FD
        ret
br_028FD:
        mov     ah, byte ptr [A0_B_0269E]
        mov     al, byte ptr [A0_B_MIDI1_RX_DATA1]
        call    fn_02D5D
        mov     ch, byte ptr [A0_B_MIDI1_RX_TRACK]
        call    fn_02EF4
        ret
midi_rx_control:
midirx_0290F:
        mov     byte ptr [A0_B_MIDI1_RX_DATA1], al
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_02919
        ret
midirx_02919:
        mov     cl, al
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_0290F
        call    fn_02D0C
        je      br_02940
        mov     al, byte ptr [A0_B_MIDI1_RX_DATA1]
        mov     bl, al
        and     bx, 7
        mov     bl, byte ptr [bx+A0_B_026B8]
        shr     al, 3
        mov     ah, 0
        add     si, ax
        and     bl, byte ptr es:[si+50h]
        jne     br_02940
        ret
br_02940:
        mov     ah, byte ptr [A0_B_0269E]
        mov     al, byte ptr [A0_B_MIDI1_RX_DATA1]
        call    fn_034E9
        jae     br_0294D
        ret
br_0294D:
        les     si, [50h]
        cmp     byte ptr es:[si+24h], 0
        je      br_0296E
        cmp     al, 40h
        jne     br_0296E
        mov     bl, ah
        and     bx, 0fh
        mov     byte ptr [bx+A0_W_026A8], cl
        cmp     cl, 0
        jne     BR_0296D
        call    fn_02CB7
BR_0296D:
        ret
br_0296E:
        les     si, [50h]
        inc     al
        cmp     al, byte ptr es:[si+0b2h]
        jne     br_0297F
        mov     byte ptr [1c8h], cl
br_0297F:
        dec     al
        call    fn_02D5D
        mov     ch, byte ptr [A0_B_026A7]
        call    fn_02DC9
        mov     ch, byte ptr [A0_B_MIDI1_RX_TRACK]
        call    fn_02EF4
        ret
midi_rx_pitch_bend:
midirx_02993:
        mov     byte ptr [A0_B_MIDI1_RX_DATA1], al
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_0299D
        ret
midirx_0299D:
        mov     cl, al
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_02993
        call    fn_02D0C
        je      br_029B2
        cmp     byte ptr es:[si+4bh], 0
        jne     br_029B2
        ret
br_029B2:
        mov     ah, byte ptr [A0_B_0269E]
        mov     al, byte ptr [A0_B_MIDI1_RX_DATA1]
        call    fn_02D5D
        mov     ch, byte ptr [A0_B_MIDI1_RX_TRACK]
        call    fn_02EF4
        ret
br_029C4:
        mov     bl, al
        and     bx, 0fh
        shl     bx, 1
        cmp     al, 0f8h
        jb      br_029DF
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 1
        je      br_029D7
        ret
br_029D7:
        cmp     byte ptr [A0_B_SYNC_IN_PORT], 0
        je      br_029DF
        ret
br_029DF:
        jmp     word ptr cs:[bx+TBL_MIDI_SYS_DISPATCH]
TBL_MIDI_SYS_DISPATCH:
        dw      midi_sys_sysex, midi_sys_mtc_qf, midi_sys_song_pos, loop_0279A
        dw      loop_0279A, loop_0279A, loop_0279A, fn_02AE8
        dw      midi_rt_clock_stop, loop_0279A, midi_rt_start_continue, midi_rt_start_continue
        dw      midi_rt_clock_stop, midi_rt_ignore, midi_rt_ignore, loop_0279A
midi_rt_start_continue:
        mov     cx, 1388h
        jmp     SHORT br_02A0C
midi_rt_clock_stop:
        mov     cx, 3e8h
br_02A0C:
        call    fn_02A25
        jae     br_02A12
        ret
br_02A12:
        mov     word ptr [A0_W_028CE], cx
        mov     bx, word ptr [A0_W_028C4]
        mov     byte ptr [bx+A0_B_027C4], al
        inc     bl
        mov     word ptr [A0_W_028C4], bx
        ret
fn_02A25:
        cmp     byte ptr [6bh], 0
        jne     loop_02A41
        cmp     byte ptr [A0_B_0436E], 0
        je      br_02A43
        if      FW_VERSION < 112
        cmp     byte ptr [A0_B_0436E], 3
        je      br_02A43
        endif
        cmp     byte ptr [A0_B_0436E], 4
        je      br_02A43
        if      FW_VERSION >= 112
        cmp     byte ptr [A0_B_0436E], 3
        je      br_02A51
        endif
loop_02A41:
        stc
        if      FW_VERSION >= 110
        ret
        endif
br_02A43:
        if      FW_VERSION >= 110
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[12h], 0
        je      loop_02A41
        if      FW_VERSION >= 112
        clc
        ret
br_02A51:
        endif
        clc
        endif
        ret
midi_sys_song_pos:
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_02A5A
        ret
midirx_02A5A:
        mov     byte ptr [P_26A1], al
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_02A64
        ret
midirx_02A64:
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_0279A
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 1
        je      br_02A72
        ret
br_02A72:
        cmp     byte ptr [A0_B_SYNC_IN_PORT], 0
        je      br_02A7A
        ret
br_02A7A:
        call    fn_02A25
        jae     br_02A80
        ret
br_02A80:
        mov     ch, al
        mov     cl, byte ptr [P_26A1]
        shl     cl, 1
        shr     cx, 1
        mov     ah, 50h
        mov     al, 0
        call    fn_032F4
        ret
midi_sys_sysex:
        call    fn_02D0C
        je      br_02AA1
        cmp     byte ptr es:[si+4fh], 0
        jne     br_02AA1
        jmp     NEAR loop_0279A
br_02AA1:
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_02AAD
        mov     byte ptr [A0_B_MIDI1_SYSEX_ACTIVE], 1
        ret
midirx_02AAD:
        if      FW_VERSION >= 114
        db      3ch, 7eh
        jae     L_02AF9
        else
        db      "<~sH"
        endif
        mov     word ptr [A0_W_MIDI1_RX_STATE], loop_02ABE
        push    ax
        mov     al, 0f0h
        call    loop_02ABE
        pop     ax
loop_02ABE:
        mov     ah, byte ptr [A0_W_CUR_TRACK]
        les     si, [50h]
        cmp     byte ptr es:[si+27h], 0
        je      br_02AD7
        mov     ah, byte ptr es:[si+38h]
        sub     ah, 1
        jae     br_02AD7
        ret
br_02AD7:
        call    fn_02D7D
        mov     bx, word ptr [A0_W_0260A]
        mov     word ptr [bx+A0_W_0250A], ax
        add     byte ptr [A0_W_0260A], 2
        ret
fn_02AE8:
        mov     ah, 0
        xchg    ah, byte ptr [A0_B_MIDI1_SYSEX_ACTIVE]
        cmp     ah, 1
        je      loop_02ABE
        cmp     ah, 2
        je      L_02B24
        ret
L_02AF9:
        mov     si, P_2654
        mov     byte ptr [A0_B_MIDI1_SYSEX_ACTIVE], 2
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_02B0F
        mov     byte ptr [si], al
        inc     si
        mov     word ptr [A0_W_MIDI1_SYSEX_PTR], si
        ret
midirx_02B0F:
        mov     si, word ptr [A0_W_MIDI1_SYSEX_PTR]
        mov     byte ptr [si], al
        inc     si
        mov     word ptr [A0_W_MIDI1_SYSEX_PTR], si
        if      FW_VERSION >= 114
        cmp     si, 2694h
        elseif  FW_VERSION >= 110
        cmp     si, 2678h
        else
        cmp     si, 265ah
        endif
        jae     br_02B21
        ret
br_02B21:
        mov     word ptr [A0_W_MIDI1_RX_STATE], midirx_0279A
        ret
L_02B24:
        mov     si, P_2654
fn_02B2B:
        lodsw
        cmp     ax, 7f7fh
        jne     L_02B58
        lodsw
        cmp     ax, 101h
        je      L_02B58
        mov     bl, 10h
        cmp     ax, 206h
        je      br_02B61
        mov     bl, 20h
        cmp     ax, 306h
        je      br_02B61
        mov     bl, 0
        cmp     ax, 106h
        je      br_02B61
        mov     bl, 30h
        cmp     ax, 606h
        je      br_02B59
        cmp     ax, 4406h
        je      br_02B79
L_02B58:
        ret
br_02B59:
        cmp     byte ptr [A0_B_0436E], 0
        je      br_02B61
        ret
br_02B61:
        cmp     byte ptr [A0_B_04845], 0
        jne     br_02B69
        ret
br_02B69:
        call    fn_02A25
        jae     br_02B6F
        ret
br_02B6F:
        mov     ah, bl
        mov     al, 0
        sub     cx, cx
        call    fn_032F4
        ret
br_02B79:
        lodsw
        cmp     ax, 106h
        je      br_02B80
        ret
br_02B80:
        cmp     byte ptr [A0_B_04845], 0
        jne     br_02B88
        ret
br_02B88:
        call    fn_02A25
        jae     br_02B8E
        ret
br_02B8E:
        mov     ah, byte ptr [si]
        shr     ah, 5
        cmp     ah, byte ptr [A0_B_FRAME_RATE]
        je      br_02B9C
        jmp     br_02C95
br_02B9C:
        mov     bp, si
        push    ds
        pop     es
        call    fn_03D52
        sub     di, word ptr [A0_W_0485E]
        sbb     si, word ptr [A0_W_04860]
        jae     br_02BB1
        sub     di, di
        sub     si, si
br_02BB1:
        mov     cx, di
        mov     ax, si
        or      ah, 40h
        call    fn_032F4
        ret
midi_sys_mtc_qf:
        mov     ax, P_2BC7
        xchg    ax, word ptr [A0_W_MIDI1_RX_STATE]
        mov     word ptr [P_269C], ax
        ret
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 2
        jne     br_02BEB
        cmp     byte ptr [A0_B_SYNC_IN_PORT], 0
        jne     br_02BEB
        call    fn_02A25
        jb      br_02BEB
        mov     bl, al
        and     al, 0fh
        and     bl, 0f0h
        sub     bh, bh
        shr     bl, 3
        call    word ptr cs:[bx+TBL_MTC_QF_PIECE]
br_02BEB:
        mov     ax, word ptr [P_269C]
        mov     word ptr [A0_W_MIDI1_RX_STATE], ax
        ret
TBL_MTC_QF_PIECE:
        dw      mtc_qf_frame_lo, mtc_qf_frame_hi, mtc_qf_sec_lo, mtc_qf_sec_hi
        dw      mtc_qf_min_lo, mtc_qf_min_hi, mtc_qf_hour_lo, mtc_qf_hour_hi
mtc_qf_frame_lo:
        mov     byte ptr [A0_B_028D5], al
        ret
mtc_qf_frame_hi:
        shl     al, 4
        or      byte ptr [A0_B_028D5], al
        ret
mtc_qf_sec_lo:
        mov     byte ptr [A0_B_028D4], al
        ret
mtc_qf_sec_hi:
        shl     al, 4
        or      byte ptr [A0_B_028D4], al
        ret
mtc_qf_min_lo:
        mov     byte ptr [A0_B_028D3], al
        ret
mtc_qf_min_hi:
        shl     al, 4
        or      byte ptr [A0_B_028D3], al
        ret
mtc_qf_hour_lo:
        mov     byte ptr [A0_W_028B6], al
        ret
mtc_qf_hour_hi:
        mov     ah, al
        and     al, 1
        shl     al, 4
        or      byte ptr [A0_W_028B6], al
        shr     ah, 1
        and     ah, 3
        mov     byte ptr [A0_B_028D7], ah
        mov     byte ptr [A0_B_028D6], 0
        cmp     ah, byte ptr [A0_B_FRAME_RATE]
        jne     br_02C95
        push    ds
        pop     es
        mov     bp, A0_W_028B6
        call    fn_03D52
        mov     ax, di
        mov     dx, si
        mov     bl, byte ptr [A0_B_028D7]
        mov     bh, 0
        shl     bx, 1
        add     ax, word ptr [bx+A0_W_028E5]
        adc     dx, 0
        call    fn_02C96
        jae     br_02C6A
        ret
br_02C6A:
        mov     word ptr [P_28CA], ax
        mov     word ptr [P_28CC], dx
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 2
        jne     br_02C7F
        mov     word ptr [A0_W_04300], ax
        mov     word ptr [A0_W_04302], dx
br_02C7F:
        mov     ax, ds
        mov     es, ax
        mov     si, A0_W_028B6
        mov     di, A0_W_028BC
        mov     cx, 5
        rep movsb
        mov     word ptr [A0_W_028D0], 64h
        ret
br_02C95:
        ret
fn_02C96:
        mov     bx, word ptr [A0_W_0485E]
        mov     cx, word ptr [A0_W_04860]
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_02CB2
        push    ax
        push    dx
        callf   EP_L_3578B_SEG:EP_L_3578B_OFF
        pop     dx
        pop     ax
        mov     bx, di
        mov     cx, si
br_02CB2:
        sub     ax, bx
        sbb     dx, cx
        ret
fn_02CB7:
        and     ax, 0f00h
        mov     si, ax
        shl     si, 1
        mov     bx, si
        add     bx, 200h
        or      ah, 90h
        mov     es, word ptr [5ah]
        sub     bp, bp
loop_02CCD:
        cmp     bp, word ptr es:[si+2]
        je      br_02D04
        test    byte ptr es:[si+3], 2
        je      br_02D04
        mov     cx, si
        shr     cx, 2
        and     cl, 7fh
        mov     al, cl
        mov     cl, 0
        mov     dx, word ptr es:[si]
        mov     ch, byte ptr es:[si+2]
        pusha
        push    es
        call    fn_02DEA
        call    fn_02D16
        call    fn_02DF4
        call    fn_02F1E
        pop     es
        popa
        mov     word ptr es:[si], bp
        mov     word ptr es:[si+2], bp
br_02D04:
        add     si, 4
        cmp     si, bx
        jne     loop_02CCD
        ret
fn_02D0C:
        les     si, [50h]
        cmp     byte ptr es:[si+25h], 0
        ret
fn_02D16:
        push    ax
        push    cx
        push    dx
        call    fn_02D20
        pop     dx
        pop     cx
        pop     ax
        ret
fn_02D20:
        cmp     byte ptr [A0_B_026A3], 1
        jae     br_02D28
        ret
br_02D28:
        je      br_02D2D
        jmp     br_03BBE
br_02D2D:
        cmp     cl, 0
        jne     br_02D3A
        mov     dh, byte ptr es:[si+1]
        mov     ch, byte ptr es:[si+2]
br_02D3A:
        cmp     ch, 0
        jne     br_02D40
        ret
br_02D40:
        sub     dh, 1
        jae     br_02D46
        ret
br_02D46:
        and     ah, 0f0h
        cmp     dh, 10h
        jae     br_02D54
        or      ah, dh
        call    fn_03BD6
        ret
br_02D54:
        sub     dh, 10h
        or      ah, dh
        call    fn_03C3C
        ret
fn_02D5D:
        push    ax
        push    cx
        call    fn_02D65
        pop     cx
        pop     ax
        ret
fn_02D65:
        cmp     byte ptr [A0_B_026A3], 1
        jae     br_02D6D
        ret
br_02D6D:
        je      br_02D72
        jmp     br_03BBE
br_02D72:
        and     ah, 0f0h
        mov     ch, byte ptr [P_26A6]
        call    fn_06D23
        ret
fn_02D7D:
        push    ax
        call    fn_02D83
        pop     ax
        ret
fn_02D83:
        les     si, [50h]
        mov     ch, byte ptr es:[si+22h]
        cmp     ch, 1
        jae     br_02D91
        ret
br_02D91:
        je      br_02DA2
        cmp     ch, 3
        jae     br_02D9B
        jmp     fn_03C9C
br_02D9B:
        jne     br_02DA0
        jmp     fn_03CC9
br_02DA0:
        jmp     loop_02DC0
br_02DA2:
        mov     bl, ah
        mov     bh, 0
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ah, byte ptr es:[bx+580h]
        cmp     ah, 0
        jne     br_02DB5
        ret
br_02DB5:
        cmp     ah, 11h
        jae     L_02DB9
        jmp     fn_03C9C
L_02DB9:
        jmp     fn_03CC9
loop_02DC0:
        push    ax
        call    fn_03C9C
        pop     ax
        call    fn_03CC9
        ret
fn_02DC9:
        sub     ch, 1
        jae     br_02DCF
        ret
br_02DCF:
        push    ax
        push    cx
        push    ds
        and     ah, 0f0h
        or      ah, ch
        mov     ch, 1
        if      FW_VERSION >= 110
        push    ax
        push    cx
        call    fn_06A24
        pop     cx
        pop     ax
        else
        mov     dh, 0
        mov     dl, 40h
        endif
        mov     bl, 0
        push    ds
        int     35h
        pop     ds
        pop     ds
        pop     cx
        pop     ax
        ret
fn_02DEA:
        pusha
        push    es
        mov     ch, dl
        call    fn_02DC9
        pop     es
        popa
        ret
fn_02DF4:
        pusha
        call    fn_02DFA
        popa
        ret
fn_02DFA:
        sub     ch, 1
        jae     br_02E00
        ret
br_02E00:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_02E16
        cmp     byte ptr [A0_B_0436E], 1
        je      br_02E16
        cmp     byte ptr [A0_B_PLAY_STATE], 8
        je      br_02E16
        ret
br_02E16:
        cmp     cl, 0
        jne     br_02E32
        mov     bx, ax
        shl     bl, 1
        and     bh, 0fh
        shl     bx, 1
        mov     es, word ptr [5ah]
        mov     ch, byte ptr es:[bx+2]
        sub     ch, 1
        jae     br_02E32
        ret
br_02E32:
        push    ax
        mov     ah, ch
        mov     bx, word ptr [A0_W_023FE]
        mov     word ptr [bx+A0_W_022FE], ax
        mov     word ptr [bx+A0_W_02300], cx
        add     byte ptr [A0_W_023FE], 4
        pop     ax
        ret
fn_02E48:
        push    bx
        push    si
        mov     si, A0_W_02932
        mov     bl, al
        mov     bh, 0
        cmp     cl, 0
        je      br_02E6B
        inc     byte ptr [A0_B_0267C]
        mov     byte ptr [bx+si], cl
        mov     bl, byte ptr [A0_B_0267D]
        mov     byte ptr [bx+si], 0
        mov     byte ptr [A0_B_0267D], 0
        pop     si
        pop     bx
        ret
br_02E6B:
        dec     byte ptr [A0_B_0267C]
        je      br_02E80
        cmp     byte ptr [A0_B_0267C], 1
        je      br_02E7D
        mov     byte ptr [bx+si], cl
        pop     si
        pop     bx
        ret
br_02E7D:
        mov     byte ptr [A0_B_0267D], al
br_02E80:
        pop     si
        pop     bx
        ret
isr_02E83:
        sti
        push    es
        push    bp
        mov     bp, RAM_SEG
        mov     es, bp
        mov     di, A0_W_02932
        mov     cx, 80h
        mov     al, 0
        rep stosb
        mov     byte ptr [A0_B_0267C], 0
        mov     byte ptr [A0_B_0267D], 0
        pop     bp
        pop     es
        iret
isr_02EA2:
        sti
        push    ds
        push    bp
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, 0
        call    fn_02EC5
        call    fn_02EDB
        or      ax, ax
        je      isr_02EC2
        cmp     byte ptr [A0_B_0267C], 0
        jne     isr_02EC2
        push    ax
        int     57h
        pop     ax
isr_02EC2:
        pop     bp
        pop     ds
        iret
fn_02EC5:
        mov     bx, A0_W_02932
        mov     si, bx
        mov     cx, 80h
tgt_02ECD:
        cmp     byte ptr [bx], 0
        jne     br_02ED6
        inc     bx
        loop    tgt_02ECD
        ret
br_02ED6:
        sub     bx, si
        mov     al, bl
        ret
fn_02EDB:
        mov     bx, A0_W_02932
        mov     si, bx
        add     bx, 7fh
        mov     cx, 80h
tgt_02EE6:
        cmp     byte ptr [bx], 0
        jne     br_02EEF
        dec     bx
        loop    tgt_02EE6
        ret
br_02EEF:
        sub     bx, si
        mov     ah, bl
        ret
fn_02EF4:
        sub     ch, 1
        jae     br_02EFA
        ret
br_02EFA:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_02F09
        cmp     byte ptr [A0_B_0436E], 1
        je      br_02F09
        ret
br_02F09:
        and     ah, 0f0h
        mov     bx, word ptr [A0_W_02504]
        mov     word ptr [bx+A0_W_02404], ax
        mov     word ptr [bx+A0_W_02406], cx
        add     byte ptr [A0_W_02504], 4
        ret
fn_02F1E:
        mov     bx, A0_W_02610
        cmp     cl, 0
        je      br_02F5C
        add     bx, word ptr [A0_W_02650]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
        mov     word ptr [bx+4], dx
        add     word ptr [A0_W_02650], 8
        and     word ptr [A0_W_02650], 1fh
        ret
fn_02F3D:
        mov     bx, A0_W_02614
        cmp     cl, 0
        je      br_02F5C
        add     bx, word ptr [A0_W_02652]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], cx
        mov     word ptr [bx+4], dx
        add     word ptr [A0_W_02652], 8
        and     word ptr [A0_W_02652], 1fh
        ret
br_02F5C:
        mov     cx, 4
tgt_02F5F:
        cmp     al, byte ptr [bx]
        je      br_02F69
        add     bx, 8
        loop    tgt_02F5F
        ret
br_02F69:
        sub     ax, ax
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], ax
        mov     word ptr [bx+4], ax
        ret
fn_02F74:
        mov     bx, word ptr [A0_W_02AD0]
        cmp     bx, word ptr [A0_W_02ACE]
        je      br_02F8D
        mov     al, byte ptr [bx+A0_B_029CE]
        inc     bl
        mov     word ptr [A0_W_02AD0], bx
        call    fn_02FB8
        jmp     fn_02F74
br_02F8D:
        call    fn_0681B
        cmp     byte ptr [A0_B_MIDI2_SYSEX_ACTIVE], 0
        jne     br_02F98
        ret
br_02F98:
        int     77h
        mov     word ptr [A0_W_0267A], ax
loop_02F9D:
        mov     bx, word ptr [A0_W_02AD0]
        cmp     bx, word ptr [A0_W_02ACE]
        jne     fn_02F74
        int     77h
        sub     ax, word ptr [A0_W_0267A]
        cmp     ax, 1eh
        jb      loop_02F9D
        mov     al, 0f7h
        call    fn_0335C
        ret
fn_02FB8:
        cmp     byte ptr [A0_B_0436E], 5
        jne     br_02FC2
        jmp     br_03078
br_02FC2:
        cmp     byte ptr [6bh], 0
        je      br_02FCA
        ret
br_02FCA:
        cmp     al, 0f0h
        jb      br_02FD1
        jmp     br_03275
br_02FD1:
        test    al, 80h
        jne     br_02FE5
        mov     bl, byte ptr [A0_B_02E0E]
        and     bx, 0fh
        mov     byte ptr [bx+A0_W_028FD], 1
        jmp     word ptr [A0_W_MIDI2_RX_STATE]
br_02FE5:
        cmp     byte ptr [A0_B_MIDI2_SYSEX_ACTIVE], 0
        je      br_02FF3
        push    ax
        mov     al, 0f7h
        call    fn_0335C
        pop     ax
br_02FF3:
        mov     byte ptr [A0_B_02E0E], al
        les     si, [50h]
        mov     ah, byte ptr es:[si+22h]
        mov     byte ptr [A0_B_026A3], ah
        mov     bl, al
        and     bx, 0fh
        mov     byte ptr [bx+A0_W_028FD], 1
        cmp     byte ptr es:[si+27h], 0
        je      br_03019
        mov     cl, byte ptr es:[bx+si+39h]
        jmp     br_0302C
br_03019:
        mov     cl, byte ptr [A0_W_CUR_TRACK]
        inc     cl
        mov     ah, byte ptr es:[si+23h]
        sub     ah, 1
        jb      br_0302C
        cmp     ah, bl
        jne     fn_03071
br_0302C:
        mov     ch, 0
        cmp     cl, 0
        je      br_03048
        mov     di, cx
        mov     word ptr [A0_B_MIDI2_RX_TRACK], cx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        dec     di
        mov     ch, byte ptr es:[di+580h]
        mov     cl, byte ptr es:[di+5c0h]
br_03048:
        mov     byte ptr [A0_B_02E32], ch
        mov     byte ptr [A0_B_02E33], cl
        mov     bl, al
        and     bx, 70h
        shr     bl, 3
        mov     bh, 0
        mov     ax, word ptr cs:[bx+TBL_MIDI2_CHAN_STATE]
        mov     word ptr [A0_W_MIDI2_RX_STATE], ax
        ret
TBL_MIDI2_CHAN_STATE:
        dw      midi2_rx_note_off, midi2_rx_note_on, midi2_rx_poly_press, midi2_rx_control
        dw      midi2_rx_program, midi2_rx_chan_press, midi2_rx_pitch_bend
fn_03071:
midirx_03071:
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03071
midi2_rt_ignore:
        ret
br_03078:
        push    ds
        mov     ah, 1
        int     4fh
        pop     ds
        ret
midi2_rx_note_off:
midirx_0307F:
        mov     byte ptr [A0_B_MIDI2_RX_DATA1], al
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03089
        ret
midirx_03089:
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_0307F
        mov     cl, 0
        jmp     SHORT br_030A5
midi2_rx_note_on:
        mov     byte ptr [A0_B_MIDI2_RX_DATA1], al
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_0309D
        ret
midirx_0309D:
        db      8ah, 0c8h
        mov     word ptr [A0_W_MIDI2_RX_STATE], midi2_rx_note_on
br_030A5:
        call    fn_02D0C
        je      br_030B2
        cmp     byte ptr es:[si+4ah], 0
        jne     br_030B2
        ret
br_030B2:
        mov     ah, byte ptr [A0_B_02E0E]
        mov     al, byte ptr [A0_B_MIDI2_RX_DATA1]
        mov     dh, byte ptr [A0_B_02E32]
        mov     dl, byte ptr [A0_B_02E33]
        mov     bx, ax
        shl     bl, 1
        and     bh, 0fh
        shl     bx, 1
        mov     si, bx
        mov     es, word ptr [5ch]
        cmp     cl, 0
        je      br_0310A
        mov     bp, word ptr es:[si]
        or      bp, word ptr es:[si+2]
        je      br_030E7
        pusha
        push    es
        mov     cl, 0
        call    fn_0311F
        pop     es
        popa
br_030E7:
        mov     word ptr es:[si], dx
        mov     di, word ptr [A0_B_MIDI2_RX_TRACK]
        or      di, 100h
        mov     word ptr es:[si+2], di
        mov     ch, byte ptr [A0_B_MIDI2_RX_TRACK]
        call    fn_02DEA
        call    fn_02D16
        call    fn_03495
        call    fn_02E48
        call    fn_02F3D
        ret
br_0310A:
        call    fn_02E48
        mov     bl, ah
        and     bx, 0fh
        cmp     byte ptr [bx+A0_W_02E34], 0
        je      fn_0311F
        or      byte ptr es:[si+3], 2
        ret
fn_0311F:
        mov     ch, byte ptr [A0_B_MIDI2_RX_TRACK]
        push    es
        push    si
        call    fn_02DEA
        call    fn_02D16
        call    fn_03495
        call    fn_02F3D
        pop     si
        pop     es
        sub     ax, ax
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], ax
        ret
midi2_rx_program:
        call    fn_02D0C
        je      br_0314A
        cmp     byte ptr es:[si+4ch], 0
        jne     br_0314A
        ret
br_0314A:
        mov     cl, al
        inc     cl
        mov     byte ptr [A0_B_0294D], cl
        mov     ah, byte ptr [A0_B_02E0E]
        mov     cl, 0
        call    fn_03431
        mov     ch, byte ptr [A0_B_02E33]
        call    fn_02DC9
        mov     ch, byte ptr [A0_B_MIDI2_RX_TRACK]
        call    fn_02EF4
        ret
midi2_rx_chan_press:
        call    fn_02D0C
        je      br_03177
        cmp     byte ptr es:[si+4dh], 0
        jne     br_03177
        ret
br_03177:
        mov     ah, byte ptr [A0_B_02E0E]
        mov     cl, 0
        call    fn_03431
        mov     ch, byte ptr [A0_B_MIDI2_RX_TRACK]
        call    fn_02EF4
        ret
midi2_rx_poly_press:
midirx_03188:
        mov     byte ptr [A0_B_MIDI2_RX_DATA1], al
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03192
        ret
midirx_03192:
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03188
        mov     cl, al
        call    fn_02D0C
        je      br_031A7
        cmp     byte ptr es:[si+4eh], 0
        jne     br_031A7
        ret
br_031A7:
        mov     ah, byte ptr [A0_B_02E0E]
        mov     al, byte ptr [A0_B_MIDI2_RX_DATA1]
        call    fn_03431
        mov     ch, byte ptr [A0_B_MIDI2_RX_TRACK]
        call    fn_02EF4
        ret
midi2_rx_control:
midirx_031B9:
        mov     byte ptr [A0_B_MIDI2_RX_DATA1], al
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_031C3
        ret
midirx_031C3:
        mov     cl, al
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_031B9
        call    fn_02D0C
        je      br_031EA
        mov     al, byte ptr [A0_B_MIDI2_RX_DATA1]
        mov     bl, al
        and     bx, 7
        mov     bl, byte ptr [bx+A0_B_026B8]
        shr     al, 3
        mov     ah, 0
        add     si, ax
        and     bl, byte ptr es:[si+50h]
        jne     br_031EA
        ret
br_031EA:
        mov     ah, byte ptr [A0_B_02E0E]
        mov     al, byte ptr [A0_B_MIDI2_RX_DATA1]
        call    fn_034E9
        jae     br_031F7
        ret
br_031F7:
        les     si, [50h]
        cmp     byte ptr es:[si+24h], 0
        je      br_03218
        cmp     al, 40h
        jne     br_03218
        mov     bl, ah
        and     bx, 0fh
        mov     byte ptr [bx+A0_W_02E34], cl
        cmp     cl, 0
        jne     BR_03217
        call    fn_033DC
BR_03217:
        ret
br_03218:
        les     si, [50h]
        inc     al
        cmp     al, byte ptr es:[si+0b2h]
        jne     br_03229
        mov     byte ptr [1c8h], cl
br_03229:
        dec     al
        mov     ah, byte ptr [A0_B_02E0E]
        mov     al, byte ptr [A0_B_MIDI2_RX_DATA1]
        call    fn_03431
        mov     ch, byte ptr [A0_B_02E33]
        call    fn_02DC9
        mov     ch, byte ptr [A0_B_MIDI2_RX_TRACK]
        call    fn_02EF4
        ret
midi2_rx_pitch_bend:
midirx_03244:
        mov     byte ptr [A0_B_MIDI2_RX_DATA1], al
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_0324E
        ret
midirx_0324E:
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03244
        mov     cl, al
        call    fn_02D0C
        je      br_03263
        cmp     byte ptr es:[si+4bh], 0
        jne     br_03263
        ret
br_03263:
        mov     ah, byte ptr [A0_B_02E0E]
        mov     al, byte ptr [A0_B_MIDI2_RX_DATA1]
        call    fn_03431
        mov     ch, byte ptr [A0_B_MIDI2_RX_TRACK]
        call    fn_02EF4
        ret
br_03275:
        mov     bl, al
        and     bx, 0fh
        shl     bx, 1
        cmp     al, 0f8h
        jb      br_03290
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 1
        je      br_03288
        ret
br_03288:
        cmp     byte ptr [A0_B_SYNC_IN_PORT], 1
        je      br_03290
        ret
br_03290:
        jmp     word ptr cs:[bx+TBL_MIDI2_SYS_DISPATCH]
TBL_MIDI2_SYS_DISPATCH:
        dw      midi2_sys_sysex, midi2_sys_mtc_qf, midi2_sys_song_pos, fn_03071
        dw      fn_03071, fn_03071, fn_03071, fn_0335C
        dw      midi_rt_clock_stop, fn_03071, midi_rt_start_continue, midi_rt_start_continue
        dw      midi_rt_clock_stop, midi2_rt_ignore, midi2_rt_ignore, fn_03071
midi2_sys_song_pos:
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_032BC
        ret
midirx_032BC:
        mov     byte ptr [P_2E2E], al
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_032C6
        ret
midirx_032C6:
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03071
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 1
        je      br_032D4
        ret
br_032D4:
        cmp     byte ptr [A0_B_SYNC_IN_PORT], 1
        je      br_032DC
        ret
br_032DC:
        call    fn_02A25
        jae     br_032E2
        ret
br_032E2:
        mov     ch, al
        mov     cl, byte ptr [P_2E2E]
        shl     cl, 1
        shr     cx, 1
        mov     ah, 50h
        mov     al, 0
        call    fn_032F4
        ret
fn_032F4:
        mov     bx, word ptr [A0_W_027C0]
        mov     word ptr [bx+A0_TBL_026C0], cx
        mov     word ptr [bx+A0_W_026C2], ax
        add     byte ptr [A0_W_027C0], 4
        ret
midi2_sys_sysex:
        call    fn_02D0C
        je      br_03315
        cmp     byte ptr es:[si+4fh], 0
        jne     br_03315
        jmp     NEAR fn_03071
br_03315:
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03321
        mov     byte ptr [A0_B_MIDI2_SYSEX_ACTIVE], 1
        ret
midirx_03321:
        if      FW_VERSION >= 114
        db      "<~sK"
        mov     word ptr [A0_W_MIDI2_RX_STATE], loop_03332
        push    ax
        mov     al, 0f0h
        call    loop_03332
        else
        db      3ch, 7eh, 73h, 4bh
        mov     word ptr [A0_W_MIDI2_RX_STATE], loop_03332
        db      50h, 0b0h, 0f0h, 0e8h, 01h, 00h
        endif
        db      58h
loop_03332:
        mov     ah, byte ptr [A0_W_CUR_TRACK]
        les     si, [50h]
        cmp     byte ptr es:[si+27h], 0
        je      br_0334B
        mov     ah, byte ptr es:[si+49h]
        sub     ah, 1
        jae     br_0334B
        ret
br_0334B:
        call    fn_03451
        mov     bx, word ptr [A0_W_02DDE]
        mov     word ptr [bx+A0_W_02CDE], ax
        add     byte ptr [A0_W_02DDE], 2
        ret
fn_0335C:
        call    fn_03071
        mov     ah, 0
        xchg    ah, byte ptr [A0_B_MIDI2_SYSEX_ACTIVE]
        cmp     ah, 1
        je      loop_03332
        cmp     ah, 2
        je      br_0339F
        ret
        mov     si, P_2DE4
        mov     byte ptr [A0_B_MIDI2_SYSEX_ACTIVE], 2
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03386
        mov     byte ptr [si], al
        inc     si
        mov     word ptr [A0_W_MIDI2_SYSEX_PTR], si
        ret
midirx_03386:
        mov     si, word ptr [A0_W_MIDI2_SYSEX_PTR]
        mov     byte ptr [si], al
        inc     si
        mov     word ptr [A0_W_MIDI2_SYSEX_PTR], si
        if      FW_VERSION >= 114
        cmp     si, 2e24h
        elseif  FW_VERSION >= 110
        cmp     si, 2e08h
        else
        cmp     si, 2deah
        endif
        jae     br_03398
        ret
br_03398:
        mov     word ptr [A0_W_MIDI2_RX_STATE], midirx_03071
        ret
br_0339F:
        mov     si, P_2DE4
        call    fn_02B2B
        ret
midi2_sys_mtc_qf:
        mov     ax, P_33B1
        xchg    ax, word ptr [A0_W_MIDI2_RX_STATE]
        mov     word ptr [A0_W_02E28], ax
        ret
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 2
        jne     br_033D5
        cmp     byte ptr [A0_B_SYNC_IN_PORT], 1
        jne     br_033D5
        call    fn_02A25
        jb      br_033D5
        mov     bl, al
        and     al, 0fh
        and     bl, 0f0h
        sub     bh, bh
        shr     bl, 3
        call    word ptr cs:[bx+TBL_MTC_QF_PIECE]
br_033D5:
        mov     ax, word ptr [A0_W_02E28]
        mov     word ptr [A0_W_MIDI2_RX_STATE], ax
        ret
fn_033DC:
        and     ax, 0f00h
        mov     si, ax
        shl     si, 1
        mov     bx, si
        add     bx, 200h
        or      ah, 90h
        mov     es, word ptr [5ch]
        sub     bp, bp
loop_033F2:
        cmp     bp, word ptr es:[si+2]
        je      br_03429
        test    byte ptr es:[si+3], 2
        je      br_03429
        mov     cx, si
        shr     cx, 2
        and     cl, 7fh
        mov     al, cl
        mov     cl, 0
        mov     dx, word ptr es:[si]
        mov     ch, byte ptr es:[si+2]
        pusha
        push    es
        call    fn_02DEA
        call    fn_02D16
        call    fn_03495
        call    fn_02F3D
        pop     es
        popa
        mov     word ptr es:[si], bp
        mov     word ptr es:[si+2], bp
br_03429:
        add     si, 4
        cmp     si, bx
        jne     loop_033F2
        ret
fn_03431:
        push    ax
        push    cx
        call    fn_03439
        pop     cx
        pop     ax
        ret
fn_03439:
        cmp     byte ptr [A0_B_026A3], 1
        jae     br_03441
        ret
br_03441:
        je      br_03446
        jmp     br_03BBE
br_03446:
        and     ah, 0f0h
        mov     ch, byte ptr [A0_B_02E32]
        call    fn_06D23
        ret
fn_03451:
        push    ax
        call    fn_03457
        pop     ax
        ret
fn_03457:
        les     si, [50h]
        mov     ch, byte ptr es:[si+22h]
        cmp     ch, 1
        jae     br_03465
        ret
br_03465:
        je      br_03477
        cmp     ch, 3
        jae     br_0346F
        jmp     fn_03C9C
br_0346F:
        jne     br_03474
        jmp     fn_03CC9
br_03474:
        jmp     loop_02DC0
br_03477:
        mov     bl, ah
        mov     bh, 0
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ah, byte ptr es:[bx+580h]
        cmp     ah, 0
        jne     br_0348A
        ret
br_0348A:
        cmp     ah, 11h
        jae     L_0348E
        jmp     fn_03C9C
L_0348E:
        jmp     fn_03CC9
fn_03495:
        pusha
        call    fn_0349B
        popa
        ret
fn_0349B:
        sub     ch, 1
        jae     br_034A1
        ret
br_034A1:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_034B7
        cmp     byte ptr [A0_B_0436E], 1
        je      br_034B7
        cmp     byte ptr [A0_B_PLAY_STATE], 8
        je      br_034B7
        ret
br_034B7:
        cmp     cl, 0
        jne     br_034D3
        mov     bx, ax
        shl     bl, 1
        and     bh, 0fh
        shl     bx, 1
        mov     es, word ptr [5ch]
        mov     ch, byte ptr es:[bx+2]
        sub     ch, 1
        jae     br_034D3
        ret
br_034D3:
        push    ax
        mov     ah, ch
        mov     bx, word ptr [A0_W_02BD2]
        mov     word ptr [bx+A0_W_02AD2], ax
        mov     word ptr [bx+A0_W_02AD4], cx
        add     byte ptr [A0_W_02BD2], 4
        pop     ax
        ret
fn_034E9:
        mov     dx, ax
        inc     dl
        mov     si, A0_W_04846
        call    fn_03508
        jae     br_034F6
        ret
br_034F6:
        call    fn_03508
        jae     br_034FC
        ret
br_034FC:
        call    fn_03508
        jae     br_03502
        ret
br_03502:
        call    fn_03508
        ret
        db      0f8h, 0c3h
fn_03508:
        cmp     dl, byte ptr [si]
        jne     br_03522
        mov     bl, byte ptr [si+1]
        mov     bh, 0
        shl     bx, 1
        cmp     cl, 40h
        call    word ptr cs:[bx+TBL_03527]
        mov     byte ptr [64h], 1
        stc
        ret
br_03522:
        add     si, 2
        clc
        ret
TBL_03527:
        dw      tgt_0356B, fn_03578, tgt_03585, loop_03592
        dw      loop_035A5, tgt_035B8, tgt_035DA, tgt_035FC
        dw      tgt_03607, tgt_03614, tgt_03621, tgt_0362E
        dw      tgt_0363B, tgt_0363B, tgt_0363B, tgt_0363B
        dw      tgt_0363B, tgt_0363B, tgt_0363B, tgt_0363B
        dw      tgt_0363B, tgt_0363B, tgt_0363B, tgt_0363B
        dw      tgt_0363B, tgt_0363B, tgt_0363B, tgt_0363B
        dw      tgt_03674, tgt_03679, tgt_0367E, tgt_03683
        dw      tgt_03688, tgt_0368D
tgt_0356B:
        jae     tgt_0356E
        ret
tgt_0356E:
        mov     ax, 156h
        call    fn_036A3
        call    fn_0369A
        ret
fn_03578:
        jae     br_0357B
        ret
br_0357B:
        mov     ax, 150h
        call    fn_036A3
        call    fn_0369A
        ret
tgt_03585:
        jae     br_03588
        ret
br_03588:
        mov     ax, 14ah
        call    fn_036A3
        call    fn_0369A
        ret
loop_03592:
        jae     br_03595
        ret
br_03595:
        mov     ax, 13eh
        call    fn_036A3
        call    fn_03578
        mov     ax, 13eh
        call    fn_0369A
        ret
loop_035A5:
        jae     br_035A8
        ret
br_035A8:
        mov     ax, 144h
        call    fn_036A3
        call    fn_03578
        mov     ax, 144h
        call    fn_0369A
        ret
tgt_035B8:
        jae     br_035BB
        ret
br_035BB:
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        je      fn_03578
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        je      loop_03592
        cmp     byte ptr [A0_B_REC_REPLACE], 0
        je      loop_03592
        mov     ax, 13eh
        call    fn_036A3
        call    fn_0369A
        ret
tgt_035DA:
        jae     br_035DD
        ret
br_035DD:
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        je      fn_03578
        cmp     byte ptr [A0_B_REC_REPLACE], 0
        jne     loop_035A5
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        je      loop_035A5
        mov     ax, 144h
        call    fn_036A3
        call    fn_0369A
        ret
tgt_035FC:
        mov     ax, 0a2h
        jae     br_03604
        jmp     fn_0369A
br_03604:
        jmp     fn_036A3
tgt_03607:
        jae     br_0360A
        ret
br_0360A:
        mov     ax, 0fch
        call    fn_036A3
        call    fn_0369A
        ret
tgt_03614:
        jae     br_03617
        ret
br_03617:
        mov     ax, 102h
        call    fn_036A3
        call    fn_0369A
        ret
tgt_03621:
        jae     br_03624
        ret
br_03624:
        mov     ax, 108h
        call    fn_036A3
        call    fn_0369A
        ret
tgt_0362E:
        jae     br_03631
        ret
br_03631:
        mov     ax, 10eh
        call    fn_036A3
        call    fn_0369A
        ret
tgt_0363B:
        mov     al, 7fh
        jae     br_03641
        mov     al, 0
br_03641:
        shr     bl, 1
        sub     bl, 9
        mov     cl, al
        mov     ch, 0
        mov     bh, 0
        mov     byte ptr [bx+A0_TBL_004DE], al
        or      bl, byte ptr [A0_B_PAD_BANK]
        les     si, cs:[180h]
        mov     al, byte ptr es:[bx+si]
        mov     ah, bl
        cli
        mov     bx, word ptr [A0_W_002CC]
        mov     ch, 40h
        mov     word ptr [bx+1cch], ax
        mov     word ptr [bx+1ceh], cx
        add     byte ptr [A0_W_002CC], 4
        sti
        ret
tgt_03674:
        mov     ax, 60h
        jmp     SHORT L_0368C
tgt_03679:
        mov     ax, 66h
        jmp     SHORT L_0368C
tgt_0367E:
        mov     ax, 6ch
        jmp     SHORT L_0368C
tgt_03683:
        mov     ax, 72h
        jmp     SHORT L_0368C
tgt_03688:
        mov     ax, 78h
        jmp     SHORT L_0368C
tgt_0368D:
        mov     ax, 7eh
L_0368C:
        jae     br_03693
        ret
br_03693:
        call    fn_036A3
        call    fn_0369A
        ret
fn_0369A:
        push    ax
        or      ah, 80h
        call    fn_036A3
        pop     ax
        ret
fn_036A3:
        cli
        mov     bl, byte ptr [A0_B_001B7]
        sub     bh, bh
        mov     word ptr [bx+0b6h], ax
        add     byte ptr [A0_B_001B7], 2
        sti
        ret
isr_036B5:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        DISP_ERASE      42h, 0eh, 0a0h, 06h
        DISP_ERASE      42h, 22h, 0a0h, 06h
        if      FW_VERSION < 110
        mov     si, 28b3h
        elseif  FW_VERSION < 114
        mov     si, 28d1h
        else
        mov     si, 28edh
        endif
        mov     di, A0_W_0292D
        mov     dl, 0
        mov     ch, 0eh
isr_036D3:
        call    fn_036F6
        inc     si
        inc     di
        inc     dl
        cmp     dl, 10h
        jne     isr_036D3
        mov     dl, 0
        mov     ch, 22h
isr_036E3:
        call    fn_036F6
        inc     si
        inc     di
        inc     dl
        cmp     dl, 10h
        jne     isr_036E3
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        pop     ds
        iret
fn_036F6:
        mov     ax, 0
        cmp     byte ptr [di], 0
        jne     br_0370A
        xchg    ah, byte ptr [si]
        cmp     ah, 0
        jne     L_03706
        ret
L_03706:
        mov     byte ptr [di], 2
        ret
br_0370A:
        dec     byte ptr [di]
        mov     al, 0ah
        mul     dl
        add     al, 42h
        mov     cl, al
        mov     ah, 6
        mov     al, 6
        mov     bl, 13h
        int     90h
        ret
fn_0371D:
        mov     byte ptr [A0_B_MTC_TX_PIECE], 0ffh
        mov     byte ptr [A0_B_02FF2], 1
        if      FW_VERSION >= 112
        mov     word ptr [A0_W_03018], 0
        mov     word ptr [A0_W_0301A], 0
        cmp     byte ptr [A0_B_0436E], 3
        je      br_0373B
        endif
        ret
        if      FW_VERSION >= 112
br_0373B:
        int     0e2h
        mov     word ptr [A0_W_03018], ax
        mov     word ptr [A0_W_0301A], dx
        ret
        endif
fn_03745:
        cmp     byte ptr [A0_B_SYNC_OUT_MODE], 2
        je      br_0374D
        ret
br_0374D:
        cmp     byte ptr [A0_B_PLAY_STATE], 2
        je      br_03755
        ret
br_03755:
        cmp     byte ptr [A0_B_MTC_TX_PIECE], 0ffh
        jne     br_03767
        call    fn_03819
        jb      br_03762
        ret
br_03762:
        mov     byte ptr [A0_B_MTC_TX_PIECE], 0
br_03767:
        dec     byte ptr [A0_B_02FF2]
        je      br_0376E
        ret
br_0376E:
        mov     bl, byte ptr [A0_B_MTC_TX_PIECE]
        mov     ah, bl
        shl     ah, 4
        sub     bh, bh
        shl     bx, 1
        call    word ptr cs:[bx+TBL_MTC_TX_PIECE]
        or      al, ah
        mov     ah, 0f1h
        mov     cl, 0ffh
        call    fn_03A51
        inc     byte ptr [A0_B_MTC_TX_PIECE]
        cmp     byte ptr [A0_B_MTC_TX_PIECE], 8
        jne     br_03799
        mov     byte ptr [A0_B_MTC_TX_PIECE], 0
br_03799:
        call    fn_037FA
        ret
TBL_MTC_TX_PIECE:
        dw      mtc_tx_frame_lo, mtc_tx_frame_hi, mtc_tx_sec_lo, mtc_tx_sec_hi
        dw      mtc_tx_min_lo, mtc_tx_min_hi, mtc_tx_hour_lo, mtc_tx_hour_hi
mtc_tx_frame_lo:
        mov     si, A0_B_0302F
        mov     di, A0_W_03008
        mov     ax, ds
        mov     es, ax
        mov     cx, 5
        rep movsb
        mov     ah, 0
        mov     al, byte ptr [A0_B_0300B]
        and     al, 0fh
        ret
mtc_tx_frame_hi:
        mov     al, byte ptr [A0_B_0300B]
        shr     al, 4
        ret
mtc_tx_sec_lo:
        mov     al, byte ptr [A0_B_0300A]
        and     al, 0fh
        ret
mtc_tx_sec_hi:
        mov     al, byte ptr [A0_B_0300A]
        shr     al, 4
        ret
mtc_tx_min_lo:
        mov     al, byte ptr [A0_B_03009]
        and     al, 0fh
        ret
mtc_tx_min_hi:
        mov     al, byte ptr [A0_B_03009]
        shr     al, 4
        ret
mtc_tx_hour_lo:
        mov     al, byte ptr [A0_W_03008]
        and     al, 0fh
        ret
mtc_tx_hour_hi:
        mov     al, byte ptr [A0_W_03008]
        shr     al, 4
        push    ax
        call    fn_03872
        call    fn_03872
        pop     ax
        ret
fn_037FA:
        mov     bl, byte ptr [A0_B_FRAME_RATE]
        sub     bh, bh
        shl     bx, 1
        mov     si, word ptr [bx+A0_W_03010]
        mov     bl, byte ptr [A0_B_0300B]
        sub     bh, bh
        shl     bx, 2
        add     bl, byte ptr [A0_B_MTC_TX_PIECE]
        mov     al, byte ptr [bx+si]
        mov     byte ptr [A0_B_02FF2], al
        ret
fn_03819:
        if      FW_VERSION >= 112
        int     0c0h
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_03834
        int     76h
        mov     di, 3e8h
        mov     si, 0
        int     0b8h
        add     ax, word ptr [A0_W_03018]
        adc     dx, word ptr [A0_W_0301A]
br_03834:
        elseif  FW_VERSION >= 110
        call    L_036FE
        else
        call    fn_039F6
        endif
        push    ax
        push    dx
        mov     di, 27c0h
        mov     si, 9
        call    X_014EE
        mov     ax, di
        mov     dx, si
        mov     di, 3e8h
        cmp     byte ptr [A0_B_FRAME_RATE], 2
        jne     br_0384E
        inc     di
br_0384E:
        sub     si, si
        call    X_014EE
        mov     ax, di
        mov     bl, byte ptr [A0_B_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+P_28DD]
        mul     bx
        mov     cx, 3e8h
        div     cx
        cmp     dx, bx
        pop     dx
        pop     ax
        jb      br_0386D
        ret
br_0386D:
        call    fn_038EA
        stc
        if      (FW_VERSION >= 110) && (FW_VERSION < 112)
        ret
L_036FE:
        cmp     byte ptr [A0_B_0436E], 3
        je      L_03708
        int     0c0h
        ret
L_03708:
        int     0e2h
        add     ax, word ptr [A0_W_04318]
        adc     dx, word ptr [A0_W_0431A]
        endif
        ret
fn_03872:
        inc     byte ptr [A0_B_MTC_GEN_FRAMES]
        mov     al, byte ptr [A0_B_MTC_GEN_FRAMES]
        mov     bl, byte ptr [A0_B_FRAME_RATE]
        mov     bh, 0
        cmp     al, byte ptr [bx+A0_B_028DD]
        jne     br_038C1
        mov     byte ptr [A0_B_MTC_GEN_FRAMES], 0
        inc     byte ptr [A0_B_MTC_GEN_SECONDS]
        cmp     byte ptr [A0_B_MTC_GEN_SECONDS], 3ch
        jne     br_038C1
        mov     byte ptr [A0_B_MTC_GEN_SECONDS], 0
        inc     byte ptr [A0_B_MTC_GEN_MINUTES]
        cmp     byte ptr [A0_B_MTC_GEN_MINUTES], 3ch
        jne     br_038C1
        mov     byte ptr [A0_B_MTC_GEN_MINUTES], 0
        mov     al, byte ptr [A0_B_0302F]
        mov     ah, al
        and     ah, 0e0h
        and     al, 1fh
        inc     al
        cmp     al, 18h
        jne     br_038BC
        mov     al, 0
br_038BC:
        or      al, ah
        if      FW_VERSION >= 110
        mov     byte ptr [A0_B_0302F], al
        else
        mov     byte ptr [2ff1h], ah
        endif
br_038C1:
        cmp     byte ptr [A0_B_FRAME_RATE], 2
        jne     br_038E9
        cmp     byte ptr [A0_B_MTC_GEN_FRAMES], 0
        jne     br_038E9
        mov     al, byte ptr [A0_B_MTC_GEN_MINUTES]
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        cmp     ah, 0
        je      br_038E9
        cmp     byte ptr [A0_B_MTC_GEN_SECONDS], 0
        jne     br_038E9
        mov     byte ptr [A0_B_MTC_GEN_FRAMES], 2
br_038E9:
        ret
fn_038EA:
        cmp     byte ptr [A0_B_FRAME_RATE], 2
        jne     br_038F3
        jmp     br_03962
br_038F3:
        if      FW_VERSION >= 112
        mov     byte ptr [A0_B_0300F], 0
        else
        mov     byte ptr [A0_B_02FF3], 0
        endif
        mov     di, 3e8h
        sub     si, si
        call    X_014EE
        cmp     dx, 1
        ja      br_0390F
        cmp     dx, 0
        je      br_03915
        cmp     ax, 5180h
        jb      br_03915
br_0390F:
        sub     ax, 5180h
        sbb     dx, 1
br_03915:
        push    di
        mov     di, 0e10h
        sub     si, si
        call    X_014EE
        cmp     al, 18h
        jb      br_03924
        sub     al, 18h
br_03924:
        and     al, 1fh
        mov     ah, byte ptr [A0_B_FRAME_RATE]
        shl     ah, 5
        or      al, ah
        mov     byte ptr [A0_B_0302F], al
        mov     ax, di
        mov     bl, 3ch
        div     bl
        mov     byte ptr [A0_B_MTC_GEN_MINUTES], al
        mov     byte ptr [A0_B_MTC_GEN_SECONDS], ah
        pop     ax
        mov     bl, byte ptr [A0_B_FRAME_RATE]
        mov     bh, 0
        mov     dl, byte ptr [bx+A0_B_028DD]
        mov     bl, dl
        mov     dh, 0
        mul     dx
        mov     cx, 3e8h
        div     cx
        mov     byte ptr [A0_B_MTC_GEN_FRAMES], al
        mov     ax, dx
        mov     bl, 0ah
        div     bl
        mov     byte ptr [A0_B_03017], al
        ret
br_03962:
        mov     di, 27c0h
        mov     si, 9
        call    X_014EE
        push    di
        push    si
        mov     bx, 6
        div     bx
        cmp     al, 18h
        jb      br_03978
        sub     al, 18h
br_03978:
        and     al, 1fh
        or      al, 40h
        mov     byte ptr [A0_B_0302F], al
        mov     al, 0ah
        mul     dl
        mov     byte ptr [A0_B_MTC_GEN_MINUTES], al
        pop     dx
        pop     ax
        mov     bx, 3e9h
        div     bx
        push    dx
        mov     bl, 3ch
        div     bl
        mov     cl, al
        add     byte ptr [A0_B_MTC_GEN_MINUTES], al
        mov     byte ptr [A0_B_MTC_GEN_SECONDS], ah
        pop     ax
        mov     bx, 1eh
        mul     bx
        mov     bx, 3e8h
        div     bx
        mov     byte ptr [A0_B_MTC_GEN_FRAMES], al
        mov     ax, dx
        mov     bl, 0ah
        div     bl
        mov     byte ptr [A0_B_03017], al
        mov     al, 2
        mul     cl
        add     al, byte ptr [A0_B_MTC_GEN_FRAMES]
        cmp     al, 1eh
        jb      br_039D7
        sub     al, 1eh
        inc     byte ptr [A0_B_MTC_GEN_SECONDS]
        cmp     byte ptr [A0_B_MTC_GEN_SECONDS], 3ch
        jne     br_039D7
        mov     byte ptr [A0_B_MTC_GEN_SECONDS], 0
        inc     byte ptr [A0_B_MTC_GEN_MINUTES]
        add     al, 2
br_039D7:
        mov     byte ptr [A0_B_MTC_GEN_FRAMES], al
        ret
fn_039DB:
        mov     si, A0_W_0301C
        call    fn_03A0B
        ret
fn_039E2:
        mov     si, A0_W_03022
        call    fn_03A0B
        ret
fn_039E9:
        call    fn_039F6
        call    fn_038EA
        mov     si, A0_W_03028
        call    fn_03A0B
        ret
fn_039F6:
        cmp     byte ptr [A0_B_0436E], 3
        if      FW_VERSION >= 110
        je      br_03A00
        int     0c0h
        else
        je      L_03866
        mov     ax, word ptr [A0_W_04318]
        mov     dx, word ptr [A0_W_0431A]
        push    ax
        push    dx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bp, 35h
        call    fn_03D52
        pop     dx
        pop     ax
        add     ax, di
        adc     dx, si
        endif
        ret
        if      FW_VERSION >= 110
br_03A00:
        else
L_03866:
        int     76h
        mov     di, 3e8h
        mov     si, 0
        int     0b8h
        push    ax
        push    dx
        endif
        int     0e2h
        if      FW_VERSION >= 110
        add     ax, word ptr [A0_W_04318]
        adc     dx, word ptr [A0_W_0431A]
        else
        pop     cx
        pop     bx
        add     ax, bx
        adc     dx, cx
        endif
        ret
fn_03A0B:
        cmp     byte ptr [A0_B_04842], 0
        jne     loop_03A13
        ret
loop_03A13:
        lodsb
        pusha
        call    fn_03A1E
        popa
        cmp     al, 0f7h
        jne     loop_03A13
        ret
fn_03A1E:
        cmp     byte ptr [A0_B_04843], 0
        jne     br_03A28
        jmp     fn_03C9C
br_03A28:
        cmp     byte ptr [A0_B_04843], 1
        jne     br_03A32
        jmp     fn_03CC9
br_03A32:
        push    es
        pusha
        call    fn_03C9C
        popa
        pop     es
        call    fn_03CC9
        ret
fn_03A3D:
        mov     ax, 0faffh
        jmp     fn_03A5B
fn_03A42:
        mov     ax, 0fbffh
        jmp     fn_03A5B
fn_03A47:
        mov     ax, 0fcffh
        jmp     fn_03A5B
fn_03A4C:
        mov     ax, 0f8ffh
        jmp     fn_03A5B
fn_03A51:
        cmp     byte ptr [A0_B_SYNC_OUT_MODE], 2
        je      L_0391C
        ret
L_0391C:
        jmp     br_03A63
fn_03A5B:
        cmp     byte ptr [A0_B_SYNC_OUT_MODE], 1
        je      br_03A63
        ret
br_03A63:
        cmp     byte ptr [A0_B_04843], 1
        jb      fn_03A77
        je      fn_03AA8
        push    ax
        push    cx
        call    fn_03A77
        pop     cx
        pop     ax
        call    fn_03AA8
        ret
fn_03A77:
        mov     bl, byte ptr [0ea3h]
        mov     bh, 0
        mov     byte ptr [bx+0da2h], ah
        inc     bl
        cmp     al, 0ffh
        je      br_03A98
        mov     byte ptr [bx+0da2h], al
        inc     bl
        cmp     cl, 0ffh
        je      br_03A98
        mov     byte ptr [bx+0da2h], cl
        inc     bl
br_03A98:
        mov     byte ptr [0ea3h], bl
        mov     dx, 186h
        mov     al, 0f7h
        out     dx, al
        mov     byte ptr [0ea4h], 0ffh
        ret
fn_03AA8:
        mov     bl, byte ptr [11adh]
        mov     bh, 0
        mov     byte ptr [bx+10ach], ah
        inc     bl
        cmp     al, 0ffh
        je      br_03AC9
        mov     byte ptr [bx+10ach], al
        inc     bl
        cmp     cl, 0ffh
        je      br_03AC9
        mov     byte ptr [bx+10ach], cl
        inc     bl
br_03AC9:
        mov     byte ptr [11adh], bl
        mov     dx, 1a6h
        mov     al, 0f7h
        out     dx, al
        mov     byte ptr [11aeh], 0ffh
        ret
fn_03AD9:
        cmp     byte ptr [A0_B_SYNC_OUT_MODE], 1
        je      br_03AEA
        mov     word ptr [A0_W_04402], 0ffffh
        call    fn_039E9
        ret
br_03AEA:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_03AFB
        call    fn_03B1B
br_03AFB:
        mov     bx, 18h
        div     bx
        or      dx, dx
        je      br_03B05
        inc     ax
br_03B05:
        cmp     ax, word ptr [A0_W_04402]
        jne     br_03B0C
        ret
br_03B0C:
        mov     word ptr [A0_W_04402], ax
        shl     ax, 1
        shr     al, 1
        mov     cl, ah
        mov     ah, 0f2h
        call    fn_03A5B
        ret
fn_03B1B:
        push    ax
        push    dx
        int     0e1h
        pop     cx
        pop     bx
        add     ax, bx
        adc     dx, cx
        ret
L_039E9:
        mov     bl, 0
loop_03B28:
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 7bh
        mov     cl, 0
        call    fn_03B6C
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 79h
        mov     cl, 0
        call    fn_03B6C
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 40h
        mov     cl, 0
        call    fn_03B6C
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 7
        mov     cl, 64h
        call    fn_03B6C
        mov     ah, bl
        or      ah, 0e0h
        mov     al, 0
        mov     cl, 40h
        call    fn_03B6C
        inc     bl
        cmp     bl, 10h
        jne     loop_03B28
        ret
fn_03B6C:
        push    bx
        call    fn_03BD6
        pop     bx
        ret
fn_03B72:
        mov     bl, 0
loop_03B74:
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 7bh
        mov     cl, 0
        call    fn_03BB8
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 79h
        mov     cl, 0
        call    fn_03BB8
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 40h
        mov     cl, 0
        call    fn_03BB8
        mov     ah, bl
        or      ah, 0b0h
        mov     al, 7
        mov     cl, 64h
        call    fn_03BB8
        mov     ah, bl
        or      ah, 0e0h
        mov     al, 0
        mov     cl, 40h
        call    fn_03BB8
        inc     bl
        cmp     bl, 10h
        jne     loop_03B74
        ret
fn_03BB8:
        push    bx
        call    fn_03C3C
        pop     bx
        ret
br_03BBE:
        cmp     byte ptr [A0_B_026A3], 3
        jae     br_03BC7
        jmp     fn_03BD6
br_03BC7:
        jne     br_03BCB
        jmp     fn_03C3C
br_03BCB:
        push    ax
        push    cx
        call    fn_03BD6
        pop     cx
        pop     ax
        call    fn_03C3C
        ret
fn_03BD6:
        mov     word ptr [0da0h], 1f4h
        mov     dx, word ptr [0d9eh]
        mov     bx, dx
        sub     dx, word ptr [0d9ch]
        and     dh, 1
        cmp     dx, 1f0h
        jb      br_03BF3
        mov     word ptr [0d9ch], bx
br_03BF3:
        mov     si, 0b9ch
        cmp     ah, 0f0h
        jae     br_03C01
        cmp     ah, byte ptr [0ea4h]
        je      br_03C0B
br_03C01:
        mov     byte ptr [0ea4h], ah
        mov     byte ptr [bx+si], ah
        inc     bx
        and     bh, 1
br_03C0B:
        mov     byte ptr [bx+si], al
        inc     bx
        and     bh, 1
        cmp     ah, 0c0h
        jb      br_03C1B
        cmp     ah, 0e0h
        jb      br_03C21
br_03C1B:
        mov     byte ptr [bx+si], cl
        inc     bx
        and     bh, 1
br_03C21:
        mov     word ptr [0d9eh], bx
        mov     dx, 186h
        mov     al, 0f7h
        out     dx, al
        mov     bl, ah
        and     bx, 0fh
        mov     byte ptr [bx+A0_W_0290D], 1
        ret
        mov     al, 20h
        call    fn_014B6
        ret
fn_03C3C:
        mov     word ptr [10aah], 1f4h
        mov     dx, word ptr [10a8h]
        mov     bx, dx
        sub     dx, word ptr [10a6h]
        and     dh, 1
        cmp     dx, 1f0h
        jb      br_03C59
        mov     word ptr [10a6h], bx
br_03C59:
        mov     si, 0ea6h
        cmp     ah, 0f0h
        jae     br_03C67
        cmp     ah, byte ptr [11aeh]
        je      br_03C71
br_03C67:
        mov     byte ptr [11aeh], ah
        mov     byte ptr [bx+si], ah
        inc     bx
        and     bh, 1
br_03C71:
        mov     byte ptr [bx+si], al
        inc     bx
        and     bh, 1
        cmp     ah, 0c0h
        jb      br_03C81
        cmp     ah, 0e0h
        jb      br_03C87
br_03C81:
        mov     byte ptr [bx+si], cl
        inc     bx
        and     bh, 1
br_03C87:
        mov     word ptr [10a8h], bx
        mov     dx, 1a6h
        mov     al, 0f7h
        out     dx, al
        mov     bl, ah
        and     bx, 0fh
        mov     byte ptr [bx+A0_W_0291D], 64h
        ret
fn_03C9C:
        mov     dx, word ptr [0d9eh]
        mov     bx, dx
        sub     dx, word ptr [0d9ch]
        and     dh, 1
        cmp     dx, 1f0h
        jae     fn_03C9C
        mov     byte ptr [bx+0b9ch], al
        inc     bx
        and     bh, 1
        cli
        mov     word ptr [0d9eh], bx
        mov     dx, 186h
        mov     al, 0f7h
        out     dx, al
        mov     byte ptr [0ea4h], 0ffh
        sti
        ret
fn_03CC9:
        mov     dx, word ptr [10a8h]
        mov     bx, dx
        sub     dx, word ptr [10a6h]
        and     dh, 1
        cmp     dx, 1f0h
        jae     fn_03CC9
        mov     byte ptr [bx+0ea6h], al
        inc     bx
        and     bh, 1
        cli
        mov     word ptr [10a8h], bx
        mov     dx, 1a6h
        mov     al, 0f7h
        out     dx, al
        mov     byte ptr [11aeh], 0ffh
        sti
        ret
fn_03CF6:
        sub     ax, ax
        cmp     ax, word ptr [0da0h]
        je      br_03D09
        dec     word ptr [0da0h]
        jne     br_03D09
        mov     byte ptr [0ea4h], 0ffh
br_03D09:
        cmp     ax, word ptr [10aah]
        je      br_03D1A
        dec     word ptr [10aah]
        jne     br_03D1A
        mov     byte ptr [11aeh], 0ffh
br_03D1A:
        cmp     ax, word ptr [A0_W_028CE]
        je      br_03D24
        dec     word ptr [A0_W_028CE]
br_03D24:
        cmp     ax, word ptr [A0_W_028D0]
        je      br_03D35
        dec     word ptr [A0_W_028D0]
        jne     br_03D35
        mov     byte ptr [A0_B_04374], 0
br_03D35:
        cmp     ax, word ptr [A0_W_056E6]
        je      br_03D46
        dec     word ptr [A0_W_056E6]
        jne     br_03D46
        mov     byte ptr [A0_B_04374], 0
br_03D46:
        ret
isr_03D47:
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        call    fn_03D52
        pop     ds
        iret
fn_03D52:
        mov     ax, 0e10h
        mov     bx, 3e8h
        mul     bx
        mov     cl, byte ptr es:[bp]
        and     cx, 1fh
        sub     si, si
        sub     di, di
        jcxz    br_03D6D
tgt_03D67:
        add     di, ax
        adc     si, dx
        loop    tgt_03D67
br_03D6D:
        mov     al, byte ptr es:[bp+1]
        mov     ah, 3ch
        mul     ah
        mov     bx, 3e8h
        mul     bx
        add     di, ax
        adc     si, dx
        mov     al, byte ptr es:[bp+2]
        mov     ah, 0
        mov     bx, 3e8h
        mul     bx
        add     di, ax
        adc     si, dx
        mov     al, byte ptr es:[bp+3]
        mov     ah, 0
        mov     bx, 3e8h
        mul     bx
        sub     bh, bh
        mov     bl, byte ptr [A0_B_FRAME_RATE]
        mov     bl, byte ptr [bx+A0_B_028C1]
        div     bx
        or      ax, ax
        je      br_03DA9
        inc     ax
br_03DA9:
        add     di, ax
        adc     si, 0
        mov     al, byte ptr es:[bp+4]
        mov     ah, 0ah
        mul     ah
        div     bl
        mov     ah, 0
        add     di, ax
        adc     si, 0
        cmp     byte ptr [A0_B_FRAME_RATE], 2
        je      br_03DC7
        ret
br_03DC7:
        mov     al, byte ptr es:[bp+1]
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        mov     cl, byte ptr es:[bp+2]
        mov     ch, 0
        cmp     ah, 0
        jne     br_03DE8
        cmp     cl, 0
        jne     br_03DE2
        ret
br_03DE2:
        add     di, cx
        adc     si, 0
        ret
br_03DE8:
        mov     al, 43h
        mul     ah
        mov     bl, 0ah
        div     bl
        mov     ah, 0
        add     di, cx
        adc     si, 0
        sub     di, ax
        sbb     si, 0
        ret
isr_03DFD:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        DISP_ERASE      42h, 0eh, 0a0h, 06h
        DISP_ERASE      42h, 22h, 0a0h, 06h
        db      0beh
        if      FW_VERSION >= 114
        or      ax, 0bf29h
        sub     ax, 0b229h
        add     byte ptr [di-17f2h], dh
        and     byte ptr [bx+si], al
        inc     si
        inc     di
        inc     dl
        cmp     dl, 10h
        db      75h, 0f4h
        mov     dl, 0
        mov     ch, 22h
isr_03E2B:
        call    fn_03E3E
        inc     si
        inc     di
        inc     dl
        cmp     dl, 10h
        jne     isr_03E2B
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        pop     ds
        iret
fn_03E3E:
        mov     ax, 0
        cmp     byte ptr [di], 0
        jne     br_03E52
        xchg    ah, byte ptr [si]
        cmp     ah, 0
        jne     br_03E4E
        ret
br_03E4E:
        mov     byte ptr [di], 2
        ret
br_03E52:
        dec     byte ptr [di]
        mov     al, 0ah
        mul     dl
        add     al, 42h
        mov     cl, al
        mov     ah, 6
        mov     al, 6
        mov     bl, 13h
        int     90h
        ret
        elseif  FW_VERSION >= 110
        db      0f1h, 28h, 0bfh, 11h, 29h, 0b2h, 00h, 0b5h, 0eh, 0e8h, 20h, 00h, 46h, 47h, 0feh, 0c2h
        db      80h, 0fah, 10h, 75h, 0f4h, 0b2h, 00h, 0b5h, 22h, 0e8h, 10h, 00h, 46h, 47h, 0feh, 0c2h
        db      80h, 0fah, 10h, 75h, 0f4h, 0c6h, 06h, 63h, 00h, 01h, 1fh, 0cfh, 0b8h, 00h, 00h, 80h
        db      3dh, 00h, 75h, 0ch, 86h, 24h, 80h, 0fch, 00h, 75h, 01h, 0c3h, 0c6h, 05h, 02h, 0c3h
        db      0feh, 0dh, 0b0h, 0ah, 0f6h, 0e2h, 04h, 42h, 8ah, 0c8h, 0b4h, 06h, 0b0h, 06h, 0b3h, 13h
        db      0cdh, 90h, 0c3h
        else
        shr     word ptr [bx+si], cl
        mov     di, 28f3h
        mov     dl, 0
        mov     ch, 0eh
L_03C8B:
        call    fn_03E3E
        inc     si
        inc     di
        inc     dl
        cmp     dl, 10h
        jne     L_03C8B
        mov     dl, 0
        mov     ch, 22h
isr_03E2B:
        call    fn_03E3E
        inc     si
        inc     di
        inc     dl
        cmp     dl, 10h
        jne     isr_03E2B
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        pop     ds
        iret
fn_03E3E:
        mov     ax, 0
        cmp     byte ptr [di], 0
        jne     br_03E52
        xchg    ah, byte ptr [si]
        cmp     ah, 0
        jne     br_03E4E
        ret
br_03E4E:
        mov     byte ptr [di], 2
        ret
br_03E52:
        dec     byte ptr [di]
        mov     al, 0ah
        mul     dl
        add     al, 42h
        mov     cl, al
        mov     ah, 6
        mov     al, 6
        mov     bl, 13h
        int     90h
        ret
        endif
isr_03E65:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     es, bp
        mov     ax, 0
        mov     di, A0_W_0292D
        mov     cx, 20h
        rep stosb
        mov     di, A0_W_028ED
        mov     cx, 10h
        rep stosb
        mov     di, A0_W_028FD
        mov     cx, 10h
        rep stosb
        mov     di, A0_W_0290D
        mov     cx, 10h
        rep stosb
        mov     di, A0_W_0291D
        mov     cx, 10h
        rep stosb
        pop     ds
        iret
isr_03E9A:
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        call    fn_03EA5
        pop     ds
        iret
fn_03EA5:
        sub     ax, ax
        mov     word ptr [1bah], ax
        mov     word ptr [1bch], ax
        push    ds
        pop     es
        mov     di, A0_TBL_0346C
        mov     cx, 0b1h
        rep stosw
loop_03EB7:
        call    xl_panel_ring_buffer_isr_b3
        or      ax, ax
        jne     br_03EBF
        ret
br_03EBF:
        test    ah, 80h
        je      L_03D68
        call    xl_panel_event_dispatch
L_03D68:
        jmp     loop_03EB7
fn_03EC9:
        call    xl_panel_ring_buffer_isr_b3
        or      ax, ax
        jne     br_03ED1
        ret
br_03ED1:
        push    fn_03EC9
        test    ah, 80h
        je      L_03ED8
        jmp     xl_panel_event_dispatch
L_03ED8:
        mov     word ptr [A0_W_03044], ax
        mov     word ptr [A0_W_00B96], 258h
fn_03EE5:
        cmp     byte ptr [A0_B_034C6], 0
        je      br_03EEF
        jmp     br_040A0
br_03EEF:
        mov     bx, ax
        mov     byte ptr [bx+A0_TBL_0346C], 1
        cmp     bx, 0ch
        jne     br_03F1D
        cmp     byte ptr [A0_B_035AA], 0
        je      br_03F03
        ret
br_03F03:
        cmp     byte ptr [A0_B_035B0], 0
        je      br_03F0B
        ret
br_03F0B:
        mov     byte ptr [6ah], 0
        mov     byte ptr [6bh], 0
        push    bx
        mov     bx, A0_W_0312A
        call    fn_03F5C
        pop     bx
br_03F1D:
        cmp     bx, 84h
        jne     br_03F33
        cmp     byte ptr [A0_B_035AA], 0
        je      br_03F2B
        ret
br_03F2B:
        cmp     byte ptr [A0_B_035B0], 0
        je      br_03F33
        ret
br_03F33:
        cmp     bx, 0a2h
        push    bx
        jne     br_03F3D
        call    fn_03FAB
br_03F3D:
        pop     bx
        cmp     bx, 12h
        jb      br_03F54
        cmp     bx, 49h
        jae     br_03F54
        mov     ax, bx
        sub     ax, 12h
        sub     dx, dx
        mov     cx, 6
        div     cx
br_03F54:
        if      FW_VERSION >= 114
        add     bx, 3046h
        elseif  FW_VERSION >= 112
        add     bx, 302ah
        elseif  FW_VERSION >= 110
        add     bx, 3026h
        else
        add     bx, 3008h
        endif
        call    fn_03F5C
ret_03F5B:
        ret
fn_03F5C:
        mov     bp, word ptr [bx]
        or      bp, word ptr [bx+2]
        jne     br_03F64
        ret
br_03F64:
        push    ds
        push    bx
        mov     bp, word ptr [bx+4]
        mov     ds, bp
        db      36h, 0ffh, 1fh
        pop     bx
        pop     ds
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        ret
fn_03F76:
        mov     bp, word ptr [bx]
        or      bp, word ptr [bx+2]
        jne     br_03F7E
        ret
br_03F7E:
        push    ds
        push    bx
        mov     bp, word ptr [bx+4]
        mov     ds, bp
        db      36h, 0ffh, 1fh
        pop     bx
        pop     ds
        ret
xl_panel_event_dispatch:
        and     ax, 7fffh
        mov     bx, ax
        mov     byte ptr [bx+A0_TBL_0346C], 0
        cmp     bx, 0a2h
        push    bx
        jne     br_03F9F
        call    fn_03FC7
br_03F9F:
        pop     bx
        if      FW_VERSION >= 114
        add     bx, 31a8h
        elseif  FW_VERSION >= 112
        add     bx, 318ch
        elseif  FW_VERSION >= 110
        add     bx, 3188h
        else
        add     bx, 316ah
        endif
        call    fn_03F5C
        call    fn_041D5
        ret
fn_03FAB:
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_03FB3
        ret
br_03FB3:
        mov     word ptr [A0_W_00B90], 0c8h
        cmp     word ptr [A0_W_00B92], 0
        je      br_03FC1
        ret
br_03FC1:
        mov     byte ptr [A0_B_03036], 0
        ret
fn_03FC7:
        cmp     word ptr [A0_W_00B90], 0
        jne     br_03FDA
        mov     word ptr [A0_W_00B92], 0
        mov     byte ptr [A0_B_03036], 0
        ret
br_03FDA:
        cmp     word ptr [A0_W_00B92], 0
        jne     br_03FE6
        mov     byte ptr [A0_B_03036], 0
br_03FE6:
        mov     word ptr [A0_W_00B92], 7d0h
        inc     byte ptr [A0_B_03036]
        jne     br_03FF7
        mov     byte ptr [A0_B_03036], 0ffh
br_03FF7:
        mov     ax, word ptr [A0_W_MS_TICKS]
        mov     bx, ax
        xchg    bx, word ptr [A0_W_03042]
        cmp     byte ptr [A0_B_03036], 2
        jae     br_04008
        ret
br_04008:
        sub     ax, bx
        mov     bx, ds
        mov     es, bx
        if      FW_VERSION >= 112
        mov     di, A0_W_03038
        else
        mov     di, A0_W_03018
        endif
        mov     si, di
        add     si, 2
        mov     cx, 3
        rep movsw
        mov     word ptr [di], ax
        les     si, [50h]
        mov     cl, byte ptr es:[si+0a1h]
        add     cl, 2
        mov     bl, cl
        mov     ch, byte ptr [A0_B_03036]
        cmp     ch, cl
        jae     br_04034
        ret
br_04034:
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        sub     ax, ax
        dec     cl
        mov     bl, cl
loop_0403F:
        add     ax, word ptr [di]
        sub     di, 2
        dec     cl
        jne     loop_0403F
        mov     bh, 0
        sub     dx, dx
        div     bx
        mov     di, ax
        sub     si, si
        mov     ax, 27c0h
        mov     dx, 9
        call    X_014EE
        cmp     ax, 12ch
        jae     br_04063
        mov     ax, 12ch
br_04063:
        cmp     ax, 0bb8h
        jb      br_0406B
        mov     ax, 0bb8h
br_0406B:
        cmp     word ptr [A0_W_0371A], 0bcbh
        jne     br_0407D
        cmp     byte ptr [A0_B_0436E], 0
        jne     br_0407D
        mov     word ptr [A0_W_03718], ax
br_0407D:
        les     si, [50h]
        cmp     byte ptr es:[si+6], 0
        jne     br_04092
        mov     word ptr es:[si+4], ax
        cli
        call    fn_07BAD
        sti
        ret
br_04092:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     word ptr es:[16h], ax
        cli
        call    fn_07BAD
        sti
        ret
br_040A0:
        cmp     byte ptr [A0_B_035AA], 0
        je      br_040A8
        ret
br_040A8:
        cmp     byte ptr [A0_B_035B0], 0
        je      br_040B0
        ret
br_040B0:
        if      FW_VERSION >= 114
        XL2K_PLAY_GATE
        else
        cmp     ax, 3ch
        je      br_040CC
        endif
        cmp     ax, 36h
        je      br_040CC
        cmp     ax, 4eh
        je      br_040CC
        cmp     ax, 1eh
        je      br_040CC
        if      FW_VERSION >= 114
xl_mode_key_gate:
        endif
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        je      br_040CC
        ret
br_040CC:
        mov     byte ptr [6ah], 0
        push    ax
        call    fn_040E1
        pop     bx
        if      FW_VERSION >= 114
        add     bx, 330ah
        elseif  FW_VERSION >= 112
        add     bx, 32eeh
        elseif  FW_VERSION >= 110
        add     bx, 32eah
        else
        add     bx, 32cch
        endif
        call    fn_03F5C
        call    fn_041D5
        ret
fn_040E1:
        cmp     ax, 54h
        je      br_0411C
        cmp     ax, 18h
        je      br_0411C
        cmp     ax, 1eh
        je      br_0411C
        cmp     ax, 24h
        je      br_0411C
        cmp     ax, 2ah
        je      br_04165
        cmp     ax, 30h
        jne     br_04102
        jmp     br_04188
br_04102:
        cmp     ax, 36h
        je      br_04138
        cmp     ax, 3ch
        je      br_04138
        cmp     ax, 42h
        je      br_0411C
        cmp     ax, 48h
        je      br_0411C
        cmp     ax, 4eh
        je      br_0411C
        ret
br_0411C:
        mov     word ptr [A0_W_SEQ_SEGMENT], 8000h
        mov     bx, A0_W_0312A
        call    fn_03F5C
        mov     bl, 0
        int     4eh
        mov     al, 0
        int     7ah
        int     0cch
        mov     byte ptr [6bh], 0
        ret
br_04138:
        KEY_DOWN        27h, 0000h, 0000h
        callf   EP_L_2FD80_SEG:EP_L_2FD80_OFF
        mov     byte ptr [6ah], 1
        mov     byte ptr [A0_B_0436E], 0
        mov     bx, A0_W_0312A
        call    fn_03F5C
        mov     bl, 0
        int     4eh
        mov     al, 0
        int     7ah
        int     0cch
        mov     byte ptr [6bh], 0
        ret
br_04165:
        mov     byte ptr [A0_B_0436E], 0
        mov     word ptr [A0_W_SEQ_SEGMENT], 8000h
        mov     bx, A0_W_0312A
        call    fn_03F5C
        mov     bl, 0
        int     4eh
        mov     al, 1
        int     7ah
        int     0cdh
        int     0cch
        mov     byte ptr [6bh], 1
        ret
br_04188:
        mov     byte ptr [A0_B_0436E], 0
        mov     word ptr [A0_W_SEQ_SEGMENT], 8000h
        mov     bx, A0_W_0312A
        call    fn_03F5C
        mov     bl, 0
        int     4eh
        mov     al, 1
        int     7ah
        int     0cdh
        int     0cch
        mov     byte ptr [6bh], 0
        ret
isr_041AB:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [6bh], 0
        mov     byte ptr [6ah], 0
        pop     ds
        iret
isr_041BD:
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     bx, word ptr [A0_W_03044]
        cmp     byte ptr [bx+A0_TBL_0346C], 0
        je      isr_041D3
        mov     byte ptr [A0_B_03035], 1
isr_041D3:
        pop     ds
        iret
fn_041D5:
        mov     byte ptr [A0_B_03035], 0
        ret
fn_041DB:
        cmp     byte ptr [A0_B_03035], 0
        jne     br_041E3
        ret
br_041E3:
        sub     ax, ax
        cmp     ax, word ptr [A0_W_00B96]
        je      br_041EC
        ret
br_041EC:
        cmp     ax, word ptr [0b98h]
        je      br_041F3
        ret
br_041F3:
        mov     word ptr [0b98h], 64h
        mov     ax, word ptr [A0_W_03044]
        call    fn_03EE5
        ret
isr_04200:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     byte ptr [bx+A0_TBL_0346C], 1
        cmc
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
isr_04218:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [bx+A0_TBL_0346C], 1
        pop     ds
        iret
isr_04225:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     si, 4deh
        mov     cx, 10h
        mov     al, 0
isr_04233:
        or      al, byte ptr [si]
        inc     si
        loop    isr_04233
        or      al, al
        je      isr_0423D
        stc
isr_0423D:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
isr_04249:
        push    ds
        sti
        mov     ax, RAM_SEG
        mov     ds, ax
resume_04250:
        mov     es, ax
        mov     di, A0_W_0302A
        mov     cx, 90h
        sub     ax, ax
        rep stosw
        mov     di, A1_W_0318C
        mov     cx, 0aeh
        sub     ax, ax
        rep stosw
        call    fn_04274
        call    fn_04285
        call    fn_0429D
        call    fn_042C6
        pop     ds
        iret
fn_04274:
        mov     ax, ds
        mov     es, ax
        mov     di, A0_W_03364
        mov     cx, 0c6h
        shr     cx, 1
        sub     ax, ax
        rep stosw
        ret
fn_04285:
        mov     di, A0_W_0302A
        mov     ax, 7ah
        mov     bx, word ptr [54h]
        mov     cx, word ptr [56h]
        mov     word ptr [di+0ch], ax
        mov     word ptr [di+0eh], bx
        mov     word ptr [di+10h], cx
        ret
fn_0429D:
        if      FW_VERSION >= 120
        int     96h
        cld
; the four PAD BANK thunks are 8-byte VM records: `cd 96`, dw tag, dw target,
; dw 0.  targets 440Ch/4412h/4418h/441Eh = bank A/B/C/D.
        db      000h
        XL2K_BANK_THUNK pad_bank_a
        add     byte ptr [bx+si], al
        int     96h
        add     al, byte ptr [bx+di]
        db      12h, 44h, 00h, 00h, 0cdh
        xchg    si, ax
        or      byte ptr [bx+di], al
        XL2K_BANK_THUNK pad_bank_c
        db      00h, 00h, 0cdh
        xchg    si, ax
        push    cs
        db      001h
        XL2K_BANK_THUNK pad_bank_d
        db      000h
        db      00h
        KEY_DOWN        28h, (APP0_BASE+pad_bank_int_c2-APP0_SEG*16), APP0_SEG
        db      0c3h
        else
        KEY_DOWN        2ah, pad_bank_a, 0000h
        KEY_DOWN        2bh, pad_bank_b, 0000h
        KEY_DOWN        2ch, pad_bank_c, 0000h
        KEY_DOWN        2dh, pad_bank_d, 0000h
        KEY_DOWN        28h, pad_bank_int_c2, 0000h
        ret
        endif
fn_042C6:
        ret
        mov     byte ptr [A0_B_034C6], 0
        int 3
retf_042CD:
        retf
        mov     byte ptr [A0_B_034C6], 0
        int     0c8h
        retf
isr_042D6:
        sti
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     bx, A0_W_03190
        call    fn_03F5C
        mov     ax, ds
        mov     es, ax
        mov     di, A0_W_0314A
        call    fn_04301
        mov     di, A0_W_032C8
        call    fn_04301
        mov     di, A0_W_0342A
        call    fn_04301
        mov     di, A0_W_0358C
        call    fn_04301
        pop     ds
        iret
fn_04301:
        mov     cx, 42h
        shr     cx, 1
        sub     ax, ax
        rep stosw
        ret
fn_0430B:
        sub     ax, ax
        mov     cx, ax
        xchg    ax, word ptr [1bah]
        or      ax, ax
        jne     br_04318
        ret
br_04318:
        cmp     byte ptr [A0_B_034C6], 0
        je      br_04321
        jmp     br_04376
br_04321:
        mov     bx, A0_W_030E4
        call    fn_03F5C
        ret
fn_04328:
        sub     cx, cx
        mov     ax, cx
        xchg    cx, word ptr [1bch]
        or      cx, cx
        jne     br_04335
        ret
br_04335:
        cmp     byte ptr [A0_B_034C6], 0
        jne     br_04364
        mov     bx, cs
        cmp     bx, word ptr [A0_W_030FC]
        je      br_0435D
        mov     bx, word ptr [54h]
        cmp     bx, word ptr [A0_W_030FC]
        je      br_0435D
        mov     bx, word ptr [58h]
        cmp     bx, word ptr [A0_W_030FC]
        je      br_0435D
        mov     ax, cx
        mov     cx, 0
br_0435D:
        mov     bx, A0_W_030DE
        call    fn_03F5C
        ret
br_04364:
        mov     al, byte ptr [78h]
        or      al, al
        jne     br_0436C
        ret
br_0436C:
        dec     al
        mov     byte ptr [78h], al
        mov     dx, 120h
        out     dx, al
        ret
br_04376:
        mov     al, byte ptr [78h]
        cmp     al, 1fh
        jne     br_0437E
        ret
br_0437E:
        inc     al
        mov     byte ptr [78h], al
        mov     dx, 120h
        out     dx, al
        ret
isr_04388:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, 14h
        mov     byte ptr [78h], al
        mov     dx, 120h
        out     dx, al
        pop     ds
        iret
fn_04399:
        mov     al, byte ptr [1c8h]
        mov     ah, al
        xchg    ah, byte ptr [1cah]
        cmp     al, ah
        jne     br_043A7
        ret
br_043A7:
        sub     ah, ah
        cmp     byte ptr [A0_B_034C6], 0
        je      br_043B2
        jmp     SHORT br_043B9
br_043B2:
        mov     bx, A0_W_0311E
        call    fn_03F5C
        ret
br_043B9:
        mov     bx, A0_W_033E2
        call    fn_03F5C
        ret
fn_043C0:
        mov     bx, word ptr [2d0h]
        cmp     bx, word ptr [A0_W_002CC]
        jne     br_043CB
        ret
br_043CB:
        mov     ax, word ptr [bx+1cch]
        mov     cx, word ptr [bx+1ceh]
        and     ah, 3fh
        add     byte ptr [2d0h], 4
        mov     bx, A0_W_03112
        mov     dx, word ptr [bx+2]
        cmp     dx, word ptr [54h]
        jbe     br_043E9
        mov     al, cl
br_043E9:
        call    fn_03F5C
        jmp     fn_043C0
        mov     bl, 40h
        cmp     al, 23h
        jb      br_04409
        cmp     al, 63h
        jae     br_04409
        mov     si, 0adch
        mov     bx, 0
loop_043FE:
        cmp     al, byte ptr [bx+si]
        je      br_04409
        inc     bl
        cmp     bl, 40h
        jne     loop_043FE
br_04409:
        mov     al, bl
        ret
        mov     byte ptr [A0_B_PAD_BANK], 0
        retf
        if      FW_VERSION >= 114
        XL2K_BANK_SETTERS
        else
pad_bank_b:
pad_bank_a      equ     pad_bank_b-6
pad_bank_c      equ     pad_bank_b+6
pad_bank_d      equ     pad_bank_b+0ch
        mov     byte ptr [A0_B_PAD_BANK], 10h
        retf
        mov     byte ptr [A0_B_PAD_BANK], 20h
        endif
        retf
        mov     byte ptr [A0_B_PAD_BANK], 30h
        retf
pad_bank_int_c2:                        ; app1 reaches it as a far call (push cs, call)
        int     0c2h
        retf
isr_04427:
        sti
        mov     bp, sp
        mov     es, word ptr [bp+2]
        mov     ax, ds
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [A0_W_0371A], di
        mov     word ptr [A0_W_0371C], es
        mov     word ptr [A0_W_0371E], ax
        mov     word ptr [A0_W_03714], si
        mov     word ptr [A0_W_03716], cx
        mov     word ptr [A0_W_03720], dx
        mov     byte ptr [A0_B_0375C], bh
        mov     bh, 0
        mov     word ptr [A0_W_03756], bx
        mov     byte ptr [A0_B_0375B], 0
        KEY_WHEEL       keyfn_043B0_112, 0000h
        pop     ds
        iret
isr_04463:
        sti
        mov     bp, sp
        mov     es, word ptr [bp+2]
        mov     ax, ds
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [A0_W_0371A], di
        mov     word ptr [A0_W_0371C], es
        mov     word ptr [A0_W_0371E], ax
        mov     word ptr [A0_W_03714], si
        mov     word ptr [A0_W_03716], cx
        mov     word ptr [A0_W_03720], dx
        mov     byte ptr [A0_B_0375C], bh
        mov     bh, 0
        mov     word ptr [A0_W_03756], bx
        mov     byte ptr [A0_B_0375B], 0
        KEY_WHEEL       keyfn_043B0_112, 0000h
        KEY_DIGITS      L_0454F, 0000h
        pop     ds
        iret
isr_044A5:
        sti
        mov     bp, sp
        mov     cx, word ptr [bp+2]
        mov     si, ds
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [A0_W_03718], ax
        mov     word ptr [A0_W_0371A], di
        mov     word ptr [A0_W_0371C], cx
        mov     word ptr [A0_W_0371E], si
        mov     word ptr [A0_W_03720], dx
        mov     byte ptr [A0_B_0375C], bh
        mov     bh, 0
        mov     word ptr [A0_W_03756], bx
        mov     byte ptr [A0_B_0375B], 0
        mov     word ptr [A0_W_03714], A0_W_03718
        mov     word ptr [A0_W_03716], ds
        KEY_WHEEL       keyfn_043B0_112, 0000h
        KEY_DIGITS      L_0454F, 0000h
        pop     ds
        iret
keyfn_043B0_112:
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        je      br_044FC
        cmp     byte ptr [A0_B_0375C], 0
        jne     br_044FC
        retf
br_044FC:
        pusha
        cmp     byte ptr [A0_B_0375B], 0
        je      br_04508
        push    cs
        call    far_046F7
br_04508:
        popa
        mov     ah, 0
        les     si, [A0_W_03714]
        mov     bx, word ptr [A0_W_03720]
        sub     bx, word ptr [A0_W_03756]
        cmp     bx, 100h
        jae     br_04536
        add     al, byte ptr es:[si]
        jb      br_04526
        cmp     ax, bx
        jb      br_04528
br_04526:
        mov     ax, bx
br_04528:
        sub     ax, cx
        jae     br_0452F
        mov     ax, 0
br_0452F:
        mov     byte ptr es:[si], al
        call    fn_04781
        retf
br_04536:
        add     ax, word ptr es:[si]
        jb      br_0453F
        cmp     ax, bx
        jb      br_04541
br_0453F:
        mov     ax, bx
br_04541:
        sub     ax, cx
        jae     br_04548
        mov     ax, 0
br_04548:
        mov     word ptr es:[si], ax
        call    fn_04781
        retf
L_0454F:
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        je      br_0455E
        cmp     byte ptr [A0_B_0375C], 0
        jne     br_0455E
        retf
br_0455E:
        mov     cx, ax
        cmp     byte ptr [A0_B_0375B], 0
        je      br_0456A
        jmp     br_045EF
br_0456A:
        mov     byte ptr [A0_B_0375B], 1
        mov     word ptr [A0_W_03740], cx
        mov     ax, ds
        mov     es, ax
        mov     si, P_3106
        mov     di, A0_W_03742
        mov     cx, 3
        rep movsw
        mov     si, A0_W_03124
        mov     di, A0_W_03748
        mov     cx, 3
        rep movsw
        mov     si, A0_W_0309A
        mov     di, A0_W_0374E
        mov     cx, 3
        rep movsw
        mov     si, A0_W_030A0
        mov     di, A0_W_03754
        mov     cx, 3
        rep movsw
        mov     si, A0_W_030B4
        mov     di, A0_W_0375A
        mov     cx, 0ch
        rep movsw
        KEY_DOWN        20h, keyfn_0448E_107, 0000h
        KEY_DOWN        25h, keyfn_0448E_107, 0000h
        KEY_DOWN        0fh, far_046F7, 0000h
        KEY_DOWN        0eh, L_04738, 0000h
        KEY_DOWN        17h, L_046CB, 0000h
        KEY_DOWN        18h, L_046D6, 0000h
        KEY_DOWN        19h, L_046E1, 0000h
        KEY_DOWN        1ah, L_046EC, 0000h
        retf
br_045EF:
        mov     ax, word ptr [A0_W_03740]
        mov     bx, 0ah
        mul     bx
        add     ax, cx
        mov     bx, 63h
        cmp     word ptr [A0_W_03720], 64h
        jb      br_04611
        mov     bx, 3e7h
        cmp     word ptr [A0_W_03720], 3e8h
        jb      br_04611
        mov     bx, 270fh
br_04611:
        cmp     ax, bx
        ja      br_04619
        mov     word ptr [A0_W_03740], ax
        retf
br_04619:
        mov     word ptr [A0_W_03740], cx
        retf
keyfn_0448E_107:
        mov     bx, A0_W_03748
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        je      br_0462B
        call    fn_03F5C
br_0462B:
        mov     ax, word ptr [A0_W_03720]
        mov     bx, 1
        cmp     ax, 0ah
        jb      br_04649
        mov     bx, 2
        cmp     ax, 64h
        jb      br_04649
        mov     bx, 3
        cmp     ax, 3e8h
        jb      br_04649
        mov     bx, 4
br_04649:
        mov     bh, bl
        push    bx
        mov     cl, byte ptr [A0_B_03758]
        mov     ch, byte ptr [A0_B_03759]
        dec     cl
        dec     ch
        mov     al, 6
        mul     bl
        cmp     word ptr [A0_W_03720], 0bb8h
        je      br_0466C
        cmp     word ptr [P_373C], 270eh
        jne     br_0466E
br_0466C:
        add     al, 4
br_0466E:
        inc     al
        mov     ah, 9
        mov     bl, 14h
        int     90h
        add     ch, 8
        mov     bl, 0eh
        int     90h
        pop     bx
        mov     cl, byte ptr [A0_B_03758]
        mov     ch, byte ptr [A0_B_03759]
        mov     ax, word ptr [A0_W_03740]
        mov     dx, 0
        cmp     word ptr [A0_W_03720], 0bb8h
        je      br_046A1
        cmp     word ptr [A0_W_0373C], 270eh
        je      br_046A1
        mov     bl, 8
        int     90h
        retf
br_046A1:
        push    ax
        push    cx
        add     cl, 11h
        mov     al, 2eh
        mov     bl, 4
        int     90h
        pop     cx
        pop     ax
        sub     dx, dx
        mov     bx, 0ah
        div     bx
        push    dx
        or      ax, ax
        je      br_046C0
        mov     bh, 3
        mov     bl, 8
        int     90h
br_046C0:
        pop     ax
        mov     bh, 1
        add     cl, 15h
        mov     bl, 8
        int     90h
        retf
L_046CB:
        push    cs
        call    far_046F7
        mov     bx, A0_W_030B4
        call    fn_03F5C
        retf
L_046D6:
        push    cs
        call    far_046F7
        mov     bx, A0_W_030D6
        call    fn_03F5C
        retf
L_046E1:
        push    cs
        call    far_046F7
        mov     bx, A0_W_030DC
        call    fn_03F5C
        retf
L_046EC:
        push    cs
        call    far_046F7
        mov     bx, A0_W_030E2
        call    fn_03F5C
        retf
far_046F7:
        mov     byte ptr [A0_B_0375B], 0
        mov     ax, ds
        mov     es, ax
        mov     di, P_3106
        mov     si, A0_W_03742
        mov     cx, 3
        rep movsw
        mov     di, A0_W_03124
        mov     si, A0_W_03748
        mov     cx, 3
        rep movsw
        mov     di, A0_W_0309A
        mov     si, A0_W_0374E
        mov     cx, 3
        rep movsw
        mov     di, A0_W_030A0
        mov     si, A0_W_03754
        mov     cx, 3
        rep movsw
        mov     di, A0_W_030B4
        mov     si, A0_W_0375A
        mov     cx, 0ch
        rep movsw
        retf
L_04738:
        push    cs
        call    far_046F7
        mov     byte ptr [A0_B_0375B], 0
        mov     ax, word ptr [A0_W_03740]
        sub     ax, word ptr [A0_W_03756]
        jae     br_0474C
        sub     ax, ax
br_0474C:
        les     si, [A0_W_03714]
        cmp     word ptr [A0_W_03720], 19h
        jne     br_0475F
        sub     ax, 32h
        jae     br_0475F
        mov     ax, 0
br_0475F:
        mov     bx, word ptr [A0_W_03720]
        sub     bx, word ptr [A0_W_03756]
        cmp     ax, bx
        jbe     br_0476D
        mov     ax, bx
br_0476D:
        cmp     word ptr [A0_W_03720], 100h
        jae     L_04776
        mov     byte ptr es:[si], al
        jmp     SHORT br_0477D
L_04776:
        mov     word ptr es:[si], ax
br_0477D:
        call    fn_04781
        retf
fn_04781:
        les     di, [A0_W_03730]
        mov     bx, A0_W_03736
        mov     cx, word ptr [bx]
        or      cx, word ptr [bx+2]
        jne     br_04790
        ret
br_04790:
        je      br_04795
        call    fn_03F5C
br_04795:
        ret
isr_04796:
        sti
        mov     bp, sp
        push    ds
        mov     cx, ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     si, word ptr [bp]
        mov     es, word ptr [bp+2]
        mov     bx, word ptr es:[si]
        if      FW_VERSION >= 114
        add     bx, 3046h
        elseif  FW_VERSION >= 112
        add     bx, 302ah
        elseif  FW_VERSION >= 110
        add     bx, 3026h
        else
        add     bx, 3008h
        endif
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], dx
        mov     word ptr [bx+4], cx
        add     word ptr [bp], 6
        pop     ds
        iret
isr_047C4:
        sti
        mov     bp, sp
        push    ds
        mov     cx, ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     si, word ptr [bp]
        mov     es, word ptr [bp+2]
        mov     bx, word ptr es:[si]
        if      FW_VERSION >= 114
        add     bx, 31a8h
        elseif  FW_VERSION >= 112
        add     bx, 318ch
        elseif  FW_VERSION >= 110
        add     bx, 3188h
        else
        add     bx, 316ah
        endif
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], dx
        mov     word ptr [bx+4], cx
        add     word ptr [bp], 6
        pop     ds
        iret
isr_047F2:
        sti
        mov     bp, sp
        push    ds
        mov     cx, ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     si, word ptr [bp]
        mov     es, word ptr [bp+2]
        mov     bx, word ptr es:[si]
        if      FW_VERSION >= 114
        add     bx, 330ah
        elseif  FW_VERSION >= 112
        add     bx, 32eeh
        elseif  FW_VERSION >= 110
        add     bx, 32eah
        else
        add     bx, 32cch
        endif
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], dx
        mov     word ptr [bx+4], cx
        add     word ptr [bp], 6
        pop     ds
        iret
isr_04820:
        mov     bp, sp
        push    ds
        mov     cx, ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     si, word ptr [bp]
        mov     es, word ptr [bp+2]
        mov     bx, A0_W_030DE
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     word ptr [bx], ax
        mov     word ptr [bx+2], dx
        mov     word ptr [bx+4], cx
        mov     word ptr [bx+6], ax
        mov     word ptr [bx+8], dx
        mov     word ptr [bx+0ah], cx
        add     word ptr [bp], 4
        pop     ds
        iret
isr_04851:
        sti
        mov     di, A0_W_030DE
        mov     cx, 2
isr_04858:
        mov     bp, sp
        mov     ax, RAM_SEG
        mov     es, ax
        push    ds
        mov     dx, ds
        mov     si, word ptr [bp]
        mov     ds, word ptr [bp+2]
        shl     cx, 2
        add     word ptr [bp], cx
        shr     cx, 2
isr_04871:
        lodsw
        stosw
        lodsw
        stosw
        mov     ax, dx
        stosw
        loop    isr_04871
        pop     ds
        iret
isr_0487C:
        sti
        mov     di, A0_W_0308A
        mov     cx, 6
        jmp     isr_04858
isr_04885:
        mov     di, A0_W_030B4
        mov     cx, 4
        jmp     isr_04858
isr_0488D:
        sti
        mov     di, A0_W_0314A
        mov     cx, 5
        jmp     isr_04858
isr_04896:
        sti
        mov     di, A0_W_03168
        mov     cx, 5
        jmp     isr_04858
isr_0489F:
        sti
        mov     bp, sp
        push    ds
        mov     si, word ptr [bp]
        mov     es, word ptr [bp+2]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     di, A0_W_03058
        mov     bx, RAM_SEG
        mov     es, bx
        mov     cx, 0ah
L_048BB:
        stosw
        push    ax
        mov     ax, dx
        stosw
        mov     ax, ds
        stosw
        pop     ax
        loop    L_048BB
        pop     ds
        add     word ptr [bp], 4
        iret
isr_048CC:
        push    ds
        mov     cx, ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [bx+A0_W_0302A], si
        mov     word ptr [bx+A0_W_0302C], dx
        mov     word ptr [bx+A0_W_0302E], cx
        pop     ds
        iret
isr_048E2:
        sti
        mov     bp, sp
        mov     di, word ptr [bp]
        mov     es, word ptr [bp+2]
        mov     di, word ptr es:[di]
        mov     ax, ds
        mov     es, ax
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     si, A0_W_0302A
        mov     cx, 162h
        rep movsb
        add     word ptr [bp], 2
        pop     ds
        iret
isr_04906:
        sti
        mov     bp, sp
        mov     si, word ptr [bp]
        mov     es, word ptr [bp+2]
        mov     si, word ptr es:[si]
        mov     ax, RAM_SEG
        mov     es, ax
        mov     di, A0_W_0302A
        mov     cx, 162h
        rep movsb
        add     word ptr [bp], 2
        iret
isr_04924:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     es, bp
        mov     si, A0_W_030DE
        mov     di, A0_W_0375E
        mov     cx, 3
        rep movsw
        mov     si, A0_W_030E4
        mov     di, A0_W_03764
        mov     cx, 3
        rep movsw
        pop     ds
        iret
isr_04945:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     es, bp
        mov     di, A0_W_030DE
        mov     si, A0_W_0375E
        mov     cx, 3
        rep movsw
        mov     di, A0_W_030E4
        mov     si, A0_W_03764
        mov     cx, 3
        rep movsw
        pop     ds
        iret
isr_04966:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [A0_B_0378B], ah
        mov     word ptr [A0_W_0376E], bx
        mov     word ptr [A0_W_03770], cx
        mov     cl, 6ah
        mov     ch, 14h
        mov     word ptr [A0_W_0378E], cx
        mov     word ptr [A0_W_03766], si
        mov     word ptr [A0_W_03768], dx
        mov     byte ptr [A0_B_03786], 0
        mov     byte ptr [A0_B_03783], 0
        mov     byte ptr [A0_B_03782], 0
        mov     byte ptr [A0_B_03784], 0
        mov     byte ptr [A0_B_037A5], 0ffh
        mov     di, A0_W_03790
        mov     ax, ds
        mov     es, ax
        mov     ds, dx
        mov     cx, 10h
        rep movsb
        mov     ds, ax
        mov     ax, ds
        mov     es, ax
        mov     si, A0_W_0302A
        mov     di, A0_W_03846
        mov     cx, 2c4h
        rep movsb
        mov     al, byte ptr [65h]
        mov     byte ptr [A0_B_037A1], al
        mov     al, 1
        int     7ah
        int     0a4h
        KEY_DOWN        16h, L_04CD6, 0000h
        KEY_DOWN        11h, L_04CEC, 0000h
        KEY_DOWN        12h, L_04D09, 0000h
        KEY_DOWN        13h, L_04CD6, 0000h
        KEY_DOWN        14h, L_04C87, 0000h
        KEY_DOWN        22h, L_04B33, 0000h
        KEY_WHEEL       L_04BEB, 0000h
        KEY_DOWN        17h, L_04C47, 0000h
        KEY_DOWN        18h, L_04C2A, 0000h
        KEY_DIGITS      L_04B8E, 0000h
        KEY_DOWN        0fh, L_04C60, 0000h
        KEY_DOWN        0eh, L_04C87, 0000h
        KEY_DOWN        20h, L_04A6F, 0000h
        KEY_DOWN        28h, L_04BE5, 0000h
        KEY_DOWN        29h, L_04BB6, 0000h
        KEY_TRANSPORT   0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        KEY_LOCATE      0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
        db      1fh, 0cfh
L_04A6F:
        DISP_WIN_WIDE   "Name"
        DISP_TEXT       34h, 14h, "New name:"
        DISP_TEXT       34h, 23h, "Press PADs or use DATA knob."
        db      0beh, 21h, 00h
        DISP_BMP        20h, 16h, 21h
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "COPY"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "PASTE"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "CANCEL"
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "ENTER"
        if      FW_VERSION >= 114
        db      8bh, 0eh, 8eh
        db      37h, 80h, 0e9h, 01h, 73h, 02h, 0feh, 0c1h, 80h, 0edh, 01h, 73h, 02h, 0feh, 0c5h, 0a0h
        db      0a7h, 37h, 0b4h, 06h, 0f6h, 0e4h, 04h, 01h, 0b4h, 09h, 0b3h, 14h, 0cdh, 90h, 51h, 8bh
        db      0eh, 8eh, 37h, 8ah, 26h, 0a7h, 37h, 8ch, 0dah, 0beh, 90h, 37h, 0b3h, 05h, 0cdh, 90h
        db      59h, 0a0h, 0a6h, 37h, 0b4h, 06h, 0f6h, 0e4h, 02h, 0c8h, 0b4h, 09h, 0b0h, 07h, 80h, 3eh
        db      0a3h, 37h, 00h, 75h, 05h, 0b3h, 15h, 0cdh, 90h, 0cbh, 80h, 0c5h, 08h, 0b3h, 0eh, 0cdh
L_04B33                         equ     $+2
        db      90h, 0cbh, 80h, 0f9h, 00h, 75h, 01h, 0cbh, 80h, 0e4h, 0fh, 0c6h, 06h, 0a3h, 37h, 01h
        db      0beh, 0b9h, 37h, 80h, 3eh, 0a8h, 37h, 00h, 74h, 03h, 0beh, 0d9h, 37h, 8ah, 0dch, 86h
        db      26h, 0a5h, 37h, 80h, 3eh, 0a2h, 37h, 00h, 74h, 16h, 3ah, 0e3h, 75h, 07h, 80h, 36h ; &.7.>.7.t.:.u..6
        db      0a4h, 37h, 01h, 0ebh, 0bh, 0c6h, 06h, 0a4h, 37h, 00h, 53h, 0eh
        call    L_04C2A
        db      5bh
        db      0d0h, 0e3h, 02h, 1eh, 0a4h, 37h, 0b7h, 00h, 8ah, 00h, 80h, 0fbh, 1ah, 73h, 00h, 8ah
L_04B8E                         equ     $+13
        db      1eh, 0a6h, 37h, 88h, 87h, 90h, 37h, 0c6h, 06h, 0a2h, 37h, 01h, 0cbh, 80h, 3eh, 0a2h
        db      37h, 00h, 74h, 06h, 50h, 0eh
        call    L_04C2A
        db      58h, 04h, 30h, 8ah, 1eh, 0a6h, 37h
        db      0b7h, 00h, 88h, 87h, 90h, 37h, 0eh
        call    L_04C2A
        db      0c6h, 06h, 0a5h, 37h, 0ffh, 0c6h
L_04BB6                         equ     $+5
        db      06h, 0a3h, 37h, 01h, 0cbh, 80h, 3eh, 0a2h, 37h, 00h, 74h, 04h, 0eh
        call    L_04C2A
        db      0b0h, 20h, 80h, 3eh, 0a8h, 37h, 00h, 74h, 02h, 0b0h, 5fh, 8ah, 1eh, 0a6h, 37h, 0b7h
        db      00h, 88h, 87h, 90h, 37h, 0eh
        call    L_04C2A
        db      0c6h, 06h, 0a5h, 37h, 0ffh, 0c6h, 06h
L_04BEB                         equ     $+0ah
L_04BE5                         equ     $+4
        db      0a3h, 37h, 01h, 0cbh, 80h, 36h, 0a8h, 37h, 01h, 0cbh, 0b7h, 00h, 8ah, 1eh, 0a6h, 37h
        db      8ah, 97h, 90h, 37h, 0b6h, 00h, 0beh, 0f9h, 37h, 56h, 80h, 3ch, 00h, 74h, 09h, 3ah
        db      14h, 74h, 07h, 46h, 0feh, 0c6h, 0ebh, 0f2h, 0b6h, 00h, 5eh, 02h, 0c6h, 3ch, 4ch, 72h
        db      02h, 0b0h, 4bh, 2ah, 0c1h, 73h, 02h, 0b0h, 00h, 0b4h, 00h, 03h, 0f0h, 8ah, 04h, 88h
L_04C2A                         equ     $+9
        db      87h, 90h, 37h, 0c6h, 06h, 0a3h, 37h, 01h, 0cbh, 0c6h, 06h, 0a2h, 37h, 00h, 0a0h, 0a7h
        db      37h, 0feh, 0c8h, 3ah, 06h, 0a6h, 37h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0feh, 06h, 0a6h, 37h
L_04C47                         equ     $+6
        db      0c6h, 06h, 0a4h, 37h, 00h, 0cbh, 0c6h, 06h, 0a2h, 37h, 00h, 80h, 3eh, 0a6h, 37h, 00h
L_04C60                         equ     $+15
        db      75h, 01h, 0cbh, 0cdh, 0a3h, 0feh, 0eh, 0a6h, 37h, 0c6h, 06h, 0a4h, 37h, 00h, 0cbh, 1eh
        db      8ch, 0d8h, 8eh, 0c0h, 0c5h, 36h, 86h, 37h, 0bfh, 90h, 37h, 0b9h, 10h, 00h, 0f3h, 0a4h
        db      1fh, 0c6h, 06h, 0a3h, 37h, 00h, 0c6h, 06h, 0a6h, 37h, 00h, 0c6h, 06h, 0a4h, 37h, 00h
L_04C87                         equ     $+6
        db      0c6h, 06h, 0a5h, 37h, 0ffh, 0cbh, 0b5h, 00h, 8ah, 0eh, 0a7h, 37h, 8bh, 0f1h, 4eh, 81h
        db      0c6h, 90h, 37h, 8ah, 04h, 3ch, 20h, 75h, 04h, 4eh, 0e2h, 0f7h, 0cbh, 4eh, 49h, 74h ; ..7..< u.N...NIt
        db      0ah, 80h, 3ch, 20h, 75h, 0f7h, 0c6h, 04h, 5fh, 0ebh, 0f2h, 0b8h, 90h, 37h, 8ch, 0dah
        db      1eh, 0ffh, 1eh, 8ah, 37h, 1fh, 3dh, 00h, 00h, 75h, 01h, 0cbh, 0c4h, 3eh, 86h, 37h
        db      0beh, 90h, 37h, 8ah, 0eh, 0a7h, 37h, 0b5h, 00h, 0f3h, 0a4h, 0eh
        call    L_04CD6
        db      0c6h
L_04CD6                         equ     $+5
        db      06h, 63h, 00h, 01h, 0cbh, 8ch, 0d8h, 8eh, 0c0h, 0beh, 46h, 38h, 0bfh, 46h, 30h, 0b9h
L_04CEC                         equ     $+11
        db      0c4h, 02h, 0f3h, 0a4h, 0a0h, 0a1h, 37h, 0a2h, 65h, 00h, 0cbh, 8ch, 0d8h, 8eh, 0c0h, 0bfh
        db      0a9h, 37h, 0b9h, 10h, 00h, 0b0h, 20h, 0f3h, 0aah, 0beh, 90h, 37h, 0bfh, 0a9h, 37h, 8ah
L_04D09                         equ     $+8
        db      0eh, 0a7h, 37h, 0b5h, 00h, 0f3h, 0a4h, 0cbh, 8ch, 0d8h, 8eh, 0c0h, 0beh, 0a9h, 37h, 0b9h
        db      10h, 00h, 80h, 3ch, 20h, 75h, 04h, 46h, 0e2h, 0f8h, 0cbh, 0beh, 0a9h, 37h, 0bfh, 90h
        db      37h, 0b9h, 10h, 00h, 0f3h, 0a4h, 0cbh
        elseif  FW_VERSION >= 112
        db      8bh, 0eh, 72h, 37h, 80h
        db      0e9h, 01h, 73h, 02h, 0feh, 0c1h, 80h, 0edh, 01h, 73h, 02h, 0feh, 0c5h, 0a0h, 8bh, 37h
        db      0b4h, 06h, 0f6h, 0e4h, 04h, 01h, 0b4h, 09h, 0b3h, 14h, 0cdh, 90h, 51h, 8bh, 0eh, 72h
        db      37h, 8ah, 26h, 8bh, 37h, 8ch, 0dah, 0beh, 74h, 37h, 0b3h, 05h, 0cdh, 90h, 59h, 0a0h
        db      8ah, 37h, 0b4h, 06h, 0f6h, 0e4h, 02h, 0c8h, 0b4h, 09h, 0b0h, 07h, 80h, 3eh, 87h, 37h
        db      00h, 75h, 05h, 0b3h, 15h, 0cdh, 90h, 0cbh, 80h, 0c5h, 08h, 0b3h, 0eh, 0cdh, 90h, 0cbh
L_04B33:
        db      80h, 0f9h, 00h, 75h, 01h, 0cbh, 80h, 0e4h, 0fh, 0c6h, 06h, 87h, 37h, 01h, 0beh, 9dh
        db      37h, 80h, 3eh, 8ch, 37h, 00h, 74h, 03h, 0beh, 0bdh, 37h, 8ah, 0dch, 86h, 26h, 89h
        db      37h, 80h, 3eh, 86h, 37h, 00h, 74h, 16h, 3ah, 0e3h, 75h, 07h, 80h, 36h, 88h, 37h ; 7.>.7.t.:.u..6.7
        db      01h, 0ebh, 0bh, 0c6h, 06h, 88h, 37h, 00h, 53h, 0eh, 0e8h, 0bah, 00h, 5bh, 0d0h, 0e3h
        db      02h, 1eh, 88h, 37h, 0b7h, 00h, 8ah, 00h, 80h, 0fbh, 1ah, 73h, 00h, 8ah, 1eh, 8ah
        db      37h, 88h, 87h, 74h, 37h, 0c6h, 06h, 86h, 37h, 01h, 0cbh
L_04B8E:
        db      80h, 3eh, 86h, 37h, 00h
        db      74h, 06h, 50h, 0eh, 0e8h, 90h, 00h, 58h, 04h, 30h, 8ah, 1eh, 8ah, 37h, 0b7h, 00h
        db      88h, 87h, 74h, 37h, 0eh, 0e8h, 7fh, 00h, 0c6h, 06h, 89h, 37h, 0ffh, 0c6h, 06h, 87h
        db      37h, 01h, 0cbh
L_04BB6:
        db      80h, 3eh, 86h, 37h, 00h, 74h, 04h, 0eh, 0e8h, 69h, 00h, 0b0h, 20h
        db      80h, 3eh, 8ch, 37h, 00h, 74h, 02h, 0b0h, 5fh, 8ah, 1eh, 8ah, 37h, 0b7h, 00h, 88h
        db      87h, 74h, 37h, 0eh, 0e8h, 50h, 00h, 0c6h, 06h, 89h, 37h, 0ffh, 0c6h, 06h, 87h, 37h
        db      01h, 0cbh
L_04BE5:
        db      80h, 36h, 8ch, 37h, 01h, 0cbh
L_04BEB:
        db      0b7h, 00h, 8ah, 1eh, 8ah, 37h, 8ah, 97h
        db      74h, 37h, 0b6h, 00h, 0beh, 0ddh, 37h, 56h, 80h, 3ch, 00h, 74h, 09h, 3ah, 14h, 74h ; t7....7V.<.t.:.t
        db      07h, 46h, 0feh, 0c6h, 0ebh, 0f2h, 0b6h, 00h, 5eh, 02h, 0c6h, 3ch, 4ch, 72h, 02h, 0b0h
        db      4bh, 2ah, 0c1h, 73h, 02h, 0b0h, 00h, 0b4h, 00h, 03h, 0f0h, 8ah, 04h, 88h, 87h, 74h
        db      37h, 0c6h, 06h, 87h, 37h, 01h, 0cbh
L_04C2A:
        db      0c6h, 06h, 86h, 37h, 00h, 0a0h, 8bh, 37h, 0feh
        db      0c8h, 3ah, 06h, 8ah, 37h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0feh, 06h, 8ah, 37h, 0c6h, 06h
        db      88h, 37h, 00h, 0cbh
L_04C47:
        db      0c6h, 06h, 86h, 37h, 00h, 80h, 3eh, 8ah, 37h, 00h, 75h, 01h
        db      0cbh, 0cdh, 0a3h, 0feh, 0eh, 8ah, 37h, 0c6h, 06h, 88h, 37h, 00h, 0cbh
L_04C60:
        db      1eh, 8ch, 0d8h
        db      8eh, 0c0h, 0c5h, 36h, 6ah, 37h, 0bfh, 74h, 37h, 0b9h, 10h, 00h, 0f3h, 0a4h, 1fh, 0c6h
        db      06h, 87h, 37h, 00h, 0c6h, 06h, 8ah, 37h, 00h, 0c6h, 06h, 88h, 37h, 00h, 0c6h, 06h
        db      89h, 37h, 0ffh, 0cbh
L_04C87:
        db      0b5h, 00h, 8ah, 0eh, 8bh, 37h, 8bh, 0f1h, 4eh, 81h, 0c6h, 74h
        db      37h, 8ah, 04h, 3ch, 20h, 75h, 04h, 4eh, 0e2h, 0f7h, 0cbh, 4eh, 49h, 74h, 0ah, 80h ; 7..< u.N...NIt..
        db      3ch, 20h, 75h, 0f7h, 0c6h, 04h, 5fh, 0ebh, 0f2h, 0b8h, 74h, 37h, 8ch, 0dah, 1eh, 0ffh
        db      1eh, 6eh, 37h, 1fh, 3dh, 00h, 00h, 75h, 01h, 0cbh, 0c4h, 3eh, 6ah, 37h, 0beh, 74h ; .n7.=..u...>j7.t
        db      37h, 8ah, 0eh, 8bh, 37h, 0b5h, 00h, 0f3h, 0a4h, 0eh, 0e8h, 06h, 00h, 0c6h, 06h, 63h
        db      00h, 01h, 0cbh
L_04CD6:
        db      8ch, 0d8h, 8eh, 0c0h, 0beh, 2ah, 38h, 0bfh, 2ah, 30h, 0b9h, 0c4h, 02h
        db      0f3h, 0a4h, 0a0h, 85h, 37h, 0a2h, 65h, 00h, 0cbh
L_04CEC:
        db      8ch, 0d8h, 8eh, 0c0h, 0bfh, 8dh, 37h
        db      0b9h, 10h, 00h, 0b0h, 20h, 0f3h, 0aah, 0beh, 74h, 37h, 0bfh, 8dh, 37h, 8ah, 0eh, 8bh
        db      37h, 0b5h, 00h, 0f3h, 0a4h, 0cbh
L_04D09:
        db      8ch, 0d8h, 8eh, 0c0h, 0beh, 8dh, 37h, 0b9h, 10h, 00h
        db      80h, 3ch, 20h, 75h, 04h, 46h, 0e2h, 0f8h, 0cbh, 0beh, 8dh, 37h, 0bfh, 74h, 37h, 0b9h
        db      10h, 00h, 0f3h, 0a4h, 0cbh
        elseif  FW_VERSION >= 110
        db      8bh
        db      0eh, 6eh, 37h, 80h, 0e9h, 01h, 73h, 02h, 0feh, 0c1h, 80h, 0edh, 01h, 73h, 02h, 0feh
        db      0c5h, 0a0h, 87h, 37h, 0b4h, 06h, 0f6h, 0e4h, 04h, 01h, 0b4h, 09h, 0b3h, 14h, 0cdh, 90h
        db      51h, 8bh, 0eh, 6eh, 37h, 8ah, 26h, 87h, 37h, 8ch, 0dah, 0beh, 70h, 37h, 0b3h, 05h
        db      0cdh, 90h, 59h, 0a0h, 86h, 37h, 0b4h, 06h, 0f6h, 0e4h, 02h, 0c8h, 0b4h, 09h, 0b0h, 07h
        db      80h, 3eh, 83h, 37h, 00h, 75h, 05h, 0b3h, 15h, 0cdh, 90h, 0cbh, 80h, 0c5h, 08h, 0b3h
        db      0eh, 0cdh, 90h, 0cbh
L_04B33:
        db      80h, 0f9h, 00h, 75h, 01h, 0cbh, 80h, 0e4h, 0fh, 0c6h, 06h, 83h
        db      37h, 01h, 0beh, 99h, 37h, 80h, 3eh, 88h, 37h, 00h, 74h, 03h, 0beh, 0b9h, 37h, 8ah
        db      0dch, 86h, 26h, 85h, 37h, 80h, 3eh, 82h, 37h, 00h, 74h, 16h, 3ah, 0e3h, 75h, 07h
        db      80h, 36h, 84h, 37h, 01h, 0ebh, 0bh, 0c6h, 06h, 84h, 37h, 00h, 53h, 0eh, 0e8h, 0bah
        db      00h, 5bh, 0d0h, 0e3h, 02h, 1eh, 84h, 37h, 0b7h, 00h, 8ah, 00h, 80h, 0fbh, 1ah, 73h
        db      00h, 8ah, 1eh, 86h, 37h, 88h, 87h, 70h, 37h, 0c6h, 06h, 82h, 37h, 01h, 0cbh
L_04B8E:
        db      80h
        db      3eh, 82h, 37h, 00h, 74h, 06h, 50h, 0eh, 0e8h, 90h, 00h, 58h, 04h, 30h, 8ah, 1eh
        db      86h, 37h, 0b7h, 00h, 88h, 87h, 70h, 37h, 0eh, 0e8h, 7fh, 00h, 0c6h, 06h, 85h, 37h
        db      0ffh, 0c6h, 06h, 83h, 37h, 01h, 0cbh
L_04BB6:
        db      80h, 3eh, 82h, 37h, 00h, 74h, 04h, 0eh, 0e8h
        db      69h, 00h, 0b0h, 20h, 80h, 3eh, 88h, 37h, 00h, 74h, 02h, 0b0h, 5fh, 8ah, 1eh, 86h
        db      37h, 0b7h, 00h, 88h, 87h, 70h, 37h, 0eh, 0e8h, 50h, 00h, 0c6h, 06h, 85h, 37h, 0ffh
        db      0c6h, 06h, 83h, 37h, 01h, 0cbh
L_04BE5:
        db      80h, 36h, 88h, 37h, 01h, 0cbh
L_04BEB:
        db      0b7h, 00h, 8ah, 1eh
        db      86h, 37h, 8ah, 97h, 70h, 37h, 0b6h, 00h, 0beh, 0d9h, 37h, 56h, 80h, 3ch, 00h, 74h
        db      09h, 3ah, 14h, 74h, 07h, 46h, 0feh, 0c6h, 0ebh, 0f2h, 0b6h, 00h, 5eh, 02h, 0c6h, 3ch
        db      4ch, 72h, 02h, 0b0h, 4bh, 2ah, 0c1h, 73h, 02h, 0b0h, 00h, 0b4h, 00h, 03h, 0f0h, 8ah
        db      04h, 88h, 87h, 70h, 37h, 0c6h, 06h, 83h, 37h, 01h, 0cbh
L_04C2A:
        db      0c6h, 06h, 82h, 37h, 00h
        db      0a0h, 87h, 37h, 0feh, 0c8h, 3ah, 06h, 86h, 37h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0feh, 06h
        db      86h, 37h, 0c6h, 06h, 84h, 37h, 00h, 0cbh
L_04C47:
        db      0c6h, 06h, 82h, 37h, 00h, 80h, 3eh, 86h
        db      37h, 00h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0feh, 0eh, 86h, 37h, 0c6h, 06h, 84h, 37h, 00h
        db      0cbh
L_04C60:
        db      1eh, 8ch, 0d8h, 8eh, 0c0h, 0c5h, 36h, 66h, 37h, 0bfh, 70h, 37h, 0b9h, 10h, 00h
        db      0f3h, 0a4h, 1fh, 0c6h, 06h, 83h, 37h, 00h, 0c6h, 06h, 86h, 37h, 00h, 0c6h, 06h, 84h
        db      37h, 00h, 0c6h, 06h, 85h, 37h, 0ffh, 0cbh
L_04C87:
        db      0b5h, 00h, 8ah, 0eh, 87h, 37h, 8bh, 0f1h
        db      4eh, 81h, 0c6h, 70h, 37h, 8ah, 04h, 3ch, 20h, 75h, 04h, 4eh, 0e2h, 0f7h, 0cbh, 4eh ; N..p7..< u.N...N
        db      49h, 74h, 0ah, 80h, 3ch, 20h, 75h, 0f7h, 0c6h, 04h, 5fh, 0ebh, 0f2h, 0b8h, 70h, 37h ; It..< u..._...p7
        db      8ch, 0dah, 1eh, 0ffh, 1eh, 6ah, 37h, 1fh, 3dh, 00h, 00h, 75h, 01h, 0cbh, 0c4h, 3eh
        db      66h, 37h, 0beh, 70h, 37h, 8ah, 0eh, 87h, 37h, 0b5h, 00h, 0f3h, 0a4h, 0eh, 0e8h, 06h
        db      00h, 0c6h, 06h, 63h, 00h, 01h, 0cbh
L_04CD6:
        db      8ch, 0d8h, 8eh, 0c0h, 0beh, 26h, 38h, 0bfh, 26h
        db      30h, 0b9h, 0c4h, 02h, 0f3h, 0a4h, 0a0h, 81h, 37h, 0a2h, 65h, 00h, 0cbh
L_04CEC:
        db      8ch, 0d8h, 8eh
        db      0c0h, 0bfh, 89h, 37h, 0b9h, 10h, 00h, 0b0h, 20h, 0f3h, 0aah, 0beh, 70h, 37h, 0bfh, 89h
        db      37h, 8ah, 0eh, 87h, 37h, 0b5h, 00h, 0f3h, 0a4h, 0cbh
L_04D09:
        db      8ch, 0d8h, 8eh, 0c0h, 0beh, 89h
        db      37h, 0b9h, 10h, 00h, 80h, 3ch, 20h, 75h, 04h, 46h, 0e2h, 0f8h, 0cbh, 0beh, 89h, 37h
        db      0bfh, 70h, 37h, 0b9h, 10h, 00h, 0f3h, 0a4h, 0cbh
        else
        db      8bh, 0eh, 50h, 37h, 80h
        db      0e9h, 01h, 73h, 02h, 0feh, 0c1h, 80h, 0edh, 01h, 73h, 02h, 0feh, 0c5h, 0a0h, 69h, 37h
        db      0b4h, 06h, 0f6h, 0e4h, 04h, 01h, 0b4h, 09h, 0b3h, 14h, 0cdh, 90h, 51h, 8bh, 0eh, 50h
        db      37h, 8ah, 26h, 69h, 37h, 8ch, 0dah, 0beh, 52h, 37h, 0b3h, 05h, 0cdh, 90h, 59h, 0a0h
        db      68h, 37h, 0b4h, 06h, 0f6h, 0e4h, 02h, 0c8h, 0b4h, 09h, 0b0h, 07h, 80h, 3eh, 65h, 37h
        db      00h, 75h, 05h, 0b3h, 15h, 0cdh, 90h, 0cbh, 80h, 0c5h, 08h, 0b3h, 0eh, 0cdh, 90h, 0cbh
L_04B33:
        db      80h, 0f9h, 00h, 75h, 01h, 0cbh, 80h, 0e4h, 0fh, 0c6h, 06h, 65h, 37h, 01h, 0beh, 7bh
        db      37h, 80h, 3eh, 6ah, 37h, 00h, 74h, 03h, 0beh, 9bh, 37h, 8ah, 0dch, 86h, 26h, 67h ; 7.>j7.t...7...&g
        db      37h, 80h, 3eh, 64h, 37h, 00h, 74h, 16h, 3ah, 0e3h, 75h, 07h, 80h, 36h, 66h, 37h ; 7.>d7.t.:.u..6f7
        db      01h, 0ebh, 0bh, 0c6h, 06h, 66h, 37h, 00h, 53h, 0eh, 0e8h, 0bah, 00h, 5bh, 0d0h, 0e3h
        db      02h, 1eh, 66h, 37h, 0b7h, 00h, 8ah, 00h, 80h, 0fbh, 1ah, 73h, 00h, 8ah, 1eh, 68h
        db      37h, 88h, 87h, 52h, 37h, 0c6h, 06h, 64h, 37h, 01h, 0cbh ; 7..R7..d7...>d7.
L_04B8E:
        db      80h, 3eh, 64h, 37h, 00h
        db      74h, 06h, 50h, 0eh, 0e8h, 90h, 00h, 58h, 04h, 30h, 8ah, 1eh, 68h, 37h, 0b7h, 00h
        db      88h, 87h, 52h, 37h, 0eh, 0e8h, 7fh, 00h, 0c6h, 06h, 67h, 37h, 0ffh, 0c6h, 06h, 65h
        db      37h, 01h, 0cbh
L_04BB6:
        db      80h, 3eh, 64h, 37h, 00h, 74h, 04h, 0eh, 0e8h, 69h, 00h, 0b0h, 20h
        db      80h, 3eh, 6ah, 37h, 00h, 74h, 02h, 0b0h, 5fh, 8ah, 1eh, 68h, 37h, 0b7h, 00h, 88h
        db      87h, 52h, 37h, 0eh, 0e8h, 50h, 00h, 0c6h, 06h, 67h, 37h, 0ffh, 0c6h, 06h, 65h, 37h
        db      01h, 0cbh
L_04BE5:
        db      80h, 36h, 6ah, 37h, 01h, 0cbh
L_04BEB:
        db      0b7h, 00h, 8ah, 1eh, 68h, 37h, 8ah, 97h
        db      52h, 37h, 0b6h, 00h, 0beh, 0bbh, 37h, 56h, 80h, 3ch, 00h, 74h, 09h, 3ah, 14h, 74h ; R7....7V.<.t.:.t
        db      07h, 46h, 0feh, 0c6h, 0ebh, 0f2h, 0b6h, 00h, 5eh, 02h, 0c6h, 3ch, 4ch, 72h, 02h, 0b0h
        db      4bh, 2ah, 0c1h, 73h, 02h, 0b0h, 00h, 0b4h, 00h, 03h, 0f0h, 8ah, 04h, 88h, 87h, 52h
        db      37h, 0c6h, 06h, 65h, 37h, 01h, 0cbh
L_04C2A:
        db      0c6h, 06h, 64h, 37h, 00h, 0a0h, 69h, 37h, 0feh
        db      0c8h, 3ah, 06h, 68h, 37h, 75h, 01h, 0cbh, 0cdh, 0a3h, 0feh, 06h, 68h, 37h, 0c6h, 06h
        db      66h, 37h, 00h, 0cbh ; f7....d7..>h7.u.
L_04C47:
        db      0c6h, 06h, 64h, 37h, 00h, 80h, 3eh, 68h, 37h, 00h, 75h, 01h
        db      0cbh, 0cdh, 0a3h, 0feh, 0eh, 68h, 37h, 0c6h, 06h, 66h, 37h, 00h, 0cbh
L_04C60:
        db      1eh, 8ch, 0d8h
        db      8eh, 0c0h, 0c5h, 36h, 48h, 37h, 0bfh, 52h, 37h, 0b9h, 10h, 00h, 0f3h, 0a4h, 1fh, 0c6h
        db      06h, 65h, 37h, 00h, 0c6h, 06h, 68h, 37h, 00h, 0c6h, 06h, 66h, 37h, 00h, 0c6h, 06h
        db      67h, 37h, 0ffh, 0cbh
L_04C87:
        db      0b5h, 00h, 8ah, 0eh, 69h, 37h, 8bh, 0f1h, 4eh, 81h, 0c6h, 52h
        db      37h, 8ah, 04h, 3ch, 20h, 75h, 04h, 4eh, 0e2h, 0f7h, 0cbh, 4eh, 49h, 74h, 0ah, 80h ; 7..< u.N...NIt..
        db      3ch, 20h, 75h, 0f7h, 0c6h, 04h, 5fh, 0ebh, 0f2h, 0b8h, 52h, 37h, 8ch, 0dah, 1eh, 0ffh
        db      1eh, 4ch, 37h, 1fh, 3dh, 00h, 00h, 75h, 01h, 0cbh, 0c4h, 3eh, 48h, 37h, 0beh, 52h ; .L7.=..u...>H7.R
        db      37h, 8ah, 0eh, 69h, 37h, 0b5h, 00h, 0f3h, 0a4h, 0eh, 0e8h, 06h, 00h, 0c6h, 06h, 63h
        db      00h, 01h, 0cbh
L_04CD6:
        db      8ch, 0d8h, 8eh, 0c0h, 0beh, 08h, 38h, 0bfh, 08h, 30h, 0b9h, 0c4h, 02h
        db      0f3h, 0a4h, 0a0h, 63h, 37h, 0a2h, 65h, 00h, 0cbh
L_04CEC:
        db      8ch, 0d8h, 8eh, 0c0h, 0bfh, 6bh, 37h
        db      0b9h, 10h, 00h, 0b0h, 20h, 0f3h, 0aah, 0beh, 52h, 37h, 0bfh, 6bh, 37h, 8ah, 0eh, 69h
        db      37h, 0b5h, 00h, 0f3h, 0a4h, 0cbh
L_04D09:
        db      8ch, 0d8h, 8eh, 0c0h, 0beh, 6bh, 37h, 0b9h, 10h, 00h
        db      80h, 3ch, 20h, 75h, 04h, 46h, 0e2h, 0f8h, 0cbh, 0beh, 6bh, 37h, 0bfh, 52h, 37h, 0b9h ; .< u.F....k7.R7.
        db      10h, 00h, 0f3h, 0a4h, 0cbh
        endif
isr_04D28:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        jne     isr_04D39
        call    fn_04DEE
isr_04D39:
        les     si, [50h]
        mov     al, byte ptr es:[si+0dh]
        mov     byte ptr [A0_B_0484E], al
        mov     al, byte ptr es:[si+0ch]
        mov     byte ptr [A0_B_0484F], al
        mov     ax, word ptr es:[si+0eh]
        mov     word ptr [A0_W_04850], ax
        mov     ax, word ptr es:[si+10h]
        mov     word ptr [A0_W_04852], ax
        mov     ax, word ptr es:[si+2]
        mov     word ptr [A0_W_CUR_TRACK], ax
        cmp     byte ptr [A0_B_PLAY_STATE], 2
        jne     isr_04D6A
        jmp     NEAR L_04C8D
isr_04D6A:
        mov     al, byte ptr es:[si+61h]
        mov     byte ptr [A0_B_SYNC_OUT_MODE], al
        mov     al, byte ptr es:[si+63h]
        mov     byte ptr [A0_B_04842], al
        mov     al, byte ptr es:[si+66h]
        mov     byte ptr [A0_B_04843], al
        mov     al, byte ptr es:[si+60h]
        mov     byte ptr [A0_B_SYNC_IN_MODE], al
        mov     al, byte ptr es:[si+0a2h]
        mov     byte ptr [A0_B_04845], al
        mov     al, byte ptr es:[si+65h]
        mov     byte ptr [A0_B_SYNC_IN_PORT], al
        mov     al, byte ptr es:[si+62h]
        mov     byte ptr [A0_B_04847], al
        mov     al, byte ptr es:[si+64h]
        mov     byte ptr [A0_B_FRAME_RATE], al
        mov     ax, word ptr es:[si+0a3h]
        mov     bx, word ptr es:[si+0a5h]
        mov     cx, word ptr es:[si+0a7h]
        mov     dx, word ptr es:[si+0a9h]
        mov     word ptr [A0_W_04846], ax
        mov     word ptr [A0_W_04844], bx
        mov     word ptr [A0_W_04866], cx
        mov     word ptr [A0_W_04848], dx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bp, 35h
        call    fn_03D52
        mov     word ptr [A0_W_0485E], di
        mov     word ptr [A0_W_04860], si
        push    ds
        mov     ax, 0f000h
        mov     es, ax
        sub     di, di
        mov     ds, word ptr [A0_W_SEQ_SEGMENT]
        sub     si, si
        mov     cx, 380h
        rep movsw
        pop     ds
L_04C8D:
        pop     ds
        iret
fn_04DEE:
        les     si, [50h]
        mov     al, byte ptr es:[si+7]
        mov     bx, A0_W_04813
        xlat
        mov     ah, 0
        mov     word ptr [A0_W_04856], ax
        shr     ax, 1
        je      br_04E1D
        mov     cl, byte ptr es:[si+14h]
        sub     ch, ch
        cmp     byte ptr es:[si+13h], 0
        jne     br_04E12
        neg     cx
br_04E12:
        mov     word ptr [A0_W_0485C], cx
        add     ax, cx
        jns     br_04E1D
        mov     ax, 0
br_04E1D:
        mov     word ptr [A0_W_04858], ax
        mov     bl, byte ptr es:[si+7]
        mov     bh, 0
        mov     al, byte ptr [bx+A0_B_0483A]
        mov     cl, al
        mov     ah, byte ptr es:[si+12h]
        mul     ah
        mov     bl, 19h
        div     bl
        mov     ah, 0
        cmp     cl, 0
        je      br_04E4F
        mov     bx, ax
        add     bx, word ptr [A0_W_0485C]
        js      br_04E4F
        cmp     bl, cl
        jb      br_04E4F
        mov     al, cl
        sub     ax, word ptr [A0_W_0485C]
br_04E4F:
        mov     word ptr [A0_W_0485A], ax
        ret
isr_04E53:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_04E5F
        pop     ds
        iret
        if      FW_VERSION < 114
fn_04E5F:
        if      FW_VERSION < 112
        cmp     bl, 7
        jne     fx_mixer_down
        jmp     br_04EE8
        endif
        endif
fx_mixer_down:
        if      FW_VERSION >= 114
fn_04E5F:
        endif
        if      FW_VERSION >= 112
        cmp     bl, 7
        jne     br_04E67
        jmp     br_04EE8
br_04E67:
        endif
        cmp     bl, 0bh
        jne     br_04E6F
        jmp     br_04F5C
br_04E6F:
        cmp     bl, 0ah
        jne     br_04E77
        jmp     br_04F6B
br_04E77:
        cmp     bl, 18h
        jne     br_04E7F
        jmp     br_04F76
br_04E7F:
        cmp     bl, 19h
        jne     br_04E87
        jmp     br_04F7D
br_04E87:
        cmp     bl, 1ah
        jne     br_04E8F
        jmp     br_04F89
br_04E8F:
        cmp     bl, 1bh
        jne     br_04E97
        jmp     br_04F9E
br_04E97:
        cmp     bl, 1ch
        jne     br_04E9F
        jmp     br_04FA4
br_04E9F:
        cmp     bl, 1dh
        jne     br_04EA7
        jmp     br_04FCA
br_04EA7:
        cmp     bl, 1eh
        jne     br_04EAF
        jmp     NEAR br_04FE1
br_04EAF:
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        jne     fn_04EC0
        cmp     bl, 4
        je      loop_04ECC
        cmp     bl, 5
        je      loop_04EDA
fn_04EC0:
        mov     byte ptr [A0_B_SEQ_CMD_REQUEST], bl
loop_04EC4:
        cmp     byte ptr [A0_B_SEQ_CMD_REQUEST], 0
        jne     loop_04EC4
        ret
loop_04ECC:
        mov     byte ptr [A0_B_REC_ACTIVE], 1
        mov     byte ptr [A0_B_REC_REPLACE_V11X], 1
        call    fn_069F8
        ret
loop_04EDA:
        mov     byte ptr [A0_B_REC_ACTIVE], 1
        mov     byte ptr [A0_B_REC_REPLACE_V11X], 0
        call    fn_069F8
        ret
br_04EE8:
        mov     dx, ax
        shl     ax, 4
        and     dx, 0f000h
        mov     word ptr [A0_FP_EVT_SCAN_PTR], ax
        if      FW_VERSION >= 114
        mov     word ptr [4336h], dx
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], dx
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], dx
        else
        mov     word ptr [42f8h], dx
        endif
        mov     word ptr [A0_FP_EVT_PLAY_PTR], ax
        mov     word ptr [P_433A], dx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     di, 2800h
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        mov     byte ptr es:[di+4], 0ffh
        mov     word ptr [A0_W_04330], di
        mov     word ptr [P_434E], es
        mov     word ptr [A0_W_04340], 700h
        mov     word ptr [A0_W_04342], es
        mov     word ptr [A0_W_SEQ_TICK_LO], 0
        mov     word ptr [A0_W_SEQ_TICK_HI], 0
        mov     word ptr [A0_W_04320], 0
        mov     word ptr [A0_W_04322], 0
        mov     word ptr [A0_W_04318], 0
        mov     word ptr [A0_W_0431A], 0
        mov     word ptr [A0_W_04300], 0
        mov     word ptr [A0_W_04302], 0
        call    fn_07BAD
        call    fn_069F8
        ret
br_04F5C:
        mov     word ptr [A0_W_043FC], ax
        mov     word ptr [A0_W_043FE], dx
        mov     word ptr [A0_W_04400], cx
        call    fn_04EC0
        ret
br_04F6B:
        mov     word ptr [A0_W_043F8], ax
        mov     word ptr [A0_W_043FA], dx
        call    fn_04EC0
        ret
br_04F76:
        mov     byte ptr [P_437D], al
        call    fn_04EC0
        ret
br_04F7D:
        mov     word ptr [P_436A], si
        mov     word ptr [P_436C], es
        call    fn_04EC0
        ret
br_04F89:
        mov     word ptr [A0_W_04388], ax
        mov     word ptr [A0_W_0438A], dx
        mov     word ptr [A0_W_0438C], di
        mov     word ptr [A0_W_0438E], si
        mov     byte ptr [A0_B_0437E], 1
        ret
br_04F9E:
        mov     byte ptr [A0_B_0437E], 0
        ret
br_04FA4:
        mov     byte ptr [P_4380], 1
        mov     word ptr [A0_FP_04360], 2800h
        mov     word ptr [A0_W_04362], 8000h
        sub     ax, ax
        mov     word ptr [A0_W_SEQ_TICK_LO], ax
        mov     word ptr [A0_W_SEQ_TICK_HI], ax
        mov     word ptr [A0_W_04348], ax
        mov     word ptr [A0_W_0434A], ax
        mov     word ptr [A0_W_04368], ax
        call    fn_07BAD
        ret
br_04FCA:
        mov     byte ptr [P_4380], 0
        sub     ax, ax
        mov     word ptr [A0_W_SEQ_TICK_LO], ax
        mov     word ptr [A0_W_SEQ_TICK_HI], ax
        mov     word ptr [A0_W_04340], 700h
        call    fn_06D3D
        ret
br_04FE1:
        call    fn_03AD9
        ret
fn_04FE5:
        les     si, [50h]
        cmp     byte ptr es:[si+63h], 0
        je      br_04FF8
        cmp     byte ptr es:[si+60h], 0
        je      br_04FF8
        ret
br_04FF8:
        call    fn_03AD9
        ret
isr_04FFC:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, byte ptr [A0_B_PLAY_STATE]
        mov     ah, 0
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        je      isr_05019
        mov     ah, 5
        cmp     byte ptr [A0_B_REC_REPLACE_V11X], 0
        je      isr_05019
        mov     ah, 4
isr_05019:
        mov     bl, ah
        or      bl, byte ptr [A0_B_04366]
        mov     cx, word ptr [A0_W_028CE]
        mov     bh, cl
        or      bh, ch
        mov     cl, byte ptr [A0_B_0437A]
        pop     ds
        iret
isr_0502D:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, 0
        xchg    al, byte ptr [P_4382]
        pop     ds
        iret
isr_0503B:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [A0_B_0436E], al
        pop     ds
        iret
fn_05046:
        or      ax, ax
        jne     br_0504B
        ret
br_0504B:
        mov     word ptr [A0_W_042F2], ax
        call    fn_062CB
        call    fn_03CF6
        mov     al, byte ptr [A0_B_PLAY_STATE]
        cmp     al, 2
        jne     br_0505E
        jmp     br_056AA
br_0505E:
        cmp     word ptr [A0_W_028CE], 0
        je      br_05068
        jmp     br_054B1
br_05068:
        cmp     byte ptr [A0_B_SYNC_OUT_MODE], 1
        jne     L_0506E
        jmp     br_0542A
L_0506E:
        jmp     SHORT br_05074
br_05074:
        cmp     byte ptr [A0_B_PLAY_STATE], 0dh
        jne     br_0507E
        jmp     NEAR loop_0528C
br_0507E:
        cmp     byte ptr [A0_B_PLAY_STATE], 8
        jne     br_05088
        jmp     br_0556C
br_05088:
        cmp     byte ptr [A0_B_PLAY_STATE], 9
        jne     br_05092
        jmp     br_055E9
br_05092:
        call    fn_0546B
        jae     br_050A1
        inc     word ptr [A0_W_043F6]
        call    fn_06D42
        call    fn_057DA
br_050A1:
        call    fn_072D2
fn_050A4:
        mov     al, 0
        xchg    al, byte ptr [A0_B_SEQ_CMD_REQUEST]
        cmp     al, 0
        jne     br_050B1
        jmp     fn_0514B
br_050B1:
        cmp     al, 1fh
        jne     br_050B8
        jmp     fn_05226
br_050B8:
        cmp     al, 3
        jne     br_050BF
        jmp     fn_05244
br_050BF:
        cmp     al, 2
        jne     br_050C6
        jmp     br_05253
br_050C6:
        cmp     al, 1
        jne     br_050CD
        jmp     br_05695
br_050CD:
        cmp     al, 20h
        jne     br_050D4
        jmp     br_05402
br_050D4:
        cmp     al, 0bh
        jne     br_050DB
        jmp     br_05290
br_050DB:
        cmp     al, 0ah
        jne     br_050E2
        jmp     br_052B1
br_050E2:
        cmp     al, 12h
        if      FW_VERSION < 112
        jne     L_050C9
        jmp     br_052C2
L_050C9:
        cmp     al, 11h
        jne     L_050EC
        jmp     br_052C9
L_050EC:
        cmp     al, 14h
        jne     L_050F3
        jmp     br_052D0
L_050F3:
        cmp     al, 13h
        jne     L_050FA
        jmp     br_052D7
L_050FA:
        cmp     al, 6
        jne     L_04FA6
        jmp     br_05364
L_04FA6:
        cmp     al, 18h
        jne     L_04FAD
        jmp     fn_0536F
L_04FAD:
        cmp     al, 21h
        jne     L_0510F
        jmp     fn_053A0
L_0510F:
        cmp     al, 19h
        jne     L_05116
        jmp     br_053E0
L_05116:
        cmp     al, 15h
        endif
        jne     br_050E9
        if      FW_VERSION >= 112
        jmp     br_052C2
        else
        jmp     fn_053F8
        endif
br_050E9:
        if      FW_VERSION >= 112
        cmp     al, 11h
        jne     br_050F0
        jmp     br_052C9
br_050F0:
        cmp     al, 14h
        jne     br_050F7
        jmp     br_052D0
br_050F7:
        cmp     al, 13h
        jne     br_050FE
        jmp     br_052D7
br_050FE:
        cmp     al, 6
        jne     br_05105
        jmp     br_05364
br_05105:
        cmp     al, 18h
        jne     br_0510C
        jmp     fn_0536F
br_0510C:
        cmp     al, 21h
        jne     br_05113
        jmp     fn_053A0
br_05113:
        cmp     al, 19h
        jne     br_0511A
        jmp     br_053E0
br_0511A:
        cmp     al, 15h
        jne     br_05121
        jmp     fn_053F8
br_05121:
        endif
        cmp     al, 16h
        jne     br_05128
        jmp     fn_0534A
br_05128:
        cmp     al, 0eh
        jne     br_0512F
        jmp     br_0534E
br_0512F:
        cmp     al, 0fh
        jne     br_05136
        jmp     fn_05352
br_05136:
        cmp     al, 10h
        jne     br_0513D
        jmp     br_05356
br_0513D:
        cmp     al, 17h
        jne     br_05144
        jmp     br_0535A
br_05144:
        cmp     al, 22h
        jne     fn_0514B
        jmp     fn_06D3D
fn_0514B:
        call    fn_072B3
        jae     br_05181
        cmp     bl, 10h
        jne     br_05158
        jmp     br_05269
br_05158:
        cmp     bl, 20h
        jne     br_05160
        jmp     br_05253
br_05160:
        cmp     bl, 30h
        jne     br_05168
        jmp     br_05270
br_05168:
        cmp     bl, 0
        jne     br_05170
        jmp     br_05286
br_05170:
        cmp     bl, 40h
        jne     br_05178
        jmp     fn_052DE
br_05178:
        cmp     bl, 50h
        jne     br_05180
        jmp     br_052EA
br_05180:
        ret
br_05181:
        cmp     byte ptr [A0_B_04375], 0
        je      br_05189
        ret
br_05189:
        cmp     word ptr [A0_W_028D0], 0
        je      br_051DD
        cmp     byte ptr [A0_B_04374], 0
        je      br_05198
        ret
br_05198:
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        callf   APP3_SEG:P_E5FF
        mov     ax, word ptr [P_28CA]
        mov     dx, word ptr [P_28CC]
        call    fn_0775A
        jb      loop_051D1
        add     word ptr [A0_W_SEQ_TICK_LO], 18h
        adc     word ptr [A0_W_SEQ_TICK_HI], 0
        call    fn_04FE5
        sub     word ptr [A0_W_SEQ_TICK_LO], 18h
        sbb     word ptr [A0_W_SEQ_TICK_HI], 0
        call    fn_03A42
        call    fn_056B4
        mov     byte ptr [A0_B_04375], 1
        ret
loop_051D1:
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        jne     L_051D9
        ret
L_051D9:
        call    fn_05AAE
        ret
br_051DD:
        cmp     word ptr [A0_W_056E6], 0
        jne     br_051E5
        ret
br_051E5:
        cmp     byte ptr [A0_B_04374], 0
        je      br_051ED
        ret
br_051ED:
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        callf   APP3_SEG:P_E5FF
        mov     ax, word ptr [A0_W_056D8]
        mov     dx, word ptr [A0_W_056DA]
        call    fn_0775A
        jb      loop_051D1
        add     word ptr [A0_W_SEQ_TICK_LO], 18h
        adc     word ptr [A0_W_SEQ_TICK_HI], 0
        call    fn_04FE5
        sub     word ptr [A0_W_SEQ_TICK_LO], 18h
        sbb     word ptr [A0_W_SEQ_TICK_HI], 0
        call    fn_03A42
        call    fn_056B4
        mov     byte ptr [A0_B_04375], 1
        ret
fn_05226:
        les     si, [50h]
        mov     ax, word ptr es:[si]
        int     0d8h
        les     si, [50h]
        mov     ax, word ptr es:[si+0ah]
        int     0d9h
        sub     ax, ax
        sub     dx, dx
        call    fn_0759C
        call    fn_07742
        ret
fn_05244:
        call    fn_03A3D
        mov     byte ptr [A0_B_PLAY_STATE], 0dh
        mov     word ptr [A0_W_04402], 0ffffh
        ret
br_05253:
        mov     al, 0
        xchg    al, byte ptr [A0_B_04365]
        cmp     al, 0
        je      br_05260
        call    fn_03AD9
br_05260:
        call    fn_03A42
        mov     byte ptr [A0_B_PLAY_STATE], 0dh
        ret
br_05269:
        call    fn_05226
        call    fn_05244
        ret
br_05270:
        mov     byte ptr [A0_B_REC_ACTIVE], 1
        mov     byte ptr [A0_B_REC_REPLACE], 1
        call    fn_069F8
        call    fn_03A42
        mov     byte ptr [A0_B_PLAY_STATE], 0dh
        ret
br_05286:
        mov     byte ptr [A0_B_SEQ_CMD_REQUEST], 1
        ret
loop_0528C:
        call    fn_05558
        ret
br_05290:
        mov     ax, word ptr [A0_W_043FC]
        mov     bx, word ptr [A0_W_043FE]
        mov     cx, word ptr [A0_W_04400]
        call    fn_0770E
fn_0529E:
        call    fn_03AD9
        mov     byte ptr [A0_B_04354], 0
        cmp     byte ptr [A0_B_0436E], 1
        jne     L_052AC
        call    L_05E96
L_052AC:
        ret
br_052B1:
        mov     ax, word ptr [A0_W_043F8]
        mov     dx, word ptr [A0_W_043FA]
        call    fn_0759C
        call    fn_07742
        call    fn_0529E
        ret
br_052C2:
        call    fn_07F0F
        call    fn_0529E
        ret
br_052C9:
        call    fn_07F78
        call    fn_0529E
        ret
br_052D0:
        call    fn_07978
        call    fn_0529E
        ret
br_052D7:
        call    fn_079AF
        call    fn_0529E
        ret
fn_052DE:
        call    fn_0775A
        call    fn_0529E
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        ret
br_052EA:
        mov     dx, 18h
        mul     dx
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_052FA
        int     0e3h
        jmp     br_0532C
br_052FA:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[34h], 0
        je      br_0532C
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[1ch]
        sbb     cx, word ptr es:[1eh]
        jb      br_0532C
loop_05316:
        sub     ax, word ptr es:[1ch]
        sbb     dx, word ptr es:[1eh]
        jae     loop_05316
        add     ax, word ptr es:[1ch]
        adc     dx, word ptr es:[1eh]
br_0532C:
        call    fn_0759C
        call    fn_07742
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        call    fn_04FE5
        mov     byte ptr [A0_B_04354], 0
        cmp     byte ptr [A0_B_0436E], 1
        jne     br_05349
        call    L_05E96
br_05349:
        ret
fn_0534A:
        call    fn_07BAD
        ret
br_0534E:
        call    fn_039DB
        ret
fn_05352:
        call    fn_039E2
        ret
br_05356:
        call    fn_039E9
        ret
br_0535A:
        call    L_039E9
        call    fn_03B72
        call    fn_027A8
        ret
br_05364:
        mov     byte ptr [A0_B_REC_ACTIVE], 0
        mov     byte ptr [A0_B_REC_REPLACE_V11X], 0
        ret
fn_0536F:
        les     si, [50h]
        mov     di, word ptr es:[si+2]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        test    byte ptr es:[di+A0_TBL_SEQ_TRK_FLAGS], 2
        jne     br_05384
        ret
br_05384:
        mov     ah, 0c0h
        mov     al, byte ptr [P_437D]
        mov     cl, 0
        or      ah, byte ptr es:[di+5c0h]
        mov     ch, byte ptr es:[di+580h]
        mov     bl, 0
        if      FW_VERSION >= 110
        mov     bh, 0
        endif
        mov     dx, 40h
        call    fn_06CF0
        ret
fn_053A0:
        mov     si, 0
loop_053A3:
        mov     ax, 0f000h
        mov     es, ax
        test    byte ptr es:[si+A0_TBL_SEQ_TRK_FLAGS], 1
        je      br_053D9
        test    byte ptr es:[si+A0_TBL_SEQ_TRK_FLAGS], 2
        je      br_053D9
        mov     ah, 0c0h
        mov     al, byte ptr es:[si+600h]
        sub     al, 1
        jb      br_053D9
        push    si
        mov     cl, 0
        or      ah, byte ptr es:[si+5c0h]
        mov     ch, byte ptr es:[si+580h]
        mov     bl, 0
        mov     dx, 40h
        call    fn_06CF0
        pop     si
br_053D9:
        inc     si
        cmp     si, 40h
        jne     loop_053A3
        ret
br_053E0:
        les     si, [P_436A]
        mov     ax, es
        or      ax, si
        jne     br_053EB
        ret
br_053EB:
        mov     al, byte ptr es:[si+3]
        and     ax, 3fh
        mov     di, ax
        call    fn_06045
        ret
fn_053F8:
        call    fn_07E83
        call    fn_07D98
        call    fn_07BAD
        ret
br_05402:
        call    fn_05669
        jb      br_05408
        ret
br_05408:
        mov     bx, word ptr [A0_W_SEQ_TICK_LO]
        mov     cx, word ptr [A0_W_SEQ_TICK_HI]
        call    fn_07A16
        sub     bx, bx
        sub     cx, cx
        call    fn_0770E
        mov     byte ptr [A0_B_04365], 1
        ret
        mov     ax, 834h
        mov     dx, 0
        call    fn_052DE
        ret
br_0542A:
        cmp     byte ptr [A0_B_PLAY_STATE], 8
        jne     br_05434
        jmp     br_0556C
br_05434:
        cmp     byte ptr [A0_B_PLAY_STATE], 9
        jne     br_0543E
        jmp     br_055E9
br_0543E:
        call    fn_072D2
        call    fn_0546B
        jb      br_05447
        ret
br_05447:
        call    fn_06D42
        call    fn_057DA
        cmp     byte ptr [A0_B_PLAY_STATE], 0dh
        jne     br_05457
        jmp     loop_0528C
br_05457:
        inc     word ptr [A0_W_043F6]
        test    word ptr [A0_W_043F6], 3
        je      br_05464
        ret
br_05464:
        call    fn_03A4C
        call    fn_050A4
        ret
fn_0546B:
        mov     ax, word ptr [A0_W_042F2]
        mov     dx, 3e8h
        mul     dx
        add     ax, word ptr [A0_W_04312]
        adc     dx, word ptr [A0_W_04310]
        mov     bx, ax
        mov     cx, dx
        sub     ax, word ptr [A0_W_0430E]
        sbb     dx, word ptr [P_432C]
        jae     br_0548D
        mov     ax, bx
        mov     dx, cx
br_0548D:
        mov     word ptr [A0_W_04312], ax
        mov     word ptr [A0_W_04310], dx
        mov     cx, 60h
        call    fn_01534
        mov     di, word ptr [A0_W_0430E]
        mov     si, word ptr [P_432C]
        call    X_014EE
        cmp     ax, word ptr [A0_W_04332]
        jne     br_054AC
        ret
br_054AC:
        mov     word ptr [A0_W_04332], ax
        stc
        ret
br_054B1:
        call    fn_0729C
        jae     br_054DE
        cmp     al, 0f8h
        je      br_054C3
        cmp     al, 0fah
        je      br_054E5
        cmp     al, 0fbh
        je      br_0552A
        ret
br_054C3:
        cmp     byte ptr [A0_B_PLAY_STATE], 0ch
        jne     br_054CC
        jmp     br_05545
br_054CC:
        cmp     byte ptr [A0_B_PLAY_STATE], 0dh
        jne     br_054D5
        jmp     br_05545
br_054D5:
        call    fn_03A4C
        call    fn_06D42
        call    fn_057DA
br_054DE:
        call    fn_050A4
        call    fn_072D2
        ret
br_054E5:
        cmp     byte ptr [A0_B_0436E], 3
        je      br_054F9
        mov     es, word ptr [A0_W_0430C]
        cmp     byte ptr es:[12h], 0
        jne     br_054F9
        ret
br_054F9:
        mov     word ptr [A0_W_04402], 0ffffh
        mov     byte ptr [A0_B_04368], 1
        call    fn_03A3D
        les     si, [50h]
        mov     ax, word ptr es:[si]
        int     0d8h
        les     si, [50h]
        mov     ax, word ptr es:[si+0ah]
        int     0d9h
        sub     ax, ax
        sub     dx, dx
        call    fn_0775A
        call    fn_07742
        mov     byte ptr [A0_B_PLAY_STATE], 0ch
        ret
br_0552A:
        mov     es, word ptr [A0_W_0430C]
        cmp     byte ptr es:[12h], 0
        jne     br_05537
        ret
br_05537:
        mov     byte ptr [A0_B_04368], 1
        call    fn_03A42
        mov     byte ptr [A0_B_PLAY_STATE], 0ch
        ret
br_05545:
        call    fn_056B4
        mov     cx, 3
L_05547:
        push    cx
loop_0554C:
        call    fn_0580B
        jae     loop_0554C
        call    fn_058E4
        pop     cx
        loop    L_05547
        ret
fn_05558:
        mov     dx, 146h
        out     dx, al
        les     si, [50h]
        cmp     byte ptr es:[si+1ch], 0
        je      br_0559B
        mov     byte ptr [A0_B_PLAY_STATE], 8
br_0556C:
        mov     al, 0
        xchg    al, byte ptr [A0_B_SEQ_CMD_REQUEST]
        cmp     al, 0
        cmp     al, 1
        je      loop_05583
        call    fn_06949
        jb      br_0557E
        ret
br_0557E:
        cmp     al, 0
        jne     br_0559B
        ret
loop_05583:
        call    fn_03A47
        mov     byte ptr [A0_B_REC_ACTIVE], 0
        mov     byte ptr [A0_B_REC_REPLACE], 0
        mov     byte ptr [A0_B_PLAY_STATE], 0
        mov     byte ptr [A0_B_04384], 0
        ret
br_0559B:
        call    fn_05669
        jb      br_055A3
        jmp     fn_056B4
br_055A3:
        mov     bx, word ptr [A0_W_SEQ_TICK_LO]
        mov     cx, word ptr [A0_W_SEQ_TICK_HI]
        call    fn_07A16
        mov     ax, cx
        les     si, [50h]
        mov     bl, byte ptr es:[si+18h]
        mov     bh, 0
        mov     bl, byte ptr cs:[bx+TBL_NOTE_TICKS]
        div     bl
        cmp     al, 0
        jne     br_055C8
        jmp     fn_056B4
br_055C8:
        mov     byte ptr [A0_B_0480F], al
        mov     byte ptr [A0_B_PLAY_STATE], 9
        sub     ax, ax
        mov     byte ptr [A0_B_0482D], al
        mov     byte ptr [A0_B_04810], al
        mov     word ptr [A0_W_04312], ax
        mov     word ptr [A0_W_04310], ax
        mov     word ptr [A0_W_04332], ax
        call    fn_06EEE
        dec     byte ptr [A0_B_0480F]
        ret
br_055E9:
        mov     al, 0
        xchg    al, byte ptr [A0_B_SEQ_CMD_REQUEST]
        cmp     al, 0
        cmp     al, 1
        je      loop_05583
        cmp     word ptr [A0_W_028CE], 0
        jne     loop_0560B
        call    fn_0546B
        jb      br_05602
        ret
br_05602:
        call    fn_05622
        jb      L_05604
        ret
L_05604:
        jmp     fn_056B4
loop_0560B:
        call    fn_0729C
        jae     br_05611
        ret
br_05611:
        call    fn_05622
        call    fn_05622
        call    fn_05622
        call    fn_05622
        jae     loop_0560B
        jmp     fn_056B4
fn_05622:
        cmp     byte ptr [P_482B], 0
        je      br_05643
        call    fn_05651
        clc
        je      br_05630
        ret
br_05630:
        mov     byte ptr [A0_B_04810], 0
        dec     byte ptr [A0_B_0480F]
        push    bx
        call    fn_06EEE
        pop     bx
        call    fn_072F3
        clc
        ret
br_05643:
        call    fn_05651
        clc
        je      br_0564A
        ret
br_0564A:
        mov     byte ptr [A0_B_04811], 0
        stc
        ret
fn_05651:
        inc     byte ptr [A0_B_04810]
        les     si, [50h]
        mov     bl, byte ptr es:[si+18h]
        mov     bh, 0
        mov     bl, byte ptr cs:[bx+TBL_NOTE_TICKS]
        sub     bl, byte ptr [A0_B_04810]
        ret
fn_05669:
        les     si, [50h]
        cmp     byte ptr es:[si+15h], 0
        je      br_0568B
        cmp     byte ptr es:[si+16h], 0
        je      br_0568B
        cmp     byte ptr es:[si+16h], 2
        je      L_0552A
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        je      br_0568B
L_0552A:
        stc
        ret
br_0568B:
        clc
        ret
TBL_NOTE_TICKS:
        db      60h, 40h, 30h, 20h, 18h, 10h, 0ch, 08h
br_05695:
        mov     byte ptr [A0_B_REC_ACTIVE], 0
        mov     byte ptr [A0_B_REC_REPLACE_V11X], 0
        mov     byte ptr [A0_B_PLAY_STATE], 0
        mov     byte ptr [A0_B_04368], 0
        ret
br_056AA:
        cmp     byte ptr [A0_B_04354], 0
        je      fn_056B4
        jmp     br_05787
fn_056B4:
        mov     dx, 146h
        out     dx, al
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     word ptr [A0_W_04324], si
        mov     word ptr [A0_W_04326], es
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_04344], ax
        mov     word ptr [A0_W_0432A], bx
        mov     bx, word ptr [A0_W_SEQ_TICK_LO]
        mov     cx, word ptr [A0_W_SEQ_TICK_HI]
        call    fn_07A16
        mov     byte ptr [A0_B_04830], dl
        mov     word ptr [A0_W_04350], si
        mov     word ptr [A0_W_04352], es
        mov     byte ptr [A0_B_PLAY_STATE], 2
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, word ptr es:[30h]
        shl     si, 2
        add     si, 1500h
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     dh, 0
        mov     word ptr [A0_W_04354], ax
        mov     word ptr [A0_W_04356], dx
        mov     ax, word ptr es:[3ah]
        mov     bx, word ptr es:[3ch]
        mov     word ptr [A0_W_04330], ax
        mov     word ptr [P_434E], bx
        mov     byte ptr [A0_B_04354], 1
        mov     byte ptr [A0_B_04374], 0
        mov     byte ptr [A0_B_04366], 0
        call    fn_0371D
        mov     byte ptr [A0_B_056CC], 0
        call    fn_081A0
        call    fn_05950
        mov     word ptr [A0_W_TICK_IN_BEAT], 0
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, word ptr es:[32h]
        inc     si
        jne     br_05752
        mov     si, word ptr es:[1ah]
br_05752:
        shl     si, 2
        add     si, 1500h
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     dh, 0
        mov     word ptr [A0_W_04358], ax
        mov     word ptr [A0_W_0435A], dx
        cmp     word ptr [A0_W_028CE], 0
        jne     br_05771
        ret
br_05771:
        sub     ax, ax
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 1
        jne     br_0577D
        mov     al, byte ptr [A0_B_04847]
br_0577D:
        mov     dx, 3e8h
        mul     dx
        add     word ptr [A0_W_04308], ax
        ret
br_05787:
        call    fn_0514B
        cmp     byte ptr [A0_B_04384], 0
        jne     loop_0579B
        call    fn_0580B
        jb      br_05797
        ret
br_05797:
        call    fn_058E4
        ret
loop_0579B:
        cmp     word ptr [A0_W_028CE], 0
        je      loop_057C7
        call    fn_0729C
        jb      br_057A8
        ret
br_057A8:
        cmp     al, 0fch
        je      loop_057C7
        cmp     al, 0f8h
        jne     loop_0579B
        mov     cx, 4
L_057AF:
        push    cx
loop_057B4:
        call    fn_0580B
        jae     loop_057B4
        call    fn_058E4
        pop     cx
        loop    L_057AF
        cmp     byte ptr [A0_B_PLAY_STATE], 2
        je      loop_0579B
        ret
loop_057C7:
        call    fn_0580B
        jae     loop_057C7
        mov     byte ptr [A0_B_SEQ_CMD_REQUEST], 1
        call    fn_058E4
        mov     byte ptr [64h], 1
        ret
fn_057DA:
        cmp     byte ptr [A0_B_0436E], 1
        je      br_057E2
        ret
br_057E2:
        cmp     byte ptr [A0_B_048CA], 0
        jne     br_057EA
        ret
br_057EA:
        mov     ax, word ptr [A0_W_043F6]
        sub     dx, dx
        les     si, [50h]
        mov     bl, byte ptr es:[si+18h]
        mov     bh, 0
        mov     bl, byte ptr cs:[bx+TBL_NOTE_TICKS]
        mov     bh, 0
        div     bx
        or      dx, dx
        je      br_05807
        ret
br_05807:
        call    fn_06F48
        ret
fn_0580B:
        mov     bp, word ptr [A0_W_042F2]
        add     word ptr [A0_W_04300], bp
        adc     word ptr [A0_W_04302], 0
        cmp     byte ptr [A0_B_04375], 0
        jne     br_05821
        jmp     fn_05875
br_05821:
        mov     ax, word ptr [A0_W_04318]
        mov     dx, word ptr [A0_W_0431A]
        add     ax, bp
        adc     dx, 0
        sub     ax, word ptr [A0_W_04300]
        sbb     dx, word ptr [A0_W_04302]
        jb      br_05846
        or      dx, dx
        jne     br_0585F
        cmp     ax, 3e8h
        jae     br_0585F
        cmp     ax, 1
        jb      fn_05875
        ret
br_05846:
        inc     dx
        jne     br_0585F
        neg     ax
        cmp     ax, 3e8h
        jae     br_0585F
        cmp     ax, 1
        jb      fn_05875
        call    fn_05875
        jae     br_0585B
        ret
br_0585B:
        call    fn_05875
        ret
br_0585F:
        mov     byte ptr [A0_B_04375], 0
        if      FW_VERSION >= 110
        call    fn_05AAE
        endif
        mov     word ptr [A0_W_056E6], 0
        mov     word ptr [A0_W_028D0], 0
        if      FW_VERSION < 110
        call    fn_05AAE
        endif
        clc
        ret
fn_05875:
        push    bp
        add     word ptr [A0_W_04318], bp
        adc     word ptr [A0_W_0431A], 0
        if      FW_VERSION >= 110
        push    bp
loop_05880:
        push    bp
        call    fn_03745
        pop     bp
        dec     bp
        jne     loop_05880
        pop     bp
        endif
        mov     ax, 3e8h
        mul     bp
        add     word ptr [A0_W_04320], ax
        adc     word ptr [A0_W_04322], 0
        add     ax, word ptr [A0_W_04308]
        adc     dx, word ptr [A0_W_04306]
        mov     bx, ax
        mov     cx, dx
        sub     ax, word ptr [A0_W_0430E]
        sbb     dx, word ptr [P_432C]
        jae     br_058B1
        mov     ax, bx
        mov     dx, cx
br_058B1:
        mov     word ptr [A0_W_04308], ax
        mov     word ptr [A0_W_04306], dx
        mov     cx, 60h
        call    fn_01534
        mov     di, word ptr [A0_W_0430E]
        mov     si, word ptr [P_432C]
        call    X_014EE
        pop     bp
        cmp     ax, word ptr [A0_W_TICK_IN_BEAT]
        jne     br_058D1
        ret
br_058D1:
        inc     word ptr [A0_W_TICK_IN_BEAT]
        cmp     word ptr [A0_W_TICK_IN_BEAT], 60h
        jne     br_058E2
        mov     word ptr [A0_W_TICK_IN_BEAT], 0
br_058E2:
        stc
        ret
fn_058E4:
        call    fn_0596C
        jae     br_058EA
        ret
br_058EA:
        call    fn_05E46
        call    fn_06D42
        call    fn_063B1
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[34h], 0
        je      br_0591D
        mov     ax, word ptr [A0_W_04358]
        mov     dx, word ptr [A0_W_0435A]
        sub     ax, 4
        sbb     dx, 0
        call    fn_06B75
        jae     br_0591D
        mov     ax, word ptr [A0_W_04358]
        mov     dx, word ptr [A0_W_0435A]
        call    fn_06B75
        jae     br_0592F
br_0591D:
        call    fn_064FB
        call    fn_0661A
        call    fn_06781
        call    fn_067EF
        call    fn_0681B
        call    fn_06A8F
br_0592F:
        call    fn_05B8A
        call    fn_08660
        call    fn_05BD1
        jae     br_0593B
        ret
br_0593B:
        call    fn_05C21
        call    fn_05D66
        jae     br_05944
        ret
br_05944:
        call    fn_05A1D
        jae     br_0594A
        ret
br_0594A:
        call    fn_05A87
        jae     fn_05950
        ret
fn_05950:
        call    fn_05AFF
        call    fn_05B4D
        call    fn_05B31
        call    fn_06E45
        call    fn_06EA2
        call    fn_05FFE
        call    fn_08328
        call    fn_06FDB
        call    fn_05D3D
        ret
fn_0596C:
        mov     ax, 0f000h
        mov     es, ax
        cmp     byte ptr [A0_B_0436E], 3
        je      br_0598A
        cmp     byte ptr [A0_B_0436E], 4
        je      br_0598A
        cmp     byte ptr [A0_B_0437B], 0
        jne     br_0598A
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
br_0598A:
        mov     ax, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
        call    fn_06B75
        clc
        je      br_0599A
        ret
br_0599A:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_059A4
        jmp     fn_05AA2
br_059A4:
        cmp     word ptr es:[1ah], 3e7h
        jne     br_059B0
        jmp     fn_05AA2
br_059B0:
        cmp     word ptr es:[32h], -1
        je      br_059BB
        jmp     fn_05AA2
br_059BB:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, word ptr es:[1ah]
        shl     si, 2
        add     si, 1500h
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        sub     ax, word ptr es:[si-4]
        sbb     dl, byte ptr es:[si-2]
        mov     cx, ax
        add     ax, word ptr es:[si]
        adc     dl, byte ptr es:[si+2]
        mov     word ptr es:[si+4], ax
        mov     word ptr es:[si+6], dx
        inc     word ptr es:[1ah]
        mov     dh, 0
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], dx
        mov     cx, ax
        mov     bx, dx
        mov     ax, word ptr es:[14h]
        mov     si, 0eh
        mul     si
        mov     si, ax
        add     si, 700h
        mov     word ptr es:[si+2], cx
        mov     word ptr es:[si+4], bx
        call    fn_07E83
        call    fn_07D98
        ret
fn_05A1D:
        test    byte ptr [A0_W_SEQ_TICK_LO], 3
        clc
        je      br_05A26
        ret
br_05A26:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        je      br_05A32
        call    fn_05E2D
        jb      fn_05AA2
br_05A32:
        mov     al, 0
        xchg    al, byte ptr [A0_B_SEQ_CMD_REQUEST]
        cmp     al, 0
        jne     br_05A3D
        ret
br_05A3D:
        cmp     al, 4
        jne     br_05A44
        jmp     loop_04ECC
br_05A44:
        cmp     al, 5
        jne     br_05A4B
        jmp     loop_04EDA
br_05A4B:
        cmp     al, 1
        je      fn_05AA2
        cmp     al, 6
        je      br_05A64
        cmp     al, 15h
        je      br_05A73
        cmp     al, 16h
        je      br_05A78
        cmp     al, 0fh
        je      br_05A7D
        cmp     al, 18h
        je      br_05A82
        ret
br_05A64:
        call    fn_06705
        mov     byte ptr [A0_B_REC_ACTIVE], 0
        mov     byte ptr [A0_B_REC_REPLACE], 0
        clc
        ret
br_05A73:
        call    fn_053F8
        clc
        ret
br_05A78:
        call    fn_0534A
        clc
        ret
br_05A7D:
        call    fn_05352
        clc
        ret
br_05A82:
        call    fn_0536F
        clc
        ret
fn_05A87:
        cmp     byte ptr [A0_B_04375], 0
        jne     br_05A8F
        ret
br_05A8F:
        mov     ax, word ptr [A0_W_028D0]
        or      ax, word ptr [A0_W_056E6]
        je      br_05A99
        ret
br_05A99:
        mov     byte ptr [A0_B_04374], 0
        call    fn_05AAE
        ret
fn_05AA2:
        cmp     byte ptr [A0_B_04375], 0
        je      fn_05AAE
        mov     byte ptr [A0_B_04374], 1
fn_05AAE:
        call    fn_06D3D
        call    fn_06705
        call    fn_06625
        call    fn_03A47
        call    fn_06FAE
        call    smpte_test_stop
        call    fn_069F8
        call    fn_06E03
        mov     dx, 156h
        out     dx, al
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, 700h
        call    fn_07C3B
        int     8dh
        sub     ax, ax
        mov     byte ptr [A0_B_PLAY_STATE], al
        mov     byte ptr [A0_B_04354], al
        mov     byte ptr [A0_B_REC_ACTIVE], al
        mov     byte ptr [A0_B_04375], al
        mov     byte ptr [A0_B_REC_REPLACE], al
        mov     byte ptr [A0_B_04365], al
        mov     word ptr [A0_W_04312], ax
        mov     word ptr [A0_W_04310], ax
        mov     word ptr [A0_W_04332], ax
        mov     byte ptr [A0_B_04384], al
        stc
        ret
fn_05AFF:
        cmp     byte ptr [A0_B_0437E], 0
        je      br_05B2B
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     bx, ax
        mov     cx, dx
        sub     ax, word ptr [A0_W_04388]
        sbb     dx, word ptr [A0_W_0438A]
        jb      br_05B25
        sub     bx, word ptr [A0_W_0438C]
        sbb     cx, word ptr [A0_W_0438E]
        jb      br_05B2B
br_05B25:
        mov     byte ptr [A0_B_0437F], 0
        ret
br_05B2B:
        mov     byte ptr [A0_B_0437F], 1
        ret
fn_05B31:
        mov     di, word ptr [A0_W_04856]
        sub     si, si
        mov     ax, di
        mov     dx, si
        shr     ax, 1
        add     ax, word ptr [A0_W_SEQ_TICK_LO]
        adc     dx, word ptr [A0_W_SEQ_TICK_HI]
        call    X_014EE
        mov     word ptr [P_4808], di
        ret
fn_05B4D:
        test    byte ptr [A0_W_SEQ_TICK_LO], 3
        je      br_05B55
        ret
br_05B55:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_05B66
        call    fn_03B1B
br_05B66:
        mov     bx, 18h
        cmp     dx, bx
        jb      br_05B70
        mov     dx, 17h
br_05B70:
        div     bx
        mov     bx, 0ffffh
        cmp     bx, word ptr [A0_W_04402]
        je      br_05B86
        cmp     ax, word ptr [A0_W_04402]
        jae     L_05A45
        ret
L_05A45:
        mov     word ptr [A0_W_04402], bx
br_05B86:
        call    fn_03A4C
        ret
fn_05B8A:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        add     ax, 1
        adc     dx, 0
        mov     word ptr [A0_W_SEQ_TICK_LO], ax
        mov     word ptr [A0_W_SEQ_TICK_HI], dx
        les     si, [A0_W_04350]
        add     si, 4
        cmp     ax, word ptr es:[si]
        jne     br_05BBF
        cmp     dl, byte ptr es:[si+2]
        jne     br_05BBF
        mov     word ptr [A0_W_04350], si
        mov     byte ptr [A0_B_04811], 0
        mov     byte ptr [A0_B_04830], 0
        ret
br_05BBF:
        sub     si, 4
        sub     ax, word ptr es:[si]
        sub     dx, dx
        mov     bx, word ptr [A0_W_04856]
        div     bx
        mov     byte ptr [A0_B_04830], al
        ret
fn_05BD1:
        cmp     byte ptr [A0_B_0436E], 3
        clc
        je      br_05BDA
        ret
br_05BDA:
        mov     ax, 0f000h
        mov     es, ax
        mov     ax, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
        call    fn_06B75
        clc
        je      br_05BEF
        ret
br_05BEF:
        if      FW_VERSION >= 112
        if      FW_VERSION >= 114
        push    word ptr [4324h]
        push    word ptr [4326h]
        else
        push    word ptr [4308h]
        push    word ptr [430ah]
        endif
        push    word ptr [A0_W_TICK_IN_BEAT]
        endif
        int     0e0h
        if      FW_VERSION >= 112
        pop     bx
        pop     dx
        pop     cx
        if      FW_VERSION < 114
        mov     word ptr [4308h], cx
        mov     word ptr [430ah], dx
        mov     word ptr [A0_W_TICK_IN_BEAT], bx
        endif
        endif
        cmp     ah, 0
        je      br_05C17
        mov     ax, 0f000h
        mov     es, ax
        cmp     byte ptr es:[12h], 0
        je      br_05C17
        call    fn_053A0
        clc
        ret
br_05C17:
        call    fn_05AA2
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        stc
        ret
fn_05C21:
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_05C29
        ret
br_05C29:
        cmp     byte ptr [A0_B_0436E], 4
        je      br_05C46
        cmp     byte ptr [A0_B_0437B], 0
        jne     br_05C46
        les     si, [50h]
        mov     ax, word ptr es:[si+0abh]
        cmp     ax, 0
        jne     br_05C46
        ret
br_05C46:
        mov     ax, 0f000h
        mov     es, ax
        mov     ax, word ptr es:[40h]
        mov     dx, word ptr es:[42h]
        call    fn_06B75
        je      br_05C87
        les     si, [50h]
        cmp     byte ptr es:[si+0adh], 0
        jne     br_05C66
        ret
br_05C66:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     di, word ptr [A0_W_04856]
        mov     si, 0
        call    X_014EE
        cmp     di, 0
        je      br_05C7D
        ret
br_05C7D:
        les     si, [50h]
        mov     byte ptr es:[si+0adh], 0
br_05C87:
        les     si, [50h]
        mov     ax, word ptr es:[si+0abh]
        sub     ax, 1
        jae     br_05CAA
        mov     ax, 0f000h
        mov     es, ax
        cmp     byte ptr es:[34h], 0
        jne     br_05CCB
        ret
        db      0c4h, 36h, 50h, 00h, 26h, 8bh, 04h
br_05CAA:
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+0abh], 0
        mov     word ptr es:[0f10h], 0f000h
        int     0ech
        call    fn_053A0
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        mov     byte ptr [A0_B_0437B], 1
        ret
br_05CCB:
        mov     si, word ptr es:[30h]
        shl     si, 2
        add     si, 1500h
        mov     word ptr [A0_W_04350], si
        mov     word ptr [A0_W_04352], es
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     dh, 0
        mov     word ptr [A0_W_SEQ_TICK_LO], ax
        mov     word ptr [A0_W_SEQ_TICK_HI], dx
        push    es
        mov     bp, A0_W_056F1
        mov     si, word ptr es:[3eh]
        mov     word ptr ds:[bp+8], si
        add     si, 0ch
        add     si, bp
        mov     bl, byte ptr [si]
        mov     bh, 0
        shl     bx, 1
        mov     ax, word ptr [bx+A0_TBL_01884]
        mov     word ptr ds:[bp+0ah], ax
        push    bp
        mov     bp, resume_05D16
        retxa   2Ch
resume_05D16:
        pop     bp
        mov     dx, word ptr ds:[bp+4]
        shr     dx, 9
        add     dx, 0ff00h
        out     dx, ax
        push    bp
        mov     bp, resume_05D2A
        brkxa   2Bh
resume_05D2A:
        pop     bp
        pop     es
        mov     si, word ptr es:[3ah]
        and     si, 3fffh
        mov     word ptr ds:[bp+6], si
        call    fn_07BAD
        ret
fn_05D3D:
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_05D45
        ret
br_05D45:
        cmp     byte ptr [A0_B_0437B], 0
        je      br_05D4D
        ret
br_05D4D:
        mov     ax, word ptr [A0_W_04354]
        mov     dx, word ptr [A0_W_04356]
        call    fn_06B75
        jne     L_05C34
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     word ptr [P_434C], si
        mov     word ptr [P_434E], es
L_05C34:
        ret
fn_05D66:
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_05D6E
        ret
br_05D6E:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[34h], 0
        jne     br_05D7B
        ret
br_05D7B:
        cmp     byte ptr [A0_B_0437B], 0
        clc
        je      br_05D84
        ret
br_05D84:
        mov     ax, word ptr [A0_W_04358]
        mov     dx, word ptr [A0_W_0435A]
        call    fn_06B75
        jne     br_05DF0
        call    fn_05E4E
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, word ptr es:[30h]
        shl     si, 2
        add     si, 1500h
        mov     word ptr [A0_W_04350], si
        mov     word ptr [A0_W_04352], es
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     dh, 0
        mov     word ptr [A0_W_SEQ_TICK_LO], ax
        mov     word ptr [A0_W_SEQ_TICK_HI], dx
        mov     word ptr [A0_W_04344], ax
        mov     word ptr [A0_W_0432A], dx
        if      FW_VERSION >= 112
        push    word ptr [A0_W_04308]
        push    word ptr [A0_W_04306]
        push    word ptr [A0_W_TICK_IN_BEAT]
        endif
        call    fn_07BAD
        if      FW_VERSION >= 112
        pop     bx
        pop     dx
        pop     ax
        mov     word ptr [A0_W_04308], ax
        mov     word ptr [A0_W_04306], dx
        mov     word ptr [A0_W_TICK_IN_BEAT], bx
        endif
        mov     byte ptr [A0_B_REC_REPLACE_V11X], 0
        mov     byte ptr [A0_B_04811], 0
        mov     byte ptr [A0_B_04830], 0
        clc
        ret
br_05DF0:
        mov     ax, word ptr [A0_W_04358]
        mov     dx, word ptr [A0_W_0435A]
        sub     ax, 3
        sbb     dx, 0
        call    fn_06B75
        clc
        je      L_05E00
        ret
L_05E00:
        mov     cx, 3
tgt_05E07:
        push    cx
        call    fn_05FFE
        call    fn_063B1
        add     word ptr [A0_W_SEQ_TICK_LO], 1
        adc     word ptr [A0_W_SEQ_TICK_HI], 0
        pop     cx
        loop    tgt_05E07
        call    fn_06705
        sub     word ptr [A0_W_SEQ_TICK_LO], 3
        sbb     word ptr [A0_W_SEQ_TICK_HI], 0
        call    fn_05E4E
        stc
        ret
fn_05E2D:
        mov     ax, word ptr [A0_W_EVT_WRITE_SEG]
        if      FW_VERSION >= 114
        cmp     ax, word ptr [4336h]
        elseif  FW_VERSION >= 112
        cmp     ax, word ptr [431ah]
        elseif  FW_VERSION >= 110
        cmp     ax, word ptr [4316h]
        else
        cmp     ax, word ptr [42f8h]
        endif
        clc
        je      br_05E38
        ret
br_05E38:
        mov     ax, word ptr [A0_FP_EVT_SCAN_PTR]
        sub     ax, word ptr [A0_FP_EVT_WRITE_PTR]
        jae     L_05D11
        ret
L_05D11:
        cmp     ax, 200h
        ret
fn_05E46:
        mov     al, byte ptr [A0_B_REC_ACTIVE]
        or      byte ptr [A0_B_04366], al
        ret
fn_05E4E:
        push    ds
        mov     ax, word ptr [A0_W_04330]
        mov     bx, word ptr [P_434E]
        mov     di, word ptr [A0_FP_EVT_SCAN_PTR]
        if      FW_VERSION >= 114
        mov     bp, word ptr [4336h]
        elseif  FW_VERSION >= 112
        mov     bp, word ptr [431ah]
        elseif  FW_VERSION >= 110
        mov     bp, word ptr [4316h]
        else
        mov     bp, word ptr [42f8h]
        endif
        mov     es, bp
        sub     di, 2
        jae     br_05E6B
        sub     bp, 1000h
        mov     es, bp
br_05E6B:
        lds     si, [A0_FP_EVT_WRITE_PTR]
        mov     dx, ds
        cmp     dx, bx
        jne     br_05E79
        cmp     ax, si
        je      br_05EE0
br_05E79:
        std
        sub     si, 2
        jae     loop_05E85
        sub     dx, 1000h
        mov     ds, dx
loop_05E85:
        mov     cx, si
        cmp     dx, bx
        jne     br_05E8D
        sub     cx, ax
br_05E8D:
        cmp     cx, di
        jb      br_05E93
        mov     cx, di
br_05E93:
        shr     cx, 1
        rep movsw
        cmp     dx, bx
        jne     br_05E9F
        cmp     si, ax
        je      br_05EB8
br_05E9F:
        movsw
        cmp     si, -2
        jne     br_05EAB
        sub     dx, 1000h
        mov     ds, dx
br_05EAB:
        cmp     di, -2
        jne     loop_05E85
        sub     bp, 1000h
        mov     es, bp
        jmp     loop_05E85
br_05EB8:
        mov     ax, word ptr [si]
        mov     word ptr es:[di], ax
        cld
        pop     ds
        mov     word ptr [A0_FP_EVT_SCAN_PTR], di
        if      FW_VERSION >= 114
        mov     word ptr [4336h], es
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], es
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], es
        else
        mov     word ptr [42f8h], es
        endif
        mov     word ptr [A0_FP_EVT_PLAY_PTR], di
        mov     word ptr [P_433A], es
        mov     word ptr [A0_FP_EVT_WRITE_PTR], si
        mov     word ptr [A0_W_EVT_WRITE_SEG], dx
        mov     word ptr [A0_W_04324], si
        mov     word ptr [A0_W_04326], dx
        ret
br_05EE0:
        pop     ds
        ret
isr_05EE2:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     byte ptr [A0_B_04815], bl
        mov     byte ptr [A0_B_04816], bh
        push    ax
        push    dx
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     word ptr [A0_W_04324], si
        mov     word ptr [A0_W_04326], es
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_04344], ax
        mov     word ptr [A0_W_0432A], bx
        mov     bx, word ptr [A0_W_SEQ_TICK_LO]
        mov     cx, word ptr [A0_W_SEQ_TICK_HI]
        call    fn_07A16
        mov     byte ptr [A0_B_04830], dl
        mov     word ptr [A0_W_04350], si
        mov     word ptr [A0_W_04352], es
        mov     word ptr [A0_W_03AF6], 0
        mov     byte ptr [A0_B_REC_ACTIVE], 1
        pop     dx
        pop     ax
isr_05F30:
        push    ax
        push    dx
        call    fn_06B75
        je      isr_05F4A
        call    fn_05B31
        call    fn_05FC4
        call    fn_05F53
        call    fn_0661A
        call    fn_05B8A
        pop     dx
        pop     ax
        jmp     isr_05F30
isr_05F4A:
        mov     byte ptr [A0_B_REC_ACTIVE], 0
        pop     dx
        pop     ax
        pop     ds
        iret
fn_05F53:
        call    fn_06B84
        cmp     bh, 0ffh
        jne     br_05F5C
        ret
br_05F5C:
        call    fn_06B75
        je      br_05F62
        ret
br_05F62:
        call    fn_05F67
        jmp     fn_05F53
fn_05F67:
        cmp     dh, byte ptr [A0_W_CUR_TRACK]
        je      br_05F70
        jmp     fn_06B98
br_05F70:
        mov     al, byte ptr es:[si+4]
        cmp     al, byte ptr [A0_B_04815]
        jae     br_05F7D
        jmp     fn_06B98
br_05F7D:
        cmp     al, byte ptr [A0_B_04812]
        jbe     br_05F86
        jmp     fn_06B98
br_05F86:
        mov     di, A0_W_03AE4
loop_05F89:
        add     di, 0ah
        cmp     byte ptr [di+8], 0
        je      br_05F9B
        cmp     al, byte ptr [di+4]
        jne     loop_05F89
        call    fn_06BF9
        ret
br_05F9B:
        push    ds
        mov     dx, es
        mov     ax, ds
        mov     es, ax
        mov     ds, dx
        mov     cx, 4
        rep movsw
        mov     ax, 101h
        stosw
        pop     ds
        sub     ax, ax
        mov     word ptr [di+8], ax
        or      si, si
        jne     br_05FBB
        add     dx, 1000h
br_05FBB:
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        if      FW_VERSION >= 114
        mov     word ptr [4336h], dx
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], dx
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], dx
        else
        mov     word ptr [42f8h], dx
        endif
        ret
fn_05FC4:
        mov     ax, word ptr [A0_W_04858]
        test    byte ptr [A0_B_04830], 1
        je      br_05FDC
        add     ax, word ptr [A0_W_0485A]
        cmp     ax, word ptr [A0_W_04856]
        jb      br_05FDC
        sub     ax, word ptr [A0_W_04856]
br_05FDC:
        cmp     ax, word ptr [P_4808]
        je      br_05FE3
        ret
br_05FE3:
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     word ptr [A0_W_04324], si
        mov     word ptr [A0_W_04326], es
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_04344], ax
        mov     word ptr [A0_W_0432A], bx
        ret
fn_05FFE:
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_06008
        jmp     br_0830A
br_06008:
        cmp     byte ptr [A0_B_0437B], 0
        je      br_06012
        jmp     br_0830A
br_06012:
        call    L_05E96
        mov     word ptr [A0_FP_EVT_PLAY_PTR], si
        mov     word ptr [P_433A], es
        ret
L_05E96:
        les     si, [A0_FP_EVT_PLAY_PTR]
loop_06022:
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 3f0fh
        call    fn_06B75
        jne     br_06044
        mov     al, dh
        mov     ah, 0
        mov     di, ax
        push    es
        push    si
        call    fn_06045
        pop     si
        pop     es
        call    fn_06C09
        jmp     loop_06022
br_06044:
        ret
fn_06045:
        push    es
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        test    byte ptr es:[di+A0_TBL_SEQ_TRK_FLAGS], 2
        pop     es
        jne     br_06054
        ret
br_06054:
        push    es
        push    si
        les     si, [50h]
        cmp     byte ptr es:[si+27h], 0
        pop     si
        pop     es
        je      br_06080
        cmp     byte ptr [A0_B_REC_REPLACE_V11X], 0
        je      br_06072
        cmp     byte ptr [A0_B_0437F], 0
        je      br_06072
        ret
br_06072:
        cmp     byte ptr [A0_B_0437C], 0
        je      br_0609D
        cmp     di, word ptr [A0_W_CUR_TRACK]
        je      br_0609D
        ret
br_06080:
        cmp     di, word ptr [A0_W_CUR_TRACK]
        jne     br_06095
        cmp     byte ptr [A0_B_REC_REPLACE], 0
        je      br_0609D
        cmp     byte ptr [A0_B_0437F], 0
        je      br_0609D
        ret
br_06095:
        cmp     byte ptr [A0_B_0437C], 0
        je      br_0609D
        ret
br_0609D:
        mov     ch, byte ptr es:[si+4]
        cmp     ch, 0f0h
        jne     br_060A9
        jmp     loop_0620A
br_060A9:
        test    ch, 80h
        je      br_060B1
        jmp     loop_061B3
br_060B1:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        je      loop_060EB
        cmp     di, word ptr [A0_W_CUR_TRACK]
        jne     loop_060EB
        cmp     byte ptr [A0_B_0351A], 0
        je      loop_060EB
        mov     bx, 4eeh
loop_060C8:
        cmp     ch, byte ptr [bx]
        jne     br_060CD
        ret
br_060CD:
        inc     bx
        cmp     bx, 4feh
        jne     loop_060C8
        mov     bx, A0_W_02610
loop_060D7:
        cmp     byte ptr [bx+2], 0
        je      br_060E2
        cmp     ch, byte ptr [bx]
        jne     br_060E2
        ret
br_060E2:
        add     bx, 8
        if      FW_VERSION >= 114
        cmp     bx, 2650h
        elseif  FW_VERSION >= 110
        cmp     bx, 2634h
        else
        cmp     bx, 2616h
        endif
        jne     loop_060D7
loop_060EB:
        mov     ah, byte ptr es:[si+2]
        mov     al, byte ptr es:[si+3]
        shr     ah, 4
        shl     ax, 2
        mov     al, byte ptr es:[si+5]
        mov     bp, ax
        mov     dh, 0
        mov     cl, byte ptr es:[si+6]
        shl     cl, 1
        rcl     dh, 1
        shr     cl, 1
        mov     dl, byte ptr es:[si+7]
        shl     dx, 1
        shr     dl, 1
resume_06113:
        cmp     byte ptr [A0_B_AFTER_ON], 0
        je      br_06133
        cmp     di, word ptr [A0_W_CUR_TRACK]
        jne     br_06133
        push    cx
        push    dx
        push    di
        push    bp
        mov     al, ch
        call    fn_06A24
        mov     ax, dx
        pop     bp
        pop     di
        pop     dx
        pop     cx
        jae     br_06133
        mov     dx, ax
br_06133:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[di+5c0h], 0
        jne     br_06166
        mov     bl, byte ptr [A0_B_0484E]
        cmp     bl, 0
        je      br_06150
        dec     bl
        mov     bh, 0
        cmp     bx, di
        jne     br_06166
br_06150:
        add     ch, byte ptr [A0_B_0484F]
        sub     ch, 0ch
        jb      br_06163
        cmp     ch, 80h
        jb      br_06166
        sub     ch, 0ch
        jmp     br_06166
br_06163:
        add     ch, 0ch
br_06166:
        mov     al, byte ptr es:[di+640h]
        mul     cl
        mov     cl, 64h
        div     cl
        cmp     al, 0
        jne     br_06177
        mov     al, 1
br_06177:
        cmp     al, 7fh
        jb      br_0617D
        mov     al, 7fh
br_0617D:
        mov     cl, al
        mov     al, ch
        mov     ah, byte ptr es:[di+5c0h]
        mov     ch, byte ptr es:[di+580h]
        mov     bx, word ptr [A0_W_04804]
        mov     word ptr [bx+A0_W_04404], bp
        mov     word ptr [bx+A0_W_04406], ax
        mov     word ptr [bx+A0_W_04408], cx
        mov     word ptr [bx+A0_W_0440A], di
        add     bx, 8
        and     bx, 3ffh
        mov     word ptr [A0_W_04804], bx
        mov     bl, 2
        or      ah, 90h
        call    fn_06CF0
        ret
loop_061B3:
        mov     ah, byte ptr es:[si+4]
        mov     al, byte ptr es:[si+5]
        mov     cl, byte ptr es:[si+6]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ch, byte ptr es:[di+580h]
        cmp     ah, 0b0h
        je      br_061D6
        cmp     ah, 0c0h
        je      br_061F3
        call    fn_06D23
        ret
br_061D6:
        cmp     al, 40h
        jne     br_061E5
        mov     bl, byte ptr es:[di+580h]
        mov     bh, 0
        mov     byte ptr [bx+P_480A], cl
br_061E5:
        or      ah, byte ptr es:[di+5c0h]
        mov     dx, 40h
        mov     bl, 2
        call    fn_06CF0
        ret
br_061F3:
        test    byte ptr es:[di+A0_TBL_SEQ_TRK_FLAGS], 4
        jne     br_061FC
        ret
br_061FC:
        or      ah, byte ptr es:[di+5c0h]
        mov     dx, 40h
        mov     bl, 2
        call    fn_06CF0
        ret
loop_0620A:
        mov     ax, word ptr es:[si+5]
        mov     bl, byte ptr es:[si+7]
        mov     bh, 0
        mov     word ptr [A0_W_04374], ax
        mov     word ptr [A0_W_04376], bx
        add     si, 8
        jae     br_06228
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_06228:
        mov     ax, word ptr es:[si+1]
        cmp     ax, 47h
        jne     br_0625E
        mov     ax, word ptr es:[si+3]
        cmp     ax, 4544h
        jne     br_0625E
        mov     dh, byte ptr es:[si+5]
        mov     al, byte ptr es:[si+6]
        mov     cl, byte ptr es:[si+7]
        mov     ch, 2
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ah, byte ptr es:[di+5c0h]
        sub     ah, 1
        jb      br_0625C
        mov     bl, 0
        push    ds
        int     35h
        pop     ds
br_0625C:
        clc
        ret
br_0625E:
        mov     al, byte ptr es:[si]
        cmp     al, 0f7h
        jne     loop_0627C
        add     si, 1
        jne     br_06272
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_06272:
        sub     word ptr [A0_W_04374], 1
        sbb     word ptr [A0_W_04376], 0
loop_0627C:
        mov     al, byte ptr es:[si]
        add     si, 1
        jne     br_0628C
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_0628C:
        push    es
        push    si
        push    ax
        call    fn_062AF
        pop     ax
        pop     si
        pop     es
        mov     ax, word ptr [A0_W_04374]
        mov     bx, word ptr [A0_W_04376]
        sub     ax, 1
        sbb     bx, 0
        mov     word ptr [A0_W_04374], ax
        mov     word ptr [A0_W_04376], bx
        or      ax, bx
        jne     loop_0627C
        clc
        ret
fn_062AF:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ch, byte ptr es:[di+580h]
        sub     ch, 1
        jae     br_062BE
        ret
br_062BE:
        cmp     ch, 10h
        jae     br_062C7
        call    fn_03C9C
        ret
br_062C7:
        call    fn_03CC9
        ret
fn_062CB:
        cmp     byte ptr [P_4380], 0
        jne     br_062D3
        ret
br_062D3:
        call    L_061A9
        call    fn_0633A
        ret
L_061A9:
        les     si, [A0_FP_04360]
loop_062DE:
        cmp     byte ptr es:[si+4], 0ffh
        jne     br_062E6
        ret
br_062E6:
        call    fn_06389
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        cmp     ax, 0ffh
        and     dx, 3f0fh
        sub     ax, word ptr [A0_W_SEQ_TICK_LO]
        sbb     dl, byte ptr [A0_W_SEQ_TICK_HI]
        jae     br_06302
        ret
br_06302:
        or      al, ah
        or      al, dl
        je      br_06309
        ret
br_06309:
        mov     al, dh
        mov     ah, 0
        mov     di, ax
        push    es
        push    si
        call    fn_06323
        pop     si
        pop     es
        call    fn_06C09
        mov     word ptr [A0_FP_04360], si
        mov     word ptr [A0_W_04362], es
        jmp     loop_062DE
fn_06323:
        mov     ch, byte ptr es:[si+4]
        cmp     ch, 0f0h
        jne     br_0632F
        jmp     loop_0620A
br_0632F:
        test    ch, 80h
        je      br_06337
        jmp     loop_061B3
br_06337:
        jmp     loop_060EB
fn_0633A:
        mov     ax, word ptr [A0_W_042F2]
        mov     dx, 3e8h
        mul     dx
        add     ax, word ptr [A0_W_04348]
        adc     dx, word ptr [A0_W_0434A]
        mov     bx, ax
        mov     cx, dx
        sub     ax, word ptr [A0_W_0430E]
        sbb     dx, word ptr [P_432C]
        jae     br_0635C
        mov     ax, bx
        mov     dx, cx
br_0635C:
        mov     word ptr [A0_W_04348], ax
        mov     word ptr [A0_W_0434A], dx
        mov     cx, 60h
        call    fn_01534
        mov     di, word ptr [A0_W_0430E]
        mov     si, word ptr [P_432C]
        call    X_014EE
        cmp     ax, word ptr [A0_W_04368]
        jne     br_0637B
        ret
br_0637B:
        mov     word ptr [A0_W_04368], ax
        add     word ptr [A0_W_SEQ_TICK_LO], 1
        adc     word ptr [A0_W_SEQ_TICK_HI], 0
        ret
fn_06389:
        pusha
        push    es
        les     si, [A0_W_04340]
        add     si, 0eh
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        call    fn_06B75
        jne     br_063AE
        mov     ax, word ptr es:[16h]
        mov     cx, word ptr es:[si]
        add     word ptr [A0_W_04340], 0eh
        call    fn_07BFD
br_063AE:
        pop     es
        popa
        ret
fn_063B1:
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_063B9
        ret
br_063B9:
        cmp     byte ptr [A0_B_0437B], 0
        je      loop_063C1
        ret
loop_063C1:
        call    fn_06B84
        cmp     bh, 0ffh
        jne     br_063CA
        ret
br_063CA:
        call    fn_06B75
        je      L_063CC
        ret
L_063CC:
        call    fn_063D5
        jmp     loop_063C1
fn_063D5:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_063DF
        jmp     fn_06B98
br_063DF:
        cmp     byte ptr [A0_B_0437F], 0
        jne     br_063E9
        jmp     fn_06B98
br_063E9:
        push    es
        push    si
        les     si, [50h]
        cmp     byte ptr es:[si+27h], 0
        pop     si
        pop     es
        jne     br_06401
        cmp     dh, byte ptr [A0_W_CUR_TRACK]
        je      br_06401
        jmp     fn_06B98
br_06401:
        cmp     byte ptr [A0_B_REC_REPLACE], 0
        je      br_0640B
        jmp     fn_06BF9
br_0640B:
        mov     al, byte ptr es:[si+4]
        test    al, 80h
        je      br_06416
        jmp     fn_06B98
br_06416:
        cmp     byte ptr [A0_B_0351A], 0
        je      br_0644D
        cmp     dh, byte ptr [A0_W_CUR_TRACK]
        jne     br_0644D
        mov     bx, 4eeh
loop_06426:
        cmp     al, byte ptr [bx]
        jne     br_0642D
        jmp     fn_06BF9
br_0642D:
        inc     bx
        cmp     bx, 4feh
        jne     loop_06426
        mov     bx, A0_W_02610
loop_06437:
        cmp     byte ptr [bx+2], 0
        je      br_06444
        cmp     al, byte ptr [bx]
        jne     br_06444
        jmp     fn_06BF9
br_06444:
        add     bx, 8
        if      FW_VERSION >= 114
        cmp     bx, 2650h
        elseif  FW_VERSION >= 110
        cmp     bx, 2634h
        else
        cmp     bx, 2616h
        endif
        jne     loop_06437
br_0644D:
        cmp     byte ptr [A0_B_AFTER_ON], 0
        je      br_06479
        cmp     dh, byte ptr [A0_W_CUR_TRACK]
        jne     br_06479
        push    es
        push    si
        push    di
        call    fn_06A24
        pop     di
        pop     si
        pop     es
        jae     br_06479
        shl     dl, 1
        shr     dx, 1
        mov     byte ptr es:[si+7], dl
        mov     dl, byte ptr es:[si+6]
        shl     dl, 1
        shr     dx, 1
        mov     byte ptr es:[si+6], dl
br_06479:
        push    si
        push    es
        mov     di, word ptr [A0_W_04856]
        sub     si, si
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        sub     ax, word ptr [A0_W_0485C]
        sbb     dx, 0
        test    byte ptr [A0_B_04830], 1
        je      br_0649D
        sub     ax, word ptr [A0_W_0485A]
        sbb     dx, 0
br_0649D:
        int     0b8h
        or      di, si
        pop     es
        pop     si
        je      br_064A8
        jmp     fn_06B98
br_064A8:
        mov     al, byte ptr es:[si+4]
        mov     ah, byte ptr es:[si+3]
        and     ah, 3fh
        mov     di, A0_W_03AE4
loop_064B6:
        add     di, 0ah
        cmp     byte ptr [di+8], 0
        je      br_064D2
        cmp     al, byte ptr [di+4]
        jne     loop_064B6
        mov     bl, byte ptr [di+3]
        and     bl, 3fh
        cmp     ah, bl
        jne     loop_064B6
        call    fn_06BF9
        ret
br_064D2:
        push    ds
        mov     dx, es
        mov     ax, ds
        mov     es, ax
        mov     ds, dx
        mov     cx, 4
        rep movsw
        mov     ax, 101h
        stosw
        pop     ds
        sub     ax, ax
        mov     word ptr [di+8], ax
        or      si, si
        jne     br_064F2
        add     dx, 1000h
br_064F2:
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        if      FW_VERSION >= 114
        mov     word ptr [4336h], dx
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], dx
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], dx
        else
        mov     word ptr [42f8h], dx
        endif
        ret
fn_064FB:
        cmp     byte ptr [A0_B_04376], 0
        je      loop_06503
        ret
loop_06503:
        call    fn_06949
        jb      br_06509
        ret
br_06509:
        call    fn_0650E
        jmp     loop_06503
fn_0650E:
        cmp     cl, 0
        je      br_0658C
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_0651B
        ret
br_0651B:
        cmp     byte ptr [A0_B_0437F], 0
        jne     br_06523
        ret
br_06523:
        push    ax
        push    cx
        mov     bx, 0aeh
        int     0a9h
        pop     cx
        pop     ax
        jae     L_0652B
        ret
L_0652B:
        mov     si, P_3B00
loop_06532:
        add     si, 0ah
        cmp     byte ptr [si+8], 0
        je      L_0654C
        cmp     al, byte ptr [si+4]
        jne     loop_06532
        mov     bl, byte ptr [si+3]
        and     bl, 3fh
        cmp     ah, bl
        jne     loop_06532
        jmp     br_06550
L_0654C:
        mov     byte ptr [si+12h], 0
br_06550:
        shl     dl, 1
        rcr     dx, 1
        mov     byte ptr [si+7], dl
        shl     cl, 1
        shr     dh, 1
        rcr     cl, 1
        mov     byte ptr [si+6], cl
        mov     byte ptr [si+4], al
        mov     byte ptr [si+3], ah
        mov     byte ptr [si+5], 1
        mov     bx, word ptr [A0_W_SEQ_TICK_LO]
        mov     cx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [si], bx
        mov     byte ptr [si+2], cl
        mov     bx, 1
        mov     word ptr [si+8], bx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bl, ah
        mov     bh, 0
        or      byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
resume_0658B:
        ret
br_0658C:
        mov     si, A0_W_03AE4
loop_0658F:
        add     si, 0ah
        cmp     byte ptr [si+8], 0
        je      br_065C3
        cmp     byte ptr [si+9], 0
        jne     loop_0658F
        cmp     al, byte ptr [si+4]
        jne     loop_0658F
        cmp     ah, byte ptr [si+3]
        jne     loop_0658F
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        sub     ax, word ptr [si]
        mov     byte ptr [si+5], al
        mov     al, 0
        shr     ax, 2
        shl     ah, 4
        or      byte ptr [si+3], al
        mov     byte ptr [si+2], ah
        mov     byte ptr [si+9], 1
        ret
br_065C3:
        mov     cx, 20h
        mov     dx, 0
        mov     bx, A0_W_03F0A
tgt_065CC:
        cmp     dx, word ptr [bx+2]
        je      br_065D6
        cmp     ax, word ptr [bx+4]
        je      br_065DC
br_065D6:
        add     bx, 8
        loop    tgt_065CC
        ret
br_065DC:
        mov     es, word ptr [bx+2]
        mov     cx, word ptr [bx]
        mov     word ptr [bx], dx
        mov     word ptr [bx+2], dx
        mov     word ptr [bx+4], dx
        mov     bx, cx
        mov     cx, word ptr es:[bx]
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        sub     ax, cx
        cmp     ax, 2710h
        jb      br_065FB
        mov     ax, 270fh
br_065FB:
        mov     byte ptr es:[bx+5], al
        mov     al, byte ptr es:[bx+3]
        shl     al, 2
        shr     ax, 2
        mov     byte ptr es:[bx+3], al
        shl     ah, 4
        and     byte ptr es:[bx+2], 0fh
        or      byte ptr es:[bx+2], ah
        ret
fn_0661A:
        cmp     word ptr [P_4808], 0
        je      br_06622
        ret
br_06622:
        call    fn_04DEE
fn_06625:
        mov     al, 0
        mov     di, 0ffffh
        mov     si, A0_W_03AE4
loop_0662D:
        add     si, 0ah
        inc     di
        cmp     al, byte ptr [si+8]
        jne     loop_0662D
        or      di, di
        jne     br_0663B
        ret
br_0663B:
        call    fn_0669E
        les     di, [A0_W_04324]
        mov     si, A0_W_03B0A
loop_06645:
        mov     ax, word ptr [A0_W_04344]
        mov     bl, byte ptr [A0_W_0432A]
        mov     word ptr [si], ax
        and     byte ptr [si+2], 0f0h
        or      byte ptr [si+2], bl
        cmp     byte ptr [si+9], 0
        jne     br_0667F
        mov     bx, A0_W_03F0A
        mov     cx, 20h
tgt_06661:
        cmp     word ptr [bx+2], 0
        je      br_0666E
        add     bx, 8
        loop    tgt_06661
        jmp     br_0667F
br_0666E:
        mov     ah, byte ptr [si+3]
        mov     al, byte ptr [si+4]
        and     ax, 3f7fh
        mov     word ptr [bx], di
        mov     word ptr [bx+2], es
        mov     word ptr [bx+4], ax
br_0667F:
        mov     cx, 4
        rep movsw
        or      di, di
        jne     br_0668F
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_0668F:
        add     si, 2
        cmp     byte ptr [si+8], 0
        jne     loop_06645
        mov     byte ptr [A0_W_03AF6], 0
        ret
fn_0669E:
        mov     bx, word ptr [A0_W_04324]
        mov     bp, word ptr [A0_W_04326]
        mov     si, word ptr [A0_FP_EVT_WRITE_PTR]
        mov     ax, word ptr [A0_W_EVT_WRITE_SEG]
        cmp     bx, si
        jne     br_066C7
        cmp     ax, bp
        jne     br_066C7
        shl     di, 3
        add     si, di
        jae     br_066BF
        add     ax, 1000h
br_066BF:
        mov     word ptr [A0_FP_EVT_WRITE_PTR], si
        mov     word ptr [A0_W_EVT_WRITE_SEG], ax
        ret
br_066C7:
        mov     dx, ax
        shl     di, 3
        add     di, si
        jae     br_066D4
        add     dx, 1000h
br_066D4:
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], dx
        push    ds
loop_066DD:
        sub     si, 8
        jae     br_066E5
        sub     ax, 1000h
br_066E5:
        sub     di, 8
        jae     br_066EE
        sub     dx, 1000h
br_066EE:
        mov     ds, ax
        mov     es, dx
        push    si
        push    di
        mov     cx, 4
        rep movsw
        pop     di
        pop     si
        cmp     bx, si
        jne     loop_066DD
        cmp     bp, ax
        jne     loop_066DD
        pop     ds
        ret
fn_06705:
        mov     si, A0_W_03AE4
loop_06708:
        add     si, 0ah
        cmp     byte ptr [si+8], 0
        je      br_06733
        cmp     byte ptr [si+9], 0
        jne     loop_06708
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        sub     ax, word ptr [si]
        mov     byte ptr [si+5], al
        mov     al, 0
        shr     ax, 2
        shl     ah, 4
        or      byte ptr [si+3], al
        mov     byte ptr [si+2], ah
        mov     byte ptr [si+9], 1
        jmp     loop_06708
br_06733:
        mov     bp, 0
        mov     cx, 20h
        mov     bx, A0_W_03F0A
tgt_0673C:
        mov     di, word ptr [bx]
        mov     ax, word ptr [bx+2]
        mov     word ptr [bx], bp
        mov     word ptr [bx+2], bp
        mov     word ptr [bx+4], bp
        cmp     ax, bp
        je      br_0677B
        mov     es, ax
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        sub     ax, word ptr es:[di]
        cmp     ax, 2710h
        jb      br_0675D
        mov     ax, 270fh
br_0675D:
        mov     byte ptr es:[di+5], al
        mov     al, byte ptr es:[di+3]
        shl     al, 2
        shr     ax, 2
        mov     byte ptr es:[di+3], al
        shl     ah, 4
        and     byte ptr es:[di+2], 0fh
        or      byte ptr es:[di+2], ah
br_0677B:
        add     bx, 8
        loop    tgt_0673C
        ret
fn_06781:
        cmp     byte ptr [A0_B_04376], 0
        je      loop_06789
        ret
loop_06789:
        call    fn_069B2
        jb      br_0678F
        ret
br_0678F:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_06797
        ret
br_06797:
        cmp     byte ptr [A0_B_0437F], 0
        jne     br_0679F
        ret
br_0679F:
        push    ax
        mov     bx, 0aeh
        int     0a9h
        pop     ax
        jae     br_067A9
        ret
br_067A9:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bl, ch
        mov     bh, 0
        or      byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        les     di, [A0_FP_EVT_WRITE_PTR]
        mov     byte ptr es:[di+3], ch
        mov     byte ptr es:[di+4], ah
        mov     byte ptr es:[di+5], al
        mov     byte ptr es:[di+6], cl
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bl, byte ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        add     di, 8
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        jae     loop_06789
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        jmp     loop_06789
fn_067EF:
        cmp     byte ptr [A0_B_04376], 2
        jne     loop_067F7
        ret
loop_067F7:
        call    fn_069CC
        jb      br_067FD
        ret
br_067FD:
        cmp     byte ptr [A0_B_0436E], 1
        je      br_06814
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_0680C
        ret
br_0680C:
        cmp     byte ptr [A0_B_0437F], 0
        jne     br_06814
        ret
br_06814:
        mov     cl, 1
        call    fn_06847
        jmp     loop_067F7
fn_0681B:
        cmp     byte ptr [A0_B_04376], 1
        jne     loop_06823
        ret
loop_06823:
        call    fn_069E2
        jb      br_06829
        ret
br_06829:
        cmp     byte ptr [A0_B_0436E], 1
        je      br_06840
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_06838
        ret
br_06838:
        cmp     byte ptr [A0_B_0437F], 0
        jne     br_06840
        ret
br_06840:
        mov     cl, 2
        call    fn_06847
        jmp     loop_06823
fn_06847:
        cmp     byte ptr [A0_B_04376], 0
        jne     br_068A3
        cmp     al, 0f0h
        je      br_06853
        ret
br_06853:
        mov     byte ptr [A0_B_04376], cl
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bl, ah
        mov     bh, 0
        or      byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        les     di, [A0_FP_EVT_WRITE_PTR]
        mov     byte ptr es:[di+3], ah
        mov     byte ptr es:[di+4], 0f0h
        mov     byte ptr es:[di+5], 1
        sub     ax, ax
        mov     word ptr es:[di+6], ax
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bl, byte ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        add     di, 8
        jae     br_06897
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_06897:
        mov     al, 0f0h
        stosb
        mov     word ptr [A0_W_0432C], di
        mov     word ptr [A0_W_0432E], es
        ret
br_068A3:
        les     di, [A0_W_0432C]
        stosb
        or      di, di
        jne     br_068B4
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
br_068B4:
        mov     word ptr [A0_W_0432C], di
        mov     word ptr [A0_W_0432E], es
        les     di, [A0_FP_EVT_WRITE_PTR]
        add     word ptr es:[di+5], 1
        adc     byte ptr es:[di+7], 0
        cmp     al, 0f7h
        je      br_068CF
        ret
br_068CF:
        mov     cx, word ptr es:[di]
        mov     dx, word ptr es:[di+2]
        les     di, [A0_W_0432C]
loop_068DA:
        test    di, 7
        je      br_068EF
        mov     al, 0
        stosb
        or      di, di
        jne     loop_068DA
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
br_068EF:
        mov     word ptr es:[di], cx
        mov     word ptr es:[di+2], dx
        mov     byte ptr es:[di+4], 0f8h
        sub     ax, ax
        mov     byte ptr es:[di+5], al
        mov     word ptr es:[di+6], ax
        add     di, 8
        jae     br_06911
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_06911:
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        mov     byte ptr [A0_B_04376], 0
        cmp     byte ptr [A0_B_0436E], 1
        je      br_06926
        ret
br_06926:
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        push    ax
        push    dx
        mov     bx, ax
        or      bx, dx
        je      br_06940
        sub     ax, 1
        sbb     dx, 0
br_06940:
        call    fn_0759C
        pop     dx
        pop     ax
        call    fn_0759C
        ret
fn_06949:
        mov     bx, word ptr [2d2h]
        cmp     bx, word ptr [A0_W_002CC]
        je      br_06971
        mov     ax, word ptr [bx+1cch]
        mov     cx, word ptr [bx+1ceh]
        mov     dl, ch
        mov     dh, ah
        shr     dh, 6
        add     byte ptr [2d2h], 4
        mov     ah, byte ptr [A0_W_CUR_TRACK]
        cmp     al, 23h
        jb      fn_06949
        stc
        ret
br_06971:
        mov     bx, word ptr [A0_W_02400]
        cmp     bx, word ptr [A0_W_023FE]
        je      br_06991
        mov     ax, word ptr [bx+A0_W_022FE]
        mov     cx, word ptr [bx+A0_W_02300]
        add     byte ptr [A0_W_02400], 4
        push    ax
        push    cx
        call    fn_06A24
        pop     cx
        pop     ax
        stc
        ret
br_06991:
        mov     bx, word ptr [A0_W_02BD4]
        cmp     bx, word ptr [A0_W_02BD2]
        jne     br_0699C
        ret
br_0699C:
        mov     ax, word ptr [bx+A0_W_02AD2]
        mov     cx, word ptr [bx+A0_W_02AD4]
        add     byte ptr [A0_W_02BD4], 4
        push    ax
        push    cx
        call    fn_06A24
        pop     cx
        pop     ax
        stc
        ret
fn_069B2:
        mov     bx, word ptr [A0_W_02506]
        cmp     bx, word ptr [A0_W_02504]
        jne     br_069BD
        ret
br_069BD:
        mov     ax, word ptr [bx+A0_W_02404]
        mov     cx, word ptr [bx+A0_W_02406]
        add     byte ptr [A0_W_02506], 4
        stc
        ret
fn_069CC:
        mov     bx, word ptr [A0_W_0260C]
        cmp     bx, word ptr [A0_W_0260A]
        jne     br_069D7
        ret
br_069D7:
        mov     ax, word ptr [bx+A0_W_0250A]
        add     byte ptr [A0_W_0260C], 2
        stc
        ret
fn_069E2:
        mov     bx, word ptr [A0_W_02DE0]
        cmp     bx, word ptr [A0_W_02DDE]
        jne     br_069ED
        ret
br_069ED:
        mov     ax, word ptr [bx+A0_W_02CDE]
        add     byte ptr [A0_W_02DE0], 2
        stc
        ret
fn_069F8:
        les     si, [A0_FP_EVT_SCAN_PTR]
        mov     word ptr [A0_FP_EVT_PLAY_PTR], si
        mov     word ptr [P_433A], es
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     word ptr [A0_W_04324], si
        mov     word ptr [A0_W_04326], es
        mov     byte ptr [A0_W_03AF6], 0
        mov     ax, ds
        mov     es, ax
        mov     di, A0_W_03F0A
        mov     cx, 80h
        sub     ax, ax
        rep stosw
        ret
fn_06A24:
        mov     dh, 0
        mov     dl, 40h
        push    ax
        push    cx
        push    dx
        int     0c5h
        mov     bp, si
        add     si, 0
        pop     dx
        pop     cx
        pop     ax
        mov     bl, byte ptr es:[si+13h]
        cmp     bl, 0
        jne     br_06A3F
        ret
br_06A3F:
        cmp     al, bl
        clc
        je      br_06A45
        ret
br_06A45:
        push    ax
        sub     al, 23h
        mov     ah, 18h
        mul     ah
        add     ax, 1eh
        push    bp
        add     bp, ax
        mov     dh, byte ptr es:[bp+16h]
        mov     bl, dh
        mov     bh, 0
        shl     bx, 1
        pop     bp
        add     bx, 14h
        add     bp, bx
        add     bp, 0
        mov     bx, word ptr es:[bp]
        sub     bh, bl
        cmp     dh, 0
        jne     br_06A77
        add     bl, 80h
        shr     bl, 1
        shr     bh, 1
br_06A77:
        cmp     dh, 3
        jne     br_06A7F
        add     bl, 32h
br_06A7F:
        mov     al, byte ptr [1c8h]
        mul     bh
        mov     bh, 7fh
        div     bh
        add     al, bl
        mov     dl, al
        pop     ax
        stc
        ret
fn_06A8F:
        mov     bx, A0_W_0486A
loop_06A92:
        mov     ah, byte ptr [bx]
        cmp     ah, 0
        je      br_06AA7
        mov     byte ptr [bx], 0
        mov     al, byte ptr [bx+1]
        mov     cl, byte ptr [bx+2]
        push    bx
        call    fn_06AB1
        pop     bx
br_06AA7:
        add     bx, 4
        cmp     bx, P_48AA
        jne     loop_06A92
        ret
fn_06AB1:
        cmp     byte ptr [A0_B_04376], 0
        je      br_06AB9
        ret
br_06AB9:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_06AC1
        ret
br_06AC1:
        cmp     byte ptr [A0_B_0437F], 0
        jne     br_06AC9
        ret
br_06AC9:
        push    ax
        push    cx
        mov     si, P_48AA
        les     di, [A0_FP_EVT_WRITE_PTR]
        push    di
        mov     cx, 8
        rep movsb
        pop     di
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bl, byte ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        mov     al, byte ptr [A0_W_CUR_TRACK]
        mov     byte ptr es:[di+3], al
        call    fn_06B4B
        mov     si, P_48B2
        push    di
        mov     cx, 8
        rep movsb
        pop     di
        pop     cx
        pop     ax
        mov     byte ptr es:[di+5], ah
        mov     byte ptr es:[di+6], al
        mov     byte ptr es:[di+7], cl
        call    fn_06B4B
        mov     si, P_48BA
        push    di
        mov     cx, 8
        rep movsb
        pop     di
        call    fn_06B4B
        mov     si, A0_W_048C2
        push    di
        mov     cx, 8
        rep movsb
        pop     di
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bl, byte ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr es:[di], ax
        mov     byte ptr es:[di+2], bl
        call    fn_06B4B
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr [A0_W_CUR_TRACK]
        or      byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        ret
fn_06B4B:
        add     di, 8
        je      br_06B51
        ret
br_06B51:
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
        ret
isr_06B59:
        push    ds
        mov     bx, RAM_SEG
        mov     ds, bx
        mov     bl, al
        and     bx, 0fh
        shl     bx, 2
        if      FW_VERSION >= 114
        add     bx, 486ah
        elseif  FW_VERSION >= 112
        add     bx, 484eh
        elseif  FW_VERSION >= 110
        add     bx, 484ah
        else
        add     bx, 482ch
        endif
        mov     byte ptr [bx], ah
        mov     byte ptr [bx+1], al
        mov     byte ptr [bx+2], cl
        pop     ds
        iret
fn_06B75:
        sub     ax, word ptr [A0_W_SEQ_TICK_LO]
        sbb     dl, byte ptr [A0_W_SEQ_TICK_HI]
        jb      L_069FB
        or      al, ah
        or      al, dl
L_069FB:
        ret
fn_06B84:
        les     si, [A0_FP_EVT_SCAN_PTR]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 3f0fh
        mov     bh, byte ptr es:[si+4]
        ret
fn_06B98:
        call    fn_06BA7
        cmp     al, 0f0h
        jne     br_06BA6
loop_06B9F:
        call    fn_06BA7
        cmp     al, 0f8h
        jne     loop_06B9F
br_06BA6:
        ret
fn_06BA7:
        push    ds
        les     di, [A0_FP_EVT_WRITE_PTR]
        lds     si, [A0_FP_EVT_SCAN_PTR]
        mov     al, byte ptr [si+4]
        mov     cx, 4
        rep movsw
        mov     cx, ds
        pop     ds
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        or      si, si
        jne     br_06BCF
        add     cx, 1000h
        if      FW_VERSION >= 114
        mov     word ptr [4336h], cx
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], cx
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], cx
        else
        mov     word ptr [42f8h], cx
        endif
br_06BCF:
        or      di, di
        jne     br_06BDD
        mov     bx, es
        add     bx, 1000h
        mov     word ptr [A0_W_EVT_WRITE_SEG], bx
br_06BDD:
        ret
        les     di, [A0_FP_EVT_WRITE_PTR]
        mov     cx, 4
        rep movsw
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        or      di, di
        je      br_06BF0
        ret
br_06BF0:
        mov     ax, es
        add     ax, 1000h
        mov     word ptr [A0_W_EVT_WRITE_SEG], ax
        ret
fn_06BF9:
        les     si, [A0_FP_EVT_SCAN_PTR]
        call    fn_06C09
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        if      FW_VERSION >= 114
        mov     word ptr [4336h], es
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], es
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], es
        else
        mov     word ptr [42f8h], es
        endif
        ret
fn_06C09:
        mov     al, byte ptr es:[si+4]
        add     si, 8
        jae     br_06C1A
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_06C1A:
        cmp     al, 0f0h
        jne     L_06C2F
loop_06C1E:
        mov     al, byte ptr es:[si+4]
        add     si, 8
        jae     br_06C2F
        mov     dx, es
        add     dx, 1000h
        mov     es, dx
br_06C2F:
        cmp     al, 0f8h
        jne     loop_06C1E
L_06C2F:
        ret
fn_06C34:
        call    fn_06C62
loop_06C37:
        call    fn_06B84
        cmp     bh, 0ffh
        je      br_06C54
        call    fn_06B75
        jae     br_06C54
        cmp     dh, byte ptr [A0_W_CUR_TRACK]
        jne     br_06C4F
        call    fn_06BF9
        jmp     loop_06C37
br_06C4F:
        call    fn_06B98
        jmp     loop_06C37
br_06C54:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        call    fn_0759C
        call    fn_07742
        ret
fn_06C62:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     di, word ptr [A0_W_04856]
        sub     si, si
        int     0b8h
        mov     ax, word ptr [A0_W_04856]
        sub     ax, di
        sub     dx, dx
        add     ax, word ptr [A0_W_SEQ_TICK_LO]
        adc     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     bx, ax
        mov     cx, dx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        sub     bx, word ptr es:[1ch]
        sbb     cx, word ptr es:[1eh]
        jb      br_06C9D
        mov     ax, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
br_06C9D:
        mov     word ptr [A0_W_SEQ_TICK_LO], ax
        mov     word ptr [A0_W_SEQ_TICK_HI], dx
        call    fn_03AD9
        ret
fn_06CA8:
        call    fn_06B84
        cmp     bh, 0ffh
        jne     br_06CB1
        ret
br_06CB1:
        call    fn_06B75
        je      br_06CB7
        ret
br_06CB7:
        cmp     dh, byte ptr [A0_W_CUR_TRACK]
        jne     L_06CBE
        call    fn_06BF9
        jmp     fn_06CA8
L_06CBE:
        call    fn_06B98
        jmp     fn_06CA8
fn_06CC7:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        add     ax, 1
        adc     dx, 0
        mov     bx, ax
        mov     cx, dx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        sub     bx, word ptr es:[1ch]
        sbb     cx, word ptr es:[1eh]
        jb      br_06CE9
        ret
br_06CE9:
        call    fn_0759C
        call    fn_07742
        ret
fn_06CF0:
        test    ah, 0fh
        je      br_06D06
        sub     ah, 1
        push    ax
        push    cx
        push    ds
        mov     ch, bl
        mov     bl, 0
        push    ds
        int     35h
        pop     ds
        pop     ds
        pop     cx
        pop     ax
br_06D06:
        sub     ch, 1
        jae     br_06D0C
        ret
br_06D0C:
        and     ah, 0f0h
        cmp     ch, 10h
        jae     br_06D1A
        or      ah, ch
        call    fn_03BD6
        ret
br_06D1A:
        sub     ch, 10h
        or      ah, ch
        call    fn_03C3C
        ret
fn_06D23:
        sub     ch, 1
        jae     br_06D29
        ret
br_06D29:
        cmp     ch, 10h
        jae     br_06D34
        or      ah, ch
        call    fn_03BD6
        ret
br_06D34:
        and     ch, 0fh
        or      ah, ch
        call    fn_03C3C
        ret
fn_06D3D:
        mov     dx, 0ffffh
        jmp     br_06D45
fn_06D42:
        mov     dx, 1
br_06D45:
        mov     si, word ptr [A0_W_04806]
        mov     di, word ptr [A0_W_04804]
        cmp     si, di
        je      br_06D9D
        mov     bp, di
        mov     bx, A0_W_04404
loop_06D56:
        and     si, 3ffh
        and     di, 3ffh
        cmp     si, bp
        je      br_06D95
        mov     ax, word ptr [bx+si]
        sub     ax, dx
        pushf
        mov     word ptr [bx+di], ax
        mov     ax, word ptr [bx+si+6]
        mov     word ptr [bx+di+6], ax
        mov     ax, word ptr [bx+si+2]
        mov     cx, word ptr [bx+si+4]
        mov     word ptr [bx+di+2], ax
        mov     word ptr [bx+di+4], cx
        add     si, 8
        add     di, 8
        popf
        ja      loop_06D56
        sub     di, 8
        pusha
        mov     cl, 0
        mov     bl, 2
        or      ah, 90h
        call    fn_06CF0
        popa
        jmp     loop_06D56
br_06D95:
        mov     word ptr [A0_W_04806], si
        mov     word ptr [A0_W_04804], di
br_06D9D:
        ret
isr_06D9E:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        cmp     byte ptr [A0_B_0437C], 0
        je      isr_06DD7
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        je      isr_06DD7
        mov     ax, word ptr [A0_W_CUR_TRACK]
        mov     si, word ptr [A0_W_04806]
        sub     si, 8
isr_06DBC:
        add     si, 8
        and     si, 3ffh
        cmp     si, word ptr [A0_W_04804]
        je      isr_06DD7
        cmp     ax, word ptr [si+A0_W_0440A]
        je      isr_06DBC
        mov     word ptr [si+A0_W_04404], 1
        jmp     isr_06DBC
isr_06DD7:
        pop     ds
        iret
isr_06DD9:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     si, word ptr [A0_W_04806]
        sub     si, 8
isr_06DE6:
        add     si, 8
        and     si, 3ffh
        cmp     si, word ptr [A0_W_04804]
        je      isr_06E01
        cmp     ax, word ptr [si+A0_W_0440A]
        jne     isr_06DE6
        mov     word ptr [si+A0_W_04404], 1
        jmp     isr_06DE6
isr_06E01:
        pop     ds
        iret
fn_06E03:
        mov     si, A0_W_0480B
        mov     ah, 0b0h
        mov     al, 40h
loop_06E0A:
        mov     cl, 0
        xchg    cl, byte ptr [si]
        inc     si
        cmp     cl, 0
        je      br_06E1F
        mov     cl, 0
        push    ax
        push    cx
        push    si
        call    fn_03BD6
        pop     si
        pop     cx
        pop     ax
br_06E1F:
        inc     ah
        cmp     ah, 0c0h
        jne     loop_06E0A
        mov     ah, 0b0h
loop_06E28:
        mov     cl, 0
        xchg    cl, byte ptr [si]
        inc     si
        cmp     cl, 0
        je      br_06E3D
        mov     cl, 0
        push    ax
        push    cx
        push    si
        call    fn_03C3C
        pop     si
        pop     cx
        pop     ax
br_06E3D:
        inc     ah
        cmp     ah, 0c0h
        jne     loop_06E28
        ret
fn_06E45:
        les     si, [A0_W_04340]
        add     si, 0eh
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        call    fn_06B75
        je      br_06E5A
        ret
br_06E5A:
        push    es
        les     bx, [50h]
        mov     ax, word ptr es:[bx+4]
        cmp     byte ptr es:[bx+6], 0
        pop     es
        je      br_06E6F
        mov     ax, word ptr es:[16h]
br_06E6F:
        mov     cx, word ptr es:[si]
        add     word ptr [A0_W_04340], 0eh
        call    fn_06E7E
        call    fn_07BFD
        ret
fn_06E7E:
        cmp     byte ptr [A0_B_0436E], 3
        je      br_06E92
        cmp     byte ptr es:[13h], 0
        je      br_06E8E
        ret
br_06E8E:
        mov     cx, 3e8h
        ret
br_06E92:
        les     si, [50h]
        cmp     byte ptr es:[si+77h], 0
        je      br_06E9E
        ret
br_06E9E:
        mov     cx, 3e8h
        ret
fn_06EA2:
        les     si, [50h]
        cmp     byte ptr es:[si+15h], 0
        jne     br_06EAE
        ret
br_06EAE:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_06EBD
        cmp     byte ptr es:[si+19h], 0
        jne     br_06EC5
        ret
br_06EBD:
        cmp     byte ptr es:[si+1ah], 0
        jne     br_06EC5
        ret
br_06EC5:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        les     si, [A0_W_04350]
        sub     ax, word ptr es:[si]
        mov     dx, 0
        les     si, [50h]
        mov     bl, byte ptr es:[si+18h]
        mov     bh, 0
        mov     bl, byte ptr cs:[bx+TBL_NOTE_TICKS]
        mov     bh, 0
        div     bx
        or      dx, dx
        je      br_06EEA
        ret
br_06EEA:
        call    fn_06EEE
        ret
fn_06EEE:
        mov     bx, L_06F02
        cmp     byte ptr [P_482D], 0
        je      br_06EFB
        mov     bx, fn_06F48
br_06EFB:
        call    bx
        inc     byte ptr [A0_B_04811]
        ret
L_06F02:
        call    fn_06FAE
        les     si, [50h]
        mov     ah, byte ptr es:[si+1dh]
        sub     ah, 1
        jae     br_06F2A
        mov     al, 7fh
        mov     cl, 7fh
        mov     ah, byte ptr es:[si+1bh]
        mov     ch, byte ptr es:[si+17h]
        mov     dx, 40h
        push    ds
        mov     bl, 2
        push    ds
        int     35h
        pop     ds
        pop     ds
        ret
br_06F2A:
        mov     bl, ah
        or      ah, 90h
        mov     cl, byte ptr es:[si+20h]
        mov     ch, 2
        mov     al, byte ptr es:[si+1eh]
        call    fn_06F8E
        mov     dx, 40h
        push    ds
        mov     bl, 0
        push    ds
        int     35h
        pop     ds
        pop     ds
        ret
fn_06F48:
        les     si, [50h]
        mov     ah, byte ptr es:[si+1dh]
        sub     ah, 1
        jae     br_06F6D
        mov     al, 7fh
        mov     cl, 20h
        mov     ah, byte ptr es:[si+1bh]
        mov     ch, byte ptr es:[si+17h]
        mov     dx, 40h
        push    ds
        mov     bl, 2
        push    ds
        int     35h
        pop     ds
        pop     ds
        ret
br_06F6D:
        call    fn_06FAE
        mov     bl, ah
        or      ah, 90h
        mov     cl, byte ptr es:[si+21h]
        mov     ch, 2
        mov     al, byte ptr es:[si+1fh]
        call    fn_06F8E
        mov     dx, 40h
        push    ds
        mov     bl, 0
        push    ds
        int     35h
        pop     ds
        pop     ds
        ret
fn_06F8E:
        mov     bh, 0
        shl     bx, 2
        add     bx, 180h
        mov     dx, 0
        mov     es, dx
        mov     si, word ptr es:[bx]
        mov     es, word ptr es:[bx+2]
        mov     bl, al
        mov     bh, 0
        mov     al, byte ptr es:[bx+si]
        mov     word ptr [A0_W_0482E], ax
        ret
fn_06FAE:
        push    ax
        sub     ax, ax
        xchg    ax, word ptr [A0_W_0482E]
        or      ax, ax
        je      br_06FC5
        mov     cx, 200h
        mov     dx, 40h
        mov     bl, 0
        push    ds
        int     35h
        pop     ds
br_06FC5:
        pop     ax
        ret
        mov     ah, 99h
        mov     al, 51h
        mov     cl, 7fh
        call    fn_03BD6
        ret
        mov     ah, 99h
        mov     al, 4dh
        mov     cl, 7fh
        call    fn_03BD6
        ret
fn_06FDB:
        mov     ax, word ptr [A0_W_04858]
        cmp     ax, 2
        jae     br_06FFE
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     word ptr [A0_W_04324], si
        mov     word ptr [A0_W_04326], es
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_04344], ax
        mov     word ptr [A0_W_0432A], bx
        ret
br_06FFE:
        test    byte ptr [A0_B_04830], 1
        je      br_07011
        add     ax, word ptr [A0_W_0485A]
        cmp     ax, word ptr [A0_W_04856]
        jb      br_07011
        sub     ax, ax
br_07011:
        cmp     ax, word ptr [P_4808]
        je      br_07018
        ret
br_07018:
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     word ptr [A0_W_04324], si
        mov     word ptr [A0_W_04326], es
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_04344], ax
        mov     word ptr [A0_W_0432A], bx
        call    L_06FA0
        call    L_07130
        call    fn_071A6
        cmp     byte ptr [6ch], 0
        je      br_07056
        cmp     byte ptr [A0_B_0437A], 0
        jne     br_07056
        call    fn_071E7
        call    fn_0705C
        call    fn_070FB
        call    fn_07171
        ret
br_07056:
        mov     byte ptr [A0_B_04367], 0
        ret
fn_0705C:
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        je      br_0706B
        mov     bx, 0aeh
        int     0a9h
        jae     br_0706B
        ret
br_0706B:
        mov     di, 0
        mov     bp, A0_W_04394
loop_07071:
        mov     cl, byte ptr [di+A0_TBL_004DE]
        cmp     cl, 0
        je      br_070CA
        mov     al, byte ptr [di+4eeh]
        cmp     al, 23h
        jb      br_070CA
        mov     ah, byte ptr [di+4feh]
        mov     dh, byte ptr [di+50eh]
        mov     ch, byte ptr [di+51eh]
        cmp     byte ptr [A0_B_16_LEVELS_V11X], 0
        je      br_070A2
        cmp     byte ptr [A0_B_004D9], 0
        jne     br_070A9
        mov     cl, byte ptr [di+52eh]
        jmp     br_070A9
br_070A2:
        push    bp
        call    fn_06A24
        pop     bp
        mov     ch, dl
br_070A9:
        mov     word ptr ds:[bp], ax
        add     bp, 2
        cli
        mov     bx, word ptr [A0_W_002CC]
        shl     dh, 6
resume_070B8:
        or      ah, dh
        mov     word ptr [bx+1cch], ax
        mov     word ptr [bx+1ceh], cx
        add     bl, 4
        mov     word ptr [A0_W_002CC], bx
        sti
br_070CA:
        inc     di
        cmp     di, 10h
        jne     loop_07071
        ret
L_06FA0:
        mov     si, A0_W_04394
        mov     dx, 0
loop_070D7:
        mov     ax, dx
        xchg    ax, word ptr [si]
        cmp     ax, 0
        jne     br_070E1
        ret
br_070E1:
        cli
        mov     bx, word ptr [A0_W_002CC]
        mov     word ptr [bx+1cch], ax
        mov     word ptr [bx+1ceh], dx
        add     bl, 4
        mov     word ptr [A0_W_002CC], bx
        sti
        add     si, 2
        jmp     loop_070D7
fn_070FB:
        mov     di, A0_W_0439A
        mov     si, A0_W_02610
        mov     cx, 4
tgt_07104:
        push    cx
        push    si
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        mov     dx, word ptr [si+4]
        or      ax, ax
        je      br_07128
        mov     word ptr [di], ax
        mov     word ptr [di+2], cx
        mov     word ptr [di+4], dx
        add     di, 8
        push    di
        call    fn_02DEA
        call    fn_02D16
        call    fn_02DF4
        pop     di
br_07128:
        pop     si
        pop     cx
        add     si, 8
        loop    tgt_07104
        ret
L_07130:
        mov     si, A0_W_0439A
        mov     cx, 4
tgt_07136:
        push    cx
        push    si
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        mov     dx, word ptr [si+4]
        sub     bx, bx
        mov     word ptr [si], bx
        mov     word ptr [si+2], bx
        mov     word ptr [si+4], bx
        or      ax, ax
        je      br_07169
        mov     cl, 0
        mov     es, word ptr [5ah]
        mov     bh, ah
        mov     bl, 0
        and     bx, 0f00h
        shl     bx, 1
        mov     si, bx
        call    fn_02DEA
        call    fn_02D16
        call    fn_02DF4
br_07169:
        pop     si
        pop     cx
        add     si, 8
        loop    tgt_07136
        ret
fn_07171:
        mov     di, A0_W_043BA
        mov     si, A0_W_02614
        mov     cx, 4
tgt_0717A:
        push    cx
        push    si
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        mov     dx, word ptr [si+4]
        or      ax, ax
        je      br_0719E
        mov     word ptr [di], ax
        mov     word ptr [di+2], cx
        mov     word ptr [di+4], dx
        add     di, 8
        push    di
        call    fn_02DEA
        call    fn_02D16
        call    fn_03495
        pop     di
br_0719E:
        pop     si
        pop     cx
        add     si, 8
        loop    tgt_0717A
        ret
fn_071A6:
        mov     si, P_43D6
        mov     cx, 4
tgt_071AC:
        push    cx
        push    si
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        mov     dx, word ptr [si+4]
        sub     bx, bx
        mov     word ptr [si], bx
        mov     word ptr [si+2], bx
        mov     word ptr [si+4], bx
        or      ax, ax
        je      br_071DF
        mov     cl, 0
        mov     es, word ptr [5ah]
        mov     bh, ah
        mov     bl, 0
        and     bx, 0f00h
        shl     bx, 1
        mov     si, bx
        call    fn_02DEA
        call    fn_02D16
        call    fn_03495
br_071DF:
        pop     si
        pop     cx
        add     si, 8
        loop    tgt_071AC
        ret
fn_071E7:
        cmp     byte ptr [A0_B_04367], 0
        je      br_071EF
        ret
br_071EF:
        mov     byte ptr [A0_B_04367], 1
        mov     di, 0
        mov     ch, 0
        mov     dx, 0
loop_071FC:
        mov     cl, byte ptr [di+A0_TBL_004DE]
        cmp     cl, 0
        je      br_0722A
        mov     bx, di
        add     bl, byte ptr [A0_B_PAD_BANK]
        cli
        les     si, cs:[180h]
        mov     al, byte ptr es:[bx+si]
        mov     ah, bl
        mov     bx, word ptr [A0_W_002CC]
        mov     word ptr [bx+1cch], ax
        mov     word ptr [bx+1ceh], dx
        add     bl, 4
        mov     word ptr [A0_W_002CC], bx
        sti
br_0722A:
        inc     di
        cmp     di, 10h
        jne     loop_071FC
        mov     si, A0_W_02610
        mov     cx, 4
tgt_07236:
        push    cx
        push    si
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        mov     dx, word ptr [si+4]
        or      ax, ax
        je      br_0724F
        mov     cl, 0
        call    fn_02DEA
        call    fn_02D16
        call    fn_02DF4
br_0724F:
        pop     si
        pop     cx
        add     si, 8
        loop    tgt_07236
        mov     si, A0_W_02614
        mov     cx, 4
tgt_0725C:
        push    cx
        push    si
        mov     ax, word ptr [si]
        mov     cx, word ptr [si+2]
        mov     dx, word ptr [si+4]
        or      ax, ax
        je      br_07275
        mov     cl, 0
        call    fn_02DEA
        call    fn_02D16
        call    fn_02DF4
br_07275:
        pop     si
        pop     cx
        add     si, 8
        loop    tgt_0725C
        ret
        cmp     bh, 0f0h
        jne     fn_0728D
loop_07282:
        call    fn_0728D
        call    fn_06B84
        cmp     bh, 0f8h
        je      loop_07282
fn_0728D:
        add     word ptr [A0_FP_EVT_SCAN_PTR], 8
        je      L_07164
        ret
L_07164:
        if      FW_VERSION >= 114
        add     word ptr [4336h], 1000h
        elseif  FW_VERSION >= 112
        add     word ptr [431ah], 1000h
        elseif  FW_VERSION >= 110
        add     word ptr [4316h], 1000h
        else
        add     word ptr [42f8h], 1000h
        endif
        ret
fn_0729C:
        mov     bx, word ptr [A0_W_028C6]
        cmp     bx, word ptr [A0_W_028C4]
        jne     br_072A7
        ret
br_072A7:
        mov     al, byte ptr [bx+A0_B_027C4]
        inc     bl
        mov     word ptr [A0_W_028C6], bx
        stc
        ret
fn_072B3:
        mov     bx, word ptr [A0_W_027C2]
        cmp     bx, word ptr [A0_W_027C0]
        jne     br_072BE
        ret
br_072BE:
        mov     ax, word ptr [bx+A0_TBL_026C0]
        mov     dx, word ptr [bx+A0_W_026C2]
        mov     bl, dh
        and     dh, 0fh
        add     byte ptr [A0_W_027C2], 4
        stc
        ret
fn_072D2:
        cmp     byte ptr [A0_B_0436E], 1
        je      br_072E2
        cmp     byte ptr [A0_B_REC_ACTIVE], 0
        jne     br_072E2
        jmp     fn_072F3
br_072E2:
        call    fn_0757B
        jb      fn_072F3
        call    fn_05E2D
        jb      fn_072F3
        call    fn_07304
        call    fn_0749C
        ret
fn_072F3:
        call    fn_06949
        jb      fn_072F3
loop_072F8:
        call    fn_069B2
        jb      loop_072F8
        call    fn_069CC
        call    fn_069E2
        ret
fn_07304:
        cmp     byte ptr [A0_B_0436E], 1
        je      loop_07331
        call    fn_06949
        jb      br_07311
        ret
br_07311:
        cmp     cl, 0
        jne     br_07319
        jmp     br_073A5
br_07319:
        cmp     byte ptr [A0_B_048CA], 0
        jne     br_07342
        pusha
        cmp     byte ptr [A0_B_REC_REPLACE], 0
        je      br_0732B
        call    fn_06CA8
br_0732B:
        call    L_05E96
        popa
        jmp     br_07342
loop_07331:
        call    fn_05E2D
        jae     br_07337
        ret
br_07337:
        call    fn_06949
        jb      br_0733D
        ret
br_0733D:
        mov     byte ptr [A0_B_REDRAW_REQ], 1
br_07342:
        cmp     cl, 0
        je      br_073A5
        cmp     byte ptr [66h], 0
        je      br_0734F
        ret
br_0734F:
        mov     word ptr [A0_W_043F6], 0
        push    ax
        push    cx
        push    dx
        call    fn_07440
        pop     dx
        pop     cx
        pop     ax
        shl     dl, 1
        rcr     dx, 1
        mov     byte ptr es:[si+7], dl
        shl     cl, 1
        shr     dh, 1
        rcr     cl, 1
        mov     byte ptr es:[si+6], cl
        mov     byte ptr es:[si+4], al
        mov     dh, byte ptr [A0_W_CUR_TRACK]
        mov     byte ptr es:[si+3], dh
        mov     byte ptr es:[si+5], 1
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bl, byte ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        inc     byte ptr [A0_B_048CA]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr [A0_W_CUR_TRACK]
        or      byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        int     8dh
        jmp     loop_07331
br_073A5:
        call    fn_07460
        jb      loop_07331
        cmp     byte ptr [A0_B_048CA], 0
        je      loop_07331
        dec     byte ptr [A0_B_048CA]
        mov     ax, word ptr [A0_W_043F6]
        cmp     ax, 270eh
        jb      br_073C0
        mov     ax, 270eh
br_073C0:
        inc     ax
        call    fn_07418
        mov     byte ptr es:[si+5], al
        mov     al, 0
        shr     ax, 2
        shl     ah, 4
        or      byte ptr es:[si+3], al
        or      byte ptr es:[si+2], ah
        int     8dh
        cmp     byte ptr [A0_B_048CA], 0
        je      br_073E4
        jmp     loop_07331
br_073E4:
        call    fn_06FAE
        mov     bx, 13eh
        int     0a9h
        jb      br_07411
        mov     bx, 144h
        int     0a9h
        jb      br_07406
        mov     bp, es
        les     di, [50h]
        cmp     byte ptr es:[di+0aeh], 0
        jne     br_07406
        jmp     loop_07331
br_07406:
        cmp     byte ptr [A0_B_REC_REPLACE], 0
        jne     br_07411
        call    fn_07F0F
        ret
br_07411:
        call    fn_06CC7
        call    fn_06C34
        ret
fn_07418:
        push    es
        les     di, [50h]
        mov     bl, byte ptr es:[di+0b0h]
        mov     bh, byte ptr es:[di+0afh]
        pop     es
        cmp     bh, 0
        jne     br_0742E
        ret
br_0742E:
        mov     ax, word ptr [A0_W_04856]
        mul     bl
        mov     bl, 64h
        div     bl
        cmp     al, 0
        jne     br_0743D
        mov     al, 1
br_0743D:
        sub     ah, ah
        ret
fn_07440:
        call    fn_07460
        jb      br_07446
        ret
br_07446:
        les     si, [A0_FP_EVT_SCAN_PTR]
        sub     si, 8
        jae     br_07457
        mov     bx, es
        sub     bx, 1000h
        mov     es, bx
br_07457:
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        if      FW_VERSION >= 114
        mov     word ptr [4336h], es
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], es
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], es
        else
        mov     word ptr [42f8h], es
        endif
        ret
fn_07460:
        mov     byte ptr [P_48CB], al
        les     si, [A0_FP_EVT_SCAN_PTR]
loop_07467:
        call    fn_07549
        call    fn_06B75
        stc
        je      br_07471
        ret
br_07471:
        mov     al, byte ptr es:[si+4]
        cmp     al, 0ffh
        stc
        jne     br_0747B
        ret
br_0747B:
        cmp     dh, byte ptr [A0_W_CUR_TRACK]
        jne     br_0748D
        mov     al, byte ptr es:[si+4]
        cmp     al, byte ptr [P_48CB]
        jne     br_0748D
        clc
        ret
br_0748D:
        add     si, 8
        jae     loop_07467
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
        jmp     loop_07467
fn_0749C:
        call    fn_05E2D
        jae     br_074A2
        ret
br_074A2:
        call    fn_069B2
        jb      br_074A8
        ret
br_074A8:
        push    ax
        push    cx
        call    fn_074EA
        pop     cx
        pop     ax
        mov     byte ptr es:[si+4], ah
        mov     byte ptr es:[si+5], al
        mov     byte ptr es:[si+6], cl
        mov     byte ptr es:[si+7], 0
        mov     al, byte ptr [A0_W_CUR_TRACK]
        mov     byte ptr es:[si+3], al
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bl, byte ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr es:[si], ax
        mov     byte ptr es:[si+2], bl
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr [A0_W_CUR_TRACK]
        or      byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        mov     byte ptr [A0_B_REDRAW_REQ], 1
        jmp     fn_0749C
fn_074EA:
        les     si, [A0_FP_EVT_SCAN_PTR]
loop_074EE:
        push    ax
        push    cx
        call    fn_07549
        call    fn_06B75
        pop     cx
        pop     ax
        jne     br_0752F
        cmp     bh, 0ffh
        je      br_0752F
        cmp     bh, 0f0h
        je      br_07520
        test    bh, 80h
        je      br_07520
        cmp     dh, byte ptr [A0_W_CUR_TRACK]
        jne     br_07520
        cmp     ah, bh
        jne     br_07520
        cmp     ah, 0b0h
        je      br_07519
        ret
br_07519:
        cmp     al, byte ptr es:[si+5]
        jne     br_07520
        ret
br_07520:
        add     si, 8
        jae     loop_074EE
        mov     bx, es
        add     bx, 1000h
        mov     es, bx
        jmp     loop_074EE
br_0752F:
        les     si, [A0_FP_EVT_SCAN_PTR]
        sub     si, 8
        jae     br_07540
        mov     bx, es
        sub     bx, 1000h
        mov     es, bx
br_07540:
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        if      FW_VERSION >= 114
        mov     word ptr [4336h], es
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], es
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], es
        else
        mov     word ptr [42f8h], es
        endif
        ret
fn_07549:
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 3f0fh
        mov     bh, byte ptr es:[si+4]
        ret
        call    fn_07549
        cmp     bh, 0f0h
        jne     fn_0756C
loop_07561:
        call    fn_0756C
        call    fn_07549
        cmp     bh, 0f8h
        jne     loop_07561
fn_0756C:
        add     si, 8
        jb      br_07572
        ret
br_07572:
        mov     cx, es
        add     cx, 1000h
        mov     es, cx
        ret
fn_0757B:
        pusha
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
        cmp     bx, word ptr [A0_W_SEQ_TICK_LO]
        jne     br_07599
        cmp     dx, word ptr [A0_W_SEQ_TICK_HI]
        jne     br_07599
        popa
        stc
        ret
br_07599:
        popa
        clc
        ret
fn_0759C:
        mov     byte ptr [A0_B_048CA], 0
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[1ch]
        sbb     cx, word ptr es:[1eh]
        jb      br_075BE
        mov     ax, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
br_075BE:
        mov     word ptr [A0_W_SEQ_TICK_LO], ax
        mov     word ptr [A0_W_SEQ_TICK_HI], dx
        call    fn_086AF
        call    fn_086C7
        call    fn_075DC
        call    fn_07BAD
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        call    fn_07C3B
        ret
fn_075DC:
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_075E4
        ret
br_075E4:
        push    ds
        les     di, [A0_FP_EVT_SCAN_PTR]
        lds     si, [A0_FP_EVT_WRITE_PTR]
        mov     bp, 8
loop_075F0:
        cmp     si, 2800h
        jne     br_07600
        mov     bx, ds
        cmp     bx, 8000h
        jne     br_07600
        jmp     br_07670
br_07600:
        sub     si, bp
        jae     br_0760C
        mov     bx, ds
        sub     bx, 1000h
        mov     ds, bx
br_0760C:
        mov     bx, word ptr [si]
        mov     cl, byte ptr [si+2]
        and     cl, 0fh
        sub     bx, ax
        sbb     cl, dl
        jb      br_07664
        sub     di, bp
        jae     br_07626
        mov     bx, es
        sub     bx, 1000h
        mov     es, bx
br_07626:
        mov     bl, byte ptr [si+4]
        mov     cx, bp
        shr     cx, 1
        rep movsw
        sub     si, bp
        sub     di, bp
        cmp     bl, 0f8h
        jne     loop_075F0
loop_07638:
        sub     si, bp
        jae     br_07644
        mov     bx, ds
        sub     bx, 1000h
        mov     ds, bx
br_07644:
        sub     di, bp
        jae     br_07650
        mov     bx, es
        sub     bx, 1000h
        mov     es, bx
br_07650:
        mov     bl, byte ptr [si+4]
        mov     cx, bp
        shr     cx, 1
        rep movsw
        sub     si, bp
        sub     di, bp
        cmp     bl, 0f0h
        jne     loop_07638
        jmp     loop_075F0
br_07664:
        add     si, bp
        jae     br_07670
        mov     bx, ds
        add     bx, 1000h
        mov     ds, bx
br_07670:
        mov     bp, ds
        pop     ds
        mov     word ptr [A0_FP_EVT_WRITE_PTR], si
        mov     word ptr [A0_W_EVT_WRITE_SEG], bp
        mov     word ptr [A0_FP_EVT_SCAN_PTR], di
        if      FW_VERSION >= 114
        mov     word ptr [4336h], es
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], es
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], es
        else
        mov     word ptr [42f8h], es
        endif
        mov     bp, 4
        push    ds
        les     di, [A0_FP_EVT_WRITE_PTR]
        lds     si, [A0_FP_EVT_SCAN_PTR]
loop_0768F:
        cmp     byte ptr [si+4], 0ffh
        je      br_076ED
        mov     bx, word ptr [si]
        mov     cl, byte ptr [si+2]
        and     cl, 0fh
        sub     bx, ax
        sbb     cl, dl
        jae     br_076ED
        mov     bl, byte ptr [si+4]
        mov     cx, bp
        rep movsw
        or      si, si
        jne     br_076B6
        mov     cx, ds
        add     cx, 1000h
        mov     ds, cx
br_076B6:
        or      di, di
        jne     br_076C2
        mov     cx, es
        add     cx, 1000h
        mov     es, cx
br_076C2:
        cmp     bl, 0f0h
        jne     loop_0768F
loop_076C7:
        mov     bl, byte ptr [si+4]
        mov     cx, bp
        rep movsw
        or      si, si
        jne     br_076DA
        mov     cx, ds
        add     cx, 1000h
        mov     ds, cx
br_076DA:
        or      di, di
        jne     br_076E6
        mov     cx, es
        add     cx, 1000h
        mov     es, cx
br_076E6:
        cmp     bl, 0f8h
        jne     loop_076C7
        jmp     loop_0768F
br_076ED:
        mov     bp, ds
        pop     ds
        mov     byte ptr es:[di+4], 0ffh
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        if      FW_VERSION >= 114
        mov     word ptr [4336h], bp
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], bp
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], bp
        else
        mov     word ptr [42f8h], bp
        endif
        mov     word ptr [A0_FP_EVT_PLAY_PTR], si
        mov     word ptr [P_433A], bp
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        ret
fn_0770E:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     ax, word ptr es:[1ah]
        jb      br_07721
        mov     ax, word ptr es:[1ah]
        sub     bx, bx
        sub     cx, cx
br_07721:
        mov     si, ax
        shl     si, 2
        add     si, 1500h
        mov     al, byte ptr es:[si+3]
        mul     bl
        add     ax, cx
        sub     dx, dx
        add     ax, word ptr es:[si]
        adc     dl, byte ptr es:[si+2]
        call    fn_0759C
        call    fn_07742
        ret
fn_07742:
        mov     ax, word ptr [A0_W_04320]
        mov     dx, word ptr [A0_W_04322]
        mov     di, 3e8h
        mov     si, 0
        call    X_014EE
        mov     word ptr [A0_W_04318], ax
        mov     word ptr [A0_W_0431A], dx
        ret
fn_0775A:
        if      FW_VERSION < 110
        mov     word ptr [A0_W_04318], ax
        mov     word ptr [A0_W_0431A], dx
        mov     word ptr [42deh], ax
        mov     word ptr [42e0h], dx
        endif
        cmp     byte ptr [A0_B_0436E], 3
        jne     br_07764
        jmp     br_0783F
br_07764:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[13h], 0
        je      br_07783
        mov     si, 28h
        les     di, [50h]
        cmp     byte ptr es:[di+6], 0
        je      br_07794
        mov     si, 20h
        jmp     br_07794
br_07783:
        mov     si, 2ch
        les     di, [50h]
        cmp     byte ptr es:[di+6], 0
        je      br_07794
        mov     si, 24h
br_07794:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[34h], 0
        je      br_077E3
        if      FW_VERSION >= 110
        push    ax
        push    dx
        endif
        push    si
        mov     di, 3e8h
        mov     si, 0
        call    fn_0155E
        pop     bp
        mov     dx, word ptr [A0_W_017EC]
        mov     cx, word ptr [A0_W_017EE]
        mov     bx, word ptr [A0_W_017F0]
        mov     ax, word ptr [A0_W_017F2]
        mov     di, word ptr es:[bp]
        mov     si, word ptr es:[bp+2]
        mov     bp, 0
        call    fn_015B6
        mov     ax, dx
        mov     dx, cx
        call    fn_07859
        if      FW_VERSION >= 110
        pop     dx
        pop     ax
        mov     word ptr [A0_W_04318], ax
        mov     word ptr [A0_W_0431A], dx
        mov     word ptr [A0_W_04300], ax
        mov     word ptr [A0_W_04302], dx
        endif
        clc
        ret
br_077E3:
        push    si
        mov     di, 3e8h
        mov     si, 0
        call    fn_0155E
        pop     si
        mov     ax, word ptr [A0_W_017EC]
        mov     bx, word ptr [A0_W_017EE]
        mov     cx, word ptr [A0_W_017F0]
        mov     dx, word ptr [A0_W_017F2]
        sub     ax, word ptr es:[si]
        sbb     bx, word ptr es:[si+2]
        sbb     cx, 0
        sbb     dx, 0
        mov     ax, word ptr [A0_W_017EC]
        mov     dx, word ptr [A0_W_017EE]
        jb      br_0781A
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
br_0781A:
        cmc
        pushf
        call    fn_07859
        mov     ax, word ptr [A0_W_04320]
        mov     dx, word ptr [A0_W_04322]
        mov     di, 3e8h
        mov     si, 0
        call    X_014EE
        mov     word ptr [A0_W_04318], ax
        mov     word ptr [A0_W_0431A], dx
        mov     word ptr [A0_W_04300], ax
        mov     word ptr [A0_W_04302], dx
        popf
        ret
br_0783F:
        if      FW_VERSION >= 110
        mov     word ptr [A0_W_04318], ax
        mov     word ptr [A0_W_0431A], dx
        mov     word ptr [A0_W_04300], ax
        mov     word ptr [A0_W_04302], dx
        endif
        int     0e4h
        pushf
        call    fn_07859
        popf
        ret
L_07855:
        dw      0
L_07857:
        dw      0
fn_07859:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[13h], 0
        jne     br_07868
        jmp     br_07933
br_07868:
        push    es
        les     di, [50h]
        mov     si, 28h
        mov     bp, word ptr es:[di+4]
        cmp     byte ptr es:[di+6], 0
        pop     es
        je      br_07884
        mov     si, 20h
        mov     bp, word ptr es:[16h]
br_07884:
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[si]
        sbb     cx, word ptr es:[si+2]
        jb      br_0789A
        mov     ax, 0ffffh
        mov     dx, ax
        call    fn_0759C
        ret
br_0789A:
        mov     bx, 700h
loop_0789D:
        push    ax
        push    dx
        sub     ax, word ptr es:[bx+14h]
        sbb     dx, word ptr es:[bx+16h]
        jb      br_078B4
        or      ax, dx
        je      br_078B4
        pop     dx
        pop     ax
        add     bx, 0eh
        jmp     loop_0789D
br_078B4:
        mov     ax, bp
        mov     cx, word ptr es:[bx]
        push    bx
        call    fn_07BFD
        pop     bx
        pop     dx
        pop     ax
        sub     ax, word ptr es:[bx+6]
        sbb     dx, word ptr es:[bx+8]
loop_078C8:
        push    bx
        mov     di, word ptr [A0_W_0430E]
        mov     si, word ptr [P_432C]
        call    X_014EE
        push    di
        push    si
        mov     cx, 60h
        call    fn_01534
        mov     word ptr cs:[L_07855], ax
        mov     word ptr cs:[L_07857], dx
        pop     dx
        pop     ax
        mov     cx, 60h
        call    fn_01534
        mov     di, word ptr [P_432A]
        mov     si, word ptr [P_432C]
        call    X_014EE
        add     ax, word ptr cs:[L_07855]
        adc     dx, word ptr cs:[L_07857]
        pop     bx
        add     ax, word ptr es:[bx+2]
        adc     dx, word ptr es:[bx+4]
        push    ax
        push    dx
        mov     ax, di
        mov     dx, si
        cmp     dx, 60h
        jae     br_0792E
        mov     bx, 60h
        div     bx
        mov     bx, ax
        pop     dx
        pop     ax
        push    bx
        call    fn_0759C
        pop     bx
        mov     word ptr [A0_W_04308], ax
        mov     word ptr [A0_W_04306], 0
        ret
br_0792E:
        mov     al, 9bh
        jmp     fn_014B6
br_07933:
        push    es
        les     di, [50h]
        mov     bp, word ptr es:[di+4]
        mov     si, 2ch
        cmp     byte ptr es:[di+6], 0
        pop     es
        je      br_0794F
        mov     si, 24h
        mov     bp, word ptr es:[16h]
br_0794F:
        mov     bx, ax
        mov     cx, dx
        sub     bx, word ptr es:[si]
        sbb     cx, word ptr es:[si+2]
        jb      br_07966
        mov     ax, 0ffffh
        mov     dx, 0ffffh
        call    fn_0759C
        ret
br_07966:
        push    ax
        push    dx
        mov     ax, bp
        mov     cx, 3e8h
        call    fn_07BFD
        mov     bx, 700h
        pop     dx
        pop     ax
        jmp     loop_078C8
fn_07978:
        call    fn_06B84
        cmp     bh, 0ffh
        je      br_079A3
        mov     bx, word ptr [A0_W_SEQ_TICK_LO]
        mov     cl, byte ptr [A0_W_SEQ_TICK_HI]
        call    fn_06B75
        jne     br_07992
        call    fn_06B98
        jmp     fn_07978
br_07992:
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 0fh
        call    fn_0759C
        call    fn_07742
        ret
br_079A3:
        mov     ax, 0ffffh
        mov     dx, ax
        call    fn_0759C
        call    fn_07742
        ret
fn_079AF:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        or      ax, word ptr [A0_W_SEQ_TICK_HI]
        jne     br_079B9
        ret
br_079B9:
        les     si, [A0_FP_EVT_WRITE_PTR]
        cmp     si, 2800h
        jne     br_079D5
        mov     ax, es
        cmp     ax, 8000h
        jne     br_079D5
        sub     ax, ax
        sub     dx, dx
        call    fn_0759C
        call    fn_07742
        ret
br_079D5:
        sub     si, 8
        jae     br_079E1
        mov     ax, es
        sub     ax, 1000h
        mov     es, ax
br_079E1:
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 0fh
        call    fn_0759C
        call    fn_07742
        ret
isr_079F2:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        pop     ds
        iret
isr_07A02:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, word ptr [A0_W_SEQ_TICK_LO]
        mov     cx, word ptr [A0_W_SEQ_TICK_HI]
        call    fn_07A16
        pop     ds
        iret
fn_07A16:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, 1500h
        mov     ax, bx
        mov     dx, cx
        sub     ax, word ptr es:[1ch]
        sbb     dx, word ptr es:[1eh]
        jae     br_07A68
loop_07A2D:
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        add     si, 4
        and     dx, 0ffh
        sub     ax, bx
        sbb     dx, cx
        jb      loop_07A2D
        or      ax, dx
        je      loop_07A2D
        sub     si, 8
        mov     ax, word ptr es:[si]
        mov     cx, word ptr es:[si+4]
        sub     cx, ax
        sub     bx, ax
        mov     ax, bx
        mov     bp, bx
        mov     bl, byte ptr es:[si+3]
        div     bl
        mov     dx, ax
        mov     ax, si
        sub     ax, 1500h
        shr     ax, 2
        ret
br_07A68:
        mov     si, word ptr es:[1ah]
        push    si
        dec     si
        shl     si, 2
        add     si, 1500h
        mov     cx, word ptr es:[si+4]
        sub     cx, word ptr es:[si]
        mov     bl, byte ptr es:[si+3]
        sub     dx, dx
        pop     ax
        ret
isr_07A85:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     bx, ax
        mov     cx, dx
        call    fn_07A16
        pop     ds
        iret
isr_07A95:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        les     si, [A0_FP_EVT_SCAN_PTR]
        pop     ds
        iret
isr_07AA1:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        les     si, [A0_FP_EVT_WRITE_PTR]
        pop     ds
        iret
isr_07AAD:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_06BF9
        pop     ds
        iret
isr_07AB8:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        add     ax, 1
        adc     dx, 0
        call    fn_0759C
        les     di, [A0_FP_EVT_SCAN_PTR]
        sub     di, 8
        jae     isr_07ADF
        mov     bx, es
        sub     bx, 1000h
        mov     es, bx
isr_07ADF:
        mov     bx, 0ffffh
        mov     word ptr es:[di], bx
        mov     word ptr es:[di+2], bx
        mov     word ptr es:[di+4], bx
        mov     word ptr es:[di+6], bx
        mov     word ptr [A0_FP_EVT_SCAN_PTR], di
        if      FW_VERSION >= 114
        mov     word ptr [4336h], es
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], es
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], es
        else
        mov     word ptr [42f8h], es
        endif
        push    di
        push    es
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        sub     ax, 1
        sbb     dx, 0
        call    fn_0759C
        pop     es
        pop     di
        pop     ds
        iret
isr_07B0F:
        push    ds
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        if      FW_VERSION >= 114
        mov     word ptr [4336h], bp
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], bp
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], bp
        else
        mov     word ptr [42f8h], bp
        endif
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], dx
        pop     ds
        iret
isr_07B27:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_07B32
        pop     ds
        iret
fn_07B32:
        mov     ax, es
        or      ax, si
        jne     br_07B39
        ret
br_07B39:
        mov     bx, word ptr [A0_FP_EVT_SCAN_PTR]
        cmp     si, bx
        jne     br_07B45
        call    fn_06BF9
        ret
br_07B45:
        mov     di, si
        mov     dx, es
        cmp     byte ptr es:[si+4], 0f0h
        jne     br_07B71
        push    dx
        push    bx
        mov     ax, word ptr es:[si+5]
        add     ax, 0fh
        mov     dx, 0
        mov     bx, 8
        div     bx
        shl     ax, 3
        add     di, ax
        jae     br_07B6F
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_07B6F:
        pop     bx
        pop     dx
br_07B71:
        sub     si, 8
        jae     br_07B7A
        sub     dx, 1000h
br_07B7A:
        push    ds
        mov     ds, dx
loop_07B7D:
        push    si
        push    di
        mov     cx, 4
        rep movsw
        pop     di
        pop     si
        cmp     bx, si
        je      br_07BA3
        sub     si, 8
        jae     br_07B95
        sub     dx, 1000h
        mov     ds, dx
br_07B95:
        sub     di, 8
        jae     loop_07B7D
        mov     ax, es
        sub     ax, 1000h
        mov     es, ax
        jmp     loop_07B7D
br_07BA3:
        pop     ds
        mov     word ptr [A0_FP_EVT_SCAN_PTR], di
        if      FW_VERSION >= 114
        mov     word ptr [4336h], es
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], es
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], es
        else
        mov     word ptr [42f8h], es
        endif
        ret
fn_07BAD:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, 700h
        mov     cl, byte ptr es:[14h]
        mov     ch, 0
tgt_07BBB:
        mov     ax, word ptr es:[si+10h]
        mov     dx, word ptr es:[si+12h]
        call    fn_06B75
        ja      br_07BCD
        add     si, 0eh
        loop    tgt_07BBB
br_07BCD:
        push    es
        push    si
        les     si, [50h]
        mov     ax, word ptr es:[si+4]
        cmp     byte ptr es:[si+6], 0
        pop     si
        pop     es
        je      br_07BE4
        mov     ax, word ptr es:[16h]
br_07BE4:
        mov     cx, 3e8h
        cmp     byte ptr es:[13h], 0
        je      br_07BF2
        mov     cx, word ptr es:[si]
br_07BF2:
        mov     word ptr [P_435C], si
        call    fn_06E7E
        call    fn_07BFD
        ret
fn_07BFD:
        mov     word ptr [73h], cx
        mul     cx
        mov     bx, 3e8h
        div     bx
        cmp     ax, 12ch
        jae     br_07C10
        mov     ax, 12ch
br_07C10:
        cmp     ax, 0bb8h
        jb      br_07C18
        mov     ax, 0bb8h
br_07C18:
        mov     di, ax
        mov     word ptr [71h], ax
        sub     si, si
        mov     dx, 23c3h
        mov     ax, 4600h
        call    X_014EE
        mov     word ptr [A0_W_0430E], ax
        mov     word ptr [P_432C], dx
        sub     ax, ax
        mov     word ptr [A0_W_04308], ax
        mov     word ptr [A0_W_04306], ax
        mov     word ptr [A0_W_TICK_IN_BEAT], ax
        ret
fn_07C3B:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[13h], 0
        jne     br_07C4A
        jmp     isr_07D03
br_07C4A:
        mov     bx, 700h
loop_07C4D:
        push    ax
        push    dx
        sub     ax, word ptr es:[bx+10h]
        sbb     dx, word ptr es:[bx+12h]
        jb      br_07C64
        or      ax, dx
        je      br_07C64
        pop     dx
        pop     ax
        add     bx, 0eh
        jmp     loop_07C4D
br_07C64:
        pop     si
        pop     di
        sub     di, word ptr es:[bx+2]
        sbb     si, word ptr es:[bx+4]
        mov     ax, word ptr es:[bx+18h]
        mov     dx, word ptr es:[bx+1ah]
        sub     ax, word ptr es:[bx+0ah]
        sbb     dx, word ptr es:[bx+0ch]
        push    es
        push    bx
        les     bx, [50h]
        cmp     byte ptr es:[bx+6], 0
        pop     bx
        pop     es
        je      br_07C9D
        mov     ax, word ptr es:[bx+14h]
        mov     dx, word ptr es:[bx+16h]
        sub     ax, word ptr es:[bx+6]
        sbb     dx, word ptr es:[bx+8]
br_07C9D:
        push    bx
        call    fn_0155E
        pop     bx
        push    bx
        mov     di, word ptr es:[bx+10h]
        mov     si, word ptr es:[bx+12h]
        sub     di, word ptr es:[bx+2]
        sbb     si, word ptr es:[bx+4]
        mov     bp, 0
        mov     ax, word ptr [A0_W_017F2]
        mov     bx, word ptr [A0_W_017F0]
        mov     cx, word ptr [A0_W_017EE]
        mov     dx, word ptr [A0_W_017EC]
        call    fn_015B6
        mov     ax, word ptr [A0_W_01802]
        mov     dx, word ptr [A0_W_01800]
        pop     bx
        mov     di, word ptr es:[bx+0ah]
        mov     si, word ptr es:[bx+0ch]
        push    es
        push    bx
        les     bx, [50h]
        cmp     byte ptr es:[bx+6], 0
        pop     bx
        pop     es
        je      br_07CEF
        mov     di, word ptr es:[bx+6]
        mov     si, word ptr es:[bx+8]
br_07CEF:
        add     ax, di
        adc     dx, si
loop_07CF3:
        mov     word ptr [A0_W_04320], ax
        mov     word ptr [A0_W_04322], dx
        sub     ax, ax
        mov     word ptr [A0_W_04308], ax
        mov     word ptr [A0_W_04306], ax
        ret
isr_07D03:
        mov     di, word ptr es:[2ch]
        mov     si, word ptr es:[2eh]
        push    es
        les     bx, [50h]
        cmp     byte ptr es:[bx+6], 0
        pop     es
        je      isr_07D24
        mov     di, word ptr es:[24h]
        mov     si, word ptr es:[26h]
isr_07D24:
        call    fn_0155E
        mov     di, word ptr es:[1ch]
        mov     si, word ptr es:[1eh]
        mov     bp, 0
        mov     ax, word ptr [A0_W_017F2]
        mov     bx, word ptr [A0_W_017F0]
        mov     cx, word ptr [A0_W_017EE]
        mov     dx, word ptr [A0_W_017EC]
        call    fn_015B6
        mov     ax, word ptr [A0_W_01802]
        mov     dx, word ptr [A0_W_01800]
        jmp     loop_07CF3
isr_07D4F:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, word ptr [A0_W_04318]
        mov     dx, word ptr [A0_W_0431A]
        add     ax, word ptr [A0_W_0485E]
        adc     dx, word ptr [A0_W_04860]
        pop     ds
        iret
isr_07D67:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_07E83
        call    fn_07D98
        call    fn_07BAD
        pop     ds
        iret
isr_07D78:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, word ptr [A0_W_04320]
        mov     dx, word ptr [A0_W_04322]
        pop     ds
        iret
isr_07D88:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     ax, word ptr [71h]
        mov     cx, word ptr [73h]
        pop     ds
        iret
fn_07D98:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, 700h
        mov     cx, word ptr es:[14h]
tgt_07DA4:
        mov     ax, word ptr es:[16h]
        mul     word ptr es:[si]
        mov     bx, 3e8h
        div     bx
        cmp     ax, 12ch
        jae     br_07DB8
        mov     ax, 12ch
br_07DB8:
        cmp     ax, 0bb8h
        jb      br_07DC0
        mov     ax, 0bb8h
br_07DC0:
        mov     di, ax
        push    si
        push    cx
        push    bx
        mov     ax, word ptr es:[si+10h]
        mov     dx, word ptr es:[si+12h]
        sub     ax, word ptr es:[si+2]
        sbb     dx, word ptr es:[si+4]
        call    fn_07E15
        pop     bx
        pop     cx
        pop     si
        add     ax, word ptr es:[si+6]
        adc     dx, word ptr es:[si+8]
        mov     word ptr es:[si+14h], ax
        mov     word ptr es:[si+16h], dx
        add     si, 0eh
        loop    tgt_07DA4
        mov     word ptr es:[20h], ax
        mov     word ptr es:[22h], dx
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        mov     di, word ptr es:[16h]
        push    si
        call    fn_07E15
        pop     si
        mov     word ptr es:[24h], ax
        mov     word ptr es:[26h], dx
        ret
fn_07E15:
        mov     bp, ax
        or      bp, dx
        jne     br_07E1C
        ret
br_07E1C:
        mov     bx, 60h
        div     bx
        push    dx
        push    ax
        sub     si, si
        mov     dx, 23c3h
        mov     ax, 4600h
        call    X_014EE
        mov     word ptr [A0_W_048B4], ax
        mov     word ptr [A0_W_048B6], dx
        pop     cx
        call    fn_01534
        pop     cx
        push    ax
        push    dx
        mov     ax, word ptr [A0_W_048B4]
        mov     dx, word ptr [A0_W_048B6]
        call    fn_01534
        mov     di, 60h
        sub     si, si
        call    X_014EE
        pop     bx
        pop     cx
        add     ax, cx
        adc     dx, bx
        ret
isr_07E55:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        push    word ptr [A0_W_SEQ_SEGMENT]
        mov     ax, 0
isr_07E62:
        push    ax
        int     0deh
        mov     es, dx
        cmp     byte ptr es:[12h], 0
        je      isr_07E76
        mov     word ptr [A0_W_SEQ_SEGMENT], dx
        call    fn_07E83
isr_07E76:
        pop     ax
        inc     ax
        cmp     ax, 63h
        jne     isr_07E62
        pop     ax
        mov     word ptr [A0_W_SEQ_SEGMENT], ax
        pop     ds
        iret
fn_07E83:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     si, 700h
        mov     cx, word ptr es:[14h]
tgt_07E8F:
        push    es
        push    si
        les     si, [50h]
        mov     ax, word ptr es:[si+4]
        pop     si
        pop     es
        mul     word ptr es:[si]
        mov     bx, 3e8h
        div     bx
        cmp     ax, 12ch
        jae     br_07EAB
        mov     ax, 12ch
br_07EAB:
        cmp     ax, 0bb8h
        jb      br_07EB3
        mov     ax, 0bb8h
br_07EB3:
        mov     di, ax
        push    si
        push    cx
        push    bx
        mov     ax, word ptr es:[si+10h]
        mov     dx, word ptr es:[si+12h]
        sub     ax, word ptr es:[si+2]
        sbb     dx, word ptr es:[si+4]
        call    fn_07E15
        pop     bx
        pop     cx
        pop     si
        add     ax, word ptr es:[si+0ah]
        adc     dx, word ptr es:[si+0ch]
        mov     word ptr es:[si+18h], ax
        mov     word ptr es:[si+1ah], dx
        add     si, 0eh
        loop    tgt_07E8F
        mov     word ptr es:[28h], ax
        mov     word ptr es:[2ah], dx
        mov     ax, word ptr es:[si+2]
        mov     dx, word ptr es:[si+4]
        push    es
        push    si
        les     si, [50h]
        mov     di, word ptr es:[si+4]
        pop     si
        pop     es
        push    si
        call    fn_07E15
        pop     si
        mov     word ptr es:[2ch], ax
        mov     word ptr es:[2eh], dx
        ret
fn_07F0F:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        push    ax
        push    dx
        mov     di, word ptr [A0_W_04856]
        sub     si, si
        int     0b8h
        pop     dx
        pop     ax
        mov     bx, word ptr [A0_W_04856]
        sub     bx, di
        add     ax, bx
        add     dx, 0
        call    fn_0759C
        call    fn_07742
        call    fn_07F37
        ret
fn_07F37:
        int     86h
        mov     ax, bp
        mov     dx, 0
        mov     bx, word ptr [A0_W_04856]
        div     bx
        test    al, 1
        mov     ax, 0
        jne     br_07F4C
        ret
br_07F4C:
        les     si, [50h]
        mov     bl, byte ptr es:[si+7]
        mov     bh, 0
        mov     al, byte ptr [bx+A0_B_0483A]
        mov     ah, byte ptr es:[si+12h]
        mul     ah
        mov     bl, 19h
        div     bl
        mov     ah, 0
        mov     dx, 0
        add     ax, word ptr [A0_W_SEQ_TICK_LO]
        adc     dx, word ptr [A0_W_SEQ_TICK_HI]
        call    fn_0759C
        call    fn_07742
        ret
fn_07F78:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        push    ax
        push    dx
        mov     di, word ptr [A0_W_04856]
        sub     si, si
        push    di
        int     0b8h
        pop     ax
        or      di, di
        jne     br_07F93
        mov     di, word ptr [A0_W_04856]
br_07F93:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        sub     ax, di
        sbb     dx, 0
        jae     br_07FA5
        sub     ax, ax
        sub     dx, dx
br_07FA5:
        call    fn_0759C
        call    fn_07742
        call    fn_07F37
        pop     dx
        pop     ax
        mov     bx, word ptr [A0_W_SEQ_TICK_LO]
        mov     cx, word ptr [A0_W_SEQ_TICK_HI]
        mov     di, bx
        or      di, cx
        jne     br_07FBF
        ret
br_07FBF:
        sub     bx, ax
        sbb     cx, dx
        jae     isr_07FC6
        ret
isr_07FC6:
        sub     ax, word ptr [A0_W_04856]
        sbb     dx, 0
        call    fn_0759C
        jmp     fn_07F78
isr_07FD2:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     al, byte ptr [A0_B_FRAME_RATE]
        mov     ah, 6
        mul     ah
        if      FW_VERSION >= 114
        add     ax, 56f5h
        elseif  FW_VERSION >= 112
        add     ax, 56d9h
        elseif  FW_VERSION >= 110
        add     ax, 56d5h
        else
        add     ax, 56b7h
        endif
        mov     si, ax
        mov     ax, word ptr [si]
        mov     byte ptr [A0_B_056EF], al
        mov     byte ptr [A0_B_056F0], ah
        mov     ax, word ptr [si+2]
        mov     word ptr [A0_W_056D5], ax
        mov     ax, word ptr [si+4]
        mov     word ptr [A0_W_056F3], ax
        mov     dx, 0c016h
        mov     al, 0b6h
        out     dx, al
        mov     dx, 1c0h
        mov     al, 0
        out     dx, al
        mov     al, 34h
        mov     dx, 1c4h
        out     dx, al
        mov     al, 0a0h
        mov     dx, 1c6h
        out     dx, al
        mov     al, 35h
        mov     dx, 1c4h
        out     dx, al
        mov     al, 0fh
        mov     dx, 1c6h
        out     dx, al
        mov     al, 36h
        mov     dx, 1c4h
        out     dx, al
        mov     al, byte ptr [A0_B_056EF]
        mov     dx, 1c6h
        out     dx, al
        mov     al, 37h
        mov     dx, 1c4h
        out     dx, al
        mov     al, byte ptr [A0_B_056F0]
        mov     dx, 1c6h
        out     dx, al
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 3
        jne     isr_08044
        mov     dx, 1c0h
        mov     al, 8
        out     dx, al
isr_08044:
        pop     ds
        iret
isr_08046:
        sti
        pusha
        push    ds
        push    es
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     es, ax
        call    fn_08058
        pop     es
        pop     ds
        popa
        iret
fn_08058:
        push    dx
        mov     dx, 1c0h
        in      al, dx
        pop     dx
        mov     byte ptr [A0_B_056DC], al
        test    al, 2
        je      br_08068
        jmp     br_0812C
br_08068:
        mov     di, A0_W_056DE
        mov     dx, 1c4h
        mov     al, 80h
        out     dx, ax
        mov     dx, 1c6h
        mov     cx, 8
        rep insb
        mov     ax, ds
        mov     es, ax
        mov     si, A0_W_056DE
        and     byte ptr [si], 0fh
        and     byte ptr [si+1], 3
        and     byte ptr [si+2], 0fh
        and     byte ptr [si+3], 7
        and     byte ptr [si+4], 0fh
        and     byte ptr [si+5], 7
        and     byte ptr [si+6], 0fh
        and     byte ptr [si+7], 3
        mov     di, A0_W_056EA
        call    fn_0811A
        mov     bl, byte ptr [A0_B_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+A0_B_028DD]
        cmp     cl, bl
        jae     br_08119
        mov     byte ptr [di+3], cl
        call    fn_0811A
        cmp     cl, 3ch
        jae     br_08119
        mov     byte ptr [di+2], cl
        call    fn_0811A
        cmp     cl, 3ch
        jae     br_08119
        mov     byte ptr [di+1], cl
        call    fn_0811A
        cmp     cl, 18h
        jae     br_08119
        mov     byte ptr [di], cl
        push    ds
        pop     es
        mov     bp, di
        call    fn_03D52
        mov     bl, byte ptr [A0_B_FRAME_RATE]
        mov     bh, 0
        mov     bl, byte ptr [bx+A0_B_028C5]
        add     di, bx
        adc     si, 0
        mov     ax, di
        mov     dx, si
        call    fn_02C96
        jae     br_080F6
        ret
br_080F6:
        call    fn_02A25
        jae     br_080FC
        ret
br_080FC:
        mov     word ptr [A0_W_056E6], 0c8h
        mov     word ptr [A0_W_056D8], ax
        mov     word ptr [A0_W_056DA], dx
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 3
        je      br_08111
        ret
br_08111:
        mov     word ptr [A0_W_04300], ax
        mov     word ptr [A0_W_04302], dx
        ret
br_08119:
        ret
fn_0811A:
        mov     ch, byte ptr [si+1]
        shl     ch, 1
        mov     cl, ch
        shl     ch, 2
        add     cl, ch
        add     cl, byte ptr [si]
        add     si, 2
        ret
br_0812C:
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        jne     br_08134
        ret
br_08134:
        mov     ax, word ptr [A0_W_056D5]
        cmp     byte ptr [A0_B_MTC_GEN_FRAMES], 2
        jae     br_08155
        cmp     byte ptr [A0_B_MTC_GEN_FRAMES], 0
        jne     br_08149
        add     ax, word ptr [A0_W_056F3]
br_08149:
        push    ax
        mov     dx, 0c014h
        out     dx, al
        pop     ax
        mov     al, ah
        mov     dx, 0c014h
        out     dx, al
br_08155:
        call    fn_03872
        call    fn_08161
        mov     byte ptr [A0_B_056E9], 1
        ret
fn_08161:
        mov     dx, 1c4h
        mov     al, 88h
        out     dx, al
        mov     dx, 1c6h
        mov     al, byte ptr [A0_B_MTC_GEN_FRAMES]
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        push    ax
        mov     al, ah
        out     dx, al
        pop     ax
        cmp     byte ptr [A0_B_FRAME_RATE], 2
        jne     br_08181
        or      al, 0ch
br_08181:
        out     dx, al
        mov     al, byte ptr [A0_B_MTC_GEN_SECONDS]
        call    fn_08193
        mov     al, byte ptr [A0_B_MTC_GEN_MINUTES]
        call    fn_08193
        mov     al, byte ptr [A0_B_0302F]
        and     al, 1fh
fn_08193:
        mov     ah, 0
        mov     bl, 0ah
        div     bl
        push    ax
        mov     al, ah
        out     dx, al
        pop     ax
        out     dx, al
        ret
fn_081A0:
        cmp     byte ptr [A0_B_SYNC_OUT_MODE], 3
        je      br_081A8
        ret
br_081A8:
        cmp     byte ptr [A0_B_056CC], 0
        je      br_081B0
        ret
br_081B0:
        cmp     byte ptr [A0_B_PLAY_STATE], 2
        je      br_081B8
        ret
br_081B8:
        call    fn_03819
        jb      br_081BE
        ret
br_081BE:
        mov     byte ptr [A0_B_056CC], 1
        call    fn_03872
        push    dx
        mov     dx, 1c0h
        in      al, dx
        pop     dx
        mov     dx, 1c0h
        mov     al, 18h
        out     dx, al
        mov     al, 34h
        mov     dx, 1c4h
        out     dx, al
        mov     al, 30h
        mov     dx, 1c6h
        out     dx, al
        mov     dx, 0c016h
        mov     al, 0b6h
        out     dx, al
        call    fn_08161
        mov     ax, word ptr [A0_W_056D5]
        push    ax
        mov     dx, 0c014h
        out     dx, al
        pop     ax
        mov     al, ah
        mov     dx, 0c014h
        out     dx, al
        ret
smpte_test_stop:
        mov     dx, 0c016h
        mov     al, 0b6h
        out     dx, al
        mov     al, 34h
        mov     dx, 1c4h
        out     dx, al
        mov     al, 0a0h
        mov     dx, 1c6h
        out     dx, al
        mov     dx, 1c0h
        mov     al, 0
        out     dx, al
        cmp     byte ptr [A0_B_SYNC_IN_MODE], 3
        je      br_08217
        ret
br_08217:
        mov     dx, 1c0h
        mov     al, 8
        out     dx, al
        ret
isr_0821E:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        les     si, [50h]
        cmp     ax, 63h
        je      isr_08230
        mov     word ptr es:[si], ax
isr_08230:
        mov     si, A0_W_056F1
        call    fn_082A6
        mov     ax, word ptr [si+0ah]
        mov     word ptr [A0_W_0206A], ax
        mov     word ptr [A0_W_02088], ax
        sub     ax, ax
        mov     word ptr [A0_W_SEQ_TICK_LO], ax
        mov     word ptr [A0_W_SEQ_TICK_HI], ax
        mov     word ptr [A0_W_04320], ax
        mov     word ptr [A0_W_04322], ax
        if      FW_VERSION < 114
        cmp     byte ptr [A0_B_PLAY_STATE], 0
        endif
        mov     ax, 0f000h
        mov     es, ax
        mov     word ptr [A0_W_SEQ_SEGMENT], ax
        mov     si, 1500h
        mov     word ptr [A0_W_04350], si
        mov     word ptr [A0_W_04352], es
        mov     si, 700h
        mov     word ptr [A0_W_04340], si
        mov     word ptr [A0_W_04342], es
        call    fn_07BAD
        pop     ds
        iret
isr_08270:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     si, A0_W_056F1
        call    fn_082A6
        mov     ax, word ptr [si+0ah]
        mov     word ptr [A0_W_0206A], ax
        mov     word ptr [A0_W_02088], ax
        pop     ds
        iret
isr_08287:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     si, A0_W_0571C
        call    fn_082A6
        mov     ax, word ptr [si+0ah]
        mov     word ptr [A0_W_0208A], ax
        mov     word ptr [A0_W_02070], ax
        sub     ax, ax
        mov     word ptr [A0_W_04314], ax
        mov     word ptr [A0_W_04316], ax
        pop     ds
        iret
fn_082A6:
        push    si
        mov     bx, ax
        mov     word ptr [si], ax
        mov     bl, byte ptr [bx+A0_TBL_0218E]
        mov     byte ptr [si+0ch], bl
        shl     bx, 1
        mov     ax, word ptr [bx+A0_TBL_01884]
        mov     word ptr [si+0ah], ax
        mov     dx, word ptr [si+2]
        shr     dx, 9
        mov     bp, resume_082C7
        retxa   2Ch
resume_082C7:
        add     dx, 0ff00h
        out     dx, ax
        mov     dx, word ptr [si+4]
        push    dx
        shr     dx, 9
        add     dx, 0ff00h
        out     dx, ax
        mov     bp, resume_082DE
        brkxa   2Bh
resume_082DE:
        mov     word ptr [si+6], 2800h
        pop     dx
        mov     byte ptr [si+2ah], 0
        mov     cx, 1dh
        mov     word ptr [si+8], 0
        add     si, 0ch
        mov     bl, byte ptr [si]
        mov     bh, 0
loop_082F7:
        inc     si
        mov     bl, byte ptr [bx+A0_TBL_0208E]
        mov     byte ptr [si], bl
        cmp     bl, 1
        je      br_08308
        loop    loop_082F7
        mov     byte ptr [si], 1
br_08308:
        pop     si
        ret
br_0830A:
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_05763], ax
        mov     word ptr [A0_W_05765], dx
        mov     bp, A0_W_056F1
        push    bp
        call    fn_08352
        pop     bp
        mov     ax, word ptr ds:[bp+0ah]
        mov     word ptr [A0_W_02088], ax
        ret
fn_08328:
        les     si, [50h]
        cmp     byte ptr es:[si+9], 0
        jne     br_08334
        ret
br_08334:
        mov     ax, word ptr [A0_W_04314]
        mov     dx, word ptr [A0_W_04316]
        mov     word ptr [A0_W_05763], ax
        mov     word ptr [A0_W_05765], dx
        mov     bp, A0_W_0571C
        push    bp
        call    fn_08352
        pop     bp
        mov     ax, word ptr ds:[bp+0ah]
        mov     word ptr [A0_W_02070], ax
        ret
fn_08352:
        cmp     word ptr ds:[bp], 63h
        jne     br_0835A
        ret
br_0835A:
        cmp     byte ptr ds:[bp+2ah], 0
        je      L_0835E
        ret
L_0835E:
        mov     si, word ptr ds:[bp+6]
loop_08366:
        mov     es, word ptr ds:[bp+4]
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     word ptr ds:[bp+6], si
        and     dx, 3f0fh
        sub     ax, word ptr [A0_W_05763]
        sbb     dl, byte ptr [A0_W_05765]
        jae     br_08384
        ret
br_08384:
        or      al, ah
        or      al, dl
        je      br_0838B
        ret
br_0838B:
        mov     al, dh
        mov     ah, 0
        mov     di, ax
        push    es
        mov     es, word ptr ds:[bp+2]
        test    byte ptr es:[di+A0_TBL_SEQ_TRK_FLAGS], 2
        pop     es
        je      br_083DA
        if      FW_VERSION >= 114
        cmp     bp, 570dh
        elseif  FW_VERSION >= 112
        cmp     bp, 56f1h
        elseif  FW_VERSION >= 110
        cmp     bp, 56edh
        else
        cmp     bp, 56cfh
        endif
        jne     br_083B2
        cmp     di, word ptr [A0_W_CUR_TRACK]
        je      br_083B2
        cmp     byte ptr [A0_B_0437C], 0
        jne     br_083DA
br_083B2:
        mov     ch, byte ptr es:[si+4]
        cmp     ch, 0f0h
        je      br_083CF
        push    es
        push    si
        push    bp
        call    fn_0840D
        pop     bp
        pop     si
        pop     es
        call    fn_085BB
        jae     loop_08366
        mov     byte ptr ds:[bp+2ah], 1
        ret
br_083CF:
        call    fn_08531
        jae     loop_08366
        mov     byte ptr ds:[bp+2ah], 1
        ret
br_083DA:
        mov     ch, byte ptr es:[si+4]
        cmp     ch, 0f0h
        je      loop_083F1
        call    fn_085BB
        jb      br_083EB
        jmp     loop_08366
br_083EB:
        mov     byte ptr ds:[bp+2ah], 1
        ret
loop_083F1:
        call    fn_085BB
        jb      br_08407
        mov     ch, byte ptr es:[si+4]
        cmp     ch, 0f8h
        jne     loop_083F1
        call    fn_085BB
        jb      br_08407
        jmp     loop_08366
br_08407:
        mov     byte ptr ds:[bp+2ah], 1
        ret
fn_0840D:
        test    ch, 80h
        je      br_08415
        jmp     br_084E7
br_08415:
        mov     ah, byte ptr es:[si+2]
        mov     al, byte ptr es:[si+3]
        shr     ah, 4
        shl     ax, 2
        mov     al, byte ptr es:[si+5]
        mov     bx, ax
        mov     dh, 0
        mov     cl, byte ptr es:[si+6]
        shl     cl, 1
        rcl     dh, 1
        shr     cl, 1
        mov     dl, byte ptr es:[si+7]
        shl     dx, 1
        shr     dl, 1
        cmp     byte ptr [A0_B_AFTER_ON], 0
        je      br_0845D
        cmp     di, word ptr [A0_W_CUR_TRACK]
        jne     br_0845D
        push    cx
        push    dx
        push    di
        push    bp
        mov     al, ch
        call    fn_06A24
        mov     ax, dx
        pop     bp
        pop     di
        pop     dx
        pop     cx
        jae     br_0845D
        mov     dx, ax
br_0845D:
        push    bx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        cmp     byte ptr es:[di+5c0h], 0
        jne     br_08491
        mov     bl, byte ptr [A0_B_0484E]
        cmp     bl, 0
        je      br_0847B
        dec     bl
        mov     bh, 0
        cmp     bx, di
        jne     br_08491
br_0847B:
        add     ch, byte ptr [A0_B_0484F]
        sub     ch, 0ch
        jb      L_0830B
        cmp     ch, 80h
        jb      br_08491
        sub     ch, 0ch
        jmp     br_08491
L_0830B:
        add     ch, 0ch
br_08491:
        pop     bx
        mov     es, word ptr ds:[bp+2]
        mov     al, byte ptr es:[di+640h]
        mul     cl
        mov     cl, 64h
        div     cl
        cmp     al, 0
        jne     br_084A7
        mov     al, 1
br_084A7:
        cmp     al, 7fh
        jb      br_084AD
        mov     al, 7fh
br_084AD:
        mov     cl, al
        mov     al, ch
        mov     bp, bx
        mov     ah, byte ptr es:[di+5c0h]
        mov     ch, byte ptr es:[di+580h]
        mov     bx, word ptr [A0_W_04804]
        mov     word ptr [bx+A0_W_04404], bp
        mov     word ptr [bx+A0_W_04406], ax
        mov     word ptr [bx+A0_W_04408], cx
        mov     word ptr [bx+A0_W_0440A], 0ffffh
        add     bx, 8
        and     bx, 3ffh
        mov     word ptr [A0_W_04804], bx
        mov     bl, 2
        or      ah, 90h
        call    fn_06CF0
        ret
br_084E7:
        mov     ah, byte ptr es:[si+4]
        cmp     ah, 80h
        jne     br_084F1
        ret
br_084F1:
        mov     al, byte ptr es:[si+5]
        mov     cl, byte ptr es:[si+6]
        mov     es, word ptr ds:[bp+2]
        mov     ch, byte ptr es:[di+580h]
        cmp     ah, 0b0h
        je      br_08510
        cmp     ah, 0c0h
        je      br_08524
        call    fn_06D23
        ret
br_08510:
        cmp     al, 40h
        jne     br_0851F
        mov     bl, byte ptr es:[di+580h]
        mov     bh, 0
        mov     byte ptr [bx+P_480A], cl
br_0851F:
        call    fn_06D23
        clc
        ret
br_08524:
        test    byte ptr es:[di+A0_TBL_SEQ_TRK_FLAGS], 4
        jne     br_0852D
        ret
br_0852D:
        call    fn_06D23
        ret
fn_08531:
        call    fn_085BB
        jae     br_08537
        ret
br_08537:
        mov     ax, word ptr es:[si+1]
        cmp     ax, 47h
        jne     loop_08576
        mov     ax, word ptr es:[si+3]
        cmp     ax, 4544h
        jne     loop_08576
        mov     dh, byte ptr es:[si+5]
        mov     al, byte ptr es:[si+6]
        mov     cl, byte ptr es:[si+7]
        mov     ch, 2
        push    es
        pusha
        mov     es, word ptr ds:[bp+2]
        mov     ah, byte ptr es:[di+5c0h]
        sub     ah, 1
        jb      br_0856D
        mov     bl, 0
        push    ds
        int     35h
        pop     ds
br_0856D:
        popa
        pop     es
        call    fn_085BB
        call    fn_085BB
        ret
loop_08576:
        mov     al, byte ptr es:[si]
        add     si, 1
        cmp     si, 4000h
        jne     br_08585
        call    fn_085C4
br_08585:
        push    es
        push    si
        push    ax
        call    fn_0859F
        pop     ax
        pop     si
        pop     es
        cmp     al, 0f7h
        jne     loop_08576
loop_08592:
        test    si, 7
        je      br_0859B
        inc     si
        jmp     loop_08592
br_0859B:
        call    fn_085BB
        ret
fn_0859F:
        mov     es, word ptr ds:[bp+2]
        mov     ch, byte ptr es:[di+580h]
        sub     ch, 1
        jae     br_085AE
        ret
br_085AE:
        cmp     ch, 10h
        jae     br_085B7
        call    fn_03C9C
        ret
br_085B7:
        call    fn_03CC9
        ret
fn_085BB:
        add     si, 8
        cmp     si, 4000h
        jb      br_08606
fn_085C4:
        inc     word ptr ds:[bp+8]
        mov     si, word ptr ds:[bp+8]
        add     si, 0ch
        add     si, bp
        mov     bl, byte ptr [si]
        mov     bh, 0
        cmp     bl, 1
        je      L_08604
        push    ax
        push    dx
        shl     bx, 1
        mov     ax, word ptr [bx+A0_TBL_01884]
        mov     word ptr ds:[bp+0ah], ax
        push    bp
        mov     bp, resume_085ED
        retxa   2Ch
resume_085ED:
        pop     bp
        mov     dx, word ptr ds:[bp+4]
        shr     dx, 9
        add     dx, 0ff00h
        out     dx, ax
        push    bp
        mov     bp, resume_08601
        brkxa   2Bh
resume_08601:
        pop     bp
        pop     dx
        pop     ax
        sub     si, si
br_08606:
        clc
        ret
L_08604:
        stc
        ret
fn_0860A:
        cmp     word ptr ds:[bp+8], 0
        jne     br_0861E
        cmp     si, 2800h
        stc
        jne     br_08619
        ret
br_08619:
        sub     si, 8
        clc
        ret
br_0861E:
        sub     si, 8
        jb      br_08624
        ret
br_08624:
        push    ax
        push    dx
        dec     word ptr ds:[bp+8]
        mov     si, word ptr ds:[bp+8]
        add     si, 0ch
        add     si, bp
        mov     bl, byte ptr [si]
        mov     bh, 0
        shl     bx, 1
        mov     ax, word ptr [bx+A0_TBL_01884]
        push    bp
        mov     bp, resume_08644
        retxa   2Ch
resume_08644:
        pop     bp
        mov     dx, word ptr ds:[bp+4]
        shr     dx, 9
        add     dx, 0ff00h
        out     dx, ax
        push    bp
        mov     bp, resume_08658
        brkxa   2Bh
resume_08658:
        pop     bp
        mov     si, 3ff8h
        pop     dx
        pop     ax
        clc
        ret
fn_08660:
        les     si, [50h]
        cmp     byte ptr es:[si+9], 0
        jne     br_0866C
        ret
br_0866C:
        mov     bp, A0_W_0571C
        cmp     word ptr ds:[bp], 63h
        jne     br_08677
        ret
br_08677:
        mov     ax, word ptr [A0_W_04314]
        mov     dx, word ptr [A0_W_04316]
        add     ax, 1
        adc     dx, 0
        mov     word ptr [A0_W_04314], ax
        mov     word ptr [A0_W_04316], dx
        mov     es, word ptr ds:[bp+2]
        cmp     byte ptr es:[34h], 0
        jne     br_08698
        ret
br_08698:
        cmp     ax, word ptr es:[1ch]
        je      br_086A0
        ret
br_086A0:
        cmp     dx, word ptr es:[1eh]
        je      br_086A8
        ret
br_086A8:
        mov     ax, word ptr ds:[bp]
        int     0d9h
        ret
fn_086AF:
        cmp     byte ptr [A0_B_0436E], 3
        je      br_086BE
        cmp     byte ptr [A0_B_0436E], 4
        je      br_086BE
        ret
br_086BE:
        pusha
        mov     bp, A0_W_056F1
        call    fn_086DE
        popa
        ret
fn_086C7:
        pusha
        mov     bp, P_5738
        call    fn_086DE
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_04314], ax
        mov     word ptr [A0_W_04316], dx
        popa
        ret
fn_086DE:
        cmp     word ptr ds:[bp], 63h
        jne     br_086E6
        ret
br_086E6:
        mov     es, word ptr ds:[bp+4]
        mov     si, word ptr ds:[bp+6]
        cmp     byte ptr es:[si+4], 0ffh
        je      br_08705
loop_086F5:
        mov     bx, word ptr es:[si]
        mov     cl, byte ptr es:[si+2]
        and     cl, 0fh
        sub     bx, ax
        sbb     cl, dl
        jb      loop_0870A
br_08705:
        call    fn_08751
        jae     loop_086F5
loop_0870A:
        cmp     byte ptr es:[si+4], 0ffh
        je      br_08727
        mov     bx, word ptr es:[si]
        mov     cl, byte ptr es:[si+2]
        and     cl, 0fh
        sub     bx, ax
        sbb     cl, dl
        jae     br_08727
        call    fn_0872C
        jae     loop_0870A
        ret
br_08727:
        mov     word ptr ds:[bp+6], si
        ret
fn_0872C:
        mov     bl, byte ptr es:[si+4]
        push    bx
        call    fn_085BB
        pop     bx
        jae     br_08738
        ret
br_08738:
        cmp     bl, 0f0h
        clc
        je      loop_0873F
        ret
loop_0873F:
        mov     bl, byte ptr es:[si+4]
        push    bx
        call    fn_085BB
        pop     bx
        jae     br_0874B
        ret
br_0874B:
        cmp     bl, 0f8h
        jne     loop_0873F
        ret
fn_08751:
        call    fn_0860A
        jae     br_08757
        ret
br_08757:
        mov     bl, byte ptr es:[si+4]
        cmp     bl, 0f8h
        clc
        je      loop_08762
        ret
loop_08762:
        call    fn_0860A
        mov     bl, byte ptr es:[si+4]
        cmp     bl, 0f0h
        jne     loop_08762
        ret
isr_0876F:
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        mov     word ptr [A0_W_0574B], ax
        mov     word ptr [A0_W_0574D], bx
        mov     word ptr [A0_W_0574F], cx
        mov     word ptr [A0_W_EDIT_COPIES], dx
        mov     ax, cx
        mov     bx, 0
        mov     cx, 0
        call    fn_0770E
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     bx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_05751], ax
        mov     word ptr [A0_W_05753], bx
        mov     ax, word ptr [A0_W_0574B]
        call    fn_088A9
        mov     word ptr [A0_W_EDIT_RANGE_START_LO], ax
        mov     word ptr [A0_W_EDIT_RANGE_START_HI], dx
        mov     ax, word ptr [A0_W_0574D]
        inc     ax
        call    fn_088A9
        mov     word ptr [A0_W_05759], ax
        mov     word ptr [A0_W_0575B], dx
        sub     ax, word ptr [A0_W_EDIT_RANGE_START_LO]
        sbb     dx, word ptr [A0_W_EDIT_RANGE_START_HI]
        mov     word ptr [A0_W_0575D], ax
        mov     word ptr [A0_W_0575F], dx
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        sub     ax, word ptr [A0_W_EDIT_RANGE_START_LO]
        sbb     dx, word ptr [A0_W_EDIT_RANGE_START_HI]
        mov     word ptr [A0_W_05781], ax
        mov     word ptr [A0_W_05767], dx
        les     si, [A0_FP_EVT_SCAN_PTR]
        mov     ax, es
        shl     ax, 1
        shr     si, 3
        add     ax, si
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     bx, es
        shl     bx, 1
        shr     si, 3
        add     bx, si
        sub     ax, bx
        jae     isr_087FE
        jmp     isr_0889D
isr_087FE:
        sub     ax, 64h
        jae     isr_08806
        jmp     isr_0889D
isr_08806:
        mov     word ptr [A0_W_05787], ax
        mov     cx, word ptr [A0_W_EDIT_COPIES]
        mov     word ptr [A0_W_05761], 0
        if      FW_VERSION >= 114
        mov     word ptr [577fh], 0
        elseif  FW_VERSION >= 112
        mov     word ptr [5763h], 0
        elseif  FW_VERSION >= 110
        mov     word ptr [575fh], 0
        else
        mov     word ptr [5741h], 0
        endif
isr_08819:
        mov     ax, word ptr [A0_W_EDIT_RANGE_START_LO]
        mov     dx, word ptr [A0_W_EDIT_RANGE_START_HI]
        push    cx
        call    fn_086C7
        call    fn_088CC
        pop     cx
        jae     isr_0882C
        jmp     isr_0889D
isr_0882C:
        mov     ax, word ptr [A0_W_0575D]
        mov     dx, word ptr [A0_W_0575F]
        add     word ptr [A0_W_05761], ax
        if      FW_VERSION >= 114
        adc     word ptr [577fh], dx
        elseif  FW_VERSION >= 112
        adc     word ptr [5763h], dx
        elseif  FW_VERSION >= 110
        adc     word ptr [575fh], dx
        else
        adc     word ptr [5741h], dx
        endif
        loop    isr_08819
        mov     ax, word ptr [A0_W_0574D]
        sub     ax, word ptr [A0_W_0574B]
        inc     ax
        mov     bx, word ptr [A0_W_EDIT_COPIES]
        mul     bx
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        add     word ptr es:[1ah], ax
        mov     ax, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        mov     dx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        mov     dx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        mov     dx, word ptr [575fh]
        else
        mov     dx, word ptr [5741h]
        endif
        add     word ptr es:[1ch], ax
        adc     word ptr es:[1eh], dx
        call    fn_089BC
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     ax, es
        and     ax, 0f000h
        shr     si, 4
        add     ax, si
        sub     ax, 8000h
        shr     ax, 0ah
        inc     ax
        push    ax
        int     0d5h
        pop     bx
        cmp     ax, bx
        jb      isr_0889D
        call    fn_08A86
        call    fn_08B22
        int     0dfh
        call    fn_08A24
        mov     word ptr [A0_W_SEQ_TICK_LO], 0
        mov     word ptr [A0_W_SEQ_TICK_HI], 0
        clc
isr_0889D:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_088A9:
        mov     bx, 0f800h
        mov     es, bx
        cmp     ax, word ptr es:[1ah]
        jb      br_088B9
        mov     ax, word ptr es:[1ah]
br_088B9:
        mov     si, ax
        shl     si, 2
        add     si, 1500h
        mov     ax, word ptr es:[si]
        mov     dl, byte ptr es:[si+2]
        mov     dh, 0
        ret
fn_088CC:
        mov     bp, A0_W_0571C
        mov     si, word ptr ds:[bp+6]
        mov     es, word ptr ds:[bp+4]
loop_088D7:
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        and     bx, 0fh
        sub     ax, word ptr [A0_W_05759]
        sbb     bx, word ptr [A0_W_0575B]
        jb      br_088EE
        jmp     NEAR br_089B8
br_088EE:
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     cx, bx
        and     bx, 0fh
        and     cl, 0f0h
        add     ax, word ptr [A0_W_05781]
        adc     bx, word ptr [A0_W_05767]
        add     ax, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        adc     bx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        adc     bx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        adc     bx, word ptr [575fh]
        else
        adc     bx, word ptr [5741h]
        endif
        and     bx, 0fh
        or      bx, cx
        mov     cx, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        push    es
        les     di, [A0_FP_EVT_WRITE_PTR]
        stosw
        mov     ax, bx
        stosw
        mov     ax, cx
        stosw
        mov     ax, dx
        stosw
        or      di, di
        jne     br_08934
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_08934:
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        pop     es
        push    cx
        call    fn_085BB
        pop     cx
        jb      br_089B8
        dec     word ptr [A0_W_05787]
        je      br_089BA
        cmp     cl, 0f0h
        jne     loop_088D7
loop_0894F:
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     cx, word ptr es:[si+4]
        cmp     cl, 0f8h
        jne     br_0897C
        mov     dx, bx
        and     bx, 0fh
        and     dl, 0f0h
        add     ax, word ptr [A0_W_05781]
        adc     bx, word ptr [A0_W_05767]
        add     ax, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        adc     bx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        adc     bx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        adc     bx, word ptr [575fh]
        else
        adc     bx, word ptr [5741h]
        endif
        and     bx, 0fh
        or      bx, dx
br_0897C:
        mov     dx, word ptr es:[si+6]
        push    es
        les     di, [A0_FP_EVT_WRITE_PTR]
        stosw
        mov     ax, bx
        stosw
        mov     ax, cx
        stosw
        mov     ax, dx
        stosw
        or      di, di
        jne     br_0899A
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_0899A:
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        pop     es
        push    cx
        call    fn_085BB
        pop     cx
        jb      br_089B8
        dec     word ptr [A0_W_05787]
        je      br_089BA
        cmp     cl, 0f8h
        jne     loop_0894F
        jmp     loop_088D7
br_089B8:
        clc
        ret
br_089BA:
        stc
        ret
fn_089BC:
        mov     dx, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        mov     bp, word ptr [577fh]
        elseif  FW_VERSION >= 112
        mov     bp, word ptr [5763h]
        elseif  FW_VERSION >= 110
        mov     bp, word ptr [575fh]
        else
        mov     bp, word ptr [5741h]
        endif
        push    ds
        les     di, [A0_FP_EVT_WRITE_PTR]
        lds     si, [A0_FP_EVT_SCAN_PTR]
loop_089CD:
        cmp     byte ptr [si+4], 0ffh
        je      br_08A10
        mov     ax, word ptr [si]
        mov     bx, word ptr [si+2]
        mov     cx, bx
        and     bx, 0fh
        and     cl, 0f0h
        add     ax, dx
        adc     bx, bp
        and     bx, 0fh
        or      bx, cx
        stosw
        mov     ax, bx
        stosw
        mov     ax, word ptr [si+4]
        stosw
        mov     ax, word ptr [si+6]
        stosw
        or      di, di
        jne     br_08A00
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_08A00:
        add     si, 8
        or      si, si
        jne     loop_089CD
        mov     ax, ds
        add     ax, 1000h
        mov     ds, ax
        jmp     loop_089CD
br_08A10:
        mov     bp, ds
        pop     ds
        mov     word ptr [A0_FP_EVT_SCAN_PTR], si
        if      FW_VERSION >= 114
        mov     word ptr [4336h], bp
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], bp
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], bp
        else
        mov     word ptr [42f8h], bp
        endif
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        ret
fn_08A24:
        push    ds
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ax, 0f800h
        mov     ds, ax
        mov     bx, 0
loop_08A31:
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 1
        je      br_08A7D
        test    byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        jne     br_08A7D
        mov     al, byte ptr [bx+5c0h]
        mov     ah, byte ptr [bx+580h]
        mov     cl, byte ptr [bx+600h]
        mov     ch, byte ptr [bx+640h]
        mov     dl, byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS]
        mov     byte ptr es:[bx+5c0h], al
        mov     byte ptr es:[bx+580h], ah
        mov     byte ptr es:[bx+600h], cl
        mov     byte ptr es:[bx+640h], ch
        mov     byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], dl
        mov     si, bx
        shl     si, 4
        add     si, 180h
        mov     di, si
        mov     cx, 10h
        rep movsb
br_08A7D:
        inc     bl
        cmp     bl, 40h
        jne     loop_08A31
        pop     ds
        ret
fn_08A86:
        mov     di, word ptr [A0_W_0574F]
        mov     dx, di
        shl     di, 2
        add     di, 1500h
        mov     bp, di
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     cx, word ptr [A0_W_0574D]
        sub     cx, word ptr [A0_W_0574B]
        inc     cx
        mov     ax, word ptr [A0_W_05781]
        mov     dx, word ptr [A0_W_05767]
        mov     si, word ptr [A0_W_0574B]
        shl     si, 2
        add     si, 1500h
        mov     bx, word ptr [A0_W_EDIT_COPIES]
loop_08AB8:
        push    bx
        push    cx
        push    si
        push    ds
        mov     bx, 0f800h
        mov     ds, bx
tgt_08AC1:
        push    ax
        push    dx
        add     ax, word ptr [si]
        adc     dl, byte ptr [si+2]
        mov     dh, byte ptr [si+3]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        add     si, 4
        add     di, 4
        pop     dx
        pop     ax
        loop    tgt_08AC1
        pop     ds
        pop     si
        pop     cx
        pop     bx
        add     ax, word ptr [A0_W_0575D]
        adc     dx, word ptr [A0_W_0575F]
        dec     bx
        jne     loop_08AB8
        mov     ax, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        mov     dx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        mov     dx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        mov     dx, word ptr [575fh]
        else
        mov     dx, word ptr [5741h]
        endif
        mov     si, bp
        mov     bp, word ptr [A0_W_0574F]
        push    ds
        mov     bx, 0f000h
        mov     ds, bx
        mov     cx, word ptr [1ah]
        sub     cx, bp
        inc     cx
tgt_08B05:
        push    ax
        push    dx
        add     ax, word ptr [si]
        adc     dl, byte ptr [si+2]
        adc     dh, byte ptr [si+3]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], dx
        add     si, 4
        add     di, 4
        pop     dx
        pop     ax
        loop    tgt_08B05
        pop     ds
        ret
fn_08B22:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     di, 700h
        mov     cx, 700h
        sub     ax, ax
        rep stosw
        mov     ax, word ptr es:[14h]
        mov     word ptr [A0_W_05773], ax
        mov     word ptr es:[14h], 0
        mov     word ptr [A0_W_05775], 0
        mov     word ptr [A0_W_0576D], 700h
        mov     ax, word ptr [A0_W_SEQ_SEGMENT]
        mov     word ptr [A0_W_0576F], ax
        call    fn_08B99
        mov     word ptr [A0_W_05761], 0
        if      FW_VERSION >= 114
        mov     word ptr [577fh], 0
        elseif  FW_VERSION >= 112
        mov     word ptr [5763h], 0
        elseif  FW_VERSION >= 110
        mov     word ptr [575fh], 0
        else
        mov     word ptr [5741h], 0
        endif
        mov     cx, word ptr [A0_W_EDIT_COPIES]
tgt_08B63:
        push    cx
        call    fn_08BDA
        pop     cx
        jb      br_08B7E
        mov     ax, word ptr [A0_W_0575D]
        mov     dx, word ptr [A0_W_0575F]
        add     word ptr [A0_W_05761], ax
        if      FW_VERSION >= 114
        adc     word ptr [577fh], dx
        elseif  FW_VERSION >= 112
        adc     word ptr [5763h], dx
        elseif  FW_VERSION >= 110
        adc     word ptr [575fh], dx
        else
        adc     word ptr [5741h], dx
        endif
        loop    tgt_08B63
        call    fn_08C72
br_08B7E:
        les     di, [A0_W_0576D]
        mov     word ptr es:[di], 3e8h
        mov     ax, word ptr es:[1ch]
        mov     bx, word ptr es:[1eh]
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], bx
        ret
fn_08B99:
        mov     dx, 0f000h
        mov     si, 700h
loop_08B9F:
        mov     es, dx
        mov     word ptr [P_578D], si
        mov     ax, word ptr es:[si+2]
        mov     bx, word ptr es:[si+4]
        sub     ax, word ptr [A0_W_05751]
        sbb     bx, word ptr [A0_W_05753]
        jb      br_08BB8
        ret
br_08BB8:
        les     di, [A0_W_0576D]
        inc     word ptr es:[14h]
        push    ds
        mov     ds, dx
        mov     ax, word ptr [si]
        mov     cx, 0eh
        rep movsb
        pop     ds
        mov     word ptr [A0_W_05775], ax
        mov     word ptr [A0_W_0576D], di
        dec     word ptr [A0_W_05773]
        jne     loop_08B9F
        ret
fn_08BDA:
        cmp     word ptr es:[14h], 0ffh
        stc
        jne     br_08BE5
        ret
br_08BE5:
        mov     dx, 0f800h
        mov     es, dx
        mov     si, 6f2h
loop_08BED:
        add     si, 0eh
        mov     ax, word ptr es:[si+2]
        mov     bx, word ptr es:[si+4]
        sub     ax, word ptr [A0_W_EDIT_RANGE_START_LO]
        sbb     bx, word ptr [A0_W_EDIT_RANGE_START_HI]
        jb      loop_08BED
        or      ax, bx
        je      loop_08C09
        call    fn_08CE4
loop_08C09:
        mov     es, dx
        mov     ax, word ptr es:[si+2]
        mov     bx, word ptr es:[si+4]
        sub     ax, word ptr [A0_W_05759]
        sbb     bx, word ptr [A0_W_0575B]
        jb      br_08C1E
        ret
br_08C1E:
        les     di, [A0_W_0576D]
        push    ds
        mov     ds, dx
        mov     ax, word ptr [si+2]
        mov     bx, word ptr [si+4]
        mov     cx, word ptr [si]
        pop     ds
        cmp     cx, word ptr [A0_W_05775]
        je      br_08C6D
        mov     word ptr [A0_W_05775], cx
        mov     word ptr es:[di], cx
        add     ax, word ptr [A0_W_05781]
        adc     bx, word ptr [A0_W_05767]
        add     ax, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        adc     bx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        adc     bx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        adc     bx, word ptr [575fh]
        else
        adc     bx, word ptr [5741h]
        endif
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], bx
        add     di, 0eh
        add     si, 0eh
        mov     word ptr [A0_W_0576D], di
        inc     word ptr es:[14h]
        cmp     word ptr es:[14h], 0ffh
        jne     loop_08C09
        stc
        ret
br_08C6D:
        add     si, 0eh
        jmp     loop_08C09
fn_08C72:
        cmp     word ptr es:[14h], 0ffh
        stc
        jne     L_08B51
        ret
L_08B51:
        mov     si, word ptr [P_578D]
loop_08C81:
        cmp     word ptr [A0_W_05773], 0
        jne     br_08C89
        ret
br_08C89:
        les     di, [A0_W_0576D]
        cmp     word ptr es:[14h], 0ffh
        jne     br_08C97
        ret
br_08C97:
        mov     ax, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        mov     bx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        mov     bx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        mov     bx, word ptr [575fh]
        else
        mov     bx, word ptr [5741h]
        endif
        push    ds
        mov     dx, 0f000h
        mov     ds, dx
        add     ax, word ptr [si+2]
        adc     bx, word ptr [si+4]
        mov     cx, word ptr [si]
        pop     ds
        cmp     cx, word ptr [A0_W_05775]
        je      br_08CD9
        mov     word ptr [A0_W_05775], cx
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], bx
        mov     word ptr es:[di], cx
        inc     word ptr es:[14h]
        add     di, 0eh
        mov     word ptr [A0_W_0576D], di
        cmp     word ptr es:[14h], 0ffh
        stc
        jne     br_08CD9
        ret
br_08CD9:
        add     si, 0eh
        dec     word ptr [A0_W_05773]
        jne     loop_08C81
        clc
        ret
fn_08CE4:
        les     di, [A0_W_0576D]
        cmp     di, 700h
        je      br_08CEF
        ret
br_08CEF:
        mov     word ptr es:[di], 3e8h
        mov     word ptr es:[di+2], 0
        mov     word ptr es:[di+4], 0
        inc     word ptr es:[14h]
        add     word ptr [A0_W_0576D], 0eh
        ret
isr_08D0B:
        push    ds
        push    bp
        mov     bp, RAM_SEG
        mov     ds, bp
        pop     bp
        mov     byte ptr [A0_B_05783], al
        and     byte ptr [A0_B_05783], 7fh
        and     al, 80h
        mov     byte ptr [P_57A1], al
        mov     byte ptr [A0_B_057A0], ah
        mov     byte ptr [A0_B_05781], cl
        mov     byte ptr [A0_B_05782], ch
        mov     word ptr [A0_W_EDIT_COPIES], si
        pusha
        mov     ax, bp
        mov     cl, bh
        mov     ch, 0
        mov     bh, 0
        call    fn_08E20
        mov     word ptr [A0_W_EDIT_RANGE_START_LO], ax
        mov     word ptr [A0_W_EDIT_RANGE_START_HI], dx
        popa
        mov     ax, di
        mov     bl, dl
        mov     cl, dh
        mov     bh, 0
        mov     ch, 0
        call    fn_08E20
        mov     word ptr [A0_W_05759], ax
        mov     word ptr [A0_W_0575B], dx
        sub     ax, word ptr [A0_W_EDIT_RANGE_START_LO]
        sbb     dx, word ptr [A0_W_EDIT_RANGE_START_HI]
        mov     word ptr [A0_W_0575D], ax
        mov     word ptr [A0_W_0575F], dx
        mov     ax, word ptr [A0_W_SEQ_TICK_LO]
        mov     dx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [A0_W_05751], ax
        mov     word ptr [A0_W_05753], dx
        sub     ax, word ptr [A0_W_EDIT_RANGE_START_LO]
        sbb     dx, word ptr [A0_W_EDIT_RANGE_START_HI]
        mov     word ptr [A0_W_05781], ax
        mov     word ptr [A0_W_05767], dx
        les     si, [A0_FP_EVT_SCAN_PTR]
        mov     ax, es
        shl     ax, 1
        shr     si, 3
        add     ax, si
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     bx, es
        shl     bx, 1
        shr     si, 3
        add     bx, si
        sub     ax, bx
        jae     isr_08DA5
        jmp     isr_0889D
isr_08DA5:
        sub     ax, 64h
        jb      isr_08E14
        mov     word ptr [A0_W_05787], ax
        mov     word ptr [A0_W_05761], 0
        if      FW_VERSION >= 114
        mov     word ptr [577fh], 0
        elseif  FW_VERSION >= 112
        mov     word ptr [5763h], 0
        elseif  FW_VERSION >= 110
        mov     word ptr [575fh], 0
        else
        mov     word ptr [5741h], 0
        endif
        mov     word ptr [A0_W_0576D], 0
        mov     word ptr [A0_W_0576F], 3800h
        mov     ax, word ptr [A0_W_0575D]
        mov     bx, word ptr [A0_W_0575F]
        add     ax, word ptr [A0_W_SEQ_TICK_LO]
        adc     bx, word ptr [A0_W_SEQ_TICK_HI]
        mov     word ptr [P_5799], ax
        mov     word ptr [P_579B], bx
        call    fn_08E4F
        jae     L_08CB7
        jmp     isr_0889D
L_08CB7:
        mov     cx, word ptr [A0_W_EDIT_COPIES]
isr_08DE7:
        push    cx
        call    fn_08FAA
        pop     cx
        jb      isr_08E14
        mov     ax, word ptr [A0_W_0575D]
        mov     dx, word ptr [A0_W_0575F]
        add     word ptr [A0_W_05761], ax
        if      FW_VERSION >= 114
        adc     word ptr [577fh], dx
        elseif  FW_VERSION >= 112
        adc     word ptr [5763h], dx
        elseif  FW_VERSION >= 110
        adc     word ptr [575fh], dx
        else
        adc     word ptr [5741h], dx
        endif
        loop    isr_08DE7
        call    fn_090F4
        call    fn_09158
        int     0dfh
        mov     word ptr [A0_W_SEQ_TICK_LO], 0
        mov     word ptr [A0_W_SEQ_TICK_HI], 0
        clc
isr_08E14:
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_08E20:
        mov     bp, 0f800h
        mov     es, bp
        cmp     ax, word ptr es:[1ah]
        jb      br_08E34
        mov     ax, word ptr es:[1ah]
        sub     bx, bx
        sub     cx, cx
br_08E34:
        mov     si, ax
        shl     si, 2
        add     si, 1500h
        mov     al, byte ptr es:[si+3]
        mul     bl
        add     ax, cx
        sub     dx, dx
        add     ax, word ptr es:[si]
        adc     dl, byte ptr es:[si+2]
        ret
fn_08E4F:
        mov     ax, word ptr [A0_W_EDIT_RANGE_START_LO]
        mov     dx, word ptr [A0_W_EDIT_RANGE_START_HI]
        call    fn_086C7
        mov     bp, A0_W_0571C
        mov     es, word ptr ds:[bp+4]
        mov     si, word ptr ds:[bp+6]
loop_08E64:
        cmp     byte ptr es:[si+4], 0ffh
        jne     br_08E6E
        jmp     br_08F9C
br_08E6E:
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     cx, bx
        and     bx, 0fh
        and     ch, 3fh
        sub     ax, word ptr [A0_W_05759]
        sbb     bx, word ptr [A0_W_0575B]
        jb      br_08E8A
        jmp     br_08F9C
br_08E8A:
        cmp     ch, byte ptr [A0_B_05783]
        je      br_08E93
        jmp     br_08F78
br_08E93:
        mov     al, byte ptr es:[si+4]
        cmp     al, 80h
        jae     br_08EAD
        cmp     al, byte ptr [A0_B_05781]
        jae     br_08EA4
        jmp     br_08F78
br_08EA4:
        cmp     al, byte ptr [A0_B_05782]
        jbe     br_08EAD
        jmp     br_08F78
br_08EAD:
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     cx, bx
        and     bx, 0fh
        and     cx, 0c0f0h
        add     ax, word ptr [A0_W_05781]
        adc     bx, word ptr [A0_W_05767]
        or      ch, byte ptr [A0_B_057A0]
        or      bx, cx
        mov     cx, word ptr es:[si+4]
        mov     dx, word ptr es:[si+6]
        push    es
        les     di, [A0_W_0576D]
        stosw
        mov     ax, bx
        stosw
        mov     ax, cx
        stosw
        mov     ax, dx
        stosw
        cmp     di, 0
        jne     br_08EEE
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_08EEE:
        mov     word ptr [A0_W_0576D], di
        mov     word ptr [A0_W_0576F], es
        pop     es
        push    cx
        call    fn_085BB
        pop     cx
        jae     br_08F01
        jmp     br_08F9C
br_08F01:
        cmp     word ptr [A0_W_0576F], 7800h
        stc
        jne     br_08F0B
        ret
br_08F0B:
        cmp     cl, 0f0h
        je      loop_08F13
        jmp     NEAR loop_08E64
loop_08F13:
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     cx, word ptr es:[si+4]
        push    cx
        cmp     cl, 0f8h
        jne     br_08F39
        mov     dx, bx
        and     bx, 0fh
        and     dl, 0f0h
        add     ax, word ptr [A0_W_05781]
        adc     bx, word ptr [A0_W_05767]
        and     bx, 0fh
        or      bx, dx
br_08F39:
        mov     dx, word ptr es:[si+6]
        push    es
        les     di, [A0_W_0576D]
        stosw
        mov     ax, bx
        stosw
        mov     ax, cx
        stosw
        mov     ax, dx
        stosw
        or      di, di
        jne     br_08F57
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_08F57:
        mov     word ptr [A0_W_0576D], di
        mov     word ptr [A0_W_0576F], es
        pop     es
        call    fn_085BB
        pop     cx
        jb      br_08F9C
        cmp     word ptr [A0_W_0576F], 7800h
        stc
        jne     br_08F70
        ret
br_08F70:
        cmp     cl, 0f8h
        jne     loop_08F13
        jmp     loop_08E64
br_08F78:
        mov     al, byte ptr es:[si+4]
        push    ax
        call    fn_085BB
        pop     ax
        jb      br_08F9C
        cmp     al, 0f0h
        je      loop_08F8A
        jmp     loop_08E64
loop_08F8A:
        mov     al, byte ptr es:[si+4]
        push    ax
        call    fn_085BB
        pop     ax
        jb      br_08F9C
        cmp     al, 0f8h
        jne     loop_08F8A
        jmp     loop_08E64
br_08F9C:
        mov     ax, 0ffffh
        mov     cx, 4
        les     di, [A0_W_0576D]
        rep stosw
        clc
        ret
fn_08FAA:
        mov     word ptr [A0_W_05795], 0
        mov     word ptr [A0_W_05797], 3800h
loop_08FB6:
        les     si, [A0_W_05795]
        cmp     byte ptr es:[si+4], 0ffh
        je      br_09006
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        and     bx, 0fh
        add     ax, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        adc     bx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        adc     bx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        adc     bx, word ptr [575fh]
        else
        adc     bx, word ptr [5741h]
        endif
        les     si, [A0_FP_EVT_SCAN_PTR]
        cmp     byte ptr es:[si+4], 0ffh
        je      br_09030
        mov     cx, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        and     dx, 3f0fh
        sub     ax, cx
        sbb     bl, dl
        jb      br_09030
loop_08FEF:
        cmp     byte ptr [P_57A1], 0
        je      br_08FFB
loop_08FF6:
        call    fn_06B98
        jmp     loop_08FB6
br_08FFB:
        cmp     dh, byte ptr [A0_B_057A0]
        jne     loop_08FF6
        call    fn_06BF9
        jmp     loop_08FB6
br_09006:
        les     si, [A0_FP_EVT_SCAN_PTR]
        cmp     byte ptr es:[si+4], 0ffh
        je      br_0902E
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        and     bx, 0fh
        sub     ax, word ptr [P_5799]
        sbb     bx, word ptr [P_579B]
        jae     br_0902E
        mov     dh, byte ptr es:[si+3]
        and     dh, 3fh
        jmp     loop_08FEF
br_0902E:
        clc
        ret
br_09030:
        call    fn_0904E
        jae     br_09036
        ret
br_09036:
        cmp     cl, 0f0h
        jne     br_09043
loop_0903B:
        call    fn_090AB
        cmp     cl, 0f8h
        jne     loop_0903B
br_09043:
        dec     word ptr [A0_W_05787]
        je      br_0904C
        jmp     loop_08FB6
br_0904C:
        stc
        ret
fn_0904E:
        push    ds
        mov     cx, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        mov     dx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        mov     dx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        mov     dx, word ptr [575fh]
        else
        mov     dx, word ptr [5741h]
        endif
        les     di, [A0_FP_EVT_WRITE_PTR]
        lds     si, [A0_W_05795]
        mov     ax, word ptr [si]
        mov     bx, word ptr [si+2]
        mov     dh, bl
        and     bl, 0fh
        and     dh, 0f0h
        add     ax, cx
        adc     bl, dl
        or      bl, dh
        mov     cx, word ptr [si+4]
        mov     dx, word ptr [si+6]
        stosw
        mov     ax, bx
        stosw
        mov     ax, cx
        stosw
        mov     ax, dx
        stosw
        mov     dx, ds
        pop     ds
        add     si, 8
        mov     word ptr [A0_W_05795], si
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        or      si, si
        jne     br_0909C
        add     dx, 1000h
        mov     word ptr [A0_W_05797], dx
br_0909C:
        or      di, di
        jne     br_090AA
        mov     bx, es
        add     bx, 1000h
        mov     word ptr [A0_W_EVT_WRITE_SEG], bx
br_090AA:
        ret
fn_090AB:
        les     si, [A0_W_05795]
        mov     cl, byte ptr es:[si+4]
        cmp     cl, 0f8h
        jne     br_090BE
        call    fn_0904E
        mov     cl, 0f8h
        ret
br_090BE:
        push    ds
        les     di, [A0_FP_EVT_WRITE_PTR]
        lds     si, [A0_W_05795]
        mov     cx, 4
        rep movsw
        mov     cx, ds
        pop     ds
        mov     word ptr [A0_W_05795], si
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        or      si, si
        jne     br_090E3
        add     cx, 1000h
        mov     word ptr [A0_W_05797], cx
br_090E3:
        or      di, di
        jne     br_090F1
        mov     bx, es
        add     bx, 1000h
        mov     word ptr [A0_W_EVT_WRITE_SEG], bx
br_090F1:
        mov     cl, 0
        ret
fn_090F4:
        mov     al, byte ptr [A0_B_05783]
        mov     ah, 0
        mov     si, ax
        mov     bl, byte ptr [A0_B_057A0]
        mov     bh, 0
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        test    byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        je      br_0910E
        ret
br_0910E:
        push    ds
        mov     ax, 0f800h
        mov     ds, ax
        mov     al, byte ptr [si+5c0h]
        mov     ah, byte ptr [si+580h]
        mov     cl, byte ptr [si+600h]
        mov     ch, byte ptr [si+640h]
        mov     dl, byte ptr [si+A0_TBL_SEQ_TRK_FLAGS]
        mov     byte ptr es:[bx+5c0h], al
        mov     byte ptr es:[bx+580h], ah
        mov     byte ptr es:[bx+600h], cl
        mov     byte ptr es:[bx+640h], ch
        mov     byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], dl
        mov     di, bx
        shl     si, 4
        shl     di, 4
        add     si, 180h
        add     di, 180h
        mov     cx, 10h
        rep movsb
        pop     ds
        ret
fn_09158:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr [A0_W_05751]
        mov     cx, word ptr [A0_W_05753]
        add     bx, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        adc     cx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        adc     cx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        adc     cx, word ptr [575fh]
        else
        adc     cx, word ptr [5741h]
        endif
        mov     word ptr [A0_W_05761], bx
        if      FW_VERSION >= 114
        mov     word ptr [577fh], cx
        elseif  FW_VERSION >= 112
        mov     word ptr [5763h], cx
        elseif  FW_VERSION >= 110
        mov     word ptr [575fh], cx
        else
        mov     word ptr [5741h], cx
        endif
        mov     ax, word ptr es:[1ch]
        mov     dx, word ptr es:[1eh]
        sub     ax, bx
        sbb     dx, cx
        jb      br_09184
        ret
br_09184:
        mov     si, word ptr es:[1ah]
        cmp     si, 3e7h
        jne     br_09190
        ret
br_09190:
        mov     cx, si
        shl     si, 2
        add     si, 1500h
        mov     ax, word ptr es:[si]
        mov     dx, word ptr es:[si+2]
        mov     bx, ax
        sub     bx, word ptr es:[si-4]
loop_091A6:
        add     ax, bx
        adc     dl, 0
        add     si, 4
        mov     word ptr es:[si], ax
        mov     word ptr es:[si+2], dx
        inc     cx
        cmp     cx, 3e7h
        je      br_091CC
        push    ax
        push    dx
        mov     dh, 0
        sub     ax, word ptr [A0_W_05761]
        if      FW_VERSION >= 114
        sbb     dx, word ptr [577fh]
        elseif  FW_VERSION >= 112
        sbb     dx, word ptr [5763h]
        elseif  FW_VERSION >= 110
        sbb     dx, word ptr [575fh]
        else
        sbb     dx, word ptr [5741h]
        endif
        pop     dx
        pop     ax
        jb      loop_091A6
br_091CC:
        and     dx, 0fh
        mov     word ptr es:[1ah], cx
        mov     word ptr es:[1ch], ax
        mov     word ptr es:[1eh], dx
        if      FW_VERSION >= 110
        push    dx
        endif
        mov     cx, ax
        mov     ax, word ptr es:[14h]
        mov     si, 0eh
        mul     si
        mov     si, ax
        add     si, 700h
        if      FW_VERSION >= 110
        pop     dx
        endif
        mov     word ptr es:[si+2], cx
        mov     word ptr es:[si+4], dx
        ret
isr_091F9:
        sti
        push    ds
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_0920F
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
fn_0920F:
        les     si, [50h]
        mov     al, byte ptr es:[si+78h]
        mov     byte ptr [A0_B_057A0], al
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     word ptr [A0_W_EDIT_COPIES], cx
        mov     ax, word ptr es:[1ch]
        mov     bx, word ptr es:[1eh]
        mov     word ptr [A0_W_05781], ax
        mov     word ptr [A0_W_05767], bx
        mov     word ptr [A0_W_05761], 0
        if      FW_VERSION >= 114
        mov     word ptr [577fh], 0
        elseif  FW_VERSION >= 112
        mov     word ptr [5763h], 0
        elseif  FW_VERSION >= 110
        mov     word ptr [575fh], 0
        else
        mov     word ptr [5741h], 0
        endif
        cmp     word ptr es:[14h], 0
        jne     br_0924C
        mov     word ptr [A0_W_05775], 0
br_0924C:
        call    fn_094F4
        les     si, [A0_FP_EVT_SCAN_PTR]
        mov     ax, es
        shl     ax, 1
        shr     si, 3
        add     ax, si
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     bx, es
        shl     bx, 1
        shr     si, 3
        add     bx, si
        sub     ax, bx
        jae     br_0926E
        ret
br_0926E:
        sub     ax, 64h
        jae     br_09274
        ret
br_09274:
        mov     word ptr [A0_W_05787], ax
        mov     cx, word ptr [A0_W_EDIT_COPIES]
        if      FW_VERSION < 114
L_0914F:
        endif
        push    cx
        call    fn_09543
        call    fn_092CD
        pop     cx
        jae     br_09286
        ret
br_09286:
        push    cx
        call    fn_09414
        call    fn_0946D
        mov     ax, 0f800h
        mov     es, ax
        mov     ax, word ptr es:[1ch]
        mov     bx, word ptr es:[1eh]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        add     word ptr es:[1ch], ax
        adc     word ptr es:[1eh], bx
        add     word ptr [A0_W_05781], ax
        adc     word ptr [A0_W_05767], bx
        mov     ax, word ptr es:[1ch]
        mov     bx, word ptr es:[1eh]
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], bx
        mov     word ptr es:[di], 3e8h
        pop     cx
        if      FW_VERSION < 114
        loop    L_0914F
        endif
        call    fn_01BFE
        clc
        ret
fn_092CD:
        mov     bp, A0_W_0571C
        mov     si, word ptr ds:[bp+6]
        mov     es, word ptr ds:[bp+4]
loop_092D8:
        cmp     byte ptr es:[si+4], 0ffh
        jne     br_092E2
        jmp     br_09410
br_092E2:
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     cx, bx
        and     bx, 0fh
        and     cl, 0f0h
        add     ax, word ptr [A0_W_05781]
        adc     bx, word ptr [A0_W_05767]
        and     bx, 0fh
        or      bx, cx
        mov     cx, word ptr es:[si+4]
        cmp     byte ptr [A0_B_057A0], 0
        je      br_09373
        cmp     byte ptr [A0_B_057A0], 1
        jne     br_0933F
        push    bx
        push    es
        mov     bl, bh
        and     bx, 3fh
        mov     dx, 0f800h
        mov     es, dx
        test    byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 2
        pop     es
        pop     bx
        if      FW_VERSION >= 114
        jne     br_09373
loop_09326:
        push    cx
        call    fn_085BB
        pop     cx
        cmp     cl, 0f0h
        jne     loop_092D8
loop_09330:
        call    fn_085BB
        cmp     byte ptr es:[si+4], 0f8h
        jne     loop_09330
        call    fn_085BB
        jmp     loop_092D8
        else
        je      br_0939A
        jmp     br_09373
        endif
br_0933F:
        push    bx
        push    es
        mov     bl, bh
        and     bx, 3fh
        mov     dx, 0f800h
        mov     es, dx
        mov     dl, byte ptr es:[bx+580h]
        mov     dh, byte ptr es:[bx+5c0h]
        test    byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 2
        pop     es
        pop     bx
        if      FW_VERSION >= 114
        je      loop_09326
        else
        je      br_0939A
        endif
        sub     dl, 1
        jae     br_0936E
        mov     dl, dh
        sub     dl, 1
        jb      br_0939A
        add     dl, 20h
br_0936E:
        and     bh, 0c0h
        or      bh, dl
br_09373:
        mov     dx, word ptr es:[si+6]
        push    es
        les     di, [A0_FP_EVT_WRITE_PTR]
        stosw
        mov     ax, bx
        stosw
        mov     ax, cx
        stosw
        mov     ax, dx
        stosw
        or      di, di
        jne     br_09391
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_09391:
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        pop     es
br_0939A:
        push    cx
        call    fn_085BB
        pop     cx
        jb      br_09410
        dec     word ptr [A0_W_05787]
        je      br_09412
        cmp     cl, 0f0h
        je      loop_093AF
        jmp     loop_092D8
loop_093AF:
        mov     ax, word ptr es:[si]
        mov     bx, word ptr es:[si+2]
        mov     cx, word ptr es:[si+4]
        cmp     cl, 0f8h
        jne     br_093D4
        mov     dx, bx
        and     bx, 0fh
        and     dl, 0f0h
        add     ax, word ptr [A0_W_05781]
        adc     bx, word ptr [A0_W_05767]
        and     bx, 0fh
        or      bx, dx
br_093D4:
        mov     dx, word ptr es:[si+6]
        push    es
        les     di, [A0_FP_EVT_WRITE_PTR]
        stosw
        mov     ax, bx
        stosw
        mov     ax, cx
        stosw
        mov     ax, dx
        stosw
        or      di, di
        jne     br_093F2
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_093F2:
        mov     word ptr [A0_FP_EVT_WRITE_PTR], di
        mov     word ptr [A0_W_EVT_WRITE_SEG], es
        pop     es
        push    cx
        call    fn_085BB
        pop     cx
        jb      br_09410
        dec     word ptr [A0_W_05787]
        je      br_09412
        cmp     cl, 0f8h
        jne     loop_093AF
        jmp     loop_092D8
br_09410:
        clc
        ret
br_09412:
        stc
        ret
fn_09414:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     di, word ptr es:[1ah]
        shl     di, 2
        add     di, 1500h
        mov     si, 1500h
        mov     ax, word ptr [A0_W_05781]
        mov     bx, word ptr [A0_W_05767]
        push    ds
        mov     dx, 0f800h
        mov     ds, dx
        mov     cx, word ptr [1ah]
        push    es
        push    cx
tgt_0943A:
        push    ax
        push    bx
        add     ax, word ptr [si]
        adc     bl, byte ptr [si+2]
        mov     bh, byte ptr [si+3]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], bx
        add     si, 4
        add     di, 4
        pop     bx
        pop     ax
        loop    tgt_0943A
        add     ax, word ptr [si]
        adc     bl, byte ptr [si+2]
        mov     bh, byte ptr [si+3]
        mov     word ptr es:[di], ax
        mov     word ptr es:[di+2], bx
        pop     cx
        pop     es
        pop     ds
        add     word ptr es:[1ah], cx
        ret
fn_0946D:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ax, word ptr es:[14h]
        cmp     ax, 0ffh
        jne     br_0947B
        ret
br_0947B:
        mov     bx, 0eh
        mul     bx
        add     ax, 700h
        mov     di, ax
        mov     si, 700h
        mov     dx, 0f800h
        mov     es, dx
        mov     cx, word ptr es:[14h]
tgt_09492:
        mov     dx, 0f800h
        mov     es, dx
        mov     dx, word ptr es:[si]
        mov     ax, word ptr [P_5793]
        mul     dx
        mov     bx, 3e8h
        cmp     dx, bx
        jb      br_094AF
        mov     dx, bx
        sub     dx, 1
        jae     br_094AF
        sub     dx, dx
br_094AF:
        div     bx
        mov     dx, ax
        cmp     dx, word ptr [A0_W_05775]
        je      br_094EE
        mov     word ptr [A0_W_05775], dx
        mov     ax, word ptr es:[si+2]
        mov     bx, word ptr es:[si+4]
        add     ax, word ptr [A0_W_05781]
        adc     bx, word ptr [A0_W_05767]
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     word ptr es:[di+2], ax
        mov     word ptr es:[di+4], bx
        mov     word ptr es:[di], dx
        add     di, 0eh
        inc     word ptr es:[14h]
        cmp     word ptr es:[14h], 0ffh
        jne     br_094EE
        ret
br_094EE:
        add     si, 0eh
        loop    tgt_09492
        ret
fn_094F4:
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr es:[16h]
        mov     dx, 0f800h
        mov     es, dx
        mov     ax, word ptr es:[16h]
        mov     cx, 3e8h
        mul     cx
        cmp     dx, bx
        jb      br_09518
        mov     dx, bx
        sub     dx, 1
        jae     br_09518
        sub     dx, dx
br_09518:
        div     bx
        mov     word ptr [P_5793], ax
        pusha
        push    es
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     bx, word ptr es:[16h]
        mul     bx
        mov     bx, 3e8h
        div     bx
        mov     dx, 0f800h
        mov     es, dx
        cmp     ax, word ptr es:[16h]
        pop     es
        popa
        jne     br_0953E
        ret
br_0953E:
        inc     word ptr [P_5793]
        ret
fn_09543:
        cmp     byte ptr [A0_B_057A0], 1
        jne     br_0954C
        if      (FW_VERSION >= 110) && (FW_VERSION < 120)
        else
        jmp     br_095BB
br_0954C:
        cmp     byte ptr [A0_B_057A0], 2
        jne     br_09556
        endif
        jmp     br_09627
        if      (FW_VERSION >= 110) && (FW_VERSION < 120)
br_0954C:
        cmp     byte ptr [A0_B_057A0], 2
        jne     br_095BB
        jmp     L_09623
br_095BB:
        push    ds
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ax, 0f800h
        mov     ds, ax
        mov     bx, 0
loop_095C8:
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 1
        je      br_0961E
        test    byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        jne     br_0961E
        mov     al, byte ptr [bx+5c0h]
        mov     ah, byte ptr [bx+580h]
        mov     cl, byte ptr [bx+600h]
        mov     ch, byte ptr [bx+640h]
        mov     dl, byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS]
        mov     byte ptr es:[bx+5c0h], al
        mov     byte ptr es:[bx+580h], ah
        mov     byte ptr es:[bx+600h], cl
        mov     byte ptr es:[bx+640h], ch
        mov     byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], dl
        mov     si, bx
        shl     si, 4
        add     si, 180h
        mov     di, si
        mov     cx, 10h
        rep movsb
br_0961E:
        call    fn_096AB
        inc     bl
        cmp     bl, 40h
        jne     loop_095C8
        pop     ds
        ret
br_09627:
        else
br_09556:
        endif
        push    ds
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ax, 0f800h
        mov     ds, ax
        mov     bx, 0
loop_09563:
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 1
        je      br_095AF
        if      (FW_VERSION >= 110) && (FW_VERSION < 120)
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 2
        je      L_0961A
        endif
        test    byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        jne     br_095AF
        mov     al, byte ptr [bx+5c0h]
        mov     ah, byte ptr [bx+580h]
        mov     cl, byte ptr [bx+600h]
        mov     ch, byte ptr [bx+640h]
        mov     dl, byte ptr [bx+680h]
        mov     byte ptr es:[bx+5c0h], al
        mov     byte ptr es:[bx+580h], ah
        mov     byte ptr es:[bx+600h], cl
        mov     byte ptr es:[bx+640h], ch
        mov     byte ptr es:[bx+680h], dl
        mov     si, bx
        shl     si, 4
        add     si, 180h
        mov     di, si
        mov     cx, 10h
        rep movsb
br_095AF:
        call    fn_096AB
L_0961A:
        inc     bl
        cmp     bl, 40h
        jne     loop_09563
        pop     ds
        ret
        if      FW_VERSION >= 110
L_09623:
        else
br_095BB:
        push    ds
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ax, 0f800h
        mov     ds, ax
        mov     bx, 0
loop_095C8:
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 1
        je      br_0961B
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 2
        je      br_0961E
        test    byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        jne     br_0961B
        mov     al, byte ptr [bx+5c0h]
        mov     ah, byte ptr [bx+580h]
        mov     cl, byte ptr [bx+600h]
        mov     ch, byte ptr [bx+640h]
        mov     dl, byte ptr [bx+680h]
        mov     byte ptr es:[bx+5c0h], al
        mov     byte ptr es:[bx+580h], ah
        mov     byte ptr es:[bx+600h], cl
        mov     byte ptr es:[bx+640h], ch
        mov     byte ptr es:[bx+680h], dl
        mov     si, bx
        shl     si, 4
        add     si, 180h
        mov     di, si
        mov     cx, 10h
        rep movsb
br_0961B:
        call    fn_096AB
br_0961E:
        inc     bl
        cmp     bl, 40h
        jne     loop_095C8
        pop     ds
        ret
br_09627:
        endif
        if      FW_VERSION >= 120
br_095BB:
        push    ds
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ax, 0f800h
        mov     ds, ax
        mov     bx, 0
loop_095C8:
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 1
        je      br_0961B
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 2
        je      br_0961E
        test    byte ptr es:[bx+A0_TBL_SEQ_TRK_FLAGS], 1
        jne     br_0961B
        mov     al, byte ptr [bx+5c0h]
        mov     ah, byte ptr [bx+580h]
        mov     cl, byte ptr [bx+600h]
        mov     ch, byte ptr [bx+640h]
        mov     dl, byte ptr [bx+680h]
        mov     byte ptr es:[bx+5c0h], al
        mov     byte ptr es:[bx+580h], ah
        mov     byte ptr es:[bx+600h], cl
        mov     byte ptr es:[bx+640h], ch
        mov     byte ptr es:[bx+680h], dl
        mov     si, bx
        shl     si, 4
        add     si, 180h
        mov     di, si
        mov     cx, 10h
        rep movsb
br_0961B:
        call    fn_096AB
br_0961E:
        inc     bl
        cmp     bl, 40h
        jne     loop_095C8
        pop     ds
        ret
br_09627:
        endif
        push    ds
        mov     es, word ptr [A0_W_SEQ_SEGMENT]
        mov     ax, 0f800h
        mov     ds, ax
        mov     bx, 0
loop_09634:
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 1
        je      br_096A2
        test    byte ptr [bx+A0_TBL_SEQ_TRK_FLAGS], 2
        je      br_096A2
        mov     al, byte ptr [bx+580h]
        sub     al, 1
        jae     br_09654
        mov     al, byte ptr [bx+5c0h]
        sub     al, 1
        jb      br_096A2
        add     al, 20h
br_09654:
        mov     ah, 0
        mov     si, ax
        test    byte ptr es:[si+A0_TBL_SEQ_TRK_FLAGS], 1
        jne     L_0969B
        mov     al, byte ptr [bx+5c0h]
        mov     ah, byte ptr [bx+580h]
        mov     cl, byte ptr [bx+600h]
        mov     ch, byte ptr [bx+640h]
        mov     dl, byte ptr [bx+680h]
        mov     byte ptr es:[si+5c0h], al
        mov     byte ptr es:[si+580h], ah
        mov     byte ptr es:[si+600h], cl
        mov     byte ptr es:[si+640h], ch
        mov     byte ptr es:[si+680h], dl
        push    si
        mov     si, bx
        shl     si, 4
        add     si, 180h
        mov     di, si
        mov     cx, 10h
        rep movsb
        pop     si
L_0969B:
        call    fn_096F4
br_096A2:
        inc     bl
        cmp     bl, 40h
        jne     loop_09634
        pop     ds
        ret
fn_096AB:
        mov     al, byte ptr [bx+600h]
        cmp     al, byte ptr es:[bx+600h]
        jne     br_096B7
        ret
br_096B7:
        cmp     al, 0
        jne     br_096BC
        ret
br_096BC:
        dec     al
        pusha
        push    es
        mov     cl, al
        les     di, ss:[A0_FP_EVT_WRITE_PTR]
        mov     ax, word ptr es:[1ch]
        stosw
        mov     ax, word ptr es:[1eh]
        mov     ah, bl
        stosw
        mov     al, 0c0h
        mov     ah, cl
        stosw
        mov     ax, 0
        stosw
        or      di, di
        jne     br_096E7
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_096E7:
        mov     word ptr ss:[A0_FP_EVT_WRITE_PTR], di
        mov     word ptr ss:[A0_W_EVT_WRITE_SEG], es
        pop     es
        popa
        ret
fn_096F4:
        mov     al, byte ptr [bx+600h]
        cmp     al, byte ptr es:[si+600h]
        jne     br_09700
        ret
br_09700:
        cmp     al, 0
        jne     br_09705
        ret
br_09705:
        dec     al
        pusha
        push    es
        mov     cl, al
        les     di, ss:[A0_FP_EVT_WRITE_PTR]
        mov     ax, word ptr es:[1ch]
        stosw
        mov     dx, si
        mov     ax, word ptr es:[1eh]
        mov     ah, dl
        stosw
        mov     al, 0c0h
        mov     ah, cl
        stosw
        mov     ax, 0
        stosw
        or      di, di
        jne     br_09732
        mov     ax, es
        add     ax, 1000h
        mov     es, ax
br_09732:
        mov     word ptr ss:[A0_FP_EVT_WRITE_PTR], di
        mov     word ptr ss:[A0_W_EVT_WRITE_SEG], es
        pop     es
        popa
        ret
        if      (FW_VERSION >= 110) && (FW_VERSION <> 112)
        db      00h
        endif
XL_EXCMON_FLAG:
        db      00h
xl_exception_monitor:
        mov     byte ptr cs:[XL_EXCMON_FLAG], 0
        jmp     isr_09751
isr_09749:
        mov     byte ptr cs:[XL_EXCMON_FLAG], 1
        jmp     isr_09751
isr_09751:
        pusha
        push    ds
        push    es
        push    sp
        push    ss
        push    es
        push    ds
        push    di
        push    si
        push    bp
        push    dx
        push    cx
        push    bx
        push    ax
        mov     ax, RAM_SEG
        mov     ds, ax
        cmp     byte ptr cs:[XL_EXCMON_FLAG], 0
        je      isr_09789
        mov     dx, 0c012h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 3
        out     dx, al
        push    dx
        mov     dx, 0c022h
        in      al, dx
        pop     dx
        and     al, 0dfh
        mov     dx, 0c022h
        out     dx, al
        mov     byte ptr [62h], 0
isr_09789:
        sti
        DISP_PLANE      01h
        DISP_ERASE      00h, 00h, 0f8h, 3ch
        DISP_FONT       DISP_FONT_7ROW
        DISP_TEXT       00h, 00h, "AX:"
        pop     ax
        DISP_HEX16      12h, 00h
        DISP_TEXT       00h, 08h, "BX:"
        pop     ax
        DISP_HEX16      12h, 08h
        DISP_TEXT       00h, 10h, "CX:"
        pop     ax
        DISP_HEX16      12h, 10h
        DISP_TEXT       00h, 18h, "DX:"
        pop     ax
        DISP_HEX16      12h, 18h
        DISP_TEXT       00h, 20h, "BP:"
        pop     ax
        mov     word ptr [A0_W_07EEE], ax
        DISP_HEX16      12h, 20h
        DISP_TEXT       30h, 00h, "SI:"
        pop     ax
        mov     word ptr [A0_W_07EE6], ax
        DISP_HEX16      42h, 00h
        DISP_TEXT       30h, 08h, "DI:"
        pop     ax
        mov     word ptr [A0_W_07EE8], ax
        DISP_HEX16      42h, 08h
        DISP_TEXT       30h, 10h, "DS:"
        pop     ax
        mov     word ptr [A0_W_07EEC], ax
        DISP_HEX16      42h, 10h
        DISP_TEXT       30h, 18h, "ES:"
        pop     ax
        mov     word ptr [A0_W_07EEA], ax
        DISP_HEX16      42h, 18h
        DISP_TEXT       30h, 28h, "SS:"
        pop     ax
        DISP_HEX16      42h, 28h
        DISP_TEXT       00h, 30h, "SP:"
        pop     ax
        add     ax, 1eh
        DISP_HEX16      12h, 30h
        DISP_TEXT       00h, 28h, "PC:"
        mov     bp, sp
        mov     ax, word ptr [bp+14h]
        DISP_HEX16      12h, 28h
        DISP_TEXT       30h, 20h, "CS:"
        mov     bp, sp
        mov     ax, word ptr [bp+16h]
        DISP_HEX16      42h, 20h
        DISP_TEXT       60h, 00h, "DS:SI=>"
        DISP_TEXT       60h, 08h, "DS:DI=>"
        DISP_TEXT       60h, 10h, "DS:BP=>"
        DISP_TEXT       60h, 18h, "ES:SI=>"
        DISP_TEXT       60h, 20h, "ES:DI=>"
        DISP_TEXT       60h, 28h, "ES:BP=>"
        mov     es, word ptr [A0_W_07EEC]
        mov     si, word ptr [A0_W_07EE6]
        mov     ch, 0
        call    fn_09B93
        mov     si, word ptr [A0_W_07EE8]
        mov     ch, 8
        call    fn_09B93
        mov     si, word ptr [A0_W_07EEE]
        mov     ch, 10h
        call    fn_09B93
        mov     es, word ptr [A0_W_07EEA]
        mov     si, word ptr [A0_W_07EE6]
        mov     ch, 18h
        call    fn_09B93
        mov     si, word ptr [A0_W_07EE8]
        mov     ch, 20h
        call    fn_09B93
        mov     si, word ptr [A0_W_07EEE]
        mov     ch, 28h
        call    fn_09B93
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "SEQ"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "RUN"
        DISP_SOFTKEY    05h, DISP_SK_FILL,   "STEP"
        DISP_SOFTKEY    06h, DISP_SK_FILL,   "MEMORY"
        DISP_FLUSH
isr_0992D:
        int     0b9h
        cmp     ax, 6ch
        je      isr_09988
        cmp     ax, 72h
        je      isr_09965
        cmp     ax, 0ch
        je      isr_09965
        cmp     ax, 84h
        je      isr_09965
        cmp     ax, 78h
        je      isr_09959
        cmp     ax, 7eh
        je      isr_09996
        int     0bah
        or      ax, ax
        jne     isr_09959
        or      cx, cx
        jne     isr_09965
        jmp     isr_0992D
isr_09959:
        mov     bp, sp
        mov     al, byte ptr [bp+19h]
        or      al, 1
        mov     byte ptr [bp+19h], al
        jmp     isr_0996F
isr_09965:
        mov     bp, sp
        mov     al, byte ptr [bp+19h]
        and     al, 0feh
        mov     byte ptr [bp+19h], al
isr_0996F:
        DISP_PLANE      00h
        mov     dx, 0c012h
        mov     al, 0e8h
        out     dx, al
        mov     dx, 0c012h
        mov     al, 3
        out     dx, al
        mov     byte ptr [62h], 1
        pop     es
        pop     ds
        popa
        iret
isr_09988:
        mov     ax, 8000h
        mov     word ptr [A0_W_07EE2], ax
        mov     word ptr [A0_W_07EE4], 0
        jmp     isr_09996
isr_09996:
        DISP_ERASE      00h, 00h, 0f8h, 3ch
        DISP_SOFTKEY    05h, DISP_SK_FILL,   "SEQ"
        DISP_SOFTKEY    06h, DISP_SK_FILL,   "REG"
        DISP_SOFTKEY    04h, DISP_SK_FILL,   "TEMPO"
        DISP_SOFTKEY    03h, DISP_SK_FILL,   "BAR"
        DISP_SOFTKEY    02h, DISP_SK_FILL,   "EVENT"
        DISP_SOFTKEY    01h, DISP_SK_FILL,   "HEADER"
        DISP_ERASE      00h, 00h, 0f8h, 33h
        db      0e8h
        iret
        if      FW_VERSION >= 114
        add     word ptr [bp+si-0ee2h], cx
        elseif  FW_VERSION >= 112
        add     word ptr [bp+si-2ae2h], cx
        elseif  FW_VERSION >= 110
        add     word ptr [bp+si-2ee2h], cx
        else
        add     word ptr [bp+si-4ce2h], cx
        endif
        db      7eh, 0b7h
        add     byte ptr [8f8ah], ch
        if      FW_VERSION >= 114
        if      FW_VERSION >= 120
        db      77h, 9bh
        else
        db      73h, 9bh
        endif
        mov     ch, 0
        mov     al, 7
        mov     ah, 9
        mov     bl, 15h
        int     90h
        else
        if      FW_VERSION >= 112
        xor     ax, 0b59ah
        add     byte ptr [bx+si-4bf9h], dh
        or      word ptr [bp+di-32ebh], si
        nop
        else
        if      FW_VERSION >= 110
        db      0dfh
        cwd
        mov     ch, 0
        else
        lea     bx, [bx+di+0b5h]
        endif
        mov     al, 7
        mov     ah, 9
        mov     bl, 15h
        int     90h
        endif
        endif
        DISP_FLUSH
L_099FC:
        int     0b9h
        cmp     ax, 8ah
        je      tgt_09A58
        cmp     ax, 90h
        je      br_09A4B
        cmp     ax, 7eh
        je      br_09A66
        cmp     ax, 78h
        je      br_09A6C
        cmp     ax, 72h
        je      br_09A74
        cmp     ax, 6ch
        je      br_09A88
        cmp     ax, 66h
        je      br_09A9C
        cmp     ax, 60h
        jne     br_09A29
        jmp     br_09AB0
br_09A29:
        cmp     ax, 0ch
        jne     br_09A31
        jmp     isr_09965
br_09A31:
        cmp     ax, 84h
        jne     br_09A39
        jmp     isr_09965
br_09A39:
        int     0bah
        or      ax, ax
        je      br_09A42
        jmp     br_09AC4
br_09A42:
        or      cx, cx
        je      BR_09A49
        jmp     br_09B0B
BR_09A49:
        jmp     SHORT L_099FC
br_09A4B:
        cmp     byte ptr [A0_B_07EF1], 0
        je      L_099FC
        dec     byte ptr [A0_B_07EF1]
        db      0ebh, 82h
tgt_09A58:
        cmp     byte ptr [A0_B_07EF1], 7
        je      L_099FC
        inc     byte ptr [A0_B_07EF1]
        db      0e9h, 74h, 0ffh
br_09A66:
        pop     es
        pop     ds
        popa
        jmp     isr_09751
br_09A6C:
        xor     byte ptr [P_7EF0], 1
        db      0e9h, 66h, 0ffh
br_09A74:
        mov     word ptr [A0_W_07EE2], 8000h
        mov     word ptr [A0_W_07EE4], 700h
        mov     byte ptr [A0_B_07EF2], 0eh
        db      0e9h, 52h, 0ffh
br_09A88:
        mov     word ptr [A0_W_07EE2], 8000h
        mov     word ptr [A0_W_07EE4], 1500h
        mov     byte ptr [A0_B_07EF2], 8
        db      0e9h, 3eh, 0ffh
br_09A9C:
        mov     word ptr [A0_W_07EE2], 8000h
        mov     word ptr [A0_W_07EE4], 2800h
        mov     byte ptr [A0_B_07EF2], 8
        db      0e9h, 2ah, 0ffh
br_09AB0:
        mov     word ptr [A0_W_07EE2], 8000h
        mov     word ptr [A0_W_07EE4], 0
        mov     byte ptr [A0_B_07EF2], 8
        db      0e9h, 16h, 0ffh
br_09AC4:
        mov     ax, 1
        cmp     byte ptr [A0_B_07EF2], 0eh
        je      BR_09B03
        mov     bl, byte ptr [A0_B_07EF1]
        mov     si, A0_W_07EE4
        cmp     bl, 4
        jb      br_09ADD
        mov     si, A0_W_07EE2
br_09ADD:
        mov     bh, 0
        shl     bx, 1
        mov     bx, word ptr cs:[bx+TBL_HEX_PLACE_VALUES]
        mul     bx
        add     ax, word ptr [si]
        jae     BR_09AFE
        mov     bl, byte ptr [A0_B_07EF1]
        mov     bh, 0
        shl     bx, 1
        and     ax, word ptr cs:[bx+TBL_HEX_LOW_MASKS]
        or      ax, word ptr cs:[bx+TBL_HEX_HIGH_MASKS]
BR_09AFE:
        mov     word ptr [si], ax
        db      0e9h, 0d7h, 0feh
BR_09B03:
        add     word ptr [A0_W_07EE4], 0eh
        db      0e9h, 0cfh, 0feh
br_09B0B:
        mov     cx, 1
        cmp     byte ptr [A0_B_07EF2], 0eh
        je      br_09B3F
        mov     ax, cx
        mov     bl, byte ptr [A0_B_07EF1]
        mov     si, A0_W_07EE4
        cmp     bl, 4
        jb      br_09B26
        mov     si, A0_W_07EE2
br_09B26:
        mov     bh, 0
        shl     bx, 1
        mov     bx, word ptr cs:[bx+TBL_HEX_PLACE_VALUES]
        mul     bx
        mov     bx, word ptr [si]
        sub     bx, ax
        jae     L_099F8
        mov     bx, 0
L_099F8:
        mov     word ptr [si], bx
        db      0e9h, 9bh, 0feh
br_09B3F:
        sub     word ptr [A0_W_07EE4], 0eh
        db      0e9h, 93h, 0feh
TBL_HEX_PLACE_VALUES:
        db      01h, 00h, 10h, 00h, 00h, 01h, 00h, 10h, 01h, 00h, 10h, 00h, 00h
        db      01h, 00h, 10h
TBL_HEX_LOW_MASKS:
        db      00h, 00h, 0fh, 00h, 0ffh, 00h, 0ffh, 0fh, 00h, 00h, 0fh, 00h, 0ffh
        db      00h, 0ffh, 0fh
TBL_HEX_HIGH_MASKS:
        db      0ffh, 0ffh, 0f0h, 0ffh, 00h, 0ffh, 00h, 0f0h, 0ffh, 0ffh, 0f0h, 0ffh, 00h
        db      0ffh, 00h, 0f0h, 2ch, 26h, 20h, 1ah, 12h, 0ch, 06h, 00h
isr_09B7F:
        pusha
        push    ds
        push    es
        mov     ax, RAM_SEG
        mov     ds, ax
        mov     word ptr [A0_W_07EE2], dx
        mov     word ptr [A0_W_07EE4], si
        sti
        jmp     isr_09996
fn_09B93:
        mov     cl, 8ah
        mov     di, si
        mov     dl, 5
        mov     di, si
loop_09B9B:
        mov     al, byte ptr es:[si]
        mov     bl, 0bh
        int     90h
        inc     si
        add     cl, 0eh
        dec     dl
        jne     loop_09B9B
        add     cl, 1
        mov     dl, 5
        call    fn_09C60
        ret
        mov     es, word ptr [A0_W_07EE2]
        mov     si, word ptr [A0_W_07EE4]
        mov     dh, 6
        mov     ch, 1
loop_09BBF:
        push    dx
        mov     cl, 1
        mov     ax, es
        mov     bl, 0ch
        int     90h
        add     cl, 1ah
        mov     ax, si
        mov     bl, 0ch
        int     90h
        add     cl, 18h
        mov     al, 3ah
        mov     bl, 4
        int     90h
        add     cl, 6
        mov     di, si
        mov     dl, byte ptr [A0_B_07EF2]
        cmp     byte ptr [A0_B_07EF2], 0eh
        je      br_09C14
loop_09BEA:
        mov     al, byte ptr es:[si]
        mov     bl, 0bh
        int     90h
        inc     si
        add     cl, 0fh
        dec     dl
        jne     loop_09BEA
        mov     al, 3ah
        mov     bl, 4
        int     90h
        add     cl, 4
        push    es
        push    si
        push    cx
        call    fn_09C4B
        pop     cx
        pop     si
        pop     es
loop_09C0B:
        pop     dx
        add     ch, 8
        dec     dh
        jne     loop_09BBF
        ret
br_09C14:
        mov     dl, 2
        call    fn_09C27
        add     cl, 1ch
        call    fn_09C32
        call    fn_09C32
        call    fn_09C32
        jmp     loop_09C0B
fn_09C27:
        mov     ax, word ptr es:[si]
        mov     bl, 0ch
        int     90h
        add     si, 2
        ret
fn_09C32:
        mov     ax, word ptr es:[si+2]
        mov     bl, 0ch
        int     90h
        add     cl, 19h
        mov     ax, word ptr es:[si]
        mov     bl, 0ch
        int     90h
        add     si, 4
        add     cl, 1bh
        ret
fn_09C4B:
        add     cl, 1
        cmp     byte ptr [A0_B_07EF2], 0ah
        je      br_09C7C
        cmp     byte ptr [P_7EF0], 1
        je      br_09C8E
        mov     dl, byte ptr [A0_B_07EF2]
fn_09C60:
        mov     al, byte ptr es:[di]
        cmp     al, 20h
        jae     br_09C69
        mov     al, 2ah
br_09C69:
        cmp     al, 7bh
        jb      br_09C6F
        mov     al, 2ah
br_09C6F:
        mov     bl, 4
        int     90h
        inc     di
        add     cl, 8
        dec     dl
        jne     fn_09C60
        ret
br_09C7C:
        mov     ax, word ptr es:[di+2]
        mov     dx, word ptr es:[di+4]
        mov     bh, 5
        mov     bl, 8
        int     90h
        add     di, 0ah
        ret
br_09C8E:
        mov     ah, byte ptr es:[di+4]
        mov     si, STR_EVT_END
        cmp     ah, 0ffh
        je      br_09CC3
        mov     si, STR_EVT_EXC
        cmp     ah, 0f0h
        je      br_09CC3
        mov     si, STR_EVT_EOX
        cmp     ah, 0f8h
        je      br_09CC3
        mov     si, STR_EVT_NOTE
        cmp     ah, 80h
        jb      br_09CC3
        mov     si, TBL_EVT_STATUS_LABELS
        cmp     ah, 0f0h
        jb      br_09CBC
        mov     ah, 0f0h
br_09CBC:
        mov     al, ah
        and     ax, 70h
        add     si, ax
br_09CC3:
        push    ax
        push    cx
        mov     dx, cs
        mov     ah, 8
        mov     bl, 5
        int     90h
        pop     cx
        pop     ax
        add     cl, 1eh
        mov     bh, 6
        mov     ax, word ptr es:[di]
        mov     dl, byte ptr es:[di+2]
        and     dx, 0fh
        mov     bl, 8
        int     90h
        ret
d_str_evt_end:
        db      "END             "
d_str_evt_note:
        db      "NOTE            "
d_str_evt_exc:
        db      "EXC             "
d_str_evt_eox:
        db      "EOX             "
d_tbl_evt_status_labels:
        db      "80              90              PRES            CNTL            PRGM            AFTR        "
isr_09D7F:
        db      "    BEND            ????            "
isr_09DA3:
        sti
        mov     bp, RAM_SEG
        mov     ds, bp
        call    fn_09DAD
        iret
fn_09DAD:
        KEY_SAVE        A0_TBL_07EF4
        KEY_DOWN        25h, 0000h, 0000h
        KEY_DOWN        21h, keyfn_09C3B_107, 0000h
        KEY_DOWN        20h, keyfn_09C3B_107, 0000h
        KEY_DOWN        02h, L_09E20, 0000h
        KEY_WHEEL       0000h, 0000h
        KEY_DOWN        10h, keyfn_09DA3, 0000h
        KEY_DOWN        11h, keyfn_09DD6, 0000h
        KEY_DOWN        12h, keyfn_09E09, 0000h
        KEY_UP          10h, 0000h, 0000h
        KEY_UP          11h, 0000h, 0000h
        KEY_UP          12h, 0000h, 0000h
        KEY_UP          13h, 0000h, 0000h
        KEY_UP          14h, 0000h, 0000h
        KEY_UP          15h, 0000h, 0000h
        ret
L_09E20:
        KEY_RESTORE     A0_TBL_07EF4
        retf
keyfn_09C3B_107:
        DISP_CLEAR
        DISP_FONT       DISP_FONT_7ROW
        DISP_SOFTKEY    01h, DISP_SK_BOX,    "Writ"
        DISP_SOFTKEY    02h, DISP_SK_BOX,    "Read"
        DISP_SOFTKEY    03h, DISP_SK_BOX,    "Recw"
        DISP_SOFTKEY    04h, DISP_SK_BOX,    "   "
        DISP_SOFTKEY    05h, DISP_SK_BOX,    "   "
        DISP_SOFTKEY    06h, DISP_SK_BOX,    "   "
        DISP_HLINE      00h, 0ah, 0f8h
        DISP_TEXT       00h, 0ch, "PLAY:"
        DISP_TEXT       00h, 15h, "READ:"
        DISP_TEXT       00h, 1eh, "WRIT:"
        DISP_TEXT       00h, 27h, "TCW :"
        DISP_HLINE      61h, 00h, 37h
        DISP_HLINE      61h, 08h, 37h
        DISP_TEXT       01h, 01h, "CLOCK:"
        int     85h
        DISP_NUM        25h, 01h, 06h
        db      0e8h, 4eh
        db      01h
        DISP_TEXT       0aah, 01h, "T:00:  :  :  "
        mov     cl, 1eh
        mov     ch, 0ch
        les     si, [A0_FP_EVT_PLAY_PTR]
        call    fn_09EF7
        mov     ch, 15h
        les     si, [A0_FP_EVT_SCAN_PTR]
        call    fn_09EF7
        mov     ch, 1eh
        les     si, [A0_FP_EVT_WRITE_PTR]
        call    fn_09EF7
        mov     ch, 27h
        les     si, [A0_W_04324]
        call    fn_09EF7
        DISP_FLUSH
        db      0cbh
fn_09EF7:
        push    cx
        mov     ax, es
        mov     bl, 0ch
        int     90h
        add     cl, 17h
        mov     al, 3ah
        mov     bl, 4
        int     90h
        add     cl, 4
        mov     ax, si
        mov     bl, 0ch
        int     90h
        add     cl, 1eh
        push    si
        mov     bh, 8
loop_09F16:
        mov     al, byte ptr es:[si]
        inc     si
        mov     bl, 0bh
        int     90h
        add     cl, 0fh
        dec     bh
        jne     loop_09F16
        pop     si
        sub     cl, 2
        mov     ax, word ptr es:[si]
        mov     dl, byte ptr es:[si+2]
        and     dx, 0fh
        mov     bh, 7
        mov     bl, 8
        int     90h
        pop     cx
        ret
keyfn_09DA3:
        KEY_WHEEL       L_09FD4, 0000h
        KEY_UP          10h, keyfn_09D72_107, 0000h
        les     si, [A0_FP_EVT_WRITE_PTR]
        mov     word ptr [A0_W_0803A], si
        mov     word ptr [A0_W_0803C], es
        mov     word ptr [A0_W_0803E], A0_FP_EVT_WRITE_PTR
        retf
        if      FW_VERSION >= 110
L_09F5C:
        endif
keyfn_09D72_107:
        mov     ax, word ptr [A0_W_0803A]
        mov     bx, word ptr [A0_W_0803C]
        mov     word ptr [A0_FP_EVT_WRITE_PTR], ax
        mov     word ptr [A0_W_EVT_WRITE_SEG], bx
        call    fn_09DAD
        retf
keyfn_09DD6:
        KEY_WHEEL       L_09FD4, 0000h
        KEY_UP          11h, L_09F8F, 0000h
        les     si, [A0_FP_EVT_SCAN_PTR]
        mov     word ptr [A0_W_0803A], si
        mov     word ptr [A0_W_0803C], es
        mov     word ptr [A0_W_0803E], A0_FP_EVT_SCAN_PTR
        retf
L_09F8F:
        mov     ax, word ptr [A0_W_0803A]
        mov     bx, word ptr [A0_W_0803C]
        mov     word ptr [A0_FP_EVT_SCAN_PTR], ax
        if      FW_VERSION >= 114
        mov     word ptr [4336h], bx
        elseif  FW_VERSION >= 112
        mov     word ptr [431ah], bx
        elseif  FW_VERSION >= 110
        mov     word ptr [4316h], bx
        else
        mov     word ptr [42f8h], bx
        endif
        call    fn_09DAD
        retf
keyfn_09E09:
        KEY_WHEEL       L_09FF7, 0000h
        KEY_UP          12h, L_09FC2, 0000h
        if      FW_VERSION >= 112
        if      FW_VERSION >= 120
        les     si, [P_4340]
        elseif  FW_VERSION >= 114
        db      0c4h, 36h, 40h
        inc     bx
        else
        db      0c4h, 36h, 24h, 43h
        endif
        else
        les     si, [P_4340]
        endif
        mov     word ptr [A0_W_0803A], si
        mov     word ptr [A0_W_0803C], es
        if      FW_VERSION >= 114
        mov     word ptr [805ah], 4340h
        else
        mov     word ptr [A0_W_0803E], A0_W_04324
        endif
        retf
L_09FC2:
        mov     ax, word ptr [A0_W_0803A]
        mov     bx, word ptr [A0_W_0803C]
        mov     word ptr [A0_W_04324], ax
        mov     word ptr [A0_W_04326], bx
        call    fn_09DAD
        retf
L_09FD4:
        mov     si, word ptr [A0_W_0803E]
        mov     bx, word ptr [si+2]
        shl     ax, 3
        shl     cx, 3
        add     ax, word ptr [si]
        jae     br_09FE9
        add     bx, 1000h
br_09FE9:
        sub     ax, cx
        jae     br_09FF1
        sub     bx, 1000h
br_09FF1:
        mov     word ptr [si], ax
        mov     word ptr [si+2], bx
        retf
L_09FF7:
        mov     si, word ptr [A0_W_0803E]
        shl     ax, 3
        shl     cx, 3
        add     ax, word ptr [si]
        sub     ax, cx
        mov     word ptr [si], ax
        retf
        DISP_ERASE      60h, 01h, 39h, 07h
        DISP_TEXT       74h, 01h, ":  :"
        int     86h
        mov     cl, 62h
        mov     ch, 1
        inc     ax
        mov     bh, 3
        mov     bl, 9
        int     90h
        add     cl, 18h
        mov     al, dl
        inc     al
        mov     bh, 2
        mov     bl, 9
        int     90h
        add     cl, 12h
        mov     al, dh
        mov     bl, 9
        int     90h
xl_scsi_service:
        DISP_INVERT     60h, 01h, 39h, 07h
        ret
isr_0A044:
        sti
        push    ds
        push    es
        mov     bp, RAM_SEG
        mov     ds, bp
        and     bx, 0fh
        shl     bx, 1
        mov     bp, A0_B_SCSI_CDB
        call    word ptr cs:[bx+TBL_SCSI_SERVICE]
        pop     es
        pop     ds
        mov     bp, sp
        pushf
        shr     byte ptr [bp+4], 1
        popf
        rcl     byte ptr [bp+4], 1
        iret
TBL_SCSI_SERVICE:
        if      FW_VERSION >= 110
        dw      scsi_svc_init, scsi_svc_set_target, scsi_svc_read_v110, scsi_svc_write_v112
        dw      scsi_svc_inquiry, tgt_0A133, scsi_svc_format, scsi_svc_test_ready
        dw      tgt_0A334, tgt_0A359, scsi_svc_read_toc_v110, scsi_svc_bus_reset
        dw      tgt_0A384, scsi_svc_mode_select, tgt_0A7DF, scsi_svc_nop
scsi_svc_nop:
        else
        dw      scsi_svc_init, scsi_svc_set_target, scsi_svc_read_v110, scsi_svc_write
        dw      scsi_svc_inquiry, tgt_0A133, scsi_svc_format, scsi_svc_test_ready
        dw      tgt_0A334, tgt_0A359, scsi_svc_read_toc_v110, scsi_svc_bus_reset
        dw      tgt_0A384, scsi_svc_mode_select, tgt_0A7DF, scsi_svc_nop
        endif
        ret
scsi_svc_init:
        mov     bx, 6
        mov     al, byte ptr cs:[bx+TBL_SCSI_ID_BIT]
        mov     byte ptr [A0_B_SCSI_OWN_ID_BIT], al
        mov     al, bl
        mov     dx, 0
        out     dx, al
        mov     dx, 2
        mov     al, 80h
        out     dx, al
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 1ah
        mov     al, 0
        out     dx, al
        mov     dx, 1ch
        mov     al, 0
        out     dx, al
        mov     dx, 16h
        mov     al, 0
        out     dx, al
        mov     dx, 2
        mov     al, 1eh
        out     dx, al
        mov     word ptr [A0_W_08072], 1
        sub     ax, ax
        clc
        ret
TBL_SCSI_ID_BIT:
        db      01h, 02h, 04h, 08h, 10h, 20h, 40h, 80h
scsi_svc_bus_reset:
        call    scsi_svc_init
        mov     dx, 4
        mov     al, 10h
        out     dx, al
        mov     ax, 2
        call    fn_0A7CB
loop_0A0E9:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jae     loop_0A0E9
        call    scsi_svc_init
        mov     word ptr [A0_W_08072], 1
        sub     ax, ax
        clc
        ret
scsi_svc_set_target:
        mov     bl, al
        mov     bh, 0
        mov     al, byte ptr cs:[bx+TBL_SCSI_ID_BIT]
        mov     byte ptr [A0_B_SCSI_TARGET_BIT], al
        ret
scsi_svc_inquiry:
        mov     byte ptr ds:[bp], 12h
        mov     al, 0
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], cl
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [A0_W_SCSI_XFER_LEN], cx
        mov     word ptr [A0_FP_SCSI_DATA_PTR], di
        mov     word ptr [A0_W_SCSI_DATA_SEG], dx
        call    fn_0A3F4
        ret
tgt_0A133:
        call    L_0A183
        jae     L_0A139
        ret
L_0A139:
        if      FW_VERSION < 110
        cmp     word ptr ds:[bp+6], 2
        je      L_09F5C
        call    L_0A014
        call    L_0A183
L_09F5C:
        endif
        mov     dh, byte ptr ds:[bp]
        mov     dl, byte ptr ds:[bp+1]
        mov     ah, byte ptr ds:[bp+2]
        mov     al, byte ptr ds:[bp+3]
        add     ax, 1
        adc     dx, 0
        if      FW_VERSION >= 110
        cmp     byte ptr [A0_B_SCSI_TARGET_BIT], 2
        endif
        mov     bh, byte ptr ds:[bp+4]
        mov     bl, byte ptr ds:[bp+5]
        mov     ch, byte ptr ds:[bp+6]
        mov     cl, byte ptr ds:[bp+7]
        mov     word ptr [A0_W_SCSI_BLOCK_SIZE], cx
        if      FW_VERSION < 110
        cmp     cx, 200h
        je      L_09FC9
        endif
        cmp     cx, 801h
        jae     br_0A17F
        if      FW_VERSION >= 110
        pusha
        endif
        mov     ax, cx
        if      FW_VERSION >= 110
        mov     dx, 0
        else
        sub     dx, dx
        endif
        mov     bx, 200h
        div     bx
        mov     word ptr [A0_W_08072], ax
        if      FW_VERSION >= 110
        popa
        else
        mov     cx, ax
        mov     dh, byte ptr ds:[bp]
        mov     dl, byte ptr ds:[bp+1]
        mov     ah, byte ptr ds:[bp+2]
        mov     al, byte ptr ds:[bp+3]
        add     ax, 1
        adc     dx, 0
        sub     di, di
        sub     si, si
L_09FBA:
        add     di, ax
        adc     si, dx
        loop    L_09FBA
        mov     dx, si
        mov     ax, di
        mov     cx, 200h
        sub     bx, bx
L_09FC9:
        endif
        clc
        ret
br_0A17F:
        mov     al, 1ch
        stc
        ret
L_0A183:
        mov     bp, A1_W_SCSI_CDB
        mov     byte ptr ds:[bp], 25h
        mov     al, 0
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], al
        mov     byte ptr ds:[bp+7], al
        mov     byte ptr ds:[bp+8], al
        mov     byte ptr ds:[bp+9], al
        mov     word ptr [A0_W_SCSI_XFER_LEN], 8
        mov     bp, A1_W_08082
        mov     word ptr [A0_FP_SCSI_DATA_PTR], bp
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        push    bp
        call    fn_0A3F4
        pop     bp
        ret
L_0A014:
        mov     bp, A1_W_SCSI_CDB
        mov     byte ptr ds:[bp], 15h
        mov     al, 0
        mov     byte ptr ds:[bp+1], 10h
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], 0ch
        mov     byte ptr ds:[bp+5], al
        mov     bp, A1_W_08082
        mov     byte ptr ds:[bp], al
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], 8
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], al
        mov     byte ptr ds:[bp+7], al
        mov     byte ptr ds:[bp+8], al
        mov     byte ptr ds:[bp+9], al
        mov     byte ptr ds:[bp+0ah], 2
        mov     byte ptr ds:[bp+0bh], al
        mov     word ptr [A0_W_SCSI_XFER_LEN], 0ch
        mov     word ptr [A0_FP_SCSI_DATA_PTR], A1_W_08082
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        call    fn_0A3F4
        ret
scsi_svc_format:
        mov     byte ptr ds:[bp], 4
        mov     al, 0
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        call    fn_0A3F4
        ret
scsi_svc_read_toc_v110:
        if      (FW_VERSION >= 110) && (FW_VERSION < 120)
        db      3eh, 0c6h, 46h, 00h, 43h, 0b0h, 00h, 3eh, 88h, 46h, 01h, 3eh, 88h, 46h, 02h, 3eh ; >.F.C..>.F.>.F.>
        db      88h, 46h, 03h, 3eh, 88h, 46h, 04h, 3eh, 88h, 46h, 05h, 3eh, 0c6h, 46h, 06h, 01h
L_0A26C:
        else
        mov     byte ptr ds:[bp], 43h
        mov     al, 0
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], 1
        endif
        mov     byte ptr ds:[bp+7], al
        mov     byte ptr ds:[bp+8], 68h
        mov     byte ptr ds:[bp+9], al
        mov     word ptr [A0_W_SCSI_XFER_LEN], 68h
        mov     word ptr [A0_FP_SCSI_DATA_PTR], di
        mov     word ptr [A0_W_SCSI_DATA_SEG], dx
        call    fn_0A3F4
        ret
scsi_svc_read_v110:
        if      FW_VERSION >= 110
        if      FW_VERSION >= 120
        mov     byte ptr ds:[bp], 28h
        mov     bl, 0
        mov     byte ptr ds:[bp+1], bl
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], bl
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        mov     byte ptr ds:[bp+9], bl
        mov     word ptr [A0_FP_SCSI_DATA_PTR], di
        mov     word ptr [A0_W_SCSI_DATA_SEG], es
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        cmp     byte ptr [A0_B_SCSI_TARGET_BIT], 2
        mul     cx
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        ret
scsi_svc_write:
        else
        db      3eh, 0c6h, 46h, 00h, 28h, 0b3h, 00h, 3eh, 88h, 5eh, 01h, 3eh, 88h, 76h, 02h, 3eh ; >.F.(..>.^.>.v.>
        db      88h, 56h, 03h, 3eh, 88h, 66h, 04h, 3eh, 88h, 46h, 05h, 3eh, 88h, 5eh, 06h, 3eh ; .V.>.f.>.F.>.^.>
        if      FW_VERSION >= 112
        db      88h, 6eh, 07h, 3eh, 88h, 4eh, 08h, 3eh, 88h, 5eh, 09h
        dw      3e89h, A0_FP_SCSI_DATA_PTR
        db      8ch
        push    es
        if      FW_VERSION >= 114
        insb
        and     byte ptr [bx+di-7f90h], 80h
        db      3eh, 74h, 80h
        add     dh, bh
        else
        push    ax
        and     byte ptr [bx+di-7fach], 80h
        db      3eh, 58h
        add     byte ptr [bp+si], 0f7h
        endif
        loope   L_0A26C
        if      FW_VERSION >= 114
        outsb
        else
        push    dx
        endif
        sub.r   al, 22h
        add.d0  bx, ax
        else
        db      88h, 6eh, 07h, 3eh, 88h, 4eh, 08h, 3eh, 88h, 5eh, 09h, 89h, 3eh, 4ah
        or      byte ptr [si+4c06h], 80h
        mov     ax, word ptr [8050h]
        cmp     byte ptr [8054h], 2
        mul     cx
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        ret
        endif
        endif
scsi_svc_write_v112:
scsi_svc_write_v114:
        else
        mov     byte ptr ds:[bp], 28h
        mov     bl, 0
        mov     byte ptr ds:[bp+1], bl
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], bl
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        mov     byte ptr ds:[bp+9], bl
        mov     word ptr [A0_FP_SCSI_DATA_PTR], di
        mov     word ptr [A0_W_SCSI_DATA_SEG], es
        cmp     word ptr [A0_W_SCSI_BLOCK_SIZE], 200h
        je      L_0A118
        jmp     fn_0A7D4
L_0A118:
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        mul     cx
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        ret
fn_0A7D4:
        mov     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        mov     ax, dx
        mov     dx, bx
        mov     di, word ptr [A0_W_08072]
        sub     si, si
        push    bp
        int     0b8h
        pop     bp
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 1
        mov     bx, di
        les     di, [A0_FP_SCSI_DATA_PTR]
        or      bx, bx
        je      loop_0A84C
        call    fn_0A86F
        jae     br_0A831
        ret
br_0A831:
        mov     ax, 200h
        mul     bx
        add     si, ax
loop_0A838:
        mov     cx, 100h
        rep movsw
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], 1
        jne     br_0A845
        ret
br_0A845:
        inc     bx
        cmp     bx, word ptr [A0_W_08072]
        jne     loop_0A838
loop_0A84C:
        call    fn_0A86F
        jae     br_0A852
        ret
br_0A852:
        mov     cx, word ptr [A0_W_08072]
        cmp     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        jae     br_0A860
        mov     cx, word ptr [A1_W_SCSI_BLOCKS_LEFT]
br_0A860:
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        pushf
        mov     ch, cl
        mov     cl, 0
        rep movsw
        popf
        jne     loop_0A84C
        ret
fn_0A86F:
        pusha
        push    es
        mov     word ptr [A0_FP_SCSI_DATA_PTR], A1_W_080AC
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        pop     es
        popa
        mov     si, A1_W_080AC
        jb      L_0A1D3
        mov     bp, A1_W_0805E
        add     byte ptr ds:[bp+3], 1
        adc     byte ptr ds:[bp+2], 0
        adc     byte ptr ds:[bp+1], 0
        adc     byte ptr ds:[bp], 0
        clc
        ret
L_0A1D3:
        ret
scsi_svc_write:
        endif
        mov     byte ptr ds:[bp], 2ah
        mov     bl, 0
        mov     byte ptr ds:[bp+1], bl
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+6], bl
        mov     byte ptr ds:[bp+7], ch
        mov     byte ptr ds:[bp+8], cl
        mov     byte ptr ds:[bp+9], bl
        mov     word ptr [A0_FP_SCSI_DATA_PTR], di
        mov     word ptr [A0_W_SCSI_DATA_SEG], es
        if      FW_VERSION = 107
        cmp     word ptr [A0_W_SCSI_BLOCK_SIZE], 200h
        jne     br_0A8A7
        endif
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        mul     cx
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        if      FW_VERSION < 110
        ret
br_0A8A7:
        mov     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        mov     di, word ptr [A0_W_08072]
        sub     si, si
        push    bp
        int     0b8h
        pop     bp
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 1
        mov     bx, di
        les     di, [A0_FP_SCSI_DATA_PTR]
        or      bx, bx
        je      loop_0A900
        call    fn_0A98A
        jae     br_0A8E5
        ret
br_0A8E5:
        mov     ax, 200h
        mul     bx
        add     si, ax
loop_0A8EC:
        call    fn_0A936
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], 1
        je      br_0A91A
        inc     bx
        cmp     bx, word ptr [A0_W_08072]
        jne     loop_0A8EC
        call    fn_0A950
loop_0A900:
        mov     cx, word ptr [A0_W_08072]
        cmp     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        jae     br_0A920
        call    fn_0A98A
        jae     loop_0A910
        ret
loop_0A910:
        call    fn_0A936
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], 1
        jne     loop_0A910
br_0A91A:
        call    fn_0A950
        sub     ax, ax
        ret
br_0A920:
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        pushf
        mov     si, A1_W_080AC
tgt_0A928:
        call    fn_0A936
        loop    tgt_0A928
        call    fn_0A950
        popf
        jne     loop_0A900
        sub     ax, ax
        ret
fn_0A936:
        push    es
        push    ds
        push    cx
        push    bx
        xchg    di, si
        mov     ax, ds
        mov     dx, es
        mov     ds, dx
        mov     es, ax
        mov     cx, 100h
        rep movsw
        xchg    di, si
        pop     bx
        pop     cx
        pop     ds
        pop     es
        ret
fn_0A950:
        pusha
        push    es
        mov     byte ptr [A0_B_SCSI_CDB], 2ah
        mov     word ptr [A0_FP_SCSI_DATA_PTR], A1_W_080AC
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        pop     es
        popa
        mov     si, A1_W_080AC
        jb      L_0A989
        mov     bp, A1_W_0805E
        add     byte ptr ds:[bp+3], 1
        adc     byte ptr ds:[bp+2], 0
        adc     byte ptr ds:[bp+1], 0
        adc     byte ptr ds:[bp], 0
        clc
L_0A989:
        ret
fn_0A98A:
        pusha
        push    es
        mov     byte ptr [A0_B_SCSI_CDB], 28h
        mov     word ptr [A0_FP_SCSI_DATA_PTR], A1_W_080AC
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        pop     es
        popa
        mov     si, A1_W_080AC
        endif
        ret
scsi_svc_test_ready:
        mov     byte ptr ds:[bp], 0
        sub     ax, ax
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        ret
tgt_0A334:
        mov     byte ptr ds:[bp], 0
        sub     ax, ax
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        mov     cx, 1f4h
        call    fn_0A3F7
        ret
tgt_0A359:
        mov     al, byte ptr [A0_B_SCSI_OWN_ID_BIT]
        mov     byte ptr [A0_B_SCSI_TARGET_BIT], al
        mov     byte ptr ds:[bp], 0
        sub     ax, ax
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], al
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        mov     cx, 1f4h
        call    fn_0A3F7
        ret
tgt_0A384:
        int     0b4h
        call    L_0A183
        pushf
        DISP_PLANE0
        popf
        ret
scsi_svc_mode_select:
        mov     bp, A1_W_SCSI_CDB
        mov     byte ptr ds:[bp], 15h
        mov     al, 0
        mov     byte ptr ds:[bp+1], 10h
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], 0ah
        mov     byte ptr ds:[bp+5], al
        mov     bp, A1_W_08082
        mov     byte ptr ds:[bp], al
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], 2fh
        mov     byte ptr ds:[bp+5], 4
        mov     byte ptr ds:[bp+6], 4
        mov     byte ptr ds:[bp+7], 1
        mov     byte ptr ds:[bp+8], 0
        mov     byte ptr ds:[bp+9], 5
        mov     word ptr [A0_W_SCSI_XFER_LEN], 0ah
        mov     word ptr [A0_FP_SCSI_DATA_PTR], A1_W_08082
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        call    fn_0A3F4
        ret
fn_0A3F4:
        mov     cx, 3000h
fn_0A3F7:
        call    xl_scsi_select
        jae     br_0A3FD
        ret
br_0A3FD:
        call    fn_0A4FF
        jae     br_0A403
        ret
br_0A403:
        mov     bl, byte ptr [A0_B_SCSI_STATUS]
        and     bl, 3eh
        je      br_0A41B
        cmp     bl, 8
        je      br_0A41F
        cmp     bl, 18h
        je      br_0A41F
        cmp     bl, 2
        je      br_0A423
br_0A41B:
        sub     ax, ax
        clc
        ret
br_0A41F:
        mov     al, 0fh
        stc
        ret
br_0A423:
        mov     bp, A1_W_SCSI_CDB
        mov     byte ptr ds:[bp], 3
        sub     ax, ax
        mov     byte ptr ds:[bp+1], al
        mov     byte ptr ds:[bp+2], al
        mov     byte ptr ds:[bp+3], al
        mov     byte ptr ds:[bp+4], 12h
        mov     byte ptr ds:[bp+5], al
        mov     word ptr [A0_W_SCSI_XFER_LEN], 12h
        mov     di, A1_W_08096
        mov     word ptr [A0_FP_SCSI_DATA_PTR], di
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        mov     cx, 3000h
        call    xl_scsi_select
        jae     br_0A45C
        ret
br_0A45C:
        call    fn_0A4FF
        jae     br_0A462
        ret
br_0A462:
        and     byte ptr [A0_B_SCSI_STATUS], 3eh
        jne     L_0A490
        mov     bl, byte ptr [A1_B_08098]
        and     bl, 0fh
        cmp     bl, 5
        je      br_0A495
        mov     al, 0fh
        cmp     bl, 2
        if      FW_VERSION >= 110
        je      br_0A493
        mov     al, 35h
        cmp     bl, 3
        endif
        je      br_0A493
        mov     al, 1dh
        cmp     bl, 6
        je      br_0A493
        mov     al, 1
        cmp     bl, 7
        je      br_0A493
L_0A490:
        mov     al, 0fh
br_0A493:
        stc
        ret
br_0A495:
        sub     ax, ax
        clc
        ret
xl_scsi_select:
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 2
        mov     al, 18h
        out     dx, al
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     al, byte ptr [A0_B_SCSI_OWN_ID_BIT]
        or      al, byte ptr [A0_B_SCSI_TARGET_BIT]
        mov     dx, 16h
        out     dx, al
        mov     ax, cx
        mov     dx, 1ah
        out     dx, al
        mov     al, ah
        mov     dx, 18h
        out     dx, al
        mov     dx, 1ch
        mov     al, 4
        out     dx, al
        mov     dx, 4
        mov     al, 25h
        out     dx, al
        mov     ax, 2
        call    fn_0A7CB
loop_0A4D4:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jb      loop_0A4D4
        mov     ax, 0bb8h
        call    fn_0A7CB
loop_0A4DF:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jae     br_0A4F8
        in      al, 8
        test    al, 1
        mov     cx, 3000h
        jne     xl_scsi_select
        test    al, 4
        jne     br_0A4F8
        test    al, 10h
        je      loop_0A4DF
        sub     ax, ax
        ret
br_0A4F8:
        call    scsi_svc_init
        mov     al, 0eh
        stc
        ret
fn_0A4FF:
        mov     byte ptr [A0_B_SCSI_STATUS], 0
        mov     byte ptr [A1_B_08077], 0
        mov     byte ptr [A0_B_SCSI_MSG_IN_COUNT], 0
L_0A50D:
        mov     ax, 7530h
        call    fn_0A7CB
loop_0A514:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jae     br_0A53E
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        mov     ah, al
        and     ah, 88h
        jne     br_0A527
        ret
br_0A527:
        test    ah, 80h
        je      loop_0A514
        and     ax, 7
        shl     ax, 1
        mov     bx, ax
        if      (FW_VERSION >= 110) && (FW_VERSION < 120)
        call    word ptr cs:[bx+TBL_SCSI_PHASE+SEGBASE]
        else
        call    word ptr cs:[bx+TBL_SCSI_PHASE]
        endif
        jae     L_0A50D
        mov     al, 11h
        stc
        ret
br_0A53E:
        mov     al, 11h
        stc
        ret
TBL_SCSI_PHASE:
        dw      scsi_phase_data_out, scsi_phase_data_in, scsi_phase_command, scsi_phase_status
        if      (FW_VERSION >= 110) && (FW_VERSION < 120)
        dw      scsi_phase_reserved+SEGBASE, scsi_phase_reserved+SEGBASE, scsi_phase_msg_out+SEGBASE, scsi_phase_msg_in+SEGBASE
        else
        dw      scsi_phase_reserved, scsi_phase_reserved, scsi_phase_msg_out, scsi_phase_msg_in
        endif
scsi_phase_reserved:
        ret
scsi_phase_data_out:
        mov     dx, 10h
        mov     al, 0
        out     dx, al
        mov     cx, word ptr [A0_W_SCSI_XFER_LEN]
        les     si, [A0_FP_SCSI_DATA_PTR]
        mov     al, cl
        mov     dx, 1ch
        out     dx, al
        mov     al, ch
        mov     dx, 1ah
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 80h
        out     dx, al
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C031
        mov     al, 0
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 1
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
tgt_0A5AB:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0A5AB
        pop     cx
        add     ax, si
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 8
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0feh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, 0bb8h
        call    fn_0A7CB
loop_0A5E8:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jae     br_0A601
        in      al, 8
        test    al, 10h
        je      loop_0A5E8
        mov     dx, 8
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        clc
        ret
br_0A601:
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        stc
        ret
scsi_phase_data_in:
        mov     dx, 10h
        mov     al, 1
        out     dx, al
        mov     cx, word ptr [A0_W_SCSI_XFER_LEN]
        les     di, [A0_FP_SCSI_DATA_PTR]
        or      cx, cx
        jne     br_0A61E
        jmp     br_0A6C6
br_0A61E:
        mov     al, cl
        mov     dx, 1ch
        out     dx, al
        mov     al, ch
        mov     dx, 1ah
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 81h
        out     dx, al
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C038
        mov     al, 10h
        out     dx, al
        mov     dx, ASIC_DMA_DIR
        mov     al, 1
        out     dx, al
        mov     dx, ASIC_DMA_C031
        mov     al, 0
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        or      al, 1
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, es
        push    cx
        mov     cx, 4
        sub     bl, bl
tgt_0A668:
        shl     ax, 1
        rcl     bl, 1
        loop    tgt_0A668
        pop     cx
        add     ax, di
        adc     bl, 0
        mov     dx, ASIC_DMA_ADDR
        out     dx, ax
        mov     al, bl
        int     8eh
        mov     dx, ASIC_DMA_ADDR_HI
        out     dx, al
        mov     ax, cx
        dec     ax
        mov     dx, ASIC_DMA_COUNT
        out     dx, ax
        mov     dx, ASIC_DMA_C03A
        mov     al, 4
        out     dx, al
        push    dx
        mov     dx, ASIC_DMA_STATUS
        in      al, dx
        pop     dx
        push    dx
        mov     dx, ASIC_DMA_C03F
        in      al, dx
        pop     dx
        and     al, 0feh
        mov     dx, ASIC_DMA_C03F
        out     dx, al
        mov     ax, 2710h
        call    fn_0A7CB
loop_0A6A5:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jae     br_0A6C6
        in      al, 0ah
        and     al, 7
        cmp     al, 1
        jne     br_0A6BE
        in      al, 8
        test    al, 10h
        je      loop_0A6A5
        mov     dx, 8
        mov     al, 10h
        out     dx, al
br_0A6BE:
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        clc
        ret
br_0A6C6:
        mov     dx, ASIC_DMA_MODE
        mov     al, 1
        out     dx, al
        stc
        ret
scsi_phase_command:
        mov     dx, 10h
        mov     al, 2
        out     dx, al
        mov     si, A1_W_SCSI_CDB
        mov     ah, byte ptr [si]
        shr     ah, 5
        mov     al, 6
        cmp     ah, 0
        je      br_0A6EC
        mov     al, 0ah
        cmp     ah, 3
        jb      br_0A6EC
        mov     al, 0ch
br_0A6EC:
        mov     cl, al
        mov     ch, 0
        mov     dx, 1ch
        out     dx, al
        mov     dx, 1ah
        mov     al, 0
        out     dx, al
        mov     dx, 18h
        mov     al, 0
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 84h
        out     dx, al
L_0A70B:
        mov     bx, 3e8h
loop_0A70F:
        dec     bx
        je      br_0A741
        in      al, 0ch
        test    al, 2
        jne     loop_0A70F
        lodsb
        out     14h, al
        loop    L_0A70B
        sub     bx, bx
loop_0A71F:
        dec     bx
        je      br_0A741
        in      al, 0ch
        test    al, 4
        je      loop_0A71F
        mov     ax, 2710h
        call    fn_0A7CB
loop_0A72E:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jae     br_0A741
        in      al, 8
        test    al, 10h
        je      loop_0A72E
        mov     dx, 8
        mov     al, 10h
        out     dx, al
        clc
        ret
br_0A741:
        stc
        ret
scsi_phase_status:
        mov     dx, 10h
        mov     al, 3
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 0e4h
        out     dx, al
        mov     ax, 2710h
        call    fn_0A7CB
loop_0A75B:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jae     br_0A77B
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        test    al, 80h
        jne     loop_0A75B
        push    dx
        mov     dx, 16h
        in      al, dx
        pop     dx
        mov     byte ptr [A0_B_SCSI_STATUS], al
        mov     dx, 4
        mov     al, 0c4h
        out     dx, al
        clc
        ret
br_0A77B:
        stc
        ret
scsi_phase_msg_in:
        mov     dx, 10h
        mov     al, 7
        out     dx, al
        mov     dx, 8
        mov     al, 0ffh
        out     dx, al
        mov     dx, 4
        mov     al, 0e4h
        out     dx, al
        mov     ax, 2710h
        call    fn_0A7CB
loop_0A795:
        if      FW_VERSION >= 110
        call    fn_0A7D4
        else
        call    L_0A7D3
        endif
        jae     br_0A7C7
        push    dx
        mov     dx, 0ah
        in      al, dx
        pop     dx
        test    al, 80h
        jne     loop_0A795
        push    dx
        mov     dx, 16h
        in      al, dx
        pop     dx
        mov     bl, byte ptr [A0_B_SCSI_MSG_IN_COUNT]
        mov     bh, 0
        if      FW_VERSION >= 114
        mov     byte ptr [bx-7f89h], al
        elseif  FW_VERSION >= 112
        mov     byte ptr [bx-7fa5h], al
        elseif  FW_VERSION >= 110
        mov     byte ptr [bx-7fa9h], al
        else
        mov     byte ptr [bx-7fc9h], al
        endif
        inc     bl
        cmp     bl, 0ah
        je      br_0A7BF
        mov     byte ptr [A0_B_SCSI_MSG_IN_COUNT], bl
br_0A7BF:
        mov     dx, 4
        mov     al, 0c4h
        out     dx, al
        clc
        ret
br_0A7C7:
        stc
        ret
scsi_phase_msg_out:
        db      0f9h, 0c3h
fn_0A7CB:
        mov     word ptr [A1_W_088AE], ax
        int     77h
        mov     word ptr [A1_W_088AC], ax
        ret
L_0A7D3:
        if      FW_VERSION >= 110
fn_0A7D4:
        endif
        int     77h
        sub     ax, word ptr [A1_W_088AC]
        cmp     ax, word ptr [A1_W_088AE]
        ret
tgt_0A7DF:
        if      FW_VERSION >= 110
        mov     byte ptr [bp], 28h
        mov     bl, 0
        mov     byte ptr ds:[bp+1], bl
        mov     byte ptr ds:[bp+6], bl
        mov     byte ptr ds:[bp+9], bl
        mov     word ptr [A0_FP_SCSI_DATA_PTR], di
        mov     word ptr [A0_W_SCSI_DATA_SEG], es
        mov     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        mov     di, word ptr [A0_W_08072]
        sub     si, si
        push    bp
        int     0b8h
        pop     bp
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 1
        mov     bx, di
        les     di, [A0_FP_SCSI_DATA_PTR]
        or      bx, bx
        je      loop_0A84C
        call    fn_0A86F
        jae     br_0A831
        endif
        ret
        if      FW_VERSION >= 110
br_0A831:
        mov     ax, 200h
        mul     bx
        add     si, ax
loop_0A838:
        mov     cx, 100h
        rep movsw
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], 1
        jne     br_0A845
        ret
br_0A845:
        inc     bx
        cmp     bx, word ptr [A0_W_08072]
        jne     loop_0A838
loop_0A84C:
        call    fn_0A86F
        jae     br_0A852
        ret
br_0A852:
        mov     cx, word ptr [A0_W_08072]
        cmp     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        jae     br_0A860
        mov     cx, word ptr [A1_W_SCSI_BLOCKS_LEFT]
br_0A860:
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        pushf
        mov     ch, cl
        mov     cl, 0
        rep movsw
        popf
        jne     loop_0A84C
        ret
fn_0A86F:
        pusha
        push    es
        mov     word ptr [A0_FP_SCSI_DATA_PTR], A1_W_080AC
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        mov     byte ptr [A1_B_08068], al
        pop     es
        popa
        mov     si, A1_W_080AC
        jb      br_0A8A7
        mov     bp, A1_W_0805E
        add     byte ptr ds:[bp+3], 1
        adc     byte ptr ds:[bp+2], 0
        adc     byte ptr ds:[bp+1], 0
        adc     byte ptr ds:[bp], 0
        clc
        ret
br_0A8A7:
        mov     al, byte ptr [A1_B_08068]
        mov     ah, 0
        ret
        mov     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        mov     di, word ptr [A0_W_08072]
        sub     si, si
        push    bp
        int     0b8h
        pop     bp
        mov     byte ptr ds:[bp+2], dh
        mov     byte ptr ds:[bp+3], dl
        mov     byte ptr ds:[bp+4], ah
        mov     byte ptr ds:[bp+5], al
        mov     byte ptr ds:[bp+7], 0
        mov     byte ptr ds:[bp+8], 1
        mov     bx, di
        les     di, [A0_FP_SCSI_DATA_PTR]
        or      bx, bx
        je      loop_0A900
        call    fn_0A98A
        jae     br_0A8E5
        ret
br_0A8E5:
        mov     ax, 200h
        mul     bx
        add     si, ax
loop_0A8EC:
        call    fn_0A936
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], 1
        je      br_0A91A
        inc     bx
        cmp     bx, word ptr [A0_W_08072]
        jne     loop_0A8EC
        call    fn_0A950
loop_0A900:
        mov     cx, word ptr [A0_W_08072]
        cmp     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        jae     br_0A920
        call    fn_0A98A
        jae     loop_0A910
        ret
loop_0A910:
        call    fn_0A936
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], 1
        jne     loop_0A910
br_0A91A:
        call    fn_0A950
        sub     ax, ax
        ret
br_0A920:
        sub     word ptr [A1_W_SCSI_BLOCKS_LEFT], cx
        pushf
        mov     si, A1_W_080AC
tgt_0A928:
        call    fn_0A936
        loop    tgt_0A928
        call    fn_0A950
        popf
        jne     loop_0A900
        sub     ax, ax
        ret
fn_0A936:
        push    es
        push    ds
        push    cx
        push    bx
        xchg    di, si
        mov     ax, ds
        mov     dx, es
        mov     ds, dx
        mov     es, ax
        mov     cx, 100h
        rep movsw
        xchg    di, si
        pop     bx
        pop     cx
        pop     ds
        pop     es
        ret
fn_0A950:
        pusha
        push    es
        mov     byte ptr [A0_B_SCSI_CDB], 2ah
        mov     word ptr [A0_FP_SCSI_DATA_PTR], A1_W_080AC
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        pop     es
        popa
        mov     si, A1_W_080AC
        jb      L_0A989
        mov     bp, A1_W_0805E
        add     byte ptr ds:[bp+3], 1
        adc     byte ptr ds:[bp+2], 0
        adc     byte ptr ds:[bp+1], 0
        adc     byte ptr ds:[bp], 0
        clc
L_0A989:
        ret
fn_0A98A:
        pusha
        push    es
        mov     byte ptr [A0_B_SCSI_CDB], 28h
        mov     word ptr [A0_FP_SCSI_DATA_PTR], A1_W_080AC
        mov     word ptr [A0_W_SCSI_DATA_SEG], ds
        mov     ax, word ptr [A0_W_SCSI_BLOCK_SIZE]
        mov     word ptr [A0_W_SCSI_XFER_LEN], ax
        call    fn_0A3F4
        pop     es
        popa
        mov     si, A1_W_080AC
        else
scsi_svc_nop:
        endif
        ret
APP0_END:
; app0 runs under CS=0 (its IVT vectors are segment 0 offsets): a byte past 64K
; is out of reach, and near calls would wrap without a word.
        if      $ > 10000h
        error   "app0: CS=0 code runs past 64K"
        endif
; app1 starts on its APP1_SEG paragraph phase.
        FRAME_PAD SEG_APP1
