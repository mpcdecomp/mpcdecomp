/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_FP_E40C {
    char pad_0[1];
};
extern unsigned char B_7B8D;
extern char B_D4C0;
extern char B_D5DD;
extern unsigned char B_E421;
extern struct g_FP_E40C FP_E40C;
extern unsigned char TBL_c5278[];
extern unsigned char TBL_c5280[];
extern unsigned char TBL_c5292[];
extern unsigned char W_E40E;
extern void far far_b05a7(void);
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1f96(int);
extern long far far_b3471(void far *, char far *, int);
extern long far far_b362e(void far *, unsigned char far *, char far *, int);
extern long far far_b3723();
extern long far far_b3819(void far *, unsigned char far *, int, int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b8ff3(int, int, int);
extern long far far_b9045(int, int, int, int);
extern long far far_b90dd(void);
extern long far far_c529a(int, char far *);
extern long far far_c530b(char, int, int);
extern int far far_c6547(int);
extern long far far_cc4e0(int);
extern long far far_da8a5();
extern long far far_fdcfb(char far *, char far *, int);

long far fn_c4a67(void)
{
    char loc_2a6[519];
    char loc_9f[1];
    char loc_9e[128];
    char loc_1e[18];
    unsigned char loc_c;
    unsigned char loc_b;
    unsigned char loc_a;
    unsigned char loc_9;
    unsigned char loc_8;
    unsigned char loc_7;
    unsigned char loc_6;
    unsigned char loc_5;
    int loc_4;
    int loc_2;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    unsigned int ax15;
    int ax16;
    int ax17;
    int ax18;
    int ax19;
    int ax2;
    int ax20;
    int ax21;
    int ax22;
    int ax23;
    int ax24;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    int bx2;
    int bx3;
    unsigned int bx4;
    unsigned int cx;
    int cx2;
    int cx3;
    unsigned int cx4;
    int cx5;
    int cx6;
    int di;
    int di2;
    int di3;
    int ds;
    int dx;
    int es;
    int es2;
    int es3;
    int p688;
    int p690;
    int p692;
    int p702;
    int p704;
    int si;
    int si2;
    int si3;
    int si4;
    int si5;
    long t1;
    long t10;
    long t11;
    long t12;
    int t13;
    long t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    int t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    long t26;
    int t27;
    long t28;
    long t29;
    long t3;
    long t30;
    long t31;
    long t32;
    long t33;
    int t34;
    long t35;
    long t36;
    long t37;
    long t38;
    int t39;
    int t4;
    long t40;
    long t41;
    long t42;
    long t43;
    int t44;
    int t45;
    int t46;
    int t47;
    long t48;
    long t49;
    int t5;
    long t50;
    long t51;
    long t52;
    long t53;
    long t54;
    long t55;
    long t56;
    long t57;
    long t58;
    long t59;
    int t6;
    long t60;
    long t61;
    long t62;
    long t63;
    long t64;
    long t65;
    long t66;
    long t67;
    long t68;
    long t69;
    long t7;
    long t70;
    long t71;
    int t72;
    long t73;
    int t74;
    int t75;
    int t76;
    int t77;
    long t78;
    int t79;
    long t8;
    long t80;
    long t81;
    int t82;
    long t83;
    int t84;
    long t85;
    long t86;
    int t87;
    long t88;
    int t89;
    long t9;
    int t90;
    int t91;
    int t92;

    B_D5DD = (char)1;
    loc_2 = 0;
    loc_6 = B_D4C0;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x5497));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x54a6));
    far_b1ad0(2, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x54b6));
    far_b1ad0(2, 29);
    far_b1b05(MK_FP(SEG_DATA, 0x54ce));
    far_b1ad0(3, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x54da));
    far_b1ad0(3, 29);
    far_b1b05(MK_FP(SEG_DATA, 0x54e1));
    t2 = far_b90dd();
    far_b1ad0(7, 0);
    ax12 = far_b1b05(MK_FP(SEG_DATA, 0x54e7));
    dx = UNDEF;
    loc_4 = 1;
    ds = SEG_DATA;
    while (loc_4 == 1) {
        far_b05a7();
        loc_5 = (unsigned char)(*(char far *)MK_FP(ds, (unsigned)&B_E421) + 1);
        t80 = far_b3819(MK_FP(ds, 0x53a6), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5), 2, 1, 24, 8);
        cx = ~__repne_scas1((int)*(long far *)MK_FP(ds, (unsigned)&FP_E40C), 0, -1);
        cx2 = cx >> 1;
        ax13 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
        si = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
        __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e), ((long)ax13 << 16 | (unsigned)si), cx2 * 2);
        si2 = si + cx2 * 2;
        di = (int)(unsigned)(loc_1e + cx2 * 2);
        cx3 = cx & 1;
        __movs1(MK_FP(SEG_STACK, di), ((long)ax13 << 16 | (unsigned)si2), cx3);
        si3 = si2 + cx3;
        di2 = di + cx3;
        ds = ds;
        t81 = far_b3471(MK_FP(ds, 0x54ee), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e), 16);
        t82 = far_b1ad0(2, 23);
        t83 = far_b8ff3(loc_6, 2, 25);
        t84 = far_b1ad0(3, 6);
        t85 = far_fdcfb((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_9e), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2a6), 1);
        loc_7 = (char)(int)far_c529a(loc_6, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_9e));
        t86 = far_b362e(MK_FP(ds, 0x53a6), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_7), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2a6), 16);
        t87 = far_b1ad0(3, 23);
        if (loc_7 == 0) {
            goto L1;
        }
        t3 = (long)(signed char)loc_9f[loc_7] * 36L;
        if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t3 + 0x4813) == 0) {
L1:
            t5 = far_b1b05(MK_FP(ds, 0x54f5));
        } else {
            t4 = far_b1b05(MK_FP(ds, 0x54f0));
        }
        loc_8 = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -777 + loc_6 * 24);
        p690 = 0x5370;
        p692 = SEG_STACK;
        t88 = far_b362e(MK_FP(ds, 0x53a6), ((long)p692 << 16 | (unsigned)(unsigned int)(unsigned)&loc_8), MK_FP(ds, p690), 6);
        t89 = far_b1ad0(4, 0);
        t90 = far_b1f96(40);
        p688 = 5;
        t91 = far_b1ad0(p688, 0);
        t92 = far_b1f96(40);
        dx = UNDEF;
        bx = loc_8;
        if (bx <= 3) {
            switch ((unsigned int)(unsigned)(TBL_c5292 + (bx << 1))) {
            case 0:
                t44 = far_b1ad0(4, 0);
                t45 = far_b1b05(MK_FP(ds, 0x54fa));
                ax14 = loc_6 << 2;
                p688 = *(int far *)MK_FP(ds, ax14 + 0x3fc);
                t46 = far_b1b05(((long)*(int far *)MK_FP(ds, ax14 + 0x3fe) << 16 | (unsigned)p688));
                dx = UNDEF;
                break;
            case 1:
                t34 = far_b1ad0(4, 0);
                t35 = (long)(int)loc_6 * 24L;
                loc_a = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -775 + (int)t35);
                t36 = far_b3819(MK_FP(ds, 0x5516), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), 2, 34, 98, 8);
                t37 = far_c530b(loc_a, 4, 17);
                t38 = far_b9045(loc_a, 4, 19, 16);
                t39 = far_b1ad0(5, 0);
                t40 = (long)(int)loc_6 * 24L;
                loc_c = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -773 + (int)t40);
                t41 = far_b3819(MK_FP(ds, 0x5516), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c), 2, 34, 98, 8);
                t42 = far_c530b(loc_c, 5, 17);
                p688 = 19;
                p690 = 5;
                p692 = loc_c;
                t43 = far_b9045(p692, p690, p688, 16);
                dx = (int)(t43 >> 16);
                break;
            case 2:
                t20 = far_b1ad0(4, 0);
                t21 = (long)(int)loc_6 * 24L;
                loc_9 = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -776 + (int)t21);
                t22 = far_b3819(MK_FP(ds, 0x5528), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_9), 3, 0, 126, 8);
                t23 = (long)(int)loc_6 * 24L;
                loc_a = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -775 + (int)t23);
                t24 = far_b3819(MK_FP(ds, 0x5531), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), 2, 34, 98, 8);
                t25 = far_c530b(loc_a, 4, 17);
                t26 = far_b9045(loc_a, 4, 19, 16);
                t27 = far_b1ad0(5, 0);
                t28 = (long)(int)loc_6 * 24L;
                loc_b = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -774 + (int)t28);
                t29 = far_b3819(MK_FP(ds, 0x5528), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_b), 3, 1, 127, 8);
                t30 = (long)(int)loc_6 * 24L;
                loc_c = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -773 + (int)t30);
                t31 = far_b3819(MK_FP(ds, 0x5531), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c), 2, 34, 98, 8);
                t32 = far_c530b(loc_c, 5, 17);
                p688 = 19;
                p690 = 5;
                p692 = loc_c;
                t33 = far_b9045(p692, p690, p688, 16);
                dx = (int)(t33 >> 16);
                break;
            case 3:
                t6 = far_b1ad0(4, 0);
                t7 = (long)(int)loc_6 * 24L;
                es = (int)(*(long far *)MK_FP(ds, (unsigned)&FP_E40C) >> 16);
                bx2 = (int)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + (int)t7;
                loc_9 = *(char far *)MK_FP(es, bx2 - 0x308);
                if (loc_9 > 99) {
                    *(char far *)MK_FP(es, bx2 - 0x308) = (char)99;
                    loc_9 = (unsigned char)99;
                }
                t8 = far_b3723(MK_FP(ds, 0x5528), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_9), 4, 0x630000L, 8, (void far *)far_da8a5);
                t9 = (long)(int)loc_6 * 24L;
                loc_a = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -775 + (int)t9);
                t10 = far_b3819(MK_FP(ds, 0x5538), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_a), 2, 34, 98, 8);
                t11 = far_c530b(loc_a, 4, 17);
                t12 = far_b9045(loc_a, 4, 19, 16);
                t13 = far_b1ad0(5, 0);
                t14 = (long)(int)loc_6 * 24L;
                es2 = (int)(*(long far *)MK_FP(ds, (unsigned)&FP_E40C) >> 16);
                bx3 = (int)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + (int)t14;
                si3 = bx3;
                loc_b = *(char far *)MK_FP(es2, bx3 - 0x306);
                if (loc_b > 100) {
                    *(char far *)MK_FP(es2, si3 - 0x306) = (char)100;
                    loc_b = (unsigned char)100;
                }
                p702 = ds;
                p704 = 0x5528;
                t15 = far_b3723(p704, p702, (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_b), 4, 0x640001L, 8, (void far *)far_da8a5);
                t16 = (long)(int)loc_6 * 24L;
                loc_c = *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -773 + (int)t16);
                t17 = far_b3819(MK_FP(ds, 0x5538), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_c), 2, 34, 98, 8);
                t18 = far_c530b(loc_c, 5, 17);
                p688 = 19;
                p690 = 5;
                p692 = loc_c;
                t19 = far_b9045(p692, p690, p688, 16);
                dx = (int)(t19 >> 16);
                break;
            }
        }
        loc_4 = 0;
        loc_2 = 0;
        while (loc_4 == 0) {
            t47 = far_b08f7(-127);
            dx = UNDEF;
            loc_2 = t47;
            if (t47 != 0) {
                break;
            }
            ax15 = *(char far *)MK_FP(ds, (unsigned)&B_7B8D);
            if (ax15 > 8) {
                continue;
            }
            switch ((unsigned int)(unsigned)(TBL_c5280 + (ax15 << 1))) {
            case 0:
                p688 = 0xcde4;
                t77 = far_c6547(loc_5 - 1);
                dx = UNDEF;
                loc_4 = 1;
                continue;
            case 1:
                ax23 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
                si4 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
                t76 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e), 0, -1);
                cx4 = ~t76;
                cx5 = cx4 >> 1;
                __movs2(((long)ax23 << 16 | (unsigned)si4), MK_FP(SEG_STACK, si4), cx5 * 2);
                si5 = si4 + cx5 * 2;
                di3 = si4 + cx5 * 2;
                cx6 = cx4 & 1;
                __movs1(((long)ax23 << 16 | (unsigned)di3), MK_FP(SEG_STACK, si5), cx6);
                si3 = si5 + cx6;
                di2 = di3 + cx6;
                ds = ds;
                continue;
            case 2:
                loc_4 = 1;
                continue;
            case 3:
                if (loc_7 != 0) {
                    t71 = (long)(int)loc_6 * 24L;
                    *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -778 + (int)t71) = loc_9f[loc_7];
                } else {
                    t70 = (long)(int)loc_6 * 24L;
                    *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -778 + (int)t70) = (char)-1;
                }
                t72 = far_b1ad0(3, 23);
                if (loc_7 == 0) {
                    goto L2;
                }
                t73 = (long)(signed char)loc_9f[loc_7] * 36L;
                if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t73 + 0x4813) != 0) {
                    p688 = 0x54f0;
                    t74 = far_b1b05(MK_FP(ds, p688));
                    dx = UNDEF;
                    continue;
                }
L2:
                p688 = 0x54f5;
                t75 = far_b1b05(MK_FP(ds, p688));
                dx = UNDEF;
                continue;
            case 4:
                t69 = (long)(int)loc_6 * 24L;
                dx = (int)(t69 >> 16);
                *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -777 + (int)t69) = loc_8;
                loc_4 = 1;
                continue;
            case 5:
                ax20 = loc_8;
                bx4 = ax20;
                if (bx4 > 3) {
                    continue;
                }
                switch ((unsigned int)(unsigned)(TBL_c5278 + (bx4 << 1))) {
                case 0:
                    continue;
                case 1:
                    t66 = (long)(int)loc_6 * 24L;
                    ax22 = ((char)((int)t66 >> 8) << 8 | (unsigned char)loc_a);
                    *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -775 + (int)t66) = (char)ax22;
                    t67 = far_c530b(ax22, 4, 17);
                    p688 = 19;
                    p690 = 4;
                    p692 = loc_a;
                    t68 = far_b9045(p692, p690, p688, 16);
                    dx = (int)(t68 >> 16);
                    continue;
                case 2:
                    goto L3;
                case 3:
                    if (loc_9 > 99) {
                        t61 = (long)(int)loc_6 * 24L;
                        *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -776 + (int)t61) = (char)99;
                        loc_9 = (unsigned char)99;
                        t62 = far_b1073(5);
                        ax20 = (int)t62;
                    }
L3:
                    ax21 = ((char)(ax20 >> 8) << 8 | (unsigned char)loc_9);
                    if ((unsigned char)(char)ax21 >= loc_b) {
                        loc_b = (unsigned char)((char)ax21 + 1);
                        t63 = far_b1073(7);
                    }
                    t64 = (long)(int)loc_6 * 24L;
                    es3 = (int)(*(long far *)MK_FP(ds, (unsigned)&FP_E40C) >> 16);
                    *(char far *)MK_FP(es3, (int)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + (int)t64 - 0x308) = loc_9;
                    t65 = (long)(int)loc_6 * 24L;
                    dx = (int)(t65 >> 16);
                    *(char far *)MK_FP(es3, *(int far *)MK_FP(ds, (unsigned)&FP_E40C) + (int)t65 - 0x306) = loc_b;
                    continue;
                }
            case 6:
                ax17 = loc_8;
                if (ax17 == 1) {
                    t58 = (long)(int)loc_6 * 24L;
                    ax19 = ((char)((int)t58 >> 8) << 8 | (unsigned char)loc_c);
                    *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -773 + (int)t58) = (char)ax19;
                    t59 = far_c530b(ax19, 5, 17);
                    p688 = 19;
                    p690 = 5;
                    p692 = loc_c;
                    t60 = far_b9045(p692, p690, p688, 16);
                    dx = (int)(t60 >> 16);
                    continue;
                }
                if (ax17 != 2 && ax17 != 3) {
                    continue;
                }
                t55 = (long)(int)loc_6 * 24L;
                ax18 = ((char)((int)t55 >> 8) << 8 | (unsigned char)loc_a);
                *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -775 + (int)t55) = (char)ax18;
                t56 = far_c530b(ax18, 4, 17);
                p688 = 19;
                p690 = 4;
                p692 = loc_a;
                t57 = far_b9045(p692, p690, p688, 16);
                dx = (int)(t57 >> 16);
                continue;
            case 7:
                ax16 = loc_8;
                if (ax16 == 2) {
                    goto L4;
                }
                if (ax16 != 3) {
                    continue;
                }
                if (loc_b > 100) {
                    t51 = (long)(int)loc_6 * 24L;
                    *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -774 + (int)t51) = (char)100;
                    loc_b = (unsigned char)100;
                    t52 = far_b1073(7);
                }
L4:
                if (loc_b <= loc_9) {
                    loc_b = (unsigned char)(loc_9 + 1);
                    t53 = far_b1073(7);
                }
                t54 = (long)(int)loc_6 * 24L;
                dx = (int)(t54 >> 16);
                *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -774 + (int)t54) = loc_b;
                continue;
            case 8:
                t48 = far_c530b(loc_c, 5, 17);
                p688 = 19;
                p690 = 5;
                p692 = loc_c;
                t49 = far_b9045(p692, p690, p688, 16);
                t50 = (long)(int)loc_6 * 24L;
                dx = (int)(t50 >> 16);
                *(char far *)((char far *)*(long far *)MK_FP(ds, (unsigned)&FP_E40C) + -773 + (int)t50) = loc_c;
                continue;
            }
        }
        ax24 = loc_2;
        if (ax24 == 80) {
            loc_4 = 1;
            continue;
        }
        if (ax24 != 120) {
            continue;
        }
        t78 = far_cc4e0(loc_6);
        dx = (int)(t78 >> 16);
        loc_4 = 1;
    }
    return ((long)dx << 16 | (unsigned)loc_2);
}
long far far_c529a(int p0, char far *p1) { return 0; }
long far far_c530b(char p0, int p1, int p2) { return 0; }
int far far_c6547(int p0) { return 0; }
