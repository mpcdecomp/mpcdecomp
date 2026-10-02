/* differs: 308 at +5, 388 bytes; 311 at +5, 387 bytes; 312 at +5, 387 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_fa6e5(int, int, int, int, int, int);

long far far_fdcfb(char far *arg_0, int arg_2, long arg_4, char arg_8)
{
    unsigned char loc_1;
    unsigned char loc_2;
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int cx;
    int cx2;
    int cx3;
    int dx;
    int es;
    int es2;
    int es3;
    int p10;
    long t1;

    loc_1 = (unsigned char)0;
    cx = ((char)(cx2 >> 8) << 8 | (unsigned char)0);
L1:
    if (*(char far *)MK_FP(0xa283 /* SEG_A28F */, (unsigned char)(char)cx * 36 + 0x4800) == 0) {
        goto L2;
    }
    arg_0[loc_1] = (char)cx;
    loc_1 = (unsigned char)(loc_1 + 1);
L2:
    cx = ((char)(cx >> 8) << 8 | (unsigned char)((char)cx + 1));
    if ((unsigned char)(char)cx < 128) {
        goto L1;
    }
    if (loc_1 != 0) {
        goto L3;
    }
    bx = (int)arg_4;
    es = (int)(arg_4 >> 16);
    *(int far *)MK_FP(es, bx + 2) = SEG_DATA;
    *(int far *)MK_FP(es, bx) = 0x3388;
    *(int far *)MK_FP(es, bx + 6) = 0;
    *(int far *)MK_FP(es, bx + 4) = 0;
    return (long)MK_FP(0xa283 /* SEG_A28F */, -1);
L3:
    ax = far_fa6e5(*(int *)((char *)&arg_0 + 0), arg_2, loc_1, 1, 0x22c3, -0x460);
    loc_2 = (unsigned char)0;
    if (arg_8 != 1) {
        goto L4;
    }
    bx2 = (int)arg_4;
    es2 = (int)(arg_4 >> 16);
    dx = *(int *)0x3399;
    *(int far *)MK_FP(es2, bx2 + 2) = *(int *)0x339b;
    *(int far *)MK_FP(es2, bx2) = dx;
    loc_2 = (unsigned char)1;
L4:
    cx3 = ((char)(UNDEF >> 8) << 8 | (unsigned char)0);
    if ((unsigned char)(char)cx3 >= loc_1) {
        goto L5;
    }
    ax2 = loc_2;
    goto L6;
L7:
    bx3 = (int)arg_4 + ((unsigned char)(char)cx3 + ax2 << 2);
    p10 = (int)(arg_4 >> 16);
    t1 = (long)(signed char)arg_0[(unsigned char)(char)cx3] * 36L;
    *(int far *)MK_FP(p10, bx3 + 2) = 0xa283 /* SEG_A28F */;
    *(int far *)MK_FP(p10, bx3) = (int)t1 + 0x4800;
    cx3 = ((char)(cx3 >> 8) << 8 | (unsigned char)((char)cx3 + 1));
L6:
    if ((unsigned char)(char)cx3 < loc_1) {
        goto L7;
    }
L5:
    es3 = (int)(arg_4 >> 16);
    bx4 = (int)arg_4 + ((unsigned char)(char)cx3 + loc_2 << 2);
    *(int far *)MK_FP(es3, bx4 + 2) = 0;
    *(int far *)MK_FP(es3, bx4) = 0;
    return ((long)loc_2 << 16 | (unsigned)loc_1);
}
