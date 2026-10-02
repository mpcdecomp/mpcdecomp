/* differs: 308 at +3, 137 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern long far fn_c0428(int, int);

int far fn_c02d7(int arg_0, int arg_2, long arg_4, int arg_6)
{
    int ax;
    int bx;
    unsigned int cx;
    int cx2;
    int si;
    long t1;

    ax = (int)fn_c0428(arg_0, arg_2);
    bx = ax;
    if (bx != -1) {
        t1 = (long)(int)bx * 9L;
        cx = ~__repne_scas1((int)arg_4, 0, -1);
        cx2 = cx >> 1;
        ax = arg_6;
        si = *(int *)((char *)&arg_4 + 0);
        __movs2(MK_FP(SEG_DATA, (int)t1 + 0x715d), ((long)ax << 16 | (unsigned)si), cx2 * 2);
        __movs1(MK_FP(SEG_DATA, (int)t1 + 0x715d + cx2 * 2), ((long)ax << 16 | (unsigned)(si + cx2 * 2)), cx & 1);
    }
    return ax;
}
long far fn_c0428(int p0, int p1) { return 0; }
