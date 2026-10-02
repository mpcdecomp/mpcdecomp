/* differs: 308 at +0, 274 bytes; 311 at +0, 274 bytes; 312 at +0, 274 bytes */
long far far_d975a(void)
{
    unsigned int ax;
    unsigned int bp;
    int bp2;
    unsigned int bp3;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    unsigned int cx;
    int cx2;
    unsigned int dx;

    if (bx == 0) {
        if (cx > dx) {
            return ((long)bx << 16 | (unsigned)(unsigned)((unsigned long)((long)dx << 16 | (unsigned)ax) / (unsigned long)(unsigned int)cx));
        }
        return ((long)(dx / cx) << 16 | (unsigned)(unsigned)((unsigned long)((long)(dx % cx) << 16 | (unsigned)ax) / (unsigned long)(unsigned int)cx));
    }
    bx2 = 0;
    bp = 0;
    cx2 = 32;
    for (;;) {
        ax = ax << 1;
        dx = dx << 1 | ax >> 15 & 1;
        bp2 = bp << 1 | dx >> 15 & 1;
        bx3 = bx2 << 1 | bp >> 15 & 1;
        bp = bp2 - cx;
        bx2 = (int)(((long)bx3 << 16 | (unsigned)bp2) - ((long)bx << 16 | (unsigned)cx) >> 16);
        if (bx2 >= 0) {
L1:
            ax = ax + 1;
            cx2 = cx2 - 1;
            if (cx2 != 0) {
                continue;
            }
            break;
        }
        for (;;) {
            cx2 = cx2 - 1;
            if (cx2 == 0) {
                goto L2;
            }
            ax = ax << 1;
            dx = dx << 1 | ax >> 15 & 1;
            bp3 = bp << 1 | dx >> 15 & 1;
            bx4 = bx2 << 1 | bp >> 15 & 1;
            bp = bp3 + cx;
            bx2 = bx4 + bx + (bp < bp3);
            if (bx2 >= 0) {
                goto L1;
            }
        }
    }
    goto L3;
L2:
L3:
    return ((long)dx << 16 | (unsigned)ax);
}
