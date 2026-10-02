/* differs: 308 at +3, 281 bytes; 311 at +3, 281 bytes; 312 at +3, 281 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long FP_E40C;
extern unsigned char TBL_da86f[];

long far far_da7e0(int arg_0, char arg_2)
{
    unsigned int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int cx;
    int dx;
    int es;
    int es2;
    int es3;
    int es4;
    long t1;

    ax = arg_2;
    if (ax > 3) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(TBL_da86f + (ax << 1))) {
    case 0:
        goto L2;
    case 1:
        goto L3;
    case 2:
        goto L4;
    case 3:
        goto L5;
    }
L2:
    bx4 = (int)FP_E40C;
    es4 = (int)(FP_E40C >> 16);
    cx = (*(char far *)MK_FP(es4, bx4 + 18) - -(*(char far *)MK_FP(es4, bx4 + 18) < 0) >> 1) + 64;
    dx = (*(char far *)MK_FP(es4, bx4 + 19) - -(*(char far *)MK_FP(es4, bx4 + 19) < 0) >> 1) + 64;
    goto L1;
L3:
    bx3 = (int)FP_E40C;
    es3 = (int)(FP_E40C >> 16);
    cx = *(char far *)MK_FP(es3, bx3 + 20);
    dx = *(char far *)MK_FP(es3, bx3 + 21);
    goto L1;
L4:
    bx2 = (int)FP_E40C;
    es2 = (int)(FP_E40C >> 16);
    cx = *(char far *)MK_FP(es2, bx2 + 22);
    dx = *(char far *)MK_FP(es2, bx2 + 23);
    goto L1;
L5:
    bx = (int)FP_E40C;
    es = (int)(FP_E40C >> 16);
    cx = *(char far *)MK_FP(es, bx + 24) + 50;
    dx = *(char far *)MK_FP(es, bx + 25) + 50;
L1:
    t1 = (long)(int)(dx - cx) * (long)(signed char)*(char *)((char *)&arg_0 + 0);
    ax2 = (int)t1 / 127;
    return ((long)((int)t1 % 127) << 16 | (unsigned)((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 + (char)cx)));
}
