/* differs: 308 at +3, 102 bytes; 311 at +3, 102 bytes; 312 at +3, 102 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern unsigned char B_F77B;
extern unsigned char TBL_F77A;
extern long far far_e4a1d(int);

int far fn_e75c8(long arg_0, int arg_2)
{
    int bx;
    int es;

    if ((int)far_e4a1d(TBL_F77A) == 0) {
        goto L1;
    }
    if (B_F77B < 35) {
        goto L2;
    }
    if (B_F77B <= 98) {
        goto L3;
    }
L2:
    return 1;
L3:
    return *(char far *)MK_FP(arg_2, B_F77B + *(int *)((char *)&arg_0 + 0) - 35);
L1:
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    if ((unsigned char)*(char far *)MK_FP(es, bx) > B_F77B) {
        goto L4;
    }
    if ((unsigned char)*(char far *)MK_FP(es, bx + 1) < B_F77B) {
        goto L4;
    }
    return 1;
L4:
    return 0;
}
