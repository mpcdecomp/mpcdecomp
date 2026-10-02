/* differs: 308 at +5, 282 bytes; 311 at +5, 281 bytes; 312 at +5, 279 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_cad6d(void far *, int, int);
extern int far far_cb566(void far *, long, long, int);
extern long far timing_calc_rate(int);

long far fn_d9451(int arg_0, int arg_2, long arg_4, int arg_8)
{
    int loc_2;
    int loc_4;
    int far *loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    unsigned int loc_10;
    int loc_12;
    int ax;
    int ax2;
    int ax3;
    int di;
    int flags;
    int si;
    int si2;
    int t1;
    int t2;

    loc_2 = 0x1200;
    t1 = far_cad6d(MK_FP(0xa28f /* SEG_A28F */, 0x1200), arg_0, arg_8);
    if (t1 >= 0) {
        goto L1;
    }
    return ((long)t1 << 16 | (unsigned)t1);
L1:
    di = 0;
    si = loc_2;
    loc_12 = loc_2 + arg_8;
    goto L2;
L3:
    ax3 = ((char)(0xa28f /* SEG_A28F */ >> 8) << 8 | (unsigned char)*(char far *)MK_FP(0xa28f /* SEG_A28F */, si + 1));
    loc_8 = (unsigned char)*(char far *)MK_FP(0xa28f /* SEG_A28F */, si);
    loc_a = (unsigned char)(char)ax3 & 240;
    loc_c = (unsigned char)*(char far *)MK_FP(0xa28f /* SEG_A28F */, si + 2);
    *(char far *)MK_FP(0xa28f /* SEG_A28F */, di) = (char)((unsigned char)(char)ax3 << 4);
    *(char far *)MK_FP(0xa28f /* SEG_A28F */, di + 1) = *(char *)((char *)&loc_8 + 0);
    *(char far *)MK_FP(0xa28f /* SEG_A28F */, di + 2) = *(char *)((char *)&loc_a + 0);
    *(char far *)MK_FP(0xa28f /* SEG_A28F */, di + 3) = *(char *)((char *)&loc_c + 0);
    di = di + 4;
    si = si + 3;
L2:
    if (loc_12 > si) {
        goto L3;
    }
    ax = (si - loc_2) / 3 << 1;
    loc_e = -(ax < 0);
    loc_10 = ax;
    loc_4 = 0xa28f /* SEG_A28F */;
    *(int *)((char *)&loc_6 + 0) = 0;
    si2 = 0;
    goto L4;
L5:
    *loc_6 = (int)timing_calc_rate(*loc_6);
    *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 2;
    si2 = si2 + 1;
L4:
    ax2 = si2;
    flags = -(ax2 < 0) - loc_e;
    if (CC("<", flags)) {
        goto L5;
    }
    if (CC("!=", flags)) {
        goto L6;
    }
    if ((unsigned int)ax2 < loc_10) {
        goto L5;
    }
L6:
    t2 = far_cb566(MK_FP(0xa28f /* SEG_A28F */, 0), *(long *)((char *)&arg_2 + 0), *(long *)((char *)&loc_10 + 0), 0);
    return ((long)UNDEF << 16 | (unsigned)0);
}
