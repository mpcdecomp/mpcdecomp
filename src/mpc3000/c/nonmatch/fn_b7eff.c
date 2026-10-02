/* differs: 308 at +5, 89 bytes; 311 at +5, 83 bytes; 312 at +5, 83 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern char B_D5DD;
extern char B_D5DE;
extern int far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3819(void far *, int far *, int, int, int, int);
extern long far far_b3b9f(int);
extern long far far_b6cd3(void far *);
extern long far far_b8f3e(int, int, int);
extern long far far_b9102(void);
extern long far far_e13f9(int, int);
extern long far far_e6006(void);

long far fn_b7eff(void)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int ax;
    int ax2;
    int ax3;
    int dx;
    long t1;
    long t10;
    long t11;
    long t12;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    int t7;
    int t8;
    int t9;

    B_D5DD = (char)7;
    loc_2 = B_8A9F;
    loc_4 = (int)far_e6006();
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x30ab));
    far_b1ad0(2, 0);
    t2 = far_b3819(MK_FP(SEG_DATA, 0x30c8), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 99, 8);
    t3 = far_b8f3e(loc_2, 2, 23);
    far_b1ad0(3, 0);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x30de), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 2, 1, 99, 8);
    t5 = far_b8f3e(loc_4, 3, 23);
    t6 = far_b9102();
    goto L1;
L2:
    t11 = far_b8f3e(loc_2, 2, 23);
    t12 = far_b8f3e(loc_4, 3, 23);
L1:
    t7 = far_b08f7(1);
    dx = t7;
    if (t7 == 0) {
        goto L2;
    }
    if (dx != 120) {
        goto L3;
    }
    t8 = far_b1ad0(7, 0);
    t9 = far_b1b05(MK_FP(SEG_DATA, 0x30f4));
    t10 = far_e13f9(loc_2, loc_4);
    loc_6 = (int)t10;
    if ((int)t10 == 0) {
        goto L4;
    }
    ax3 = (int)far_b3b9f((int)t10);
L4:
    dx = B_D5DE;
L3:
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b8f3e(int p0, int p1, int p2) { return 0; }
long far far_b9102(void) { return 0; }
