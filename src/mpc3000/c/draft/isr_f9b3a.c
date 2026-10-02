/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern unsigned char TBL_f9b2a[];

int far pascal isr_f9b3a(void)
{
    int ax;
    int ax2;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int p18;
    int si;

    _enable();
    p18 = ax;
    if ((unsigned char)(char)(ax >> 8) <= 7) {
        *(char far *)MK_FP(0x6dd, 0x6) = (char)1;
        ax = (int)(*(long (*)())*(int far *)MK_FP(0xf800, (unsigned int)(unsigned)(TBL_f9b2a + (char)ax + (char)ax)))(p18, dx, MK_FP(es, cx), MK_FP(SEG_DATA, bx), UNDEF, di, si);
    } else {
        *(char far *)MK_FP(0x6dd, 0x7) = (char)1;
    }
    ax2 = (*(char far *)MK_FP(0x6dd, 0x7) << 8 | (unsigned char)(char)ax);
    *(char far *)MK_FP(0x6dd, 0x6) = (char)0;
    return ax2;
}
