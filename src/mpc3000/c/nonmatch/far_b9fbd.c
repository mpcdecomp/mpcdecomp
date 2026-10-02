/* differs: 308 absent; 311 at +3, 260 bytes; 312 at +3, 259 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char B_D4BF;
extern char B_D4C0;
extern char B_D4C1;
extern long far far_b1073(char);
extern int far far_b1ad0(int, int);
extern int far far_b1f96(int);
extern long far far_b9755(int, int, int);
long far far_b9755(int p0, int p1, int p2) { return 0; }

long far far_b9fbd(int arg_0, int arg_2, int arg_4, int arg_6, long arg_8, int arg_10, int far *arg_12)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int es;
    int es2;
    int es3;
    int t1;
    int t2;

    ax = arg_0;
    if (ax == 68) {
        goto L1;
    }
    if (ax == 78) {
        goto L2;
    }
    goto L3;
L1:
    arg_0 = 0;
    if (arg_6 != 0) {
        goto L4;
    }
    goto L3;
L4:
    if (*arg_12 == 0) {
        goto L5;
    }
    __stos2(arg_8, 0, 64);
    t1 = far_b1ad0(arg_2, 6);
    t2 = far_b1f96(40);
    *arg_12 = 0;
L5:
    *(char far *)MK_FP(arg_10, B_D4C0 + *(int *)((char *)&arg_8 + 0) - 35) = (char)1;
    arg_6 = (int)(far_b9755(*(int *)((char *)&arg_8 + 0), arg_10, B_D4BF) >> 16);
    goto L3;
L2:
    arg_0 = 0;
    if (arg_6 != 0) {
        goto L3;
    }
    bx = (int)arg_8;
    es = (int)(arg_8 >> 16);
    if (*(char far *)MK_FP(es, bx) != 0) {
        goto L6;
    }
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)B_D4C1);
    *(char far *)MK_FP(es, bx + 1) = (char)ax2;
    *(char far *)MK_FP(es, bx) = (char)ax2;
    goto L7;
L6:
    bx2 = (int)arg_8;
    es2 = (int)(arg_8 >> 16);
    if (*(char far *)MK_FP(es2, bx2) <= B_D4C1) {
        goto L8;
    }
    *(char far *)MK_FP(es2, bx2) = B_D4C1;
L8:
    bx3 = (int)arg_8;
    es3 = (int)(arg_8 >> 16);
    if (*(char far *)MK_FP(es3, bx3 + 1) >= B_D4C1) {
        goto L7;
    }
    *(char far *)MK_FP(es3, bx3 + 1) = B_D4C1;
L7:
    arg_6 = (int)(far_b1073((char)(*(char *)((char *)&arg_4 + 0) + 1)) >> 16);
L3:
    return ((long)arg_6 << 16 | (unsigned)arg_0);
}
