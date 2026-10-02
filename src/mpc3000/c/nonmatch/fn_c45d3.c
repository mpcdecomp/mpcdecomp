/* differs: 308 absent; 311 absent; 312 at +5, 137 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern long far far_d7805(int, char far *, int, int);

void far fn_c45d3(long arg_0, int arg_2, int arg_4)
{
    char loc_4[4];
    int ax;
    int di;
    int es;
    int si;
    long t1;

    __movs2(arg_0, MK_FP(SEG_DATA, 0x5665), 6);
    t1 = far_d7805(arg_4, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 3, 48);
    ax = arg_2;
    si = *(int *)((char *)&arg_0 + 0);
    __movs1(((long)ax << 16 | (unsigned)(si + (-1 - __repne_scas1((int)((long)ax << 16 | (unsigned)si), 0, -1)) - 1)), MK_FP(SEG_STACK, si), ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), 0, -1));
    di = (int)arg_0;
    es = (int)(arg_0 >> 16);
    __movs1(MK_FP(es, di + (-1 - __repne_scas1(MK_FP(es, di), 0, -1)) - 1), MK_FP(SEG_DATA, 0x5423), 9);
    return;
}
