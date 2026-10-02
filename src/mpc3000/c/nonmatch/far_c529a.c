/* differs: 308 at +3, 148 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char FP_E40C[];

long far far_c529a(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int cx;
    int cx2;
    int di;
    int dx;
    int si;
    long t1;

    t1 = (long)(int)arg_0 * 24L;
    ax = ((char)((int)t1 >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + -778 + (int)t1));
    cx = (unsigned char)(char)ax;
    dx = 0xa853 /* SEG_A28F */;
    if (*(char far *)MK_FP(dx, (unsigned char)(char)ax * 36 + 0x4800) == 0) {
        return ((long)dx << 16 | (unsigned)0);
    }
    if (cx != 255) {
        di = 0;
        dx = di;
        si = arg_2 + dx;
        while (di == 0) {
            if (*(char far *)MK_FP(arg_4, si) == cx) {
                cx = dx;
                di = 1;
            }
            si = si + 1;
            dx = dx + 1;
            if (dx != 128) {
                continue;
            }
            di = 1;
        }
        cx2 = cx + 1;
    } else {
        cx2 = 0;
    }
    return ((long)dx << 16 | (unsigned)cx2);
}
