/* differs: 308 at +3, 165 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far far_c7e9d(int arg_0)
{
    int cx;
    unsigned int dx;
    int dx2;
    long t1;
    long t2;

    t1 = (long)(int)arg_0 * 36L;
    if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4800) == 0) {
        return (long)MK_FP(0xa853 /* SEG_A28F */, 0);
    }
    if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4813) == 1) {
        t2 = *(long far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x481c) << 2;
        return (t2 + 0x3ffL) / 0x400L;
    }
    dx = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x481c);
    dx2 = dx << 1;
    return (((long)(*(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x481e) << 1 | dx >> 15 & 1) << 16 | (unsigned)dx2) + 0x3ffL) / 0x400L;
}
