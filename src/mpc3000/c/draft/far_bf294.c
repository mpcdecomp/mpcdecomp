/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
struct g_TBL_882A {
    char pad_0[4];
    int f_4;
};
extern char B_7B8D;
extern char B_7FCA;
extern char B_7FCB;
extern unsigned char B_7FCC[];
extern unsigned char B_8A88;
extern char B_8A9A;
extern char B_8A9C;
extern char B_8A9E;
extern char B_8A9F;
extern unsigned char B_8C41[];
extern char B_901B;
extern char B_901C;
extern char B_9443;
extern char B_9444;
extern char B_955B;
extern char B_955C;
extern char B_9561;
extern char B_9562;
extern char B_956A;
extern char B_956D;
extern char B_A56E;
extern char B_A5C1;
extern char B_A5C2;
extern char B_D4B1;
extern char B_D4C2;
extern char B_D5DE;
extern char B_EFA4;
extern char B_EFA5;
extern char B_EFA6;
extern char B_EFA7;
extern char B_EFA8;
extern char B_EFA9;
extern char B_EFAA;
extern char B_EFAB;
extern char B_EFAC;
extern char B_EFAD;
extern char B_EFAE;
extern char B_EFAF;
extern char B_EFB0;
extern char B_EFB3;
extern struct g_TBL_882A TBL_882A;
extern int TBL_882E;
extern unsigned char TBL_8830[];
extern char TBL_905D[];
extern char TBL_90C1[];
extern char TBL_91ED[];
extern char TBL_9251[];
extern unsigned char TBL_bfe4e[];
extern unsigned char TBL_bfe6a[];
extern long W_8C35;
extern int W_9035;
extern int W_9037;
extern unsigned int W_9039;
extern int W_903B;
extern int W_9045;
extern int W_9047;
extern int W_904B;
extern int W_904D;
extern int W_A57A;
extern int W_A57C;
extern unsigned char W_D5F3[];
extern int W_D657;
extern int W_D659;
extern int W_EFB1;
extern long far L_d2667(int, int);
extern long far L_ef4d3(void);
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern long far far_b1206(int, int, int);
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern long far far_b3471(void far *, void far *, int);
extern long far far_b362e(void far *, unsigned char far *, void far *, int);
extern long far far_b3819();
extern long far far_b3b9f(int);
extern long far far_b3d1d(int, int, int);
extern long far far_bff70(void);
extern void far far_bffc9(void);
extern int far far_c036b(void);
extern long far far_d7a79(void);
extern void far far_dd970(void);
extern int far far_de88f(int, int, int);
extern long far far_deeab(void);
extern int far far_e0031(void far *);
extern long far far_e259f(char);
extern long far far_e37be(char far *);
extern int far far_e3b75(void);
extern long far far_e4a1d(int);
extern long far far_e4d15(int, int, char far *);
extern int far far_e4e74(void far *, int);
extern long far far_e4f54(int, int, void far *);
extern long far far_e51be(void far *, int, int);
extern long far far_e570d(int, int);
extern long far far_e57c8(int, int, void far *);
extern long far far_e5a99(char far *);
extern long far far_e6fef(void);
extern long far far_e7069(void);
extern long far far_e70e6(void);
extern long far far_e7189(char far *, int);
extern int far far_ea926(int);
extern long far far_eb86b(long, void far *);
extern long far far_ec03b(void far *);
extern long far fn_bfe90();
extern long far fn_bfee6(int);
extern long far fn_bfff8(void);
extern int far fn_c0109(void);
extern int far fn_c0180(void);
extern long far fn_c0194(int);
extern long far fn_c01aa(int, int);
extern long far fn_c01d2(void);
extern long far fn_c01e4(void);
extern long far fn_c0211(void);
extern long far fn_c0254(void);
extern long far fn_c0274(int, int, void far *);
extern int far fn_c02d7(int, int, void far *);
extern long far fn_c0325(void);
extern long far fn_c03b2(void far *);
extern long far fn_c0446(void);

long far far_bf294(void)
{
    char loc_1a[19];
    char loc_7;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax17;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    unsigned int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int cx;
    int cx2;
    int di;
    int dx;
    unsigned int dx2;
    int dx3;
    int es;
    int flags;
    int flags2;
    int flags3;
    int p36;
    int p38;
    int p40;
    int p42;
    int si;
    struct s1 near *si2;
    long t1;
    long t10;
    int t100;
    long t101;
    long t102;
    long t103;
    long t104;
    long t105;
    long t106;
    int t107;
    long t108;
    int t109;
    long t11;
    long t110;
    long t111;
    long t112;
    long t113;
    long t114;
    int t115;
    long t116;
    int t117;
    long t118;
    long t119;
    long t12;
    int t120;
    long t121;
    int t122;
    long t123;
    long t124;
    long t125;
    int t126;
    long t127;
    long t128;
    int t129;
    long t13;
    long t130;
    int t131;
    long t132;
    long t133;
    long t134;
    int t135;
    long t136;
    long t137;
    long t138;
    long t139;
    long t14;
    long t140;
    long t141;
    long t142;
    long t143;
    long t144;
    long t145;
    long t146;
    long t147;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    long t21;
    int t22;
    long t23;
    long t24;
    long t25;
    int t26;
    long t27;
    int t28;
    long t29;
    long t3;
    long t30;
    long t31;
    long t32;
    int t33;
    long t34;
    long t35;
    long t36;
    long t37;
    long t38;
    long t39;
    long t4;
    long t40;
    long t41;
    long t42;
    long t43;
    long t44;
    long t45;
    long t46;
    long t47;
    int t48;
    long t49;
    long t5;
    long t50;
    long t51;
    long t52;
    int t53;
    long t54;
    int t55;
    long t56;
    long t57;
    long t58;
    long t59;
    long t6;
    long t60;
    long t61;
    long t62;
    long t63;
    int t64;
    long t65;
    long t66;
    long t67;
    long t68;
    long t69;
    long t7;
    long t70;
    long t71;
    long t72;
    long t73;
    long t74;
    long t75;
    long t76;
    long t77;
    long t78;
    long t79;
    long t8;
    long t80;
    long t81;
    long t82;
    int t83;
    long t84;
    long t85;
    long t86;
    long t87;
    int t88;
    long t89;
    int t9;
    int t90;
    int t91;
    long t92;
    long t93;
    long t94;
    long t95;
    int t96;
    long t97;
    int t98;
    long t99;

    loc_6 = far_c036b();
    t1 = fn_c0325();
    B_D4C2 = B_D5DE;
    t2 = far_b3819(MK_FP(SEG_DATA, 0x4555), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 2, 1, 99, 0);
    W_D659 = far_de88f(W_D657, B_7FCA, B_7FCB);
    t3 = (long)(signed char)B_7FCA * (long)(int)(B_7FCB + 1);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x4558), (int far *)&W_D659, 5, *(int *)(0x248 + ((int)t3 << 1)), *(int *)(0x252 + ((int)t3 << 1)), 4);
    t5 = far_b362e(MK_FP(SEG_DATA, 0x455e), (unsigned char far *)B_7FCC, MK_FP(SEG_DATA, 88), 4);
    far_b1ad0(2, 0);
    B_EFB3 = (char)(B_901C & 1);
    W_EFB1 = W_904D;
    t6 = far_b362e(MK_FP(SEG_DATA, 0x4561), (char far *)&B_EFB3, MK_FP(SEG_DATA, 0x453e), 6);
    t7 = far_b3819(MK_FP(SEG_DATA, 0x455c), (int far *)&W_EFB1, 3, 1, 0x3e7, 0);
    far_b1ad0(3, 0);
    t8 = far_ec03b(MK_FP(SEG_DATA, 0x457f));
    t9 = far_b1ad0(4, 0);
    loc_7 = B_8A9A;
    t10 = far_b3819(MK_FP(SEG_DATA, 0x458a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_7), 2, 1, 99, 8);
    t11 = far_e4a1d(B_8A9C);
    B_EFA7 = (char)(int)t11;
    B_EFA4 = (char)(int)t11;
    t12 = far_b362e(MK_FP(SEG_DATA, 0x458f), (char far *)&B_EFA4, MK_FP(SEG_DATA, 0x208), 4);
    B_EFB0 = (char)fn_c0180();
    t13 = far_b362e(MK_FP(SEG_DATA, 0x4596), (char far *)&B_EFB0, MK_FP(SEG_DATA, 36), 3);
    far_b1ad0(5, 0);
    t14 = far_b3819(MK_FP(SEG_DATA, 0x459b), (char far *)&B_EFAE, 2, 0, 16, 8);
    t15 = fn_c0274(B_EFAC, B_EFAE, MK_FP(SEG_DATA, -0x200f));
    t16 = far_b3471(MK_FP(SEG_DATA, 0x455a), MK_FP(SEG_DATA, -0x200f), 8);
    t17 = far_b3819(MK_FP(SEG_DATA, 0x45a0), (char far *)&B_EFAF, 2, 0, 16, 8);
    t18 = far_b362e(MK_FP(SEG_DATA, 0x454d), (char far *)&B_EFAD, MK_FP(SEG_DATA, 0x25c), 1);
    t19 = far_b3819(MK_FP(SEG_DATA, 0x45a4), (char far *)&B_EFA6, 3, 1, 200, 8);
    p38 = 0;
    p40 = 3;
    p42 = SEG_DATA;
    t20 = far_b3819(MK_FP(SEG_DATA, 0x45ac), &B_EFA5, p42, p40, p38, 128, 8);
    t21 = fn_c0254();
    far_bffc9();
    p36 = 0x45b2;
    far_b1b05(MK_FP(SEG_DATA, p36));
    t23 = fn_c01e4();
    t24 = fn_c0211();
    t25 = fn_bfff8();
    dx = (int)(far_d7a79() >> 16);
    loc_4 = B_901B;
    loc_2 = 0;
    while (loc_2 == 0) {
        if (B_901B != loc_4) {
            if (B_A5C1 == 0) {
                p36 = (int)(unsigned)B_8C41;
                t26 = far_e0031(MK_FP(SEG_DATA, p36));
                t27 = far_deeab();
                loc_4 = B_901B;
            }
        }
        for (;;) {
L1:
            ax5 = far_b08f7(4);
            dx = UNDEF;
            si = ax5;
            if (ax5 != 0) {
                break;
            }
            ax6 = B_7B8D;
            di = ax6;
            if (ax6 > 18) {
                continue;
            }
            switch ((unsigned int)(unsigned)(TBL_bfe6a + (ax6 << 1))) {
            case 0:
                if (B_9562 != 0) {
                    t96 = far_b1af9();
                    t97 = far_b3b9f(-40);
                    t98 = far_b1aff();
                    loc_6 = B_9561;
                    t99 = far_b1073(0);
                    continue;
                }
                if (B_A5C2 == 0) {
                    if (B_956D != 0) {
                        t100 = far_e3b75();
                        B_956A = (char)(B_956A - 1);
                    }
                    B_8A9E = (char)0;
                    p40 = (int)(unsigned)&B_901B;
                    t101 = far_e51be(MK_FP(SEG_DATA, p40), loc_6, 1);
                    t102 = far_deeab();
                    loc_7 = B_8A9A;
                    p36 = (int)(unsigned)&loc_6;
                    p38 = 0xc87c;
                    t103 = fn_c03b2(MK_FP(SEG_STACK, p36));
                    t104 = L_ef4d3();
                    B_955B = (char)(B_955B | 64);
                    B_955C = (char)(B_955C | -128);
                    continue;
                }
                if (B_8A9F != loc_6) {
                    if (B_901B != 1) {
                        t106 = far_e6fef();
                        t107 = far_b1af9();
                        t108 = far_b3d1d(3, 62, 0);
                        t109 = far_b1aff();
                        p36 = loc_6;
                        p38 = SEG_DATA;
                        p40 = (int)(unsigned)&B_901B;
                        t110 = far_e51be(((long)p38 << 16 | (unsigned)p40), p36, 1);
                        t111 = far_deeab();
                    } else {
                        t105 = far_e259f(*(char *)((char *)&loc_6 + 0));
                        if ((int)t105 == 0) {
                            bx = (int)W_8C35;
                            es = (int)(W_8C35 >> 16);
                            dx3 = *(int far *)MK_FP(es, bx + 31);
                            W_A57C = *(int far *)MK_FP(es, bx + 33);
                            W_A57A = dx3;
                            B_8A9E = *(char *)((char *)&loc_6 + 0);
                        }
                    }
                } else {
                    B_8A9E = (char)0;
                }
                loc_6 = B_8A9F;
                t112 = far_b1073(0);
                t113 = fn_c0325();
                *(char *)0xcec6 = (char)0;
                continue;
            case 1:
                if (B_901B < 0) {
                    t89 = far_e4d15(0, -1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a));
                    t90 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), 0, -1);
                    cx2 = ~t90;
                    ax12 = 0;
                    t91 = __repe_cmps1(MK_FP(SEG_DATA, -0x2006), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_1a + (-1 - t90) - cx2)), cx2);
                    di = UNDEF;
                    if (!CC("==", UNDEF)) {
                        ax12 = 0 - 0 - CC("<u", UNDEF) + 1;
                    }
                    if (ax12 != 0) {
                        p42 = 0xc87c;
                        t92 = fn_bfe90(loc_6, loc_7, 0, 0);
                        t93 = L_ef4d3();
                    }
                }
                p38 = -1;
                p40 = B_8A9F;
                t94 = far_e57c8(p40, p38, MK_FP(SEG_DATA, -0x2006));
                p36 = B_8A9F;
                t95 = L_d2667(p36, 1);
                continue;
            case 2:
                t86 = (long)(signed char)B_7FCA * (long)(int)(B_7FCB + 1);
                p36 = *(int *)(0x248 + ((int)t86 << 1));
                p38 = 3;
                t87 = far_b1206(p38, p36, *(int *)(0x252 + ((int)t86 << 1)));
                t88 = far_ea926(0);
                continue;
            case 3:
                if (B_901B < 0) {
                    p36 = -0x2006;
                    p38 = loc_7;
                    p40 = loc_6;
                    p42 = 0xc87c;
                    t84 = fn_bfe90(p40, p38, MK_FP(SEG_DATA, p36));
                }
                t85 = far_bff70();
                continue;
            case 4:
                t81 = far_e70e6();
                p36 = (int)(unsigned)W_D5F3;
                p38 = W_9047;
                p40 = W_9045;
                t82 = far_eb86b(((long)p38 << 16 | (unsigned)p40), MK_FP(SEG_DATA, p36));
                t83 = far_ea926(0);
                continue;
            case 5:
                continue;
            case 6:
                if (B_9562 != 0 || B_A5C2 != 0) {
                    t80 = fn_c0211();
                    continue;
                }
                if (B_901B == -1) {
                    p38 = loc_7;
                    p40 = loc_6;
                    p42 = 0xc87c;
                    t77 = fn_bfe90(p40, p38, MK_FP(SEG_DATA, -0x2006));
                    W_EFB1 = W_904D;
                }
                B_901C = (char)(B_901C & -2 | B_EFB3);
                p36 = B_8A9F;
                t78 = L_d2667(p36, 1);
                t79 = fn_c0211();
                continue;
            case 7:
                if (B_9562 != 0 || B_A5C2 != 0 || B_EFB3 == 0) {
                    t76 = fn_c0211();
                    continue;
                }
                if (B_901B == -1) {
                    p42 = 0xc87c;
                    t67 = fn_bfe90(loc_6, loc_7, MK_FP(SEG_DATA, -0x2006));
                }
                t68 = far_e51be((char far *)&B_901B, B_8A9F, 0);
                if (W_EFB1 > W_904B) {
                    W_EFB1 = W_904B;
                    t69 = fn_c0211();
                }
                ax10 = W_EFB1;
                W_904D = ax10;
                if ((B_901C & 2) == 0) {
                    t72 = far_e5a99((char far *)&B_901B);
                } else {
                    t70 = far_e570d(0, ax10);
                    W_9037 = (int)(t70 >> 16);
                    W_9035 = (int)t70;
                    t71 = far_e7189((char far *)&B_901B, W_904D);
                    W_903B = (int)(t71 >> 16);
                    W_9039 = (int)t71;
                }
                TBL_882E = 0x1000;
                if (B_8A88 != 0) {
                    cx = 0;
                    si2 = (struct s1 near *)TBL_8830;
                    di = B_8A88;
                    while (di > cx) {
                        ax11 = si2->f_2;
                        dx2 = si2->f_0;
                        flags = ax11 - W_903B;
                        if (CC("<u", flags)) {
                            goto L2;
                        }
                        if (CC(">u", flags)) {
                            break;
                        }
                        if (dx2 > W_9039) {
                            goto L3;
                        }
L2:
                        si2 = (struct s1 near *)((char near *)si2 + 6);
                        cx = cx + 1;
                    }
                    goto L4;
                }
                goto L5;
            case 8:
                p36 = 0xc87c;
                t66 = fn_bfee6(loc_7);
                continue;
            case 9:
                if (B_A5C2 != 0) {
                    t58 = far_e57c8(B_8A9F, B_8A9C, MK_FP(SEG_DATA, -0x71f3));
                    p36 = -0x71f3;
                    p38 = ((char)((int)t58 >> 8) << 8 | (unsigned char)B_8A9C);
                    p40 = B_8A9F;
                    t59 = far_e4d15(p40, p38, MK_FP(SEG_DATA, p36));
                    t60 = far_b1073(9);
                    continue;
                }
                t61 = far_e4f54(B_8A9F, B_8A9C, MK_FP(SEG_DATA, -0x71f3));
                p36 = -0x2006;
                p38 = -1;
                p40 = B_8A9F;
                t62 = far_e4d15(p40, p38, MK_FP(SEG_DATA, p36));
                t63 = far_b1073(1);
                t64 = far_ea926(0);
                t65 = fn_c0325();
                continue;
            case 10:
            case 12:
            case 13:
            case 15:
            case 16:
                if (B_A5C2 == 0) {
                    if (B_9562 == 0) {
                        p40 = (int)(unsigned)&B_901B;
                        t44 = far_e51be(MK_FP(SEG_DATA, p40), loc_6, 0);
                        if ((int)t44 == -1) {
                            p40 = loc_6;
                            p42 = 0xc87c;
                            t45 = fn_bfe90(p40, loc_7, MK_FP(SEG_DATA, -0x2006));
                            t46 = L_ef4d3();
                        }
                        t47 = far_b1073(1);
                    }
                    ax9 = B_8A9C;
                    if ((TBL_90C1[ax9] & 2) == 0) {
                        TBL_90C1[ax9] = (char)(TBL_90C1[ax9] | 2);
                        t48 = far_e4e74(MK_FP(SEG_DATA, -0x71f3), B_8A9A);
                        p40 = B_8A9F;
                        t49 = far_e4f54(p40, B_8A9C, MK_FP(SEG_DATA, -0x71f3));
                        t50 = far_b1073(9);
                    }
                    t51 = fn_c0325();
                    p38 = 0xc87c;
                    t52 = fn_c01aa(B_EFA4, 4);
                    B_EFA7 = B_EFA4;
                    t53 = fn_c0109();
                    t54 = fn_bfff8();
                    t55 = far_ea926(0);
                } else {
                    B_EFAE = B_EFAA;
                    B_EFAF = B_EFAB;
                    B_EFAC = B_EFA8;
                    B_EFAD = B_EFA9;
                    t42 = fn_bfff8();
                    B_EFA4 = B_EFA7;
                    t43 = far_b1073(10);
                }
                p36 = B_8A9F;
                t56 = L_d2667(p36, 1);
                t57 = fn_c0325();
                continue;
            case 11:
            case 17:
            case 18:
                if (B_A5C2 == 0) {
                    if (B_9562 == 0) {
                        p38 = SEG_DATA;
                        p40 = (int)(unsigned)&B_901B;
                        t30 = far_e51be(((long)p38 << 16 | (unsigned)p40), loc_6, 0);
                        if ((int)t30 == -1) {
                            p38 = loc_7;
                            p40 = loc_6;
                            p42 = 0xc87c;
                            t31 = fn_bfe90(p40, p38, MK_FP(SEG_DATA, -0x2006));
                            t32 = L_ef4d3();
                        }
                    }
                    ax7 = B_8A9C;
                    if ((TBL_90C1[ax7] & 2) == 0) {
                        TBL_90C1[ax7] = (char)(TBL_90C1[ax7] | 2);
                        t33 = far_e4e74(MK_FP(SEG_DATA, -0x71f3), B_8A9A);
                        p38 = B_8A9C;
                        p40 = B_8A9F;
                        t34 = far_e4f54(p40, p38, MK_FP(SEG_DATA, -0x71f3));
                        t35 = far_b1073(9);
                        t36 = fn_c0254();
                    }
                }
                if (TBL_905D[B_8A9A] == -1) {
                    t37 = far_e37be((char far *)&B_901B);
                }
                t38 = fn_c0194(B_EFB0);
                ax8 = ((char)((int)t38 >> 8) << 8 | (unsigned char)B_8A9C);
                TBL_90C1[(char)ax8] = (char)(TBL_90C1[(char)ax8] | 2);
                TBL_9251[(char)ax8] = B_EFA6;
                if (di == 18) {
                    TBL_91ED[(char)ax8] = B_EFA5;
                    t39 = fn_c0254();
                    if (B_EFA5 != 0 && (TBL_90C1[B_8A9C] & 1) == 0) {
                        B_9444 = (char)(B_EFA5 - 1);
                        B_955B = (char)(B_955B | 16);
                        B_955C = (char)(B_955C | -128);
                    }
                }
                p36 = B_8A9F;
                t40 = L_d2667(p36, 1);
                t41 = fn_c0325();
                continue;
            case 14:
                p36 = -0x200f;
                p38 = B_EFAE;
                p40 = B_EFAC;
                p42 = 0xc87c;
                t28 = fn_c02d7(p40, p38, MK_FP(SEG_DATA, p36));
                t29 = fn_bfff8();
                continue;
            }
        }
        bx2 = si;
        flags2 = bx2 - 101;
        if (!CC("!=", flags2)) {
L6:
            t142 = fn_c0325();
            dx = (int)(t142 >> 16);
            continue;
        }
        if (!CC(">", flags2)) {
            flags3 = bx2 - 80;
            if (!CC("!=", flags3)) {
L7:
                if (B_9443 != 0) {
                    ax17 = ((char)(ax5 >> 8) << 8 | (unsigned char)B_9443);
                    loc_6 = (char)ax17;
                    p40 = (int)(unsigned)&B_901B;
                    t145 = far_e51be(MK_FP(SEG_DATA, p40), (char)ax17, 1);
                    t146 = L_ef4d3();
                    B_9443 = (char)0;
                }
                B_8A9E = (char)0;
                loc_7 = B_8A9A;
                p36 = (int)(unsigned)&loc_6;
                p38 = 0xc87c;
                t147 = fn_c03b2(MK_FP(SEG_STACK, p36));
                dx = (int)(t147 >> 16);
                continue;
            }
            if (!CC(">", flags3)) {
                if (bx2 == 36) {
                    t114 = far_e7069();
                    t115 = far_b1af9();
                    t116 = far_b3d1d(3, 61, 0);
                    t117 = far_b1aff();
                    p36 = loc_6;
                    p38 = SEG_DATA;
                    p40 = (int)(unsigned)&B_901B;
                    t118 = far_e51be(((long)p38 << 16 | (unsigned)p40), p36, 0);
                    t119 = far_deeab();
                    dx = (int)(t119 >> 16);
                    continue;
                }
                if (bx2 != 69) {
                    if (bx2 == 77) {
                        continue;
                    }
L8:
                    loc_2 = 1;
                    continue;
                }
                if ((B_A5C2 & 20) != 0) {
                    t120 = far_b1ad0(0, 0);
                    p36 = 0x45db;
                    t121 = far_ec03b(MK_FP(SEG_DATA, p36));
                    dx = (int)(t121 >> 16);
                }
                if (B_A5C2 != 0) {
                    continue;
                }
                loc_2 = 1;
                continue;
            }
            if (bx2 == 82) {
                if ((B_A5C2 & 21) != 0) {
                    t122 = far_b1ad0(0, 0);
                    p36 = 0x45f8;
                    t123 = far_ec03b(MK_FP(SEG_DATA, p36));
                    dx = (int)(t123 >> 16);
                }
                if (B_A5C2 != 0) {
                    continue;
                }
                loc_2 = 1;
                continue;
            }
            if (bx2 != 87) {
                goto L8;
            }
            if (B_9562 == 0) {
                p36 = loc_6;
                p38 = SEG_DATA;
                p40 = (int)(unsigned)&B_901B;
                t124 = far_e51be(((long)p38 << 16 | (unsigned)p40), p36, 0);
                if ((int)t124 == -1) {
                    p36 = -0x2006;
                    p38 = loc_7;
                    p40 = loc_6;
                    p42 = 0xc87c;
                    t125 = fn_bfe90(p40, p38, MK_FP(SEG_DATA, p36));
                }
                if (B_A5C1 == 0) {
                    p36 = (int)(unsigned)B_8C41;
                    t126 = far_e0031(MK_FP(SEG_DATA, p36));
                    t127 = far_deeab();
                    loc_4 = B_901B;
                }
            }
            t128 = fn_c0211();
            far_dd970();
            *(char *)0xcec6 = (char)0;
            t130 = fn_c0325();
            t131 = far_ea926(0);
            dx = UNDEF;
            continue;
        }
        if ((unsigned int)(bx2 - 109) > 13) {
            goto L8;
        }
        switch ((unsigned int)(unsigned)(TBL_bfe4e + (bx2 - 109 << 1))) {
        case 0:
            if (B_9562 != 0) {
                continue;
            }
            if (B_A5C2 != 0) {
                continue;
            }
            loc_6 = B_D4B1;
            if (loc_6 < 1) {
                loc_6 = 1;
            }
            if (loc_6 > 99) {
                loc_6 = 99;
            }
            p40 = (int)(unsigned)&B_901B;
            t143 = far_e51be(MK_FP(SEG_DATA, p40), loc_6, 1);
            t144 = L_ef4d3();
            ax5 = (int)t144;
            B_9443 = (char)0;
            goto L7;
        case 1:
        case 2:
        case 3:
        case 4:
        case 6:
        case 7:
        case 9:
        case 10:
            goto L8;
        case 5:
            goto L6;
        case 8:
            ax15 = ((char)(ax5 >> 8) << 8 | (unsigned char)loc_7);
            ax16 = ((char)(ax15 >> 8) << 8 | (unsigned char)((char)ax15 + 1));
            loc_7 = (char)ax16;
            if ((char)ax16 > 99) {
                loc_7 = (char)99;
            }
            p36 = 0xc87c;
            t140 = fn_bfee6(loc_7);
            t141 = far_b1073(8);
            dx = (int)(t141 >> 16);
            continue;
        case 11:
            t135 = fn_c0180();
            t136 = fn_c0194(0 - (t135 != 0) + 1);
            t137 = fn_c01d2();
            t138 = fn_c0446();
            p36 = B_8A9F;
            t139 = L_d2667(p36, 1);
            dx = (int)(t139 >> 16);
            continue;
        case 12:
            B_A56E = (char)((char)(0 - (B_A56E != 0)) + 1);
            t134 = fn_c01e4();
            dx = (int)(t134 >> 16);
            continue;
        case 13:
            ax13 = ((char)(ax5 >> 8) << 8 | (unsigned char)loc_7);
            ax14 = ((char)(ax13 >> 8) << 8 | (unsigned char)((char)ax13 - 1));
            loc_7 = (char)ax14;
            if ((char)ax14 < 1) {
                loc_7 = (char)1;
            }
            p36 = 0xc87c;
            t132 = fn_bfee6(loc_7);
            t133 = far_b1073(8);
            dx = (int)(t133 >> 16);
            continue;
        }
    }
    return ((long)dx << 16 | (unsigned)si);
L3:
L4:
    if (cx != 0) {
        t73 = (long)(int)cx * 6L;
        TBL_882E = *(int *)((char *)&TBL_882A + 4 + (int)t73);
    }
L5:
    p38 = W_9047;
    p40 = W_9045;
    t74 = far_eb86b(((long)p38 << 16 | (unsigned)p40), (unsigned char far *)W_D5F3);
    p36 = B_8A9F;
    t75 = L_d2667(p36, 1);
    goto L1;
}
long far far_bff70(void) { return 0; }
void far far_bffc9(void) { }
int far far_c036b(void) { return 0; }
long far fn_bfe90(void) { return 0; }
long far fn_bfee6(int p0) { return 0; }
long far fn_bfff8(void) { return 0; }
int far fn_c0109(void) { return 0; }
int far fn_c0180(void) { return 0; }
long far fn_c0194(int p0) { return 0; }
long far fn_c01aa(int p0, int p1) { return 0; }
long far fn_c01d2(void) { return 0; }
long far fn_c01e4(void) { return 0; }
long far fn_c0211(void) { return 0; }
long far fn_c0254(void) { return 0; }
long far fn_c0274(int p0, int p1, void far *p2) { return 0; }
int far fn_c02d7(int p0, int p1, void far *p2) { return 0; }
long far fn_c0325(void) { return 0; }
long far fn_c03b2(void far *p0) { return 0; }
long far fn_c0446(void) { return 0; }
