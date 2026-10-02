/* differs: 308 absent; 311 at +0, 158 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern char B_EFAC;
extern char B_EFAE;
extern char B_EFAF;
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far fn_c0274(int, int, void far *);

long far fn_bfff8(void)
{
    int ax;
    int dx;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    int t6;
    int t7;

    t1 = far_b1073(12);
    t2 = fn_c0274(B_EFAC, B_EFAE, MK_FP(SEG_DATA, -0x10fb));
    t3 = far_b1073(14);
    t4 = far_b1073(15);
    t5 = far_b1073(16);
    ax = (int)t5;
    dx = (int)(t5 >> 16);
    if (B_EFAE == 0) {
        t6 = far_b1ad0(5, 4);
        ax = far_b1b05(MK_FP(SEG_DATA, 0x49fa));
        dx = UNDEF;
    }
    if (B_EFAF == 0) {
        t7 = far_b1ad0(5, 19);
        ax = far_b1b05(MK_FP(SEG_DATA, 0x49fa));
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
long far fn_c0274(int p0, int p1, void far *p2) { return 0; }
