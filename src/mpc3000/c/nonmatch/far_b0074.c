/* differs: 308 at +45, 102 bytes; 311 at +64, 76 bytes; 312 at +64, 76 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8437;
extern unsigned char B_901B[];
extern long far far_b0002(void);
extern long far far_b0524(void);
extern long far far_b0541(void);
extern int far far_b1ab2(int);
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern long far far_ba179(void);
extern long far far_c04ab(void);
extern long far far_cad00(int);
extern long far far_d5be8(void);
extern long far far_d7adf(int);
extern int far far_da79d(void);
extern long far far_deabe(void);
extern void far far_deb3f(void);
extern long far far_e51be(unsigned char far *, int, int);
extern int far far_e931c(void);
extern int far far_ead2e(void);
extern long far fn_b0141(int, int);
extern void far fn_b034e(void);
long far far_b0002(void) { return 0; }

long far far_b0074(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int si;
    long t1;
    int t10;
    int t11;
    long t12;
    long t13;
    int t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    int t9;

    si = 0;
    far_e931c();
    far_ead2e();
    t1 = far_deabe();
    far_deb3f();
    far_da79d();
    t3 = far_ba179();
    t4 = far_e51be((unsigned char far *)B_901B, 1, 1);
    t5 = far_b0524();
    t6 = far_b0541();
    far_b1ab2(0);
    t7 = far_b0002();
    far_b1b05(MK_FP(SEG_DATA, 0x11d3));
    t8 = far_cad00(0);
    fn_b034e();
    if (UNDEF != 0) {
        t10 = far_b1af9();
        si = (int)fn_b0141(0, si);
        ax6 = far_b1aff();
    }
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x11f9));
    if ((int)far_d5be8() != 0) {
        t11 = far_b1af9();
        t12 = fn_b0141(1, si);
        ax9 = far_b1aff();
    }
    if (B_8437 != 0) {
        t13 = far_d7adf(-120);
    }
    return far_c04ab();
}
long far fn_b0141(int p0, int p1) { return 0; }
void far fn_b034e(void) { }
