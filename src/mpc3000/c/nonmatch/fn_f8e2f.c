/* differs: 308 at +0, 239 bytes; 311 at +0, 239 bytes; 312 at +0, 239 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int near fn_f8e2f(void)
{
    int ax;
    int bx;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int di;
    int dx;
    int es;
    int flags;
    int flags2;
    int p12;
    int p2;
    char near *si;
    char near *si2;
    char near *si3;

    p2 = ax;
    bx = dx;
    cx = 8;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
        *si = (char)ax;
        bx = bx + 1;
        si = si + 1;
        flags = (int)(unsigned)si;
        cx = cx - 1;
    } while (cx != 0);
    p12 = (int)(unsigned)si;
    si2 = si + 4;
    if (*(char far *)MK_FP(es, bx + 3) != 0) {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)32);
        di = bx + (8 - __repe_scas1(MK_FP(es, bx), (char)ax, 8));
        flags2 = UNDEF;
        if (!CC("!=", flags2)) {
            bx = di;
L1:
            cx3 = 8;
            ax = ((char)(ax >> 8) << 8 | (unsigned char)0);
            flags2 = (char)ax;
            do {
                *si2 = (char)ax;
                si2 = si2 + 1;
                flags2 = (int)(unsigned)si2;
                cx3 = cx3 - 1;
            } while (cx3 != 0);
        } else {
            cx2 = 8;
            do {
                ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
                *si2 = (char)ax;
                bx = bx + 1;
                si2 = si2 + 1;
                flags2 = (int)(unsigned)si2;
                cx2 = cx2 - 1;
            } while (cx2 != 0);
        }
    } else {
        goto L1;
    }
    si3 = (char near *)p12;
    cx4 = 3;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx));
        *si3 = (char)ax;
        bx = bx + 1;
        si3 = si3 + 1;
        flags2 = (int)(unsigned)si3;
        cx4 = cx4 - 1;
    } while (cx4 != 0);
    return p2;
}
