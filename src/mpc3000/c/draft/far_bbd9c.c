/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_FP_E40C {
    char pad_0[1];
};
extern unsigned char B_7B8D;
extern char B_D5DD;
extern char B_D5DE;
extern unsigned char B_E421;
extern struct g_FP_E40C FP_E40C;
extern unsigned char TBL_83D1;
extern unsigned char W_E40E;
extern int W_EFA1;
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1d48();
extern long far far_b3471(void far *, char far *, int);
extern long far far_b362e(void far *, char far *, char far *, int);
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b3b9f(int);
extern long far far_b6beb(long, void far *);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_bd216();
extern int far far_c6547(int);
extern long far far_caade(long);
extern long far far_cab20(int);
extern long far far_cad00(int);
extern int far far_cad6d(char far *, int, int);
extern int far far_cb457(int);
extern long far far_cca70(void);
extern long far far_cce4b(long, long, int);
extern long far far_cd063(void);
extern long far far_cd087(void);
extern void far far_cd0a9(void);
extern long far far_cd353(int, int);
extern int far far_cd551(void far *);
extern long far far_cd5d8(int);
extern void far far_da3fa(int);
extern long far far_da8a5(int, int);
extern long far far_ebcce(char far *, int, int);
extern long far far_fa0c8(int, int, int);
extern int far far_fa6e5(char far *, int, int, void far *);
extern long far fn_bd1a3(int);
extern long far fn_bd237(int, int, int, int, int, int, int, int, int, int, int, int);

long far far_bbd9c(int arg_0, int arg_2, int arg_4)
{
    char loc_9ca[64];
    char loc_98a[32];
    char loc_96a[32];
    char loc_94a[32];
    char loc_92a[32];
    char loc_90a[32];
    char loc_8ea[32];
    char loc_8ca[140];
    char loc_83e[34];
    char loc_81c[18];
    char loc_80a[4];
    char loc_806[4];
    char loc_802[2];
    char loc_800[6];
    char loc_7fa[2];
    char loc_7f8[2];
    char loc_7f6[2];
    char loc_7f4[2];
    char loc_7f2[2];
    char loc_7f0[1];
    char loc_7ef[3];
    char loc_7ec[2];
    char loc_7ea[3];
    char loc_7e7[1];
    char loc_7e6[1952];
    char loc_46[16];
    char loc_36[2];
    int loc_34;
    int loc_32;
    int loc_30;
    int loc_2e;
    int loc_2c;
    int loc_2a;
    int loc_28;
    int loc_26;
    int loc_24;
    int loc_22;
    unsigned long loc_20;
    int loc_1e;
    int loc_1c;
    char loc_1a[3];
    char loc_17;
    char loc_16;
    char loc_15;
    char loc_14;
    char loc_13;
    char loc_12;
    char loc_11;
    char loc_10;
    char loc_f;
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
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
    int ax18;
    int ax19;
    int ax2;
    int ax20;
    int ax21;
    int ax22;
    int ax23;
    int ax24;
    int ax25;
    int ax26;
    int ax27;
    int ax28;
    int ax29;
    int ax3;
    int ax30;
    int ax31;
    int ax32;
    int ax33;
    int ax34;
    unsigned int ax35;
    unsigned int ax36;
    int ax37;
    int ax38;
    int ax39;
    int ax4;
    int ax40;
    int ax41;
    int ax42;
    int ax43;
    int ax44;
    int ax45;
    int ax46;
    int ax47;
    int ax48;
    int ax49;
    int ax5;
    int ax50;
    int ax51;
    int ax52;
    int ax53;
    int ax54;
    int ax55;
    int ax56;
    int ax57;
    int ax58;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int cx;
    int cx10;
    int cx11;
    int cx12;
    int cx13;
    unsigned int cx14;
    int cx15;
    int cx16;
    int cx17;
    unsigned int cx18;
    int cx19;
    int cx2;
    int cx20;
    int cx21;
    int cx22;
    unsigned int cx3;
    int cx4;
    int cx5;
    unsigned int cx6;
    int cx7;
    int cx8;
    unsigned int cx9;
    int di;
    int di10;
    int di11;
    int di2;
    int di3;
    int di4;
    int di5;
    int di6;
    int di7;
    int di8;
    int di9;
    int ds;
    int ds2;
    int dx;
    int dx10;
    int dx11;
    int dx12;
    int dx13;
    int dx14;
    int dx15;
    int dx16;
    int dx2;
    int dx3;
    int dx4;
    unsigned int dx5;
    int dx6;
    int dx7;
    unsigned int dx8;
    int dx9;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int flags;
    int p2514;
    int p25142;
    int p2516;
    int p25162;
    int p25163;
    int p25164;
    int p25165;
    int p2518;
    int p25182;
    int p2520;
    int si;
    int si2;
    int si3;
    int si4;
    int si5;
    int si6;
    int si7;
    long t1;
    int t10;
    long t100;
    long t101;
    long t102;
    int t103;
    long t104;
    long t105;
    long t106;
    long t107;
    long t108;
    long t109;
    int t11;
    long t110;
    long t111;
    long t112;
    long t113;
    long t114;
    int t115;
    long t116;
    long t117;
    long t118;
    long t119;
    int t12;
    long t120;
    long t121;
    long t122;
    long t123;
    long t124;
    long t125;
    long t126;
    long t127;
    long t128;
    long t129;
    int t13;
    long t130;
    long t131;
    long t132;
    long t133;
    long t134;
    long t135;
    long t136;
    long t137;
    long t138;
    long t139;
    int t14;
    int t140;
    long t141;
    long t142;
    long t143;
    long t144;
    long t145;
    long t146;
    long t147;
    int t15;
    int t16;
    long t17;
    long t18;
    int t19;
    long t2;
    int t20;
    long t21;
    long t22;
    long t23;
    long t24;
    int t25;
    long t26;
    long t27;
    int t28;
    int t29;
    long t3;
    long t30;
    int t31;
    int t32;
    int t33;
    int t34;
    long t35;
    int t36;
    long t37;
    int t38;
    long t39;
    long t4;
    int t40;
    int t41;
    long t42;
    int t43;
    int t44;
    long t45;
    int t46;
    int t47;
    long t48;
    int t49;
    long t5;
    int t50;
    int t51;
    long t52;
    int t53;
    int t54;
    int t55;
    int t56;
    int t57;
    int t58;
    int t59;
    int t6;
    long t60;
    int t61;
    int t62;
    int t63;
    long t64;
    long t65;
    long t66;
    int t67;
    long t68;
    int t69;
    int t7;
    long t70;
    int t71;
    int t72;
    long t73;
    long t74;
    int t75;
    long t76;
    int t77;
    long t78;
    long t79;
    int t8;
    int t80;
    long t81;
    int t82;
    int t83;
    long t84;
    long t85;
    int t86;
    int t87;
    long t88;
    long t89;
    int t9;
    long t90;
    long t91;
    int t92;
    long t93;
    int t94;
    long t95;
    int t96;
    long t97;
    int t98;
    int t99;

    B_D5DD = (char)105;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x39de));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x39f9));
    t2 = far_b90dd();
    far_b1ad0(7, 0);
    t3 = far_ebcce((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_17), 2, 0);
    if ((int)t3 != 0) {
        return t3;
    }
    loc_e = loc_17 - 1;
    far_b1ad0(7, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x3a6b));
    t4 = far_cad00(0);
    t5 = far_caade(*(long *)((char *)&arg_0 + 0));
    W_EFA1 = (int)t5;
    if ((int)t5 < 0) {
        return (long)MK_FP((int)(far_b3b9f((int)t5) >> 16), B_D5DE);
    }
    t6 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_10), W_EFA1, 2);
    if (t6 != 0) {
        return (long)MK_FP((int)(far_b3b9f(t6) >> 16), B_D5DE);
    }
    if (loc_10 != arg_4 || loc_f > 1) {
        return (long)MK_FP((int)(far_b3b9f(-32) >> 16), B_D5DE);
    }
    *(int *)((char *)&loc_1a + 0) = 0;
    loc_1c = 0;
    t7 = far_cad6d((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1c), W_EFA1, 3);
    if (t7 != 0) {
        return (long)MK_FP((int)(far_b3b9f(t7) >> 16), B_D5DE);
    }
    ax6 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_81c), W_EFA1, 0x7d6);
    if (ax6 != 0) {
        return (long)MK_FP((int)(far_b3b9f(ax6) >> 16), B_D5DE);
    }
    di = 0x425;
    if (arg_4 != 5) {
        goto L1;
    }
    t8 = far_cad6d(MK_FP(SEG_DATA, -0x2029), W_EFA1, 1);
    if (t8 != 0) {
        return (long)MK_FP((int)(far_b3b9f(t8) >> 16), B_D5DE);
    }
    di = di - 1;
L1:
    ax7 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_83e), W_EFA1, 34);
    if (ax7 != 0) {
        return (long)MK_FP((int)(far_b3b9f(ax7) >> 16), B_D5DE);
    }
    di2 = di - 34;
    loc_2 = 1;
    if (arg_4 != 2 && loc_f != 0) {
        goto L2;
    }
    ax8 = far_cad6d((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), W_EFA1, 1);
    if (ax8 != 0) {
        return (long)MK_FP((int)(far_b3b9f(ax8) >> 16), B_D5DE);
    }
    if (arg_4 == 2) {
        di2 = di2 - 1;
    }
L2:
    if (loc_2 != 0) {
        t9 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_94a), W_EFA1, 32);
        if (t9 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t9) >> 16), B_D5DE);
        }
        t10 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_96a), W_EFA1, 32);
        if (t10 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t10) >> 16), B_D5DE);
        }
        t11 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_98a), W_EFA1, 32);
        if (t11 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t11) >> 16), B_D5DE);
        }
        t12 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_9ca), W_EFA1, 64);
        if (t12 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t12) >> 16), B_D5DE);
        }
        di2 = di2 - 160;
        if (loc_f <= 0) {
            goto L3;
        }
        t13 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8ea), W_EFA1, 32);
        if (t13 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t13) >> 16), B_D5DE);
        }
        t14 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_90a), W_EFA1, 32);
        if (t14 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t14) >> 16), B_D5DE);
        }
        t15 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_92a), W_EFA1, 32);
        if (t15 != 0) {
            return (long)MK_FP((int)(far_b3b9f(t15) >> 16), B_D5DE);
        }
        di2 = di2 - 96;
        goto L3;
    }
L3:
    p2516 = W_EFA1;
    t16 = far_cad6d(MK_FP(0xa853 /* SEG_A28F */, 0), p2516, di2);
    if (t16 != 0) {
        return (long)MK_FP((int)(far_b3b9f(t16) >> 16), B_D5DE);
    }
    p2514 = W_EFA1;
    t17 = far_cab20(p2514);
    cx = UNDEF;
    es = UNDEF;
    si = (int)t17;
    if ((int)t17 < 0) {
        return (long)MK_FP((int)(far_b3b9f((int)t17) >> 16), B_D5DE);
    }
    loc_a = 0;
    loc_1e = 0;
    *(int *)((char *)&loc_20 + 0) = 0;
    loc_2 = 0;
    loc_34 = (int)(unsigned)loc_8ca;
    ds = SEG_DATA;
    for (;;) {
L4:
        if (*(char *)((char *)&loc_81c + 0 + loc_2 * 59) != 0) {
            loc_c = 0;
            loc_4 = 0;
            loc_32 = (int)(unsigned)loc_8ca;
            if (loc_4 < loc_a) {
                do {
                    t18 = (long)(int)loc_2 * 59L;
                    bx = loc_32;
                    di3 = (int)*(long far *)MK_FP(SEG_STACK, bx);
                    es = (int)(*(long far *)MK_FP(SEG_STACK, bx) >> 16);
                    p2516 = (int)(unsigned)(loc_81c + (int)t18);
                    t19 = __repne_scas1(MK_FP(es, di3), 0, -1);
                    cx2 = ~t19;
                    p2514 = ds;
                    ax9 = 0;
                    t20 = __repe_cmps1(MK_FP(SEG_STACK, p2516), MK_FP(es, di3 + (-1 - t19) - cx2), cx2);
                    si = UNDEF;
                    di2 = UNDEF;
                    cx = UNDEF;
                    ds = p2514;
                    if (!CC("==", UNDEF)) {
                        ax9 = 0 - 0 - CC("<u", UNDEF) + 1;
                    }
                    if (ax9 == 0) {
                        goto L5;
                    }
                    loc_32 = loc_32 + 4;
                    loc_4 = loc_4 + 1;
                } while (loc_4 < loc_a);
            }
            goto L6;
        }
        goto L7;
    }
    goto L8;
L5:
    loc_c = 1;
L6:
    if (loc_c == 0) {
        t21 = (long)(int)loc_2 * 59L;
        bx2 = loc_34;
        *(int far *)MK_FP(SEG_STACK, bx2 + 2) = SEG_STACK;
        *(int far *)MK_FP(SEG_STACK, bx2) = (int)(unsigned)(loc_81c + (int)t21);
        t22 = (long)(int)loc_2 * 59L;
        bx3 = (int)(unsigned)(loc_806 + (int)t22);
        ax10 = *(int far *)MK_FP(SEG_STACK, bx3 + 2);
        dx = *(int far *)MK_FP(SEG_STACK, bx3);
        *(int *)((char *)&loc_20 + 0) = *(int *)((char *)&loc_20 + 0) + dx;
        loc_1e = (int)(loc_20 + ((long)ax10 << 16 | (unsigned)dx) >> 16);
        loc_34 = loc_34 + 4;
        loc_a = loc_a + 1;
    }
L7:
    loc_2 = loc_2 + 1;
    if (loc_2 < 34) {
        goto L4;
    }
L8:
    bx4 = (int)(unsigned)(loc_8ca + (loc_a << 2));
    *(int far *)MK_FP(SEG_STACK, bx4 + 2) = 0;
    *(int far *)MK_FP(SEG_STACK, bx4) = 0;
    if (loc_e == 1) {
        t66 = far_b6cd3(MK_FP(ds, 0x3a8a));
        *(char far *)MK_FP(ds, (unsigned)&B_D5DD) = (char)109;
        t67 = far_fa6e5((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8ca), loc_a, 4, (void far *)far_bd216);
        loc_15 = (char)0;
        t68 = far_b362e(MK_FP(ds, 0x3aab), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_15), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8ca), 16);
        loc_2 = 0;
        cx12 = (int)(unsigned)loc_81c;
        ax24 = (int)(unsigned)(loc_8ca + (loc_15 << 2));
        while (*(int far *)MK_FP(SEG_STACK, ax24 + 2) != SEG_STACK || *(int far *)MK_FP(SEG_STACK, ax24) != cx12) {
            cx12 = cx12 + 59;
            loc_2 = loc_2 + 1;
            if (loc_2 < 34) {
                continue;
            }
            break;
        }
        loc_16 = *(char *)((char *)&loc_2 + 0);
        ax25 = (int)(unsigned)(loc_806 + loc_2 * 59);
        dx4 = *(int far *)MK_FP(SEG_STACK, ax25);
        loc_26 = *(int far *)MK_FP(SEG_STACK, ax25 + 2);
        loc_28 = dx4;
        t69 = far_b1ad0(1, 29);
        dx5 = loc_28;
        dx6 = dx5 << 1;
        t70 = (((long)(loc_26 << 1 | dx5 >> 15 & 1) << 16 | (unsigned)dx6) + 0x3ffL) / 0x400L;
        t71 = far_b1d48(MK_FP(ds, 0x3ab2), (int)t70, (int)(t70 >> 16));
        t72 = far_b1ad0(2, 24);
        t73 = far_cca70();
        p2520 = (int)t73 << 1;
        t74 = ((long)((int)(t73 >> 16) << 1 | (unsigned int)(int)t73 >> 15 & 1) << 16 | (unsigned)p2520) / 0x400L;
        loc_2 = (int)t74;
        p2518 = 0x3abc;
        t75 = far_b1d48(MK_FP(ds, p2518), (int)t74);
        t76 = far_b90dd();
        t77 = far_b1ad0(7, 0);
        p25164 = 0x3acb;
        ax26 = far_b1b05(MK_FP(ds, p25164));
        for (;;) {
            t87 = far_b08f7(1);
            if (t87 != 0) {
                break;
            }
            if (*(char far *)MK_FP(ds, (unsigned)&B_7B8D) != 0) {
                continue;
            }
            loc_2 = 0;
            t78 = 0L;
            cx13 = (int)(unsigned)(loc_81c + (int)t78);
            ax27 = (int)(unsigned)(loc_8ca + (loc_15 << 2));
            while (*(int far *)MK_FP(SEG_STACK, ax27 + 2) != SEG_STACK || *(int far *)MK_FP(SEG_STACK, ax27) != cx13) {
                cx13 = cx13 + 59;
                loc_2 = loc_2 + 1;
                if (loc_2 < 34) {
                    continue;
                }
                break;
            }
            loc_16 = *(char *)((char *)&loc_2 + 0);
            t79 = (long)(int)loc_2 * 59L;
            ax28 = (int)(unsigned)(loc_806 + (int)t79);
            dx7 = *(int far *)MK_FP(SEG_STACK, ax28);
            loc_26 = *(int far *)MK_FP(SEG_STACK, ax28 + 2);
            loc_28 = dx7;
            t80 = far_b1ad0(1, 29);
            dx8 = loc_28;
            dx9 = dx8 << 1;
            t81 = (((long)(loc_26 << 1 | dx8 >> 15 & 1) << 16 | (unsigned)dx9) + 0x3ffL) / 0x400L;
            t82 = far_b1d48(MK_FP(ds, 0x3ab2), (int)t81, (int)(t81 >> 16));
            t83 = far_b1ad0(2, 24);
            t84 = far_cca70();
            p2520 = (int)t84 << 1;
            t85 = ((long)((int)(t84 >> 16) << 1 | (unsigned int)(int)t84 >> 15 & 1) << 16 | (unsigned)p2520) / 0x400L;
            loc_2 = (int)t85;
            p25164 = ds;
            p2518 = 0x3abc;
            t86 = far_b1d48(((long)p25164 << 16 | (unsigned)p2518), (int)t85);
        }
        ax29 = (int)(unsigned)(loc_80a + loc_16 * 59);
        t88 = *(long far *)MK_FP(SEG_STACK, ax29) / 2L;
        t89 = far_fa0c8(3, (int)t88, (int)(t88 >> 16));
        dx10 = (int)(t89 >> 16) + ((unsigned int)((int)t89 + 0xc00) < (unsigned int)(int)t89);
        loc_2e = dx10;
        loc_30 = (int)t89 + 0xc00;
        if (t87 != 120) {
            return ((long)dx10 << 16 | (unsigned)t87);
        }
        ax30 = (int)(unsigned)(loc_8ca + (loc_15 << 2));
        t90 = far_cce4b(*(long far *)MK_FP(SEG_STACK, ax30), *(long *)((char *)&loc_28 + 0), 0);
        loc_6 = (int)t90;
        if (loc_6 < 0) {
            return (long)MK_FP((int)(far_b3b9f(-(int)t90) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
        }
        t91 = (long)(int)loc_6 * 36L;
        dx11 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t91 + 0x4820);
        loc_2a = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t91 + 0x4822);
        loc_2c = dx11;
        dx12 = loc_28;
        loc_22 = loc_26;
        loc_24 = dx12;
        goto L9;
    }
    if ((int)far_cd087() < loc_a) {
        return (long)MK_FP((int)(far_b3b9f(3) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    t23 = far_cca70();
    flags = (int)(t23 >> 16) - loc_1e;
    if (!CC(">", flags) && (CC("<", flags) || (unsigned int)(int)t23 < (unsigned int)*(int *)((char *)&loc_20 + 0))) {
        return (long)MK_FP((int)(far_b3b9f(2) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    t24 = far_b6cd3(MK_FP(ds, 0x39de));
    *(char far *)MK_FP(ds, (unsigned)&B_D5DD) = (char)106;
    t25 = far_b1b05(MK_FP(ds, 0x3ad5));
    loc_11 = (char)(*(char far *)MK_FP(ds, (unsigned)&B_E421) + 1);
    t26 = far_b3819(MK_FP(ds, 0x3afa), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_11), 2, 1, 24, 8);
    cx3 = ~__repne_scas1((int)*(long far *)MK_FP(ds, (unsigned)&FP_E40C), 0, -1);
    cx4 = cx3 >> 1;
    ax11 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
    si2 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_46), ((long)ax11 << 16 | (unsigned)si2), cx4 * 2);
    di4 = (int)(unsigned)(loc_46 + cx4 * 2);
    cx5 = cx3 & 1;
    __movs1(MK_FP(SEG_STACK, di4), ((long)ax11 << 16 | (unsigned)(si2 + cx4 * 2)), cx5);
    di5 = di4 + cx5;
    ds = ds;
    t27 = far_b3471(MK_FP(ds, 0x3b03), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_46), 16);
    t28 = far_b1ad0(4, 0);
    t29 = far_b1b05(MK_FP(ds, 0x3b05));
    t30 = far_b90dd();
    t31 = far_b1ad0(7, 0);
    p25162 = 0x3b26;
    ax12 = far_b1b05(MK_FP(ds, p25162));
    for (;;) {
        t36 = far_b08f7(1);
        if (t36 != 0) {
            break;
        }
        ax13 = *(char far *)MK_FP(ds, (unsigned)&B_7B8D);
        if (ax13 != 0) {
            if (ax13 != 1) {
                continue;
            }
            ax14 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
            si3 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
            t32 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_46), 0, -1);
            cx6 = ~t32;
            cx7 = cx6 >> 1;
            __movs2(((long)ax14 << 16 | (unsigned)si3), MK_FP(SEG_STACK, si3), cx7 * 2);
            di6 = si3 + cx7 * 2;
            cx8 = cx6 & 1;
            __movs1(((long)ax14 << 16 | (unsigned)di6), MK_FP(SEG_STACK, si3 + cx7 * 2), cx8);
            di5 = di6 + cx8;
            ds = ds;
            continue;
        }
        t33 = far_c6547(loc_11 - 1);
        p25162 = (int)(unsigned)loc_46;
        t34 = __repne_scas1((int)*(long far *)MK_FP(ds, (unsigned)&FP_E40C), 0, -1);
        cx9 = ~t34;
        cx10 = cx9 >> 1;
        ax15 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
        si4 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
        __movs2(MK_FP(SEG_STACK, p25162), ((long)ax15 << 16 | (unsigned)si4), cx10 * 2);
        di7 = p25162 + cx10 * 2;
        cx11 = cx9 & 1;
        __movs1(MK_FP(SEG_STACK, di7), ((long)ax15 << 16 | (unsigned)(si4 + cx10 * 2)), cx11);
        di5 = di7 + cx11;
        ds = ds;
        t35 = far_b1073(1);
    }
    if (t36 != 120) {
        return ((long)UNDEF << 16 | (unsigned)t36);
    }
    *(char far *)MK_FP(ds, (unsigned)&B_D5DD) = (char)107;
    t37 = far_b6cd3(MK_FP(ds, 0x39de));
    t38 = far_b1b05(MK_FP(ds, 0x3b30));
    t39 = far_b90dd();
    t40 = far_b1ad0(7, 0);
    ax16 = far_b1b05(MK_FP(ds, 0x3bea));
    do {
        t41 = far_b08f7(1);
    } while (t41 == 0);
    if (t41 != 120) {
        return ((long)UNDEF << 16 | (unsigned)t41);
    }
    *(char far *)MK_FP(ds, (unsigned)&B_D5DD) = (char)108;
    t42 = far_b6cd3(MK_FP(ds, 0x39de));
    t43 = far_b1b05(MK_FP(ds, 0x3bf8));
    t44 = far_b1ad0(4, 0);
    loc_12 = (char)0;
    t45 = far_b362e(MK_FP(ds, 0x3c6f), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_12), MK_FP(ds, 0x3fc), 9);
    loc_13 = (char)(loc_12 - 2);
    if (loc_13 < 0) {
        loc_13 = (char)0;
    }
    ax17 = loc_13 << 2;
    t46 = far_b1b05(*(long far *)MK_FP(ds, ax17 + 0x274));
    t47 = far_b1b05(MK_FP(ds, 0x3b24));
    loc_14 = *(char far *)MK_FP(ds, (unsigned)&TBL_83D1 + loc_12);
    t48 = far_b3819(MK_FP(ds, 0x3c7c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_14), 2, 35, 98, 8);
    t49 = far_b1ad0(5, 16);
    t50 = far_b1b05(MK_FP(ds, 0x3c8a));
    ax18 = loc_14 << 2;
    t51 = far_b1b05(*(long far *)MK_FP(ds, ax18 + 0x3fc));
    t52 = far_b90dd();
    t53 = far_b1ad0(7, 0);
    p25163 = 0x3ca1;
    ax19 = far_b1b05(MK_FP(ds, p25163));
    for (;;) {
        t63 = far_b08f7(1);
        if (t63 != 0) {
            break;
        }
        ax20 = *(char far *)MK_FP(ds, (unsigned)&B_7B8D);
        if (ax20 != 0) {
            if (ax20 != 1) {
                continue;
            }
            *(char far *)MK_FP(ds, (unsigned)&TBL_83D1 + loc_12) = loc_14;
            t54 = far_b1ad0(5, 26);
            ax21 = loc_14 << 2;
            p25163 = *(int far *)MK_FP(ds, ax21 + 0x3fc);
            t55 = far_b1b05(((long)*(int far *)MK_FP(ds, ax21 + 0x3fe) << 16 | (unsigned)p25163));
            continue;
        }
        t56 = far_b1ad0(4, 20);
        loc_13 = (char)(loc_12 - 2);
        if (loc_13 < 0) {
            loc_13 = (char)0;
        }
        t57 = far_b1b05(MK_FP(ds, 0x3c7a));
        ax22 = loc_13 << 2;
        t58 = far_b1b05(*(long far *)MK_FP(ds, ax22 + 0x274));
        t59 = far_b1b05(MK_FP(ds, 0x3b24));
        loc_14 = *(char far *)MK_FP(ds, (unsigned)&TBL_83D1 + loc_12);
        t60 = far_b1073(1);
        t61 = far_b1ad0(5, 26);
        ax23 = loc_14 << 2;
        p25163 = *(int far *)MK_FP(ds, ax23 + 0x3fc);
        t62 = far_b1b05(((long)*(int far *)MK_FP(ds, ax23 + 0x3fe) << 16 | (unsigned)p25163));
    }
    if (t63 != 120) {
        return ((long)UNDEF << 16 | (unsigned)t63);
    }
    t64 = far_cce4b(MK_FP(ds, 0x3cad), loc_20, 0);
    loc_6 = (int)t64;
    t65 = (long)(int)(int)t64 * 36L;
    dx2 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t65 + 0x4820);
    loc_2a = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t65 + 0x4822);
    loc_2c = dx2;
    loc_2e = 0;
    loc_30 = 0xc00;
    dx3 = *(int *)((char *)&loc_20 + 0);
    loc_22 = loc_1e;
    loc_24 = dx3;
L9:
    far_da3fa(1);
    t93 = fn_bd237(arg_0, arg_2, *(int far *)MK_FP(ds, (unsigned)&W_EFA1), arg_4, loc_30, loc_2e, loc_2c, loc_2a, loc_24, loc_22, loc_1c, *(int *)((char *)&loc_1a + 0));
    if ((int)t93 != 0) {
        far_da3fa(0);
        t95 = far_cad00(0);
        dx13 = (int)(far_cd353(loc_6, 0) >> 16);
        if (loc_e == 0) {
            ax31 = far_cb457(loc_11 - 1);
            dx13 = UNDEF;
        }
        if ((int)t93 >= 0) {
            return ((long)dx13 << 16 | (unsigned)(int)t93);
        }
        return (long)MK_FP((int)(far_b3b9f((int)t93) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    far_da3fa(0);
    t97 = far_cad00(0);
    if (loc_e == 1) {
        ax57 = *(int *)((char *)&loc_7fa + 0 + loc_16 * 59);
        t144 = far_fa0c8(40, ax57, -(ax57 < 0));
        t145 = (long)(int)loc_6 * 36L;
        *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t145 + 0x4816) = (int)(t144 >> 16);
        *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t145 + 0x4814) = (int)t144;
        ax58 = *(int *)((char *)&loc_7f8 + 0 + loc_16 * 59);
        t146 = far_fa0c8(40, ax58, -(ax58 < 0));
        t147 = (long)(int)loc_6 * 36L;
        *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t147 + 0x481a) = (int)(t146 >> 16);
        *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t147 + 0x4818) = (int)t146;
        *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t147 + 0x4813) = (char)0;
        *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t147 + 0x4811) = (char)100;
        *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t147 + 0x4812) = (char)-17;
        dx16 = (int)(far_cd5d8(loc_6) >> 16);
    } else {
        t98 = far_c6547(loc_11 - 1);
        di8 = 0;
        p25165 = (int)(unsigned)loc_46;
        p25182 = arg_2;
        ax32 = (int)far_b6beb(((long)p25182 << 16 | (unsigned)arg_0), MK_FP(SEG_STACK, p25165));
        loc_2 = 0;
        do {
            bx5 = (int)(unsigned)(loc_46 + loc_2);
            if (*(char far *)MK_FP(SEG_STACK, bx5) == 46 || di8 == 1) {
                *(char far *)MK_FP(SEG_STACK, bx5) = (char)32;
                di8 = 1;
            }
            loc_2 = loc_2 + 1;
        } while (loc_2 < 17);
        loc_36[0] = (char)0;
        ax33 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
        si5 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
        cx14 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_46), 0, -1);
        cx15 = cx14 >> 1;
        p25142 = ds;
        __movs2(((long)ax33 << 16 | (unsigned)si5), MK_FP(SEG_STACK, si5), cx15 * 2);
        si6 = si5 + cx15 * 2;
        di9 = si5 + cx15 * 2;
        cx16 = cx14 & 1;
        __movs1(((long)ax33 << 16 | (unsigned)di9), MK_FP(SEG_STACK, si6), cx16);
        si7 = si6 + cx16;
        di10 = di9 + cx16;
        cx17 = 0;
        ds2 = p25142;
        es2 = 0xa853 /* SEG_A28F */;
        *(char far *)MK_FP(es2, loc_6 * 36 + 0x4800) = (char)0;
        loc_2 = 0;
        do {
            ax34 = (int)(unsigned)(loc_81c + loc_2 * 59);
            if (*(char far *)MK_FP(SEG_STACK, ax34) != 0) {
                t99 = far_cd551(MK_FP(SEG_STACK, ax34));
                if (t99 < 0) {
                    t100 = far_cd063();
                    loc_6 = (int)t100;
                    t101 = (long)(int)loc_2 * 59L;
                    p25182 = 0xa853 /* SEG_A28F */;
                    t102 = (long)(int)loc_6 * 36L;
                    t103 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_81c + (int)t101)), 0, -1);
                    cx18 = ~t103;
                    cx19 = cx18 >> 1;
                    __movs2(((long)p25182 << 16 | (unsigned)((int)t102 + 0x4800)), MK_FP(SEG_STACK, (int)t102 + 0x4800), cx19 * 2);
                    di11 = (int)t102 + 0x4800 + cx19 * 2;
                    cx20 = cx18 & 1;
                    __movs1(((long)p25182 << 16 | (unsigned)di11), MK_FP(SEG_STACK, (int)t102 + 0x4800 + cx19 * 2), cx20);
                    di10 = di11 + cx20;
                    ds2 = ds2;
                    t104 = (long)(int)loc_2 * 59L;
                    ax35 = (unsigned int)(unsigned)(loc_80a + (int)t104);
                    ax36 = ax35 + *(int far *)MK_FP(SEG_STACK, ax35);
                    t105 = (long)(int)loc_6 * 36L;
                    si7 = (int)t105;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t105 + 0x4822) = loc_2a + *(int far *)MK_FP(SEG_STACK, ax35 + 2) + (ax36 < ax35);
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t105 + 0x4820) = ax36;
                    t106 = (long)(int)loc_2 * 59L;
                    ax37 = (int)(unsigned)(loc_806 + (int)t106);
                    ax38 = *(int far *)MK_FP(SEG_STACK, ax37 + 2);
                    dx14 = *(int far *)MK_FP(SEG_STACK, ax37);
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, si7 + 0x481e) = ax38;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, si7 + 0x481c) = dx14;
                    if (loc_f == 0) {
                        ax40 = ((char)(ax38 >> 8) << 8 | (unsigned char)100);
                    } else {
                        t107 = (long)(int)loc_2 * 59L;
                        ax39 = (int)(unsigned)(loc_7f0 + (int)t107);
                        ax40 = ((char)(ax39 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(SEG_STACK, ax39));
                    }
                    *(char far *)MK_FP(0xa853 /* SEG_A28F */, si7 + 0x4811) = (char)ax40;
                    *(char far *)MK_FP(0xa853 /* SEG_A28F */, si7 + 0x4812) = (char)-17;
                    *(char far *)MK_FP(0xa853 /* SEG_A28F */, si7 + 0x4813) = (char)0;
                    t108 = (long)(int)loc_2 * 59L;
                    ax41 = *(int *)((char *)&loc_7fa + 0 + (int)t108);
                    t109 = far_fa0c8(40, ax41, -(ax41 < 0));
                    t110 = (long)(int)loc_6 * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t110 + 0x4816) = (int)(t109 >> 16);
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t110 + 0x4814) = (int)t109;
                    t111 = (long)(int)loc_2 * 59L;
                    ax42 = *(int *)((char *)&loc_7f8 + 0 + (int)t111);
                    t112 = far_fa0c8(40, ax42, -(ax42 < 0));
                    t113 = (long)(int)loc_6 * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t113 + 0x481a) = (int)(t112 >> 16);
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t113 + 0x4818) = (int)t112;
                }
                loc_4 = 0;
                do {
                    if (loc_83e[loc_4] == loc_2) {
                        loc_8 = *(char far *)MK_FP(ds2, (unsigned)&TBL_83D1 + loc_4);
                    }
                    loc_4 = loc_4 + 1;
                } while (loc_4 < 34);
                t114 = (long)(int)loc_2 * 59L;
                t115 = far_cd551((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)(loc_81c + (int)t114)));
                t116 = (long)(int)loc_8 * 24L;
                cx21 = (int)t116;
                es3 = (int)(*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) >> 16);
                *(char far *)MK_FP(es3, (int)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + (int)t116 - 0x30a) = (char)t115;
                if (loc_f != 1) {
                    t118 = (long)(int)loc_2 * 59L;
                    t119 = fn_bd1a3(*(int *)((char *)&loc_7f2 + 0 + (int)t118));
                    t120 = (long)(int)loc_8 * 24L;
                    *(int far *)((char far *)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + -769 + (int)t120) = (int)t119;
                } else {
                    t117 = (long)(int)loc_2 * 59L;
                    si7 = (int)t117;
                    *(int far *)MK_FP(es3, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx21 - 0x301) = *(int *)((char *)&loc_800 + 0 + (int)t117) + *(int *)((char *)&loc_802 + 0 + si7);
                }
                t121 = (long)(int)loc_2 * 59L;
                t122 = far_da8a5(*(int *)((char *)&loc_7f6 + 0 + (int)t121), 1);
                t123 = (long)(int)loc_8 * 24L;
                *(char far *)((char far *)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + -767 + (int)t123) = (char)(int)t122;
                t124 = (long)(int)loc_2 * 59L;
                p25165 = *(int *)((char *)&loc_7f4 + 0 + (int)t124);
                t125 = far_da8a5(p25165, 1);
                t126 = (long)(int)loc_8 * 24L;
                cx17 = (int)t126;
                ax43 = (int)t125;
                *(char far *)((char far *)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + -766 + (int)t126) = (char)ax43;
                if (loc_f == 0) {
                    ax45 = ((char)(ax43 >> 8) << 8 | (unsigned char)100);
                } else {
                    t127 = (long)(int)loc_2 * 59L;
                    ax44 = (int)(unsigned)(loc_7ef + (int)t127);
                    ax45 = ((char)(ax44 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(SEG_STACK, ax44));
                }
                *(char far *)((char far *)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + -759 + cx17) = (char)ax45;
                if (loc_f == 0) {
                    ax46 = ((char)(ax45 >> 8) << 8 | (unsigned char)0);
                } else {
                    t128 = (long)(int)loc_2 * 59L;
                    p25165 = *(int *)((char *)&loc_7ec + 0 + (int)t128);
                    t129 = far_da8a5(p25165, 1);
                    cx17 = UNDEF;
                    ax46 = (int)t129;
                }
                t130 = (long)(int)loc_8 * 24L;
                ax47 = ax46;
                *(char far *)((char far *)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + -758 + (int)t130) = (char)ax47;
                if (loc_f == 0) {
                    ax48 = ((char)(ax47 >> 8) << 8 | (unsigned char)0);
                } else {
                    t131 = (long)(int)loc_2 * 59L;
                    p25165 = *(int *)((char *)&loc_7ea + 0 + (int)t131);
                    t132 = far_da8a5(p25165, 1);
                    cx17 = UNDEF;
                    ax48 = (int)t132;
                }
                p25142 = ax48;
                t133 = (long)(int)loc_8 * 24L;
                es2 = (int)(*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) >> 16);
                *(char far *)MK_FP(es2, (int)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + (int)t133 - 0x2f5) = (char)p25142;
                t134 = (long)(int)loc_2 * 59L;
                t135 = (long)(signed char)loc_7e7[(int)t134] * 25L;
                t136 = (long)(int)(int)t135;
                *(char far *)MK_FP(es2, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + (loc_8 << 2) + 0x5b2) = (char)(int)(t136 / 32L);
                t137 = (long)(int)loc_2 * 59L;
                t138 = (long)(signed char)loc_7e6[(int)t137] * 25L;
                t139 = (long)(int)(int)t138;
                *(char far *)MK_FP(es2, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + (loc_8 << 2) + 0x5b3) = (char)(int)(t139 / 32L);
            }
            loc_2 = loc_2 + 1;
        } while (loc_2 < 34);
        far_cd0a9();
        ax49 = ((char)(UNDEF >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds2, (unsigned)&TBL_83D1));
        loc_8 = (char)ax49;
        t141 = (long)(signed char)(char)ax49 * 24L;
        dx15 = (int)(t141 >> 16);
        cx22 = (int)t141;
        es4 = (int)(*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) >> 16);
        *(char far *)MK_FP(es4, (int)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + (int)t141 - 0x309) = (char)3;
        *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x308) = (char)22;
        ax50 = ((char)((int)t141 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds2, 0x77a8));
        *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x307) = (char)ax50;
        *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x306) = (char)41;
        ax51 = ((char)(ax50 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds2, 0x77a9));
        *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x305) = (char)ax51;
        ax52 = ((char)(ax51 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds2, 0x77a8));
        *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x303) = (char)ax52;
        ax53 = ((char)(ax52 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds2, 0x77a9));
        *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x302) = (char)ax53;
        *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x2fd) = (char)1;
        bx6 = *(int far *)MK_FP(ds2, (unsigned)&FP_E40C);
        ax54 = ((char)(ax53 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_8 + 0));
        *(char far *)MK_FP(es4, bx6 + 17) = (char)ax54;
        *(char far *)MK_FP(es4, bx6 + cx22 - 0x2f3) = (char)1;
        ax55 = ((char)(ax54 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds2, (unsigned)&TBL_83D1));
        *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + 0x73e) = (char)ax55;
        loc_2 = 3;
        while (loc_2 < 34) {
            ax55 = ((char)(ax55 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds2, (unsigned)&TBL_83D1 + loc_2));
            es4 = (int)(*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) >> 16);
            *(char far *)MK_FP(es4, (int)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + loc_2 + 0x73c) = (char)ax55;
            loc_2 = loc_2 + 1;
        }
        loc_2 = 1;
        while (loc_2 < 32) {
            if (loc_8ea[loc_2] > 0) {
                es5 = (int)(*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) >> 16);
                loc_8 = (unsigned char)*(char far *)MK_FP(es5, (int)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + loc_2 + 0x73e);
                if (loc_90a[loc_2] != 1) {
                    t143 = (long)(int)loc_8 * 24L;
                    dx15 = (int)(t143 >> 16);
                    cx22 = (int)t143;
                    *(char far *)((char far *)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + -777 + (int)t143) = (char)1;
                } else {
                    t142 = (long)(int)loc_8 * 24L;
                    dx15 = (int)(t142 >> 16);
                    cx22 = (int)t142;
                    *(char far *)MK_FP(es5, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + (int)t142 - 0x309) = (char)2;
                }
                es4 = (int)(*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) >> 16);
                *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x307) = *(char far *)MK_FP(es4, (int)*(long far *)MK_FP(ds2, (unsigned)&FP_E40C) + loc_8ea[loc_2] + 0x73d);
                *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x308) = loc_92a[loc_2];
                *(char far *)MK_FP(es4, *(int far *)MK_FP(ds2, (unsigned)&FP_E40C) + cx22 - 0x306) = (char)127;
            }
            loc_2 = loc_2 + 1;
        }
        ax56 = far_c6547(loc_11 - 1);
        dx16 = UNDEF;
    }
    return ((long)dx16 << 16 | (unsigned)0);
}
long far far_bd216(void) { return 0; }
long far fn_bd1a3(int p0) { return 0; }
long far fn_bd237(int p0, int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8, int p9, int p10, int p11) { return 0; }
