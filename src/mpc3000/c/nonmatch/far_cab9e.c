/* differs: 308 at +3, 185 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern long far far_cad00(int, int);

void far far_cab9e(long arg_0, int arg_2, long arg_4, int arg_6)
{
    int ax;
    int ax2;
    unsigned int cx;
    int cx2;
    unsigned int cx3;
    int cx4;
    int si;
    int si2;
    long t1;

    cx = ~__repne_scas1((int)arg_0, 0, -1);
    cx2 = cx >> 1;
    ax = arg_2;
    si = *(int *)((char *)&arg_0 + 0);
    __movs2(MK_FP(SEG_DATA, -0x1d57), ((long)ax << 16 | (unsigned)si), cx2 * 2);
    __movs1(MK_FP(SEG_DATA, cx2 * 2 - 0x1d57), ((long)ax << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    cx3 = ~__repne_scas1((int)arg_4, 0, -1);
    cx4 = cx3 >> 1;
    ax2 = arg_6;
    si2 = *(int *)((char *)&arg_4 + 0);
    __movs2(MK_FP(SEG_DATA, -0x1d6b), ((long)ax2 << 16 | (unsigned)si2), cx4 * 2);
    __movs1(MK_FP(SEG_DATA, cx4 * 2 - 0x1d6b), ((long)ax2 << 16 | (unsigned)(si2 + cx4 * 2)), cx3 & 1);
    t1 = far_cad00(7, -0x1d57);
    return;
}
