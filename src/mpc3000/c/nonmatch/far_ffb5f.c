/* differs: 308 at +3, 94 bytes; 311 at +3, 94 bytes; 312 at +3, 94 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_F77B;

int far far_ffb5f(long arg_0, int arg_2, int arg_4)
{
    int bx;
    int es;

    if (arg_4 == 0) {
        goto L1;
    }
    if (B_F77B < 35) {
        goto L2;
    }
    if (B_F77B > 98) {
        goto L2;
    }
    if (*(char far *)MK_FP(arg_2, B_F77B + *(int *)((char *)&arg_0 + 0) - 35) != 0) {
        goto L3;
    }
    return 0;
L2:
    return 0;
L1:
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    if ((unsigned char)*(char far *)MK_FP(es, bx) > B_F77B) {
        goto L4;
    }
    if ((unsigned char)*(char far *)MK_FP(es, bx + 1) >= B_F77B) {
        goto L3;
    }
L4:
    return 0;
L3:
    return 1;
}
