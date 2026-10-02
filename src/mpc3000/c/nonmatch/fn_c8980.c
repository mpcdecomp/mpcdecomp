/* differs: 308 at +5, 156 bytes; 311 at +5, 155 bytes; 312 at +5, 155 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_F779[];
extern int W_93F5;
extern void far far_b05a7(void);
extern int far far_b1ad0(int, int);
extern int far far_b1f96(int);
extern long far far_c8d05(int, void far *, int);
extern long far far_dc2bf(char far *, int, int);
extern int far far_ea926(int);

long far fn_c8980(int arg_0)
{
    int loc_e;
    char loc_c[10];
    int loc_2;
    int ax;
    int ax2;
    int di;
    int p26;
    int p28;
    int si;
    long t1;
    int t2;
    long t3;
    int t4;
    int t5;
    int t6;

    di = W_93F5;
    si = 2;
    loc_e = arg_0 + 1;
    goto L1;
L2:
    t6 = far_b1ad0(si, 1);
    if (di == 0) {
        goto L3;
    }
    t1 = far_dc2bf((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c), 10, 0);
    di = (int)t1;
    far_b05a7();
    p26 = (int)(unsigned)loc_c;
    p28 = loc_e;
    t3 = far_c8d05(p28, MK_FP(SEG_STACK, p26), di);
    goto L4;
L3:
    t4 = far_b1f96(40);
L4:
    loc_e = loc_e + 1;
    si = si + 1;
L1:
    if (si <= 5) {
        goto L2;
    }
    far_b05a7();
    far_b1ad0(1, 1);
    loc_2 = (int)far_c8d05(arg_0, (unsigned char far *)TBL_F779, W_93F5);
    far_ea926(0);
    return ((long)UNDEF << 16 | (unsigned)loc_2);
}
