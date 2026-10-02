/* differs: 308 at +0, 83 bytes; 311 at +0, 83 bytes; 312 at +0, 83 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern unsigned char TBL_f96d4[];

long interrupt far isr_f96aa(void)
{
    unsigned int ax;
    int bp;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;
    long t1;

    _enable();
    if (ax < 8) {
        t1 = (*(long (*)())*(int far *)MK_FP(0xf800, (unsigned int)(unsigned)(TBL_f96d4 + (ax << 1))))(MK_FP(SEG_DATA, es), bp, di, si, dx, cx, bx);
    }
    return 0L;
}
