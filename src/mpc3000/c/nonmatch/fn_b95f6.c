/* differs: 308 at +6, 196 bytes; 311 at +6, 195 bytes; 312 at +6, 196 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9F;
extern unsigned char B_901B[];
extern char B_D4C2;
extern char B_D5DD;
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b3819(void far *, char far *, int, int, int);
extern long far far_b6cd3(int);
extern long far far_b8f3e(int, int);
extern long far far_b9102(void);
extern int far far_e0031(unsigned char near *);
extern int far far_e1e11(void);
extern long far far_e51be(unsigned char far *, int);

long far fn_b95f6(void)
{
    char loc_1;
    int ax;
    int ax2;
    int dx;
    long t1;
    int t10;
    long t11;
    long t12;
    int t2;
    long t3;
    long t4;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    t1 = far_b6cd3(0x3940);
    t2 = far_b1ad0(1);
    loc_1 = B_8A9F;
    t3 = far_b3819(MK_FP(SEG_DATA, 0x3950), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), 2, 1, 99);
    t4 = far_b8f3e(loc_1, 1);
    far_b1ad0(2);
    far_b1b05(0x395a);
    t5 = far_b9102();
    B_D5DD = (char)2;
    for (;;) {
        t6 = far_b08f7();
        dx = t6;
        if (t6 != 0) {
            break;
        }
        t11 = far_b8f3e(loc_1, 1);
        t12 = far_e51be((unsigned char far *)B_901B, loc_1);
    }
    if (t6 == 120) {
        t7 = far_b1ad0(7);
        t8 = far_b1b05(0x399f);
        t9 = far_e0031(B_901B);
        t10 = far_e1e11();
        dx = B_D4C2;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
