; the shared macros and equates every part assembles against.  each is included
; once.

        include "../../../common/pad_to.inc"
        include "../../../common/ports.inc"
        include "../../../common/display_macros.inc"
        include "../../../common/window_macros.inc"
        include "../../../common/shared_tables.inc"
        include "../keys.inc"
        include "../structures.inc"
        include "../../../common/feat/tune.inc"
        include "../feat/xl_for_2k.inc"
        include "../feat/banner.inc"
        include "../feat/tune_hooks.inc"
        include "../feat/mute.inc"
        include "../feat/skip_drum.inc"

; zeros to the next paragraph of the image: the first byte of a segment.  it
; takes up whatever growth ahead leaves, so the anchor after it stays aligned.
PARA_PAD        macro
        PAD_TO  $+((10h-((SEGBASE+$)&0fh))&0fh), 000h
        endm

; zeros to where the next part's segment starts on a paragraph: a part that
; keeps its stock offsets under a segment of its own has that segment begin
; <anchor> bytes after it, and growth ahead is padded out to whole paragraphs.
FRAME_PAD       macro   anchor
        PAD_TO  $+((0-(SEGBASE+$+(anchor)))&0fh), 000h
        endm

; the same from inside a part, at a point no code falls through: zeros so the
; next part's anchor lands on a paragraph, whatever grew ahead of it on either
; side.  `here` labels the end of the pad, `partend` is the part's end label.
; zero bytes in a stock build.
GROW_PAD        macro   here, partend, anchor
        PAD_TO  $+((0-(SEGBASE+$+((partend)-(here))+(anchor)))&0fh), 000h
here:
        endm
