/* differs: 308 absent; 311 at +0, 114 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_9457;
extern char TBL_943B[];
extern unsigned char TBL_dd19c[];
extern int far far_dac6a(int);

long far far_dd212(void)
{
    int ax;
    int bx;
    int bx2;
    unsigned int bx3;
    int bx4;
    int dx;
    int t1;

    if (B_9457 == 0) {
        bx = (unsigned char)(char)bx2 - 1;
        if (bx >= 0) {
            bx3 = bx << 1;
            t1 = far_dac6a(bx3);
            dx = *(int far *)MK_FP(0xdd51, (unsigned int)(unsigned)(TBL_dd19c + -96 + bx3));
            bx4 = bx3 >> 1;
            _disable();
            TBL_943B[bx4] = (char)(TBL_943B[bx4] | 2);
            ax = ((char)(t1 >> 8) << 8 | (unsigned char)TBL_943B[bx4]);
            outp(dx, (char)ax);
            __insn("popf", __flags(bx4));
        }
    }
    return ((long)dx << 16 | (unsigned)ax);
}
