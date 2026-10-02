/* differs: 308 at +C, 349 bytes; 311 at +C, 349 bytes; 312 at +C, 346 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern char B_8802;
extern char B_8803;
extern unsigned char B_8804;
extern char B_901B;
extern char B_9456;
extern char B_A5C1;
extern int W_87FE;
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern int far far_b1d48(void far *, int);
extern long far far_b3b9f(int);
extern long far far_b3cdb(int, int, int);
extern long far far_b3dda(void);
extern int far far_deee8(char far *, int);
extern long far far_e562e(void);
extern int far far_e5796(char);
extern long far far_e5a99(char far *);
extern long far far_e603d(int);
extern int far far_e60a8(void);
extern long far far_e6fef(void);

long far fn_dfab9(void)
{
    int loc_2;
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
    long t1;
    int t10;
    int t11;
    long t2;
    int t3;
    long t4;
    long t5;
    long t6;
    long t7;
    int t8;
    long t9;

    if (B_A5C1 != 0) {
        return ((long)dx << 16 | (unsigned)1);
    }
    if (B_8800 == 0) {
        goto L1;
    }
    if ((int)far_e603d(B_8804 - 1) > 0x3e7) {
        t1 = far_e6fef();
        far_b1af9();
        t2 = far_b3b9f(-13);
        B_8802 = (char)0;
        B_9456 = (char)0;
        far_b1aff();
        return ((long)UNDEF << 16 | (unsigned)1);
    }
    t3 = far_e60a8();
    loc_2 = t3;
    if (t3 != 0) {
        t4 = far_e6fef();
        far_b1af9();
        t5 = far_b3cdb(102, 3, 43);
        far_b1ad0(2, 5);
        far_b1d48(MK_FP(SEG_DATA, 0x72d9), loc_2);
        far_b1ad0(7, 0);
        far_b1b05(MK_FP(SEG_DATA, 0x72dd));
        t6 = far_b3dda();
        B_8802 = (char)0;
        B_9456 = (char)0;
        far_b1aff();
        return ((long)UNDEF << 16 | (unsigned)1);
    }
    dx = (int)(far_e5a99((char far *)&B_901B) >> 16);
    if (B_9456 != 0) {
        t7 = far_e6fef();
        t8 = far_b1af9();
        t9 = far_b3b9f(B_9456);
        B_8802 = (char)0;
        B_9456 = (char)0;
        far_b1aff();
        return ((long)UNDEF << 16 | (unsigned)1);
    }
L1:
    if (B_901B < 0) {
        if (B_8800 != 0) {
            t10 = far_e5796(B_8803);
            if (t10 <= W_87FE) {
                t11 = far_deee8((char far *)&B_901B, t10);
                dx = (int)(far_e562e() >> 16);
L2:
                return ((long)dx << 16 | (unsigned)0);
            }
            return ((long)t10 << 16 | (unsigned)-1);
        }
        return (long)MK_FP((int)(far_e6fef() >> 16), 1);
    }
    goto L2;
}
