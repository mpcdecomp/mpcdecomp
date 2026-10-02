/* differs: 308 at +5, 189 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern long far far_cad00(int, int);

long far far_cac0f(long arg_0, int arg_2, long arg_4, int arg_6)
{
    int loc_2;
    int ax;
    int ax2;
    unsigned int cx;
    int cx2;
    int di;
    int es;
    int si;
    int si2;
    long t1;

    cx = ~__repne_scas1((int)arg_0, 0, -1);
    cx2 = cx >> 1;
    ax = arg_2;
    si = *(int *)((char *)&arg_0 + 0);
    __movs2(MK_FP(SEG_DATA, -0x1d57), ((long)ax << 16 | (unsigned)si), cx2 * 2);
    __movs1(MK_FP(SEG_DATA, cx2 * 2 - 0x1d57), ((long)ax << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    ax2 = arg_6;
    si2 = *(int *)((char *)&arg_4 + 0);
    __movs2(MK_FP(SEG_DATA, -0x1d86), ((long)ax2 << 16 | (unsigned)si2), 26);
    *(char *)(0xe294) = *(char far *)MK_FP(ax2, si2 + 26);
    t1 = far_cad00(9, -0x1d57);
    loc_2 = (int)t1;
    di = (int)arg_4;
    es = (int)(arg_4 >> 16);
    __movs2(MK_FP(es, di), MK_FP(SEG_DATA, -0x1d86), 26);
    *(char far *)MK_FP(es, di + 26) = *(char *)(0xe294);
    return t1;
}
