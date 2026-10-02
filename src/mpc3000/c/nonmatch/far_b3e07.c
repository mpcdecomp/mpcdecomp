/* differs: 308 at +6, 215 bytes; 311 at +6, 214 bytes; 312 at +6, 214 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_83CF;
extern unsigned char B_8805[];
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern long far far_b3471();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b90dd();
extern long far far_deeab();
extern long far far_e4d15();
extern long far far_e57c8();
extern long far far_ec03b();

long far far_b3e07(void)
{
    char loc_14[20];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int p26;
    int p28;
    int p30;
    long t1;
    long t10;
    long t11;
    int t12;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_ec03b(0x1e16);
    t2 = far_b362e(MK_FP(SEG_DATA, 0x1e25), (unsigned char far *)B_8805, MK_FP(SEG_DATA, 48));
    t3 = far_b3819(MK_FP(SEG_DATA, 0x1e2d), (char far *)&B_83CF, 2, 1, 99);
    t4 = far_e4d15(B_83CF, -1, loc_14);
    p28 = (int)(unsigned)loc_14;
    p30 = SEG_DATA;
    t5 = far_b3471(0x1e39, p30, MK_FP(SEG_STACK, p28));
    far_b1ad0(2);
    far_b1b05(0x1e3b);
    p26 = 0x1e63;
    far_b1b05(p26);
    t6 = far_b90dd();
    for (;;) {
        t12 = far_b08f7();
        *(int *)((char *)&loc_14 + 18) = t12;
        if (t12 != 0) {
            break;
        }
        ax4 = B_7B8D;
        if (ax4 != 0) {
            if (ax4 != 1) {
                if (ax4 != 2) {
                    continue;
                }
                t7 = far_e57c8(B_83CF, -1, loc_14);
L1:
                p26 = (int)(unsigned)loc_14;
                p28 = -1;
                p30 = B_83CF;
                t8 = far_e4d15(p30, p28, p26);
                t9 = far_b1073();
                t10 = far_deeab();
                continue;
            }
            goto L1;
        }
        t11 = far_deeab();
    }
    return ((long)UNDEF << 16 | (unsigned)t12);
}
