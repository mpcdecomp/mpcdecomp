/* differs: 308 at +0, 132 bytes; 311 at +0, 132 bytes; 312 at +0, 132 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far far_fb33d(void)
{
    int bx;
    int di;
    int ds;
    int dx;
    int es;
    int flags;
    int p8;

    p8 = __flags(flags);
    if ((char)dx != 0 && (unsigned char)(char)dx != 4) {
        ds = 0;
        di = (unsigned char)(char)dx * 4;
        _disable();
        if ((es | bx) != 0) {
            goto L1;
        }
        *(int far *)MK_FP(ds, di) = 0x30f;
        *(int far *)MK_FP(ds, di + 2) = 0xfb00;
    } else {
        ds = (int)(*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) >> 16);
        di = *(int far *)MK_FP(ds, (int)*(long far *)MK_FP(0xfb00, (unsigned int)(unsigned)((char *)0x40)) + 10) + 24 + (unsigned char)(char)dx;
        _disable();
L1:
        *(int far *)MK_FP(ds, di) = bx;
        *(int far *)MK_FP(ds, di + 2) = es;
    }
    __insn("popf", p8);
    return;
}
