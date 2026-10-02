/* differs: 308 at +5, 376 bytes; 311 at +5, 377 bytes; 312 at +5, 377 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int TBL_6F4C[];
extern long far far_fa0c8(int, int, int);
extern long far fn_c2aec(void);
long far fn_c2aec(void) { return 0; }

long far far_c2b07(char far *arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int bx;
    int cx;
    int di;
    int dx;
    int es;
    int si;
    int si2;
    long t1;
    long t2;

    if (*arg_0 != 0) {
        goto L1;
    }
    return fn_c2aec();
L1:
    outpw(96, 0xa0b);
    outpw(98, 0);
    outpw(100, 1);
    si = 1;
    di = 0;
    loc_6 = *(int *)((char *)&arg_0 + 0) + 8;
    loc_8 = *(int *)((char *)&arg_0 + 0);
L2:
    ax = *(int far *)MK_FP(arg_2, loc_6);
    loc_2 = -(ax < 0);
    loc_4 = ax;
    t1 = far_fa0c8(ax, 0x1b9, 0);
    loc_2 = (int)(t1 >> 16);
    loc_4 = (int)t1;
    t2 = t1 / 10L;
    loc_2 = (int)(t2 >> 16);
    loc_4 = (int)t2;
    cx = -1 - loc_4;
    es = arg_2;
    ax2 = ((char)((int)t2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, loc_8 + 5));
    loc_a = (unsigned char)(char)ax2;
    ax3 = TBL_6F4C[100 - (unsigned char)(char)ax2];
    dx = ((char)((int)(t2 >> 16) >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, loc_8 + 2));
    loc_c = (unsigned char)(char)dx;
    ax4 = si;
    si2 = si + 1;
    outpw(96, ax4 + 0xa00);
    outpw(98, ax3 * (unsigned char)(char)dx >> 1 & -4);
    outpw(100, cx);
    bx = (unsigned int)(TBL_6F4C[loc_a] * loc_c) >> 1 & -4 | 1;
    outpw(96, si2 + 0xa00);
    outpw(98, bx);
    outpw(100, cx);
    ax5 = (unsigned char)*(char far *)MK_FP(es, loc_8 + 20) * 0x144;
    si = si2 + 2;
    outpw(96, si2 + 0xa01);
    outpw(98, ax5 | 3);
    outpw(100, cx);
    loc_6 = loc_6 + 2;
    loc_8 = loc_8 + 1;
    di = di + 1;
    if (di >= 3) {
        goto L3;
    }
    goto L2;
L3:
    return ((long)100 << 16 | (unsigned)cx);
}
