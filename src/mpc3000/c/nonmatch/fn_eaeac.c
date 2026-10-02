/* differs: 308 at +5, 396 bytes; 311 at +5, 396 bytes; 312 at +5, 396 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern unsigned char B_901B[];
extern unsigned char TBL_86AE[];
extern unsigned char W_87FE[];

long far fn_eaeac(int arg_0, int arg_2, unsigned int arg_4, unsigned long arg_6, int arg_8, int arg_10, int arg_12)
{
    int loc_2;
    long loc_4;
    int loc_6;
    char loc_a[4];
    int loc_c;
    int loc_e;
    int far *loc_10;
    int loc_12;
    int loc_14;
    int loc_16;
    int far *loc_18;
    int loc_1a;
    int loc_1c;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int cx;
    int cx2;
    int di;
    int dx;
    int es;
    int es2;
    int flags;
    long t1;
    long t2;

    loc_2 = arg_12;
    *(int *)((char *)&loc_4 + 0) = arg_10;
    if (B_8800 == 0) {
        goto L1;
    }
    if (arg_2 != SEG_DATA) {
        goto L1;
    }
    if (arg_0 != (unsigned int)(unsigned)B_901B) {
        goto L1;
    }
    loc_12 = SEG_DATA;
    loc_14 = (int)(unsigned)TBL_86AE;
    loc_16 = SEG_DATA;
    *(int *)((char *)&loc_18 + 0) = (int)(unsigned)W_87FE;
    goto L2;
L1:
    ax = arg_2;
    loc_12 = ax;
    loc_14 = arg_0 + 0x29a;
    loc_16 = ax;
    *(int *)((char *)&loc_18 + 0) = arg_0 + 48;
L2:
    loc_e = loc_12;
    *(int *)((char *)&loc_10 + 0) = loc_14;
    *(int *)((char *)&loc_10 + 0) = *(int *)((char *)&loc_10 + 0) + 4;
    goto L3;
L4:
    *(int *)((char *)&loc_10 + 0) = *(int *)((char *)&loc_10 + 0) + 4;
L3:
    if ((unsigned int)*loc_10 <= arg_4) {
        goto L4;
    }
    *(int *)((char *)&loc_10 + 0) = *(int *)((char *)&loc_10 + 0) - 4;
    *(int *)((char *)&loc_a + 0) = arg_4;
    cx = 0;
    loc_1c = *loc_18 + 1;
    goto L5;
L6:
    es2 = FP_SEG(loc_10);
    di = (int)(0x180L / (long)(signed char)*(char far *)MK_FP(es2, FP_OFF(loc_10) + 3));
    t2 = (long)(int)di * (long)(signed char)*(char far *)MK_FP(es2, *(int *)((char *)&loc_10 + 0) + 2);
    loc_6 = -((int)t2 < 0);
    *(int *)((char *)&loc_10 + 0) = *(int *)((char *)&loc_10 + 0) + 4;
    dx = *loc_10;
    loc_1a = dx;
    if (dx != -1) {
        goto L7;
    }
    dx = loc_1c;
    cx = -1;
L7:
    bx2 = dx - *(int *)((char *)&loc_a + 0);
    *(int *)((char *)&loc_a + 0) = loc_1a;
    goto L8;
L9:
    ax2 = arg_8;
    flags = ax2 - loc_6;
    if (CC("<", flags)) {
        goto L10;
    }
    if (CC("!=", flags)) {
        goto L11;
    }
    if ((unsigned int)*(int *)((char *)&arg_6 + 0) < (unsigned int)(int)t2) {
        goto L10;
    }
L11:
    *(int *)((char *)&arg_6 + 0) = *(int *)((char *)&arg_6 + 0) - (int)t2;
    arg_8 = (int)(arg_6 - ((long)loc_6 << 16 | (unsigned)(int)t2) >> 16);
    arg_4 = arg_4 + 1;
    goto L12;
L10:
    cx = 1;
    goto L5;
L12:
    bx2 = bx2 - 1;
L8:
    if (bx2 > 0) {
        goto L9;
    }
L5:
    if (cx == 0) {
        goto L6;
    }
    if (cx != 1) {
        goto L13;
    }
    t1 = arg_6 / (long)(int)di;
    loc_c = *(int *)((char *)&arg_6 + 0) - (int)t1 * di;
    cx2 = (int)t1 + 1;
    arg_8 = 0;
    *(int *)((char *)&arg_6 + 0) = 0;
    goto L14;
L13:
    cx2 = 1;
    loc_c = 0;
L14:
    bx = (int)loc_4;
    es = (int)(loc_4 >> 16);
    *(char far *)MK_FP(es, bx) = *(char *)((char *)&loc_c + 0);
    *(char far *)MK_FP(es, bx + 1) = (char)cx2;
    *(int far *)MK_FP(es, bx + 2) = arg_4;
    return arg_6;
}
