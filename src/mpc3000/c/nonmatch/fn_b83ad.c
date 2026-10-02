/* differs: 308 at +5, 398 bytes; 311 at +5, 399 bytes; 312 at +5, 398 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_92B8 {
    char f_0;
};
struct g_TBL_92B7 {
    char f_0;
};
extern char B_7B8D;
extern char B_8287;
extern char B_8288;
extern char B_901B;
extern char B_D5DD;
extern char B_D5DE;
extern int TBL_2DFE[];
extern struct g_TBL_92B7 TBL_92B7;
extern struct g_TBL_92B8 TBL_92B8;
extern int W_904B;
extern int W_9053;
extern int W_946C;
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b362e(void far *, char far *, void far *, int);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b9102(void);
extern long far far_e5a99(char far *);
extern long far far_e6a45(int, int, int, int);
extern long far fn_b8557(int);

long far fn_b83ad(void)
{
    int loc_2;
    char loc_5[3];
    char loc_8[3];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int dx;
    int dx2;
    int p16;
    int si;
    long t1;
    int t10;
    int t11;
    int t12;
    long t13;
    long t2;
    int t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    ax = W_9053;
    *(int *)((char *)&loc_8 + 0) = ax;
    if (ax <= W_904B) {
        goto L1;
    }
    *(int *)((char *)&loc_8 + 0) = W_904B;
L1:
    if (B_901B != -1) {
        goto L2;
    }
    return ((long)dx << 16 | (unsigned)0);
L2:
    B_D5DD = (char)11;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x2e5c));
    far_b1ad0(1, 0);
    t2 = far_b3819(MK_FP(SEG_DATA, 0x2e72), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), 3, 1, 0x3e7, 0);
    t3 = far_b1ad0(2, 0);
    loc_2 = B_8287;
    t4 = far_b3819(MK_FP(SEG_DATA, 0x2e94), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 1, 31, 8);
    loc_5[0] = B_8288;
    t5 = far_b362e(MK_FP(SEG_DATA, 0x2c41), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_5), MK_FP(SEG_DATA, 0x5c4), 2);
    far_b1ad0(3, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x2ea3));
    far_b1ad0(4, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x2ecc));
    far_b1ad0(5, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x2ef0));
    t6 = far_e5a99((char far *)&B_901B);
    p16 = 0xbdc0;
    si = (int)fn_b8557(*(int *)((char *)&loc_8 + 0));
    t7 = far_b9102();
    goto L3;
L4:
    if (B_7B8D != 0) {
        goto L3;
    }
    if (*(int *)((char *)&loc_8 + 0) <= W_904B) {
        goto L5;
    }
    *(int *)((char *)&loc_8 + 0) = W_904B;
    t8 = far_b1073(0);
L5:
    p16 = 0xbdc0;
    t9 = fn_b8557(*(int *)((char *)&loc_8 + 0));
    si = (int)t9;
L3:
    t10 = far_b08f7(1);
    dx2 = t10;
    if (t10 == 0) {
        goto L4;
    }
    if (dx2 != 120) {
        goto L6;
    }
    W_946C = *(int *)((char *)&loc_8 + 0);
    t11 = far_b1ad0(7, 0);
    t12 = far_b1b05(MK_FP(SEG_DATA, 0x2f12));
    ax9 = TBL_2DFE[loc_5[0]];
    *(int *)((char *)&loc_5 + 1) = ax9;
    t13 = far_e6a45(*(char *)((char *)&TBL_92B7 + 0 + (si << 2)), *(char *)((char *)&TBL_92B8 + 0 + (si << 2)), loc_2, ax9);
    dx2 = B_D5DE;
L6:
    return ((long)dx2 << 16 | (unsigned)dx2);
}
long far far_b9102(void) { return 0; }
long far fn_b8557(int p0) { return 0; }
