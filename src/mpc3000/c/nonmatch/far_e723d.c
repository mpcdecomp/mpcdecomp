/* differs: 308 at +3, 78 bytes; 311 at +3, 78 bytes; 312 at +3, 78 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far far_e723d(long arg_0, int arg_4, unsigned int arg_6)
{
    int ax;
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(char far *)MK_FP(es, bx + 60) = *(char *)((char *)&arg_4 + 0);
    *(char far *)MK_FP(es, bx + 61) = (char)arg_6;
    *(int far *)MK_FP(es, bx + 62) = (unsigned int)(arg_4 * 0x180) / arg_6;
    ax = (unsigned int)0x180 / arg_6;
    *(int far *)MK_FP(es, bx + 64) = ax;
    return ((long)((unsigned int)0x180 % arg_6) << 16 | (unsigned)ax);
}
