/* differs: 308 at +5, 225 bytes; 311 at +5, 203 bytes; 312 at +5, 204 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8439;
extern int FP_E40C;
extern int W_E40E;

int far fn_c7f20(void)
{
    int loc_2;
    long loc_4;
    int loc_6;
    int ax;
    unsigned int ax2;
    int bx;
    int cx;
    int di;
    int dx;
    int dx2;
    int dx3;
    int es;
    int si;
    long t1;

    if (B_8439 == 0) {
        return 4;
    }
    loc_2 = 0;
    *(int *)((char *)&loc_4 + 0) = 0;
    loc_6 = 0;
    si = 0;
    for (;;) {
L1:
        dx = 0;
        di = FP_E40C + 62;
        while (dx <= 64) {
            es = W_E40E;
            ax = (unsigned char)*(char far *)MK_FP(es, di);
            if (ax == loc_6) {
                goto L2;
            }
            di = di + 24;
            dx = dx + 1;
        }
        goto L3;
    }
    goto L4;
L2:
    if (*(char far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x4813) != 0) {
        t1 = *(long far *)MK_FP(0xa283 /* SEG_A28F */, si + 0x481c) << 2;
        bx = UNDEF;
        cx = UNDEF;
        es = UNDEF;
        ax = (int)t1;
        dx2 = (int)(t1 >> 16);
    } else {
        es = 0xa283 /* SEG_A28F */;
        ax2 = *(int far *)MK_FP(es, si + 0x481c);
        ax = ax2 << 1;
        dx2 = *(int far *)MK_FP(es, si + 0x481e) << 1 | ax2 >> 15 & 1;
    }
    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + ax;
    loc_2 = (int)(loc_4 + ((long)dx2 << 16 | (unsigned)ax) >> 16);
L3:
    si = si + 36;
    loc_6 = loc_6 + 1;
    if (loc_6 < 128) {
        goto L1;
    }
L4:
    dx3 = *(int *)((char *)&loc_4 + 0);
    return (int)((((long)loc_2 << 16 | (unsigned)dx3) + 0x3ffL) / 0x400L) + 4;
}
