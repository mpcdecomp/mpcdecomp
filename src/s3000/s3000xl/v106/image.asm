; S3000XL OS v1.06; ../../common/image.inc

        cpu     v53

XL              equ     1
MODEL           equ     3000
FW_VERSION      equ     106

; the image sits in the upper half of the 27C040

        phase   0
        db      8000h dup (0ffh)
        db      8000h dup (0ffh)
        phase   0
        db      8000h dup (0ffh)
        db      8000h dup (0ffh)
        phase   0
        db      8000h dup (0ffh)
        db      8000h dup (0ffh)
        phase   0
        db      8000h dup (0ffh)
        db      8000h dup (0ffh)

        include "../../common/image.inc"

        end
