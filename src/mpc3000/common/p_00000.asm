; ROM 00000h v3.12 image; v3.08/v3.11/v3.12 shared; FW_VERSION for differences

        phase   0
        db      44h dup (0ffh)
        if      FW_VERSION >= 311
        db      01fh, 000h, 0c0h, 0fah, 04fh, 002h, 0c0h, 0fah, 0ffh, 0ffh, 0ffh, 0ffh, 034h, 001h, 0c0h, 0fah
        else
        db      01fh, 000h, 0c0h, 0fah, 0a9h, 001h, 0c0h, 0fah
        endif
        db      8000h dup (0ffh)
        if      FW_VERSION >= 311
        db      7fach dup (0ffh)
        else
        db      7fb4h dup (0ffh)
        phase   10000h
        phase   0
        db      8000h dup (0ffh)
        db      8000h dup (0ffh)
        endif
