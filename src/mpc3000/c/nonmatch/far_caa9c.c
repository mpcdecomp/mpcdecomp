/* differs: 308 at +3, 100 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern long far far_cad00(int);

long far far_caa9c(long arg_0, int arg_2)
{
    int ax;
    unsigned int cx;
    int cx2;
    int si;

    cx = ~__repne_scas1((int)arg_0, 0, -1);
    cx2 = cx >> 1;
    ax = arg_2;
    si = *(int *)((char *)&arg_0 + 0);
    __movs2(MK_FP(SEG_DATA, -0x1d57), ((long)ax << 16 | (unsigned)si), cx2 * 2);
    __movs1(MK_FP(SEG_DATA, cx2 * 2 - 0x1d57), ((long)ax << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    return far_cad00(1);
}
