/* differs: 308 at +5, 640 bytes; 311 at +5, 704 bytes; 312 at +5, 703 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_D5DE;
extern long far L_c5247(char far *, char far *, int far *);
extern long far L_c52b0(char far *, int);
extern int far far_b08f7(char);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1d48(void far *, int, int);
extern long far far_b362e(void far *, int far *, char far *, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_cca70(void);
extern long far far_ccbdd(int, long);
extern long far far_d7a79(void);
extern int far far_e821c(void);
extern int far far_e8248(void);
extern long far fn_bab60(long);
extern long far fn_baeca(char far *);
extern void far fn_bafcb(int);
extern long far fn_bb591(long, long);
long far L_c5247(char far *p0, char far *p1, int far *p2) { return 0; }
long far L_c52b0(char far *p0, int p1) { return 0; }
long far fn_bab60(long p0) { return 0; }
long far fn_baeca(char far *p0) { return 0; }
void far fn_bafcb(int p0) { }
long far fn_bb591(long p0, long p1) { return 0; }

long far far_bb9e3(void)
{
    char loc_4[4];
    int loc_6;
    int loc_8;
    char loc_806[2046];
    int ax;
    int ax2;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int di;
    int dx;
    int si;
    long t1;
    long t10;
    int t11;
    long t12;
    long t13;
    long t14;
    int t15;
    int t16;
    long t17;
    int t18;
    long t19;
    int t2;
    long t20;
    int t21;
    int t22;
    long t23;
    long t24;
    int t25;
    int t26;
    long t3;
    int t4;
    long t5;
    long t6;
    long t7;
    int t8;
    long t9;

    loc_8 = 0;
    *(int *)((char *)&loc_806 + 2044) = 1;
    si = 0;
    di = 0;
    goto L1;
L2:
    t13 = far_b6cd3(MK_FP(SEG_DATA, 0x3920));
    t14 = far_b90dd();
    ax = far_b1b05(MK_FP(SEG_DATA, 0x39af));
    if (*(int *)((char *)&loc_806 + 2044) == 0) {
        goto L3;
    }
    t1 = far_ccbdd(0, -1L);
    t2 = far_e821c();
    t3 = fn_baeca((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_806));
    di = (int)t3;
    t4 = far_e8248();
    if (di >= 0) {
        goto L4;
    }
    fn_bafcb(di);
    return ((long)UNDEF << 16 | (unsigned)B_D5DE);
L4:
    *(int *)((char *)&loc_806 + 2044) = 0;
L3:
    t16 = far_b1ad0(1, 0);
    t17 = far_b362e(MK_FP(SEG_DATA, 0x39bf), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_806), 20);
    t18 = far_b1ad0(1, 29);
    bx = (int)(unsigned)(loc_806 + (loc_8 << 2));
    t19 = fn_bab60(*(long far *)MK_FP(SEG_STACK, bx));
    t20 = t19 / 0x400L;
    t21 = far_b1d48(MK_FP(SEG_DATA, 0x39c5), (int)t20, (int)(t20 >> 16));
    t22 = far_b1ad0(2, 24);
    t23 = far_cca70();
    t24 = ((long)((int)(t23 >> 16) << 1 | (unsigned int)(int)t23 >> 15 & 1) << 16 | (unsigned)((int)t23 << 1)) / 0x400L;
    t25 = far_b1d48(MK_FP(SEG_DATA, 0x39cf), (int)t24, (int)(t24 >> 16));
    loc_6 = (int)L_c52b0((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_806), loc_8);
    *(int *)((char *)&loc_4 + 2) = 0;
    if (di == 0) {
        goto L5;
    }
    *(int *)((char *)&loc_4 + 2) = 2;
L5:
    ax2 = (int)far_d7a79();
    goto L6;
L7:
    t8 = far_b1ad0(1, 29);
    bx5 = (int)(unsigned)(loc_806 + (loc_8 << 2));
    t9 = fn_bab60(*(long far *)MK_FP(SEG_STACK, bx5));
    t10 = t9 / 0x400L;
    t11 = far_b1d48(MK_FP(SEG_DATA, 0x39c5), (int)t10, (int)(t10 >> 16));
    t12 = L_c52b0((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_806), loc_8);
    loc_6 = (int)t12;
L6:
    t26 = far_b08f7(loc_4[2]);
    dx = UNDEF;
    si = t26;
    if (t26 == 0) {
        goto L7;
    }
    if (t26 == 120) {
        goto L8;
    }
    if (t26 == 121) {
        goto L9;
    }
    goto L1;
L9:
    if (loc_6 != -1) {
        goto L10;
    }
    si = 0;
    goto L1;
L10:
    loc_6 = -1;
L8:
    si = 0;
    if (loc_6 < 0) {
        goto L11;
    }
    *(int *)((char *)&loc_4 + 0) = loc_8;
    t5 = L_c5247((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_806), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6));
    bx2 = (int)(unsigned)(loc_806 + (loc_6 << 2));
    bx3 = (int)(unsigned)(loc_806 + (*(int *)((char *)&loc_4 + 0) << 2));
    t6 = fn_bb591(*(long far *)MK_FP(SEG_STACK, bx3), *(long far *)MK_FP(SEG_STACK, bx2));
    dx = (int)(t6 >> 16);
    if ((int)t6 != 1) {
        goto L1;
    }
    si = B_D5DE;
    goto L1;
L11:
    bx4 = (int)(unsigned)(loc_806 + (loc_8 << 2));
    t7 = fn_bb591(*(long far *)MK_FP(SEG_STACK, bx4), 0L);
    dx = (int)(t7 >> 16);
    if ((int)t7 != 1) {
        goto L1;
    }
    si = B_D5DE;
L1:
    if (si != 0) {
        goto L12;
    }
    goto L2;
L12:
    return ((long)dx << 16 | (unsigned)si);
}
