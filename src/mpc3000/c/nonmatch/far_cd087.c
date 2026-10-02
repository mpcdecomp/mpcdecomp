/* differs: 308 at +2, 6 bytes; 311 at +2, 8 bytes; 312 at +2, 8 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far far_cd087(void)
{
    int cx;
    int dx;
    int si;

    dx = 0;
    cx = 0;
    si = 0x4800;
    do {
        if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, si) == 0) {
            dx = dx + 1;
        }
        si = si + 36;
        cx = cx + 1;
    } while (si != 0x5a00);
    return;
}
