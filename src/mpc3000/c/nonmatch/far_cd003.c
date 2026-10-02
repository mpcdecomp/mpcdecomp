/* differs: 308 at +3, 114 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void far far_cd003(int arg_0)
{
    int dx;
    long t1;

    t1 = (long)(int)arg_0 * 36L;
    *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4811) = (char)100;
    *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4812) = (char)0;
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4816) = 0;
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4814) = 0;
    dx = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x481c);
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x481a) = (int)(((long)*(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x481e) << 16 | (unsigned)dx) - 1L >> 16);
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t1 + 0x4818) = dx - 1;
    return;
}
