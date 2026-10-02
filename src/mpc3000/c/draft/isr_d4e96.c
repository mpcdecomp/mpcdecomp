/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern unsigned char B_7AAE;
extern unsigned char B_7AC5;
extern unsigned char W_7AC6;

int far pascal isr_d4e96(void)
{
    int ax;
    int ax2;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int flags;
    int si;
    long t1;

    _enable();
    flags = *(char far *)MK_FP(0, 0xfc);
    if (!CC("!=", flags)) {
        return (int)(*(long (far *)())*(long far *)MK_FP(-0x7ff0, (unsigned)&W_7AC6))(MK_FP(SEG_DATA, __flags(flags)));
    }
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_7AAE) = (char)ax;
    t1 = (*(long (*)())*(int far *)MK_FP(0xde1b, ((((char)(ax >> 8) << 8 | (unsigned char)(char)(ax >> 8)) & 15) << 1) + 10))(ax, di, si, dx, cx, MK_FP(es, bx), SEG_DATA);
    ax2 = (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_7AC5) << 8 | (unsigned char)(char)ax);
    return ax2;
}
