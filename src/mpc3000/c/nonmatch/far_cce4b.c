/* differs: 308 at +5, 739 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_D65D {
    int f_0;
};
struct g_TBL_D65F {
    int f_0;
};
extern struct g_TBL_D65D TBL_D65D;
extern struct g_TBL_D65F TBL_D65F;
extern int W_E3A6;
extern int W_E3A8;
extern long far far_cca70(void);
extern long far far_ccbdd(char, long);
extern long far far_cd003(int);
extern long far far_cd063(void);
extern int far far_cd551(char far *);
extern long far far_cdb31(char far *, int);
extern long far fn_ccaf6(long, int);
long far far_cca70(void) { return 0; }
long far far_ccbdd(char p0, long p1) { return 0; }
long far fn_ccaf6(long p0, int p1) { return 0; }

long far far_cce4b(long arg_0, int arg_2, unsigned int arg_4, int arg_6, int arg_8)
{
    char loc_1c[18];
    int loc_a;
    unsigned long loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int bx;
    int bx2;
    unsigned int cx;
    int cx2;
    int cx3;
    unsigned int cx4;
    int cx5;
    int cx6;
    int di;
    int di2;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int flags;
    int flags2;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;

    cx = ~__repne_scas1((int)arg_0, 0, -1);
    ax = arg_2;
    si = *(int *)((char *)&arg_0 + 0);
    dx = 17 - cx;
    if (cx <= 17) {
        goto L1;
    }
    cx = cx + dx;
    dx = 0;
L1:
    cx2 = cx >> 1;
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), ((long)ax << 16 | (unsigned)si), cx2 * 2);
    di = (int)(unsigned)(loc_1c + cx2 * 2);
    cx3 = cx & 1;
    __movs1(MK_FP(SEG_STACK, di), ((long)ax << 16 | (unsigned)(si + cx2 * 2)), cx3);
    __stos1(MK_FP(SEG_STACK, di + cx3), 0, dx);
    t1 = far_cdb31((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), 16);
    if (far_cd551((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c)) < 0) {
        goto L2;
    }
    return ((long)UNDEF << 16 | (unsigned)-1);
L2:
    t2 = far_cd063();
    loc_2 = (int)t2;
    if ((int)t2 != -1) {
        goto L3;
    }
    return (long)MK_FP((int)(t2 >> 16), -3);
L3:
    ax2 = arg_6;
    dx2 = arg_4;
    loc_6 = ax2;
    *(int *)((char *)&loc_8 + 0) = dx2;
    if (arg_8 == 0) {
        goto L4;
    }
    *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + dx2;
    loc_6 = (int)(loc_8 + ((long)ax2 << 16 | (unsigned)dx2) >> 16);
L4:
    t3 = fn_ccaf6(loc_8, loc_2);
    loc_4 = (int)t3;
    if ((int)t3 >= 0) {
        goto L5;
    }
    t4 = far_cca70();
    dx3 = (int)(t4 >> 16);
    flags = dx3 - loc_6;
    if (CC("<", flags)) {
        goto L6;
    }
    if (CC("!=", flags)) {
        goto L7;
    }
    if ((unsigned int)(int)t4 < (unsigned int)*(int *)((char *)&loc_8 + 0)) {
        goto L6;
    }
L7:
    t5 = far_ccbdd(*(char *)((char *)&loc_2 + 0), loc_8);
    dx3 = (int)(t5 >> 16);
    loc_4 = (int)t5;
L6:
    if (loc_4 >= 0) {
        goto L5;
    }
    return ((long)dx3 << 16 | (unsigned)-2);
L5:
    t6 = (long)(int)loc_2 * 36L;
    cx4 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), 0, -1);
    dx4 = 16 - cx4;
    if (cx4 <= 16) {
        goto L8;
    }
    cx4 = cx4 + dx4;
    dx4 = 0;
L8:
    cx5 = cx4 >> 1;
    __movs2(MK_FP(0xa853 /* SEG_A28F */, (int)t6 + 0x4800), MK_FP(SEG_STACK, (int)t6 + 0x4800), cx5 * 2);
    di2 = (int)t6 + 0x4800 + cx5 * 2;
    cx6 = cx4 & 1;
    __movs1(MK_FP(0xa853 /* SEG_A28F */, di2), MK_FP(SEG_STACK, (int)t6 + 0x4800 + cx5 * 2), cx6);
    __stos1(MK_FP(0xa853 /* SEG_A28F */, di2 + cx6), 0, dx4);
    t7 = (long)(int)loc_2 * 36L;
    t8 = (long)(int)loc_4 * 10L;
    loc_a = (int)t8;
    dx5 = *(int *)((char *)&TBL_D65D + 0 + (int)t8);
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t7 + 0x4822) = *(int *)((char *)&TBL_D65F + 0 + (int)t8);
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t7 + 0x4820) = dx5;
    flags2 = arg_6;
    if (CC(">", flags2)) {
        goto L9;
    }
    if (CC("<", flags2)) {
        goto L10;
    }
    if (arg_4 >= 0x1b9) {
        goto L9;
    }
L10:
    arg_6 = 0;
    arg_4 = 0x1b9;
L9:
    bx = arg_4;
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t7 + 0x481e) = arg_6;
    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t7 + 0x481c) = bx;
    bx2 = loc_a;
    dx6 = *(int *)((char *)&TBL_D65D + 0 + bx2);
    W_E3A8 = *(int *)((char *)&TBL_D65F + 0 + bx2);
    W_E3A6 = dx6;
    *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t7 + 0x4813) = *(char *)((char *)&arg_8 + 0);
    return (long)MK_FP((int)(far_cd003(loc_2) >> 16), loc_2);
}
long far far_cd003(int p0) { return 0; }
long far far_cd063(void) { return 0; }
int far far_cd551(char far *p0) { return 0; }
long far far_cdb31(char far *p0, int p1) { return 0; }
