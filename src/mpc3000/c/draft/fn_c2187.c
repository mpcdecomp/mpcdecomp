/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
struct s1 {
    char pad_0[3];
    char f_3;
};
struct s2 {
    char pad_0[1];
    char f_1;
};
struct s3 {
    char pad_0[2];
    char f_2;
};
struct g_FP_E40C {
    long f_0;
};
extern char B_7B8D;
extern char B_D4C0;
extern struct g_FP_E40C FP_E40C;
extern unsigned char TBL_c26d4[];
extern unsigned char TBL_c26e4[];
extern unsigned char TBL_c26f4[];
extern unsigned char TBL_c2700[];
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b362e(void far *, char far *, void far *, int);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b9045(int, int, int, int);
extern long far far_b90dd(void);
extern long far far_cbb70(int);
extern long far far_cbbd4(int);
extern long far fn_c2710(void);

long far fn_c2187(void)
{
    char loc_6;
    char loc_5;
    char loc_4;
    char loc_3;
    char loc_2;
    char loc_1;
    int ax;
    unsigned int ax2;
    int ax3;
    unsigned int ax4;
    unsigned int ax5;
    int ax6;
    unsigned int ax7;
    int dx;
    int p14;
    int p16;
    int p18;
    int si;
    int t1;
    long t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    long t16;
    struct s1 far *t17;
    struct s2 far *t18;
    struct s3 far *t19;
    long t2;
    char far *t20;
    long t21;
    long t22;
    int t23;
    long t24;
    int t25;
    int t26;
    char far *t27;
    long t28;
    struct s3 far *t29;
    int t3;
    long t30;
    struct s2 far *t31;
    long t32;
    struct s1 far *t33;
    long t34;
    long t35;
    int t36;
    int t37;
    int t38;
    int t39;
    int t4;
    int t40;
    long t41;
    struct s1 far *t42;
    long t43;
    long t44;
    int t45;
    long t46;
    int t47;
    int t48;
    int t49;
    int t5;
    char far *t50;
    long t51;
    struct s3 far *t52;
    long t53;
    struct s2 far *t54;
    long t55;
    struct s1 far *t56;
    long t57;
    struct s1 far *t58;
    long t59;
    int t6;
    long t60;
    int t61;
    int t62;
    int t7;
    int t8;
    int t9;

    dx = 0;
    while (dx == 0) {
        t45 = far_b1aac();
        t46 = far_b6cd3(MK_FP(SEG_DATA, 0x4b04));
        t47 = far_b1ad0(1, 0);
        loc_1 = B_D4C0;
        ax = (unsigned char)*(char far *)((char far *)FP_E40C.f_0 + -778 + loc_1 * 24);
        si = ax;
        if (ax != 255) {
            t1 = far_b1ad0(1, 29);
            t2 = (long)(int)si * 36L;
            if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t2 + 0x4813) == 0) {
                t4 = far_b1b05(MK_FP(SEG_DATA, 0x4b8f));
            } else {
                t3 = far_b1b05(MK_FP(SEG_DATA, 0x4b8a));
            }
        }
        t48 = far_b1ad0(2, 0);
        t49 = far_b1b05(MK_FP(SEG_DATA, 0x4b94));
        t50 = (char far *)far_cbb70(loc_1);
        loc_2 = *t50;
        t51 = far_b3819(MK_FP(SEG_DATA, 0x4bbd), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), 3, 0, 100, 8);
        t52 = (struct s3 far *)far_cbbd4(loc_1);
        loc_4 = t52->f_2;
        t53 = far_b3819(MK_FP(SEG_DATA, 0x4bbd), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), 3, 0, 100, 8);
        t54 = (struct s2 far *)far_cbb70(loc_1);
        loc_3 = t54->f_1;
        t55 = far_b362e(MK_FP(SEG_DATA, 0x4bc5), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), MK_FP(SEG_DATA, 100), 3);
        t56 = (struct s1 far *)far_cbbd4(loc_1);
        loc_5 = (char)(t56->f_3 & 15);
        t57 = far_b362e(MK_FP(SEG_DATA, 0x4bca), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5), MK_FP(SEG_DATA, 0x49aa), 4);
        if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, si * 36 + 0x4813) != 0) {
            t5 = far_b1ad0(4, 35);
            ax2 = loc_5 - 1;
            if (ax2 <= 7) {
                switch ((unsigned int)(unsigned)(TBL_c2700 + (ax2 << 1))) {
                case 0:
                case 1:
                    t9 = far_b1b05(MK_FP(SEG_DATA, 0x4bd9));
                    break;
                case 2:
                case 3:
                    t8 = far_b1b05(MK_FP(SEG_DATA, 0x4bde));
                    break;
                case 4:
                case 5:
                    t7 = far_b1b05(MK_FP(SEG_DATA, 0x4be3));
                    break;
                case 6:
                case 7:
                    t6 = far_b1b05(MK_FP(SEG_DATA, 0x4be8));
                    break;
                }
            }
        }
        t58 = (struct s1 far *)far_cbbd4(loc_1);
        loc_6 = (char)((int)((unsigned char)t58->f_3 & 128) >> 7);
        p16 = 36;
        p18 = SEG_STACK;
        t59 = far_b362e(MK_FP(SEG_DATA, 0x4bed), ((long)p18 << 16 | (unsigned)(unsigned int)(unsigned)&loc_6), MK_FP(SEG_DATA, p16), 3);
        t60 = far_b90dd();
        t61 = far_b1ad0(7, 0);
        p14 = 0x4bfe;
        ax3 = far_b1b05(MK_FP(SEG_DATA, p14));
        for (;;) {
            t62 = far_b08f7(-126);
            dx = t62;
            if (t62 != 0) {
                break;
            }
            ax4 = B_7B8D;
            if (ax4 > 5) {
                continue;
            }
            switch ((unsigned int)(unsigned)(TBL_c26f4 + (ax4 << 1))) {
            case 0:
                p14 = 7;
                p16 = 1;
                p18 = loc_1;
                t21 = far_b9045(p18, p16, p14, 16);
                t22 = (long)(signed char)loc_1 * 24L;
                ax6 = (unsigned char)*(char far *)((char far *)FP_E40C.f_0 + -778 + (int)t22);
                si = ax6;
                if (ax6 != 255) {
                    t23 = far_b1ad0(1, 29);
                    t24 = (long)(int)si * 36L;
                    if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t24 + 0x4813) == 0) {
                        p14 = 0x4b8f;
                        t26 = far_b1b05(MK_FP(SEG_DATA, p14));
                    } else {
                        p14 = 0x4b8a;
                        t25 = far_b1b05(MK_FP(SEG_DATA, p14));
                    }
                }
                t27 = (char far *)far_cbb70(loc_1);
                loc_2 = *t27;
                t28 = far_b1073(1);
                t29 = (struct s3 far *)far_cbbd4(loc_1);
                loc_4 = t29->f_2;
                t30 = far_b1073(2);
                t31 = (struct s2 far *)far_cbb70(loc_1);
                loc_3 = t31->f_1;
                t32 = far_b1073(3);
                t33 = (struct s1 far *)far_cbbd4(loc_1);
                loc_5 = (char)(t33->f_3 & 15);
                t34 = far_b1073(4);
                t35 = (long)(int)si * 36L;
                if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t35 + 0x4813) != 0) {
                    p14 = 4;
                    t36 = far_b1ad0(p14, 35);
                    ax7 = loc_5 - 1;
                    if (ax7 > 7) {
                        t41 = far_b1073(4);
                    } else {
                        switch ((unsigned int)(unsigned)(TBL_c26e4 + (ax7 << 1))) {
                        case 0:
                        case 1:
                            p14 = 0x4bd9;
                            t40 = far_b1b05(MK_FP(SEG_DATA, p14));
                            break;
                        case 2:
                        case 3:
                            p14 = 0x4bde;
                            t39 = far_b1b05(MK_FP(SEG_DATA, p14));
                            break;
                        case 4:
                        case 5:
                            p14 = 0x4be3;
                            t38 = far_b1b05(MK_FP(SEG_DATA, p14));
                            break;
                        case 6:
                        case 7:
                            p14 = 0x4be8;
                            t37 = far_b1b05(MK_FP(SEG_DATA, p14));
                            break;
                        }
                    }
                }
                t42 = (struct s1 far *)far_cbbd4(loc_1);
                loc_6 = (char)((int)((unsigned char)t42->f_3 & 128) >> 7);
                t43 = far_b1073(5);
                continue;
            case 1:
                t20 = (char far *)far_cbb70(loc_1);
                *t20 = (char)FP_OFF(t20);
                continue;
            case 2:
                t19 = (struct s3 far *)far_cbbd4(loc_1);
                t19->f_2 = (char)FP_OFF(t19);
                continue;
            case 3:
                t18 = (struct s2 far *)far_cbb70(loc_1);
                t18->f_1 = (char)FP_OFF(t18);
                continue;
            case 4:
                t10 = (long)(int)si * 36L;
                if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t10 + 0x4813) != 0) {
                    p14 = 4;
                    t11 = far_b1ad0(p14, 35);
                    ax5 = loc_5 - 1;
                    if (ax5 > 7) {
                        t16 = far_b1073(4);
                    } else {
                        switch ((unsigned int)(unsigned)(TBL_c26d4 + (ax5 << 1))) {
                        case 0:
                        case 1:
                            p14 = 0x4bd9;
                            t15 = far_b1b05(MK_FP(SEG_DATA, p14));
                            break;
                        case 2:
                        case 3:
                            p14 = 0x4bde;
                            t14 = far_b1b05(MK_FP(SEG_DATA, p14));
                            break;
                        case 4:
                        case 5:
                            p14 = 0x4be3;
                            t13 = far_b1b05(MK_FP(SEG_DATA, p14));
                            break;
                        case 6:
                        case 7:
                            p14 = 0x4be8;
                            t12 = far_b1b05(MK_FP(SEG_DATA, p14));
                            break;
                        }
                    }
                }
L1:
                t17 = (struct s1 far *)far_cbbd4(loc_1);
                t17->f_3 = (char)(loc_5 | loc_6 << 7);
                continue;
            case 5:
                goto L1;
            }
        }
        if (t62 != 120) {
            continue;
        }
        t44 = fn_c2710();
        dx = (int)t44;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
long far fn_c2710(void) { return 0; }
