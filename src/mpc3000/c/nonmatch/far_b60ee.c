/* differs: 308 absent; 311 at +6, 171 bytes; 312 at +6, 172 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern unsigned char B_7AC3;
extern char B_D5DD;
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern long far far_b362e(void far *, unsigned char far *, void far *);
extern long far far_b3b9f(void);
extern long far far_b6cd3(int);
extern long far far_b90dd(void);
extern long far far_cad00(void);
extern long far far_d549d(void);
extern long far far_d5b6a(void);

long far far_b60ee(void)
{
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int dx;
    long t1;
    long t10;
    long t2;
    long t3;
    int t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_b6cd3(0x2800);
    B_D5DD = (char)73;
    far_b1ad0(1);
    far_b1b05(0x280c);
    far_b1b05(0x2834);
    far_b1ad0(4);
    t2 = far_b362e(MK_FP(SEG_DATA, 0x284f), (unsigned char far *)&B_7AC3, MK_FP(SEG_DATA, 0x60c));
    t3 = far_b90dd();
    t4 = far_b1b05(0x2855);
    loc_2 = B_7AC3;
    for (;;) {
        t5 = far_b08f7();
        dx = t5;
        if (t5 != 0) {
            break;
        }
        t9 = far_d5b6a();
        t10 = far_b1073();
    }
    if (dx == 120) {
        if (loc_2 == 0 && B_7AC3 != 0 && (int)far_d549d() != 0) {
            t6 = far_b3b9f();
            t7 = far_d5b6a();
        }
        t8 = far_cad00();
        dx = 0;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far far_b6cd3(int p0) { return 0; }
