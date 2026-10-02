/* differs: 308 at +5, 185 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
void far fn_cd837(unsigned int arg_0, long arg_2, int arg_4)
{
    int loc_2;
    int ax;
    unsigned int cx2;
    int cx3;
    int cx4;
    int di;
    int di2;
    int dx;
    int es;
    int p14;
    int si;

    if (arg_0 >= 128 || *(char far *)MK_FP(0xa853 /* SEG_A28F */, arg_0 * 36 + 0x4800) == 0) {
        ax = 1;
    } else {
        ax = 0;
    }
    loc_2 = ax;
    if (loc_2 == 0) {
        si = *(int *)((char *)&arg_2 + 0);
        p14 = arg_4;
        cx2 = ~__repne_scas1(MK_FP(0xa853 /* SEG_A28F */, arg_0 * 36 + 0x4800), 0, -1);
        dx = 17 - cx2;
        if (cx2 > 17) {
            cx2 = cx2 + dx;
            dx = 0;
        }
        cx3 = cx2 >> 1;
        __movs2(((long)p14 << 16 | (unsigned)si), MK_FP(0xa853 /* SEG_A28F */, si), cx3 * 2);
        di2 = si + cx3 * 2;
        cx4 = cx2 & 1;
        __movs1(((long)p14 << 16 | (unsigned)di2), MK_FP(0xa853 /* SEG_A28F */, si + cx3 * 2), cx4);
        __stos1(((long)p14 << 16 | (unsigned)(di2 + cx4)), 0, dx);
    } else {
        di = (int)arg_2;
        es = (int)(arg_2 >> 16);
        __movs2(MK_FP(es, di), MK_FP(SEG_DATA, 0x69be), 16);
        *(char far *)MK_FP(es, di + 16) = *(char *)(0x69ce);
    }
    return;
}
