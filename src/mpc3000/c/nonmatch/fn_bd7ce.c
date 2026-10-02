/* differs: 308 at +5, 669 bytes; 311 at +5, 669 bytes; 312 at +5, 669 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1020];
    int f_3fc;
    int f_3fe;
};
struct s2 {
    char pad_0[628];
    int f_274;
    int f_276;
};
extern char B_7B8D;
extern char TBL_83D1[];
extern char TBL_83D3[];
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1ad0();
extern int far far_b1b05();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b6cd3();
extern long far far_b90dd();

long far fn_bd7ce(int arg_0, int arg_2)
{
    int loc_2;
    char loc_3;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    struct s2 near *ax17;
    int ax18;
    int ax19;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    struct s2 near *ax7;
    int ax8;
    int ax9;
    struct s1 near *bx;
    struct s1 near *bx2;
    struct s1 near *bx3;
    int p12;
    long t1;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    long t16;
    int t17;
    int t18;
    int t19;
    long t2;
    int t3;
    long t4;
    long t5;
    int t6;
    int t7;
    long t8;
    long t9;

    t1 = far_b6cd3(arg_0, arg_2);
    far_b1b05(MK_FP(SEG_DATA, 0x3e1d));
    t2 = far_b90dd();
    far_b1ad0(7, 0);
    ax3 = far_b1b05(MK_FP(SEG_DATA, 0x3edb));
    do {
        t3 = far_b08f7(1);
    } while (t3 == 0);
    if (t3 != 120) {
        return ((long)UNDEF << 16 | (unsigned)t3);
    }
    t4 = far_b6cd3(arg_0, arg_2);
    far_b1b05(MK_FP(SEG_DATA, 0x3ee9));
    far_b1ad0(4, 0);
    loc_3 = (char)0;
    t5 = far_b362e(MK_FP(SEG_DATA, 0x3f60), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), MK_FP(SEG_DATA, 0x378), 4);
    far_b1ad0(4, 15);
    t6 = far_b1b05(MK_FP(SEG_DATA, 0x3f6b));
    ax7 = (struct s2 near *)(loc_3 << 2);
    far_b1b05(*(long *)((char near *)ax7 + 628));
    far_b1b05(MK_FP(SEG_DATA, 0x3dd6));
    t7 = far_b1ad0(5, 0);
    if (loc_3 == 0) {
        loc_2 = TBL_83D1[loc_3];
    } else {
        loc_2 = TBL_83D3[loc_3];
    }
    t8 = far_b3819(MK_FP(SEG_DATA, 0x3f6d), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 2, 35, 98, 8);
    far_b1ad0(5, 16);
    far_b1b05(MK_FP(SEG_DATA, 0x3f7b));
    far_b1ad0(5, 26);
    bx = (struct s1 near *)(loc_2 << 2);
    far_b1b05(*(long *)((char near *)bx + 1020));
    t9 = far_b90dd();
    far_b1ad0(7, 0);
    p12 = 0x3def;
    ax15 = far_b1b05(MK_FP(SEG_DATA, p12));
    for (;;) {
        t19 = far_b08f7(1);
        if (t19 == 0) {
            ax16 = B_7B8D;
            if (ax16 != 0) {
                if (ax16 == 1) {
                    if (loc_3 == 0) {
                        TBL_83D1[loc_3] = *(char *)((char *)&loc_2 + 0);
                    } else {
                        TBL_83D3[loc_3] = *(char *)((char *)&loc_2 + 0);
                    }
                    t10 = far_b1ad0(5, 26);
                    bx2 = (struct s1 near *)(loc_2 << 2);
                    p12 = bx2->f_3fc;
                    t11 = far_b1b05(((long)bx2->f_3fe << 16 | (unsigned)p12));
                    continue;
                }
                continue;
            }
            t12 = far_b1ad0(4, 15);
            t13 = far_b1b05(MK_FP(SEG_DATA, 0x3f6b));
            ax17 = (struct s2 near *)(loc_3 << 2);
            t14 = far_b1b05(*(long *)((char near *)ax17 + 628));
            t15 = far_b1b05(MK_FP(SEG_DATA, 0x3dd6));
            if (loc_3 == 0) {
                loc_2 = TBL_83D1[loc_3];
            } else {
                loc_2 = TBL_83D3[loc_3];
            }
            t16 = far_b1073(1);
            t17 = far_b1ad0(5, 26);
            bx3 = (struct s1 near *)(loc_2 << 2);
            p12 = bx3->f_3fc;
            t18 = far_b1b05(((long)bx3->f_3fe << 16 | (unsigned)p12));
            continue;
        }
        break;
    }
    if (t19 != 120) {
        return ((long)UNDEF << 16 | (unsigned)t19);
    }
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x3df9));
    return ((long)UNDEF << 16 | (unsigned)t19);
}
