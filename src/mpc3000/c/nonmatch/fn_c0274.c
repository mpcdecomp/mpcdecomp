/* differs: 308 at +3, 164 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern long far fn_c0428(int, int);

void far fn_c0274(int arg_0, int arg_2, long arg_4, int arg_6)
{
    unsigned int cx;
    int cx2;
    int di;
    int dx;
    int es;
    int si;
    long t1;

    t1 = fn_c0428(arg_0, arg_2);
    if ((int)t1 == -1) {
        di = (int)arg_4;
        es = (int)(arg_4 >> 16);
        __movs2(MK_FP(es, di), MK_FP(SEG_DATA, 0x4647), 8);
        *(char far *)MK_FP(es, di + 8) = *(char *)(0x464f);
        return;
    }
    dx = arg_6;
    si = *(int *)((char *)&arg_4 + 0);
    cx = ~__repne_scas1(MK_FP(SEG_DATA, (int)t1 * 9 + 0x715d), 0, -1);
    cx2 = cx >> 1;
    __movs2(((long)dx << 16 | (unsigned)si), MK_FP(SEG_DATA, si), cx2 * 2);
    __movs1(((long)dx << 16 | (unsigned)(si + cx2 * 2)), MK_FP(SEG_DATA, si + cx2 * 2), cx & 1);
    return;
}
long far fn_c0428(int p0, int p1) { return 0; }
