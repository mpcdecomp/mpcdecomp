/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B8D;
extern char B_D4C0;
extern char B_D5DD;
extern char FP_E40C[];
extern unsigned char L_c1469[];
extern unsigned char L_c1475[];
extern unsigned char L_c1483[];
extern long far L_c14a3(int);
extern long far L_c154c(char, int, int);
extern long far L_c1595(int, long, int, int);
extern long far L_c1712(char, int, int);
extern long far L_c1bb4(int, long, int, int);
extern long far L_c1e74(int, long, int, int);
extern long far L_c1fec(char, long, long);
extern long far L_c231f(void far *);
extern long far L_c2373(char far *, int, int);
extern long far L_c25ff(int, void far *);
extern void far far_b05a7(void);
extern int far far_b08f7(int);
extern long far far_b1073(int);
extern int far far_b1aac(void);
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern int far far_b1b05(void far *);
extern int far far_b1d48(void far *, int, int, int);
extern long far far_b362e();
extern long far far_b3819(void far *, char far *, int, int, int, int);
extern long far far_b3b9f(int);
extern long far far_c529a(int, void far *);
extern long far far_cc583(int);
extern int far far_cc60f(void);
extern long far far_cc62d(void);
extern long far far_cd353(int, int);
extern int far far_cd551(void far *);
extern long far far_d7a63(int);
extern long far far_fdcfb(char far *, char far *, int);

long far far_fba0a(void)
{
    char loc_2be[516];
    char loc_ba[128];
    int loc_3a;
    int loc_38;
    int loc_36;
    int loc_34;
    unsigned int loc_32;
    int loc_30;
    unsigned int loc_2e;
    int loc_2c;
    unsigned int loc_2a;
    int loc_28;
    int loc_26;
    int loc_24;
    int loc_22;
    char loc_20[2];
    char loc_1e[2];
    char loc_1c[2];
    char loc_1a[2];
    char loc_18[2];
    char loc_16[2];
    char loc_14[2];
    char loc_12[2];
    char loc_10[2];
    char loc_e[2];
    char loc_c[2];
    char loc_a[2];
    char loc_8[3];
    char loc_5;
    char loc_4;
    char loc_3;
    char loc_2;
    char loc_1;
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
    unsigned int ax20;
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
    int ax35;
    int ax36;
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
    unsigned int ax54;
    int ax55;
    int ax56;
    int ax57;
    int ax58;
    int ax59;
    int ax6;
    int ax60;
    int ax61;
    int ax62;
    int ax63;
    int ax64;
    int ax65;
    int ax66;
    int ax67;
    int ax68;
    int ax69;
    int ax7;
    unsigned int ax70;
    int ax71;
    int ax72;
    int ax73;
    int ax8;
    int ax9;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int cx5;
    int cx6;
    int cx7;
    int di;
    int dx;
    int dx10;
    int dx11;
    int dx12;
    int dx13;
    int dx14;
    int dx15;
    int dx16;
    int dx17;
    int dx18;
    int dx19;
    int dx2;
    int dx20;
    int dx21;
    int dx22;
    int dx23;
    int dx24;
    int dx25;
    int dx26;
    int dx27;
    int dx28;
    int dx29;
    int dx3;
    int dx30;
    int dx31;
    int dx32;
    int dx33;
    int dx34;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    int dx8;
    int dx9;
    int flags;
    int flags10;
    int flags11;
    int flags12;
    int flags13;
    int flags14;
    int flags15;
    int flags16;
    int flags17;
    int flags18;
    int flags19;
    int flags2;
    int flags20;
    int flags3;
    int flags4;
    int flags5;
    int flags6;
    int flags7;
    int flags8;
    int flags9;
    int p712;
    int p714;
    int p716;
    int p718;
    int p720;
    int t1;
    long t10;
    long t100;
    long t101;
    long t102;
    long t103;
    long t104;
    long t105;
    int t106;
    int t107;
    long t108;
    long t109;
    long t11;
    long t110;
    long t111;
    long t112;
    long t113;
    long t114;
    long t115;
    long t116;
    long t117;
    long t118;
    long t119;
    long t12;
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
    long t13;
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
    long t14;
    long t140;
    int t141;
    int t142;
    long t143;
    long t144;
    long t145;
    long t146;
    long t147;
    int t148;
    long t149;
    long t15;
    long t150;
    int t151;
    long t152;
    long t153;
    long t154;
    long t155;
    long t156;
    long t157;
    long t158;
    long t159;
    long t16;
    long t160;
    long t161;
    long t162;
    long t163;
    int t164;
    int t165;
    long t166;
    int t167;
    long t168;
    long t169;
    long t17;
    int t170;
    long t171;
    long t172;
    long t173;
    long t174;
    long t175;
    long t176;
    long t177;
    long t178;
    long t179;
    long t18;
    long t180;
    long t181;
    long t182;
    int t183;
    int t184;
    long t185;
    int t186;
    long t187;
    long t188;
    int t189;
    long t19;
    long t190;
    long t191;
    long t192;
    long t193;
    long t194;
    long t195;
    long t196;
    long t197;
    long t198;
    long t199;
    long t2;
    long t20;
    long t200;
    long t201;
    int t202;
    long t203;
    long t204;
    long t205;
    long t206;
    long t207;
    long t208;
    long t209;
    long t21;
    long t210;
    long t211;
    long t212;
    long t213;
    long t214;
    int t215;
    long t216;
    long t217;
    int t218;
    long t22;
    long t23;
    long t24;
    long t25;
    long t26;
    long t27;
    long t28;
    long t29;
    long t3;
    long t30;
    long t31;
    long t32;
    long t33;
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
    long t48;
    long t49;
    long t5;
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
    long t6;
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
    long t72;
    long t73;
    long t74;
    int t75;
    int t76;
    long t77;
    long t78;
    long t79;
    long t8;
    long t80;
    long t81;
    long t82;
    long t83;
    long t84;
    long t85;
    long t86;
    long t87;
    long t88;
    long t89;
    long t9;
    long t90;
    long t91;
    long t92;
    long t93;
    long t94;
    long t95;
    long t96;
    long t97;
    long t98;
    long t99;

    B_D5DD = (char)6;
    far_b1aac();
    far_b05a7();
    far_b1ad0(0, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x30fb));
    far_b1ad0(0, 5);
    t2 = far_fdcfb((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_ba), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2be), 0);
    loc_2 = *(char *)0xdc32;
    if (*(int *)0xdc32 >= (int)t2) {
        loc_2 = (char)0;
    }
    t3 = far_b362e(MK_FP(SEG_DATA, 0x3124), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2be), 16);
    if ((int)t2 != -1) {
        t4 = L_c154c(loc_ba[loc_2], 0, 31);
    }
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x312e));
    t5 = (long)(signed char)loc_ba[loc_2] * 36L;
    dx = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4814);
    loc_28 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t5 + 0x4816);
    loc_2a = dx;
    if ((int)t2 == -1) {
        loc_28 = 0;
        loc_2a = 0;
    }
    t6 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), loc_2a, loc_28);
    t7 = far_b3819(MK_FP(SEG_DATA, 0x3157), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), 3, 0, 0x3e7, 2);
    t8 = far_b3819(MK_FP(SEG_DATA, 0x3161), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_18), 3, 0, 0x3e7, 2);
    t9 = (long)(signed char)loc_ba[loc_2] * 36L;
    dx2 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t9 + 0x481c);
    loc_30 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t9 + 0x481e);
    loc_32 = dx2;
    ax7 = *(int *)0xdf94;
    flags = ax7 - loc_30;
    if (!CC("<", flags) && (CC(">", flags) || (unsigned int)*(int *)0xdf92 > loc_32)) {
        *(int *)0xdf94 = loc_30;
        *(int *)0xdf92 = loc_32;
    }
    flags2 = *(int *)0xdf94;
    if (!CC(">", flags2) && (CC("<", flags2) || (unsigned int)*(int *)0xdf92 < 0)) {
        *(int *)0xdf94 = 0;
        *(int *)0xdf92 = 0;
    }
    far_b1ad0(2, 21);
    t10 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_e), *(int *)0xdf92, *(int *)0xdf94);
    t11 = far_b3819(MK_FP(SEG_DATA, 0x3163), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_a), 3, 0, 0x3e7, 2);
    t12 = far_b3819(MK_FP(SEG_DATA, 0x3161), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c), 3, 0, 0x3e7, 2);
    t13 = far_b3819(MK_FP(SEG_DATA, 0x3161), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_e), 2, 0, 43, 2);
    t14 = (long)(signed char)loc_ba[loc_2] * 36L;
    dx3 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t14 + 0x4818);
    loc_2c = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t14 + 0x481a);
    loc_2e = dx3;
    if ((int)t2 == -1) {
        loc_2c = 0;
        loc_2e = 0;
    }
    t15 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), loc_2e, loc_2c);
    t16 = far_b3819(MK_FP(SEG_DATA, 0x316d), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), 3, 0, 0x3e7, 2);
    t17 = far_b3819(MK_FP(SEG_DATA, 0x3161), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e), 3, 0, 0x3e7, 2);
    t18 = far_b3819(MK_FP(SEG_DATA, 0x3161), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), 2, 0, 43, 2);
    ax9 = *(int *)0xdf90;
    flags3 = ax9 - loc_30;
    if (!CC("<", flags3) && (CC(">", flags3) || (unsigned int)*(int *)0xdf8e > loc_32)) {
        *(int *)0xdf90 = loc_30;
        *(int *)0xdf8e = loc_32;
    }
    ax10 = *(int *)0xdf90;
    flags4 = ax10 - *(int *)0xdf94;
    if (!CC(">", flags4) && (CC("<", flags4) || (unsigned int)*(int *)0xdf8e < (unsigned int)*(int *)0xdf92)) {
        dx4 = *(int *)0xdf92;
        *(int *)0xdf90 = *(int *)0xdf94;
        *(int *)0xdf8e = dx4;
    }
    flags5 = *(int *)0xdf90;
    if (!CC(">", flags5) && (CC("<", flags5) || (unsigned int)*(int *)0xdf8e < 0)) {
        *(int *)0xdf90 = 0;
        *(int *)0xdf8e = 0;
    }
    far_b1ad0(3, 21);
    t19 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14), *(int *)0xdf8e, *(int *)0xdf90);
    t20 = far_b3819(MK_FP(SEG_DATA, 0x3177), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_10), 3, 0, 0x3e7, 2);
    t21 = far_b3819(MK_FP(SEG_DATA, 0x3161), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_12), 3, 0, 0x3e7, 2);
    t22 = far_b3819(MK_FP(SEG_DATA, 0x3161), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14), 2, 0, 43, 2);
    far_b1ad0(4, 0);
    if ((int)t2 == -1) {
        loc_30 = 0;
        loc_32 = 0;
    }
    t23 = L_c2373((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_26), loc_32, loc_30);
    far_b1d48(MK_FP(SEG_DATA, 0x3181), loc_22, loc_24, loc_26);
    far_b1ad0(4, 21);
    loc_4 = (char)1;
    t24 = far_b362e(MK_FP(SEG_DATA, 0x3199), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_4), MK_FP(SEG_DATA, 0x3002), 12);
    loc_3 = *(char far *)MK_FP(0xa853 /* SEG_A28F */, loc_ba[loc_2] * 36 + 0x4811);
    if ((int)t2 == -1) {
        loc_3 = (char)100;
    }
    t25 = far_b3819(MK_FP(SEG_DATA, 0x31a1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), 3, 0, 200, 8);
    *(int *)((char *)&loc_8 + 0) = *(char far *)MK_FP(0xa853 /* SEG_A28F */, loc_ba[loc_2] * 36 + 0x4812);
    if ((int)t2 == -1) {
        *(int *)((char *)&loc_8 + 0) = 0;
    }
    t26 = far_b3819(MK_FP(SEG_DATA, 0x31a7), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), 4, -120, 120, 0);
    far_b1ad0(5, 21);
    loc_5 = (char)0;
    p714 = 0x3022;
    p716 = SEG_STACK;
    p718 = (int)(unsigned)&loc_5;
    p720 = SEG_DATA;
    t27 = far_b362e(0x31ad, p720, ((long)p716 << 16 | (unsigned)p718), MK_FP(SEG_DATA, p714), 16);
    far_b1ad0(6, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x31b1));
    far_b1ad0(7, 0);
    p712 = 0x31da;
    ax19 = far_b1b05(MK_FP(SEG_DATA, p712));
    loc_1 = (char)0;
    while (loc_1 == 0) {
        for (;;) {
            t218 = far_b08f7(68);
            loc_1 = (char)t218;
            if ((char)t218 != 0) {
                break;
            }
            ax20 = B_7B8D;
            if (ax20 > 15) {
                continue;
            }
            switch ((unsigned int)(unsigned)(L_c1483 + (ax20 << 1))) {
            case 0:
                if ((int)t2 == -1) {
                    continue;
                }
                ax37 = ((char)(ax20 >> 8) << 8 | (unsigned char)loc_2);
                di = (char)ax37;
                *(int *)0xdc32 = (char)ax37;
                t68 = (long)(signed char)loc_ba[di] * 36L;
                loc_3 = *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t68 + 0x4811);
                t69 = far_b1073(14);
                t70 = (long)(signed char)loc_ba[loc_2] * 36L;
                *(int *)((char *)&loc_8 + 0) = *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t70 + 0x4812);
                t71 = far_b1073(15);
                if ((int)t2 != -1) {
                    t72 = L_c154c(loc_ba[loc_2], 0, 31);
                }
                t73 = (long)(signed char)loc_ba[loc_2] * 36L;
                ax38 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t73 + 0x481e);
                dx13 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t73 + 0x481c);
                loc_30 = ax38;
                loc_32 = dx13;
                t74 = L_c2373((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_26), dx13, ax38);
                t75 = far_b1ad0(4, 0);
                t76 = far_b1d48(MK_FP(SEG_DATA, 0x3181), loc_22, loc_24, loc_26);
                t77 = (long)(signed char)loc_ba[loc_2] * 36L;
                ax39 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t77 + 0x4816);
                dx14 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t77 + 0x4814);
                loc_28 = ax39;
                loc_2a = dx14;
                t78 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), dx14, ax39);
                t79 = far_b1073(1);
                t80 = far_b1073(2);
                t81 = far_b1073(3);
                t82 = (long)(signed char)loc_ba[loc_2] * 36L;
                ax40 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t82 + 0x481a);
                dx15 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t82 + 0x4818);
                loc_2c = ax40;
                loc_2e = dx15;
                p712 = dx15;
                p714 = SEG_STACK;
                p716 = (int)(unsigned)loc_20;
                p718 = 0xbfd8;
                t83 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax40);
                t84 = far_b1073(7);
                t85 = far_b1073(8);
                t86 = far_b1073(9);
                ax41 = *(int *)0xdf94;
                flags14 = ax41 - loc_30;
                if (!CC("<", flags14) && (CC(">", flags14) || (unsigned int)*(int *)0xdf92 > loc_32)) {
                    ax42 = loc_30;
                    dx16 = loc_32;
                    *(int *)0xdf94 = ax42;
                    *(int *)0xdf92 = dx16;
                    p712 = dx16;
                    p714 = SEG_STACK;
                    p716 = (int)(unsigned)loc_e;
                    p718 = 0xbfd8;
                    t87 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax42);
                    t88 = far_b1073(4);
                    t89 = far_b1073(5);
                    t90 = far_b1073(6);
                }
                ax43 = *(int *)0xdf90;
                flags15 = ax43 - loc_30;
                if (!CC(">=", flags15)) {
                    continue;
                }
                if (!CC(">", flags15) && (unsigned int)*(int *)0xdf8e <= loc_32) {
                    continue;
                }
                ax44 = loc_30;
                dx17 = loc_32;
                *(int *)0xdf90 = ax44;
                *(int *)0xdf8e = dx17;
                p712 = dx17;
                p714 = SEG_STACK;
                p716 = (int)(unsigned)loc_14;
                p718 = 0xbfd8;
                t91 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax44);
                t92 = far_b1073(10);
                t93 = far_b1073(11);
                t94 = far_b1073(12);
                continue;
            case 1:
            case 2:
            case 3:
                p712 = (int)(unsigned)loc_1a;
                p714 = 0xbfd8;
                t58 = L_c231f(MK_FP(SEG_STACK, p712));
                loc_28 = (int)(t58 >> 16);
                loc_2a = (int)t58;
                ax33 = loc_28;
                flags12 = ax33 - loc_30;
                if (!CC("<", flags12) && (CC(">", flags12) || loc_2a > loc_32)) {
                    ax34 = loc_30;
                    dx11 = loc_32;
                    loc_28 = ax34;
                    loc_2a = dx11;
                    p712 = dx11;
                    p714 = SEG_STACK;
                    p716 = (int)(unsigned)loc_1a;
                    p718 = 0xbfd8;
                    t59 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax34);
                    t60 = far_b1073(1);
                    t61 = far_b1073(2);
                    t62 = far_b1073(3);
                }
                ax35 = loc_28;
                flags13 = ax35 - loc_2c;
                if (!CC("<", flags13) && (CC(">", flags13) || loc_2a > loc_2e)) {
                    ax36 = loc_28;
                    dx12 = loc_2a;
                    loc_2c = ax36;
                    loc_2e = dx12;
                    p712 = dx12;
                    p714 = SEG_STACK;
                    p716 = (int)(unsigned)loc_20;
                    p718 = 0xbfd8;
                    t63 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax36);
                    t64 = far_b1073(7);
                    t65 = far_b1073(8);
                    t66 = far_b1073(9);
                }
                t67 = (long)(signed char)loc_ba[loc_2] * 36L;
                cx = loc_2a;
                *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t67 + 0x4816) = (int)t67;
                *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t67 + 0x4814) = cx;
                continue;
            case 4:
            case 5:
            case 6:
                p712 = (int)(unsigned)loc_e;
                p714 = 0xbfd8;
                t49 = L_c231f(MK_FP(SEG_STACK, p712));
                *(int *)0xdf94 = (int)(t49 >> 16);
                *(int *)0xdf92 = (int)t49;
                ax29 = *(int *)0xdf94;
                flags10 = ax29 - loc_30;
                if (!CC("<", flags10) && (CC(">", flags10) || (unsigned int)*(int *)0xdf92 > loc_32)) {
                    ax30 = loc_30;
                    dx9 = loc_32;
                    *(int *)0xdf94 = ax30;
                    *(int *)0xdf92 = dx9;
                    p712 = dx9;
                    p714 = SEG_STACK;
                    p716 = (int)(unsigned)loc_e;
                    p718 = 0xbfd8;
                    t50 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax30);
                    t51 = far_b1073(4);
                    t52 = far_b1073(5);
                    t53 = far_b1073(6);
                }
                ax31 = *(int *)0xdf94;
                flags11 = ax31 - *(int *)0xdf90;
                if (!CC(">=", flags11)) {
                    continue;
                }
                if (!CC(">", flags11) && (unsigned int)*(int *)0xdf92 <= (unsigned int)*(int *)0xdf8e) {
                    continue;
                }
                ax32 = *(int *)0xdf94;
                dx10 = *(int *)0xdf92;
                *(int *)0xdf90 = ax32;
                *(int *)0xdf8e = dx10;
                p712 = dx10;
                p714 = SEG_STACK;
                p716 = (int)(unsigned)loc_14;
                p718 = 0xbfd8;
                t54 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax32);
                t55 = far_b1073(10);
                t56 = far_b1073(11);
                t57 = far_b1073(12);
                continue;
            case 7:
            case 8:
            case 9:
                p712 = (int)(unsigned)loc_20;
                p714 = 0xbfd8;
                t39 = L_c231f(MK_FP(SEG_STACK, p712));
                loc_2c = (int)(t39 >> 16);
                loc_2e = (int)t39;
                ax25 = loc_2c;
                flags8 = ax25 - loc_30;
                if (!CC("<", flags8) && (CC(">", flags8) || loc_2e > loc_32)) {
                    ax26 = loc_30;
                    dx7 = loc_32;
                    loc_2c = ax26;
                    loc_2e = dx7;
                    p712 = dx7;
                    p714 = SEG_STACK;
                    p716 = (int)(unsigned)loc_20;
                    p718 = 0xbfd8;
                    t40 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax26);
                    t41 = far_b1073(7);
                    t42 = far_b1073(8);
                    t43 = far_b1073(9);
                }
                ax27 = loc_2c;
                flags9 = ax27 - loc_28;
                if (!CC(">", flags9) && (CC("<", flags9) || loc_2e < loc_2a)) {
                    ax28 = loc_2c;
                    dx8 = loc_2e;
                    loc_28 = ax28;
                    loc_2a = dx8;
                    p712 = dx8;
                    p714 = SEG_STACK;
                    p716 = (int)(unsigned)loc_1a;
                    p718 = 0xbfd8;
                    t44 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax28);
                    t45 = far_b1073(1);
                    t46 = far_b1073(2);
                    t47 = far_b1073(3);
                }
                t48 = (long)(signed char)loc_ba[loc_2] * 36L;
                *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t48 + 0x481a) = (int)t48;
                *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t48 + 0x4818) = loc_2e;
                continue;
            case 10:
            case 11:
            case 12:
                p712 = (int)(unsigned)loc_14;
                p714 = 0xbfd8;
                t30 = L_c231f(MK_FP(SEG_STACK, p712));
                *(int *)0xdf90 = (int)(t30 >> 16);
                *(int *)0xdf8e = (int)t30;
                ax21 = *(int *)0xdf90;
                flags6 = ax21 - loc_30;
                if (!CC("<", flags6) && (CC(">", flags6) || (unsigned int)*(int *)0xdf8e > loc_32)) {
                    ax22 = loc_30;
                    dx5 = loc_32;
                    *(int *)0xdf90 = ax22;
                    *(int *)0xdf8e = dx5;
                    p712 = dx5;
                    p714 = SEG_STACK;
                    p716 = (int)(unsigned)loc_14;
                    p718 = 0xbfd8;
                    t31 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax22);
                    t32 = far_b1073(10);
                    t33 = far_b1073(11);
                    t34 = far_b1073(12);
                }
                ax23 = *(int *)0xdf90;
                flags7 = ax23 - *(int *)0xdf94;
                if (!CC("<=", flags7)) {
                    continue;
                }
                if (!CC("<", flags7) && (unsigned int)*(int *)0xdf8e >= (unsigned int)*(int *)0xdf92) {
                    continue;
                }
                ax24 = *(int *)0xdf90;
                dx6 = *(int *)0xdf8e;
                *(int *)0xdf94 = ax24;
                *(int *)0xdf92 = dx6;
                p712 = dx6;
                p714 = SEG_STACK;
                p716 = (int)(unsigned)loc_e;
                p718 = 0xbfd8;
                t35 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax24);
                t36 = far_b1073(4);
                t37 = far_b1073(5);
                t38 = far_b1073(6);
                continue;
            case 13:
                continue;
            case 14:
                t29 = (long)(signed char)loc_ba[loc_2] * 36L;
                *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t29 + 0x4811) = (char)(int)t29;
                continue;
            case 15:
                t28 = (long)(signed char)loc_ba[loc_2] * 36L;
                *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t28 + 0x4812) = (char)(int)t28;
                continue;
            }
        }
        flags16 = (char)t218 - 120;
        if (CC("==", flags16)) {
            loc_1 = (char)0;
            if ((int)t2 == -1) {
                continue;
            }
            t215 = far_cc60f();
            if (t215 == 0) {
                t217 = far_cc583(loc_ba[loc_2]);
                continue;
            }
            t216 = far_cc62d();
            continue;
        }
        if (CC(">", flags16)) {
            if ((char)t218 == 121) {
                loc_1 = (char)0;
                if ((int)t2 == -1) {
                    continue;
                }
                p712 = (int)(unsigned)&loc_2a;
                ax72 = (int)(unsigned)(loc_ba + loc_2);
                p714 = ((char)(ax72 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(SEG_STACK, ax72));
                p716 = 0xbfd8;
                t212 = L_c25ff(p714, MK_FP(SEG_STACK, p712));
                loc_1 = (char)(int)t212;
                t213 = (long)(signed char)loc_ba[loc_2] * 36L;
                cx7 = loc_2a;
                *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t213 + 0x4816) = (int)t213;
                *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t213 + 0x4814) = cx7;
                if (loc_1 != 76) {
                    continue;
                }
                t214 = far_d7a63(54);
                continue;
            }
            if ((char)t218 != 122) {
                continue;
            }
            loc_1 = (char)0;
            if ((int)t2 == -1) {
                continue;
            }
            dx33 = loc_2a;
            loc_34 = loc_28;
            loc_36 = dx33;
            loc_38 = loc_2c;
            loc_3a = loc_2e;
            ax70 = loc_4;
            if (ax70 <= 6) {
                switch ((unsigned int)(unsigned)(L_c1475 + (ax70 << 1))) {
                case 0:
                    t207 = (long)(signed char)loc_ba[loc_2] * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t207 + 0x4816) = 0;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t207 + 0x4814) = 0;
                    t208 = (long)(signed char)loc_ba[loc_2] * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t208 + 0x481a) = (int)t208;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t208 + 0x4818) = loc_32;
                    p712 = 0xbfd8;
                    t209 = L_c14a3(loc_ba[loc_2]);
                    break;
                case 1:
                    t204 = (long)(signed char)loc_ba[loc_2] * 36L;
                    cx5 = *(int *)0xdf92;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t204 + 0x4816) = (int)t204;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t204 + 0x4814) = cx5;
                    t205 = (long)(signed char)loc_ba[loc_2] * 36L;
                    cx6 = *(int *)0xdf8e;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t205 + 0x481a) = (int)t205;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t205 + 0x4818) = cx6;
                    p712 = 0xbfd8;
                    t206 = L_c14a3(loc_ba[loc_2]);
                    break;
                case 2:
                    p712 = 0x3200;
                    t202 = far_cd551(MK_FP(SEG_DATA, p712));
                    ax71 = t202;
                    if ((char)ax71 >= 0) {
                        p712 = 0xbfd8;
                        t203 = L_c14a3((char)ax71);
                    }
                    break;
                case 3:
                    t199 = (long)(signed char)loc_ba[loc_2] * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t199 + 0x4816) = 0;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t199 + 0x4814) = 0;
                    t200 = (long)(signed char)loc_ba[loc_2] * 36L;
                    cx4 = *(int *)0xdf92;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t200 + 0x481a) = (int)t200;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t200 + 0x4818) = cx4;
                    p712 = 0xbfd8;
                    t201 = L_c14a3(loc_ba[loc_2]);
                    break;
                case 4:
                    t196 = (long)(signed char)loc_ba[loc_2] * 36L;
                    cx3 = *(int *)0xdf8e;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t196 + 0x4816) = (int)t196;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t196 + 0x4814) = cx3;
                    t197 = (long)(signed char)loc_ba[loc_2] * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t197 + 0x481a) = (int)t197;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t197 + 0x4818) = loc_32;
                    p712 = 0xbfd8;
                    t198 = L_c14a3(loc_ba[loc_2]);
                    break;
                case 5:
                    t193 = (long)(signed char)loc_ba[loc_2] * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t193 + 0x4816) = 0;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t193 + 0x4814) = 0;
                    t194 = (long)(signed char)loc_ba[loc_2] * 36L;
                    cx2 = loc_2a;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t194 + 0x481a) = (int)t194;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t194 + 0x4818) = cx2;
                    p712 = 0xbfd8;
                    t195 = L_c14a3(loc_ba[loc_2]);
                    break;
                case 6:
                    t190 = (long)(signed char)loc_ba[loc_2] * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t190 + 0x4816) = (int)t190;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t190 + 0x4814) = loc_2e;
                    t191 = (long)(signed char)loc_ba[loc_2] * 36L;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t191 + 0x481a) = (int)t191;
                    *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t191 + 0x4818) = loc_32;
                    p712 = 0xbfd8;
                    t192 = L_c14a3(loc_ba[loc_2]);
                    break;
                }
            }
            t210 = (long)(signed char)loc_ba[loc_2] * 36L;
            *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t210 + 0x4816) = (int)t210;
            *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t210 + 0x4814) = loc_36;
            t211 = (long)(signed char)loc_ba[loc_2] * 36L;
            *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t211 + 0x481a) = (int)t211;
            *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t211 + 0x4818) = loc_3a;
            continue;
        }
        if ((char)t218 == 68) {
L1:
            loc_1 = (char)0;
            if ((int)t2 == -1) {
                continue;
            }
            ax45 = ((char)-((char)t218 < 0) << 8 | (unsigned char)loc_2);
            *(int *)0xdc32 = (char)ax45;
            ax46 = ((char)-((char)ax45 < 0) << 8 | (unsigned char)B_D4C0);
            t95 = (long)(signed char)(char)ax46 * 24L;
            if (*(char far *)((char far *)*(long *)((char *)&FP_E40C + 0) + -778 + (int)t95) == -1) {
                continue;
            }
            p712 = (int)(unsigned)loc_ba;
            p714 = (char)ax46;
            t96 = far_c529a(p714, MK_FP(SEG_STACK, p712));
            if ((int)t96 == -1) {
                continue;
            }
            t97 = far_c529a(B_D4C0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_ba));
            loc_2 = (char)((char)(int)t97 - 1);
            t98 = far_b1073(0);
            t99 = (long)(signed char)loc_ba[loc_2] * 36L;
            loc_3 = *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t99 + 0x4811);
            t100 = far_b1073(14);
            t101 = (long)(signed char)loc_ba[loc_2] * 36L;
            *(int *)((char *)&loc_8 + 0) = *(char far *)MK_FP(0xa853 /* SEG_A28F */, (int)t101 + 0x4812);
            t102 = far_b1073(15);
            if ((int)t2 != -1) {
                t103 = L_c154c(loc_ba[loc_2], 0, 31);
            }
            t104 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax47 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t104 + 0x481e);
            dx18 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t104 + 0x481c);
            loc_30 = ax47;
            loc_32 = dx18;
            t105 = L_c2373((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_26), dx18, ax47);
            t106 = far_b1ad0(4, 0);
            t107 = far_b1d48(MK_FP(SEG_DATA, 0x3181), loc_22, loc_24, loc_26);
            t108 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax48 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t108 + 0x4816);
            dx19 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t108 + 0x4814);
            loc_28 = ax48;
            loc_2a = dx19;
            t109 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), dx19, ax48);
            t110 = far_b1073(1);
            t111 = far_b1073(2);
            t112 = far_b1073(3);
            t113 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax49 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t113 + 0x481a);
            dx20 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t113 + 0x4818);
            loc_2c = ax49;
            loc_2e = dx20;
            p712 = dx20;
            p714 = SEG_STACK;
            p716 = (int)(unsigned)loc_20;
            p718 = 0xbfd8;
            t114 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax49);
            t115 = far_b1073(7);
            t116 = far_b1073(8);
            t117 = far_b1073(9);
            ax50 = *(int *)0xdf94;
            flags17 = ax50 - loc_30;
            if (!CC("<", flags17) && (CC(">", flags17) || (unsigned int)*(int *)0xdf92 > loc_32)) {
                ax51 = loc_30;
                dx21 = loc_32;
                *(int *)0xdf94 = ax51;
                *(int *)0xdf92 = dx21;
                p712 = dx21;
                p714 = SEG_STACK;
                p716 = (int)(unsigned)loc_e;
                p718 = 0xbfd8;
                t118 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax51);
                t119 = far_b1073(4);
                t120 = far_b1073(5);
                t121 = far_b1073(6);
            }
            ax52 = *(int *)0xdf90;
            flags18 = ax52 - loc_30;
            if (CC("<", flags18) || !CC(">", flags18) && (unsigned int)*(int *)0xdf8e <= loc_32) {
                continue;
            }
            ax53 = loc_30;
            dx22 = loc_32;
            *(int *)0xdf90 = ax53;
            *(int *)0xdf8e = dx22;
            p712 = dx22;
            p714 = SEG_STACK;
            p716 = (int)(unsigned)loc_14;
            p718 = 0xbfd8;
            t122 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax53);
            t123 = far_b1073(10);
            t124 = far_b1073(11);
            t125 = far_b1073(12);
            continue;
        }
        if ((char)t218 == 78) {
            goto L1;
        }
        if ((char)t218 != 117) {
            continue;
        }
        loc_1 = (char)0;
        if ((int)t2 == -1) {
            continue;
        }
        ax54 = loc_5;
        if (ax54 > 5) {
            continue;
        }
        switch ((unsigned int)(unsigned)(L_c1469 + (ax54 << 1))) {
        case 0:
            ax68 = *(int *)0xdf90;
            flags20 = ax68 - *(int *)0xdf94;
            if (CC(">", flags20)) {
                goto L2;
            }
            if (!CC("==", flags20)) {
                continue;
            }
            if ((unsigned int)*(int *)0xdf8e <= (unsigned int)*(int *)0xdf92) {
                continue;
            }
L2:
            p712 = *(int *)0xdf8e;
            p714 = *(int *)0xdf94;
            p716 = *(int *)0xdf92;
            ax69 = (int)(unsigned)(loc_ba + loc_2);
            p718 = ((char)(ax69 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(SEG_STACK, ax69));
            p720 = 0xbfd8;
            t185 = L_c1595(p718, ((long)p714 << 16 | (unsigned)p716), p712, *(int *)0xdf90);
            di = (int)t185;
            if (di >= 0) {
                continue;
            }
            t186 = far_b1af9();
            t187 = (long)(int)di * -1L;
            t188 = far_b3b9f((int)t187);
            t189 = far_b1aff();
            continue;
        case 1:
            t166 = L_c1712(loc_ba[loc_2], *(int *)0xdf92, *(int *)0xdf94);
            di = (int)t166;
            if (di < 0) {
                t167 = far_b1af9();
                t168 = (long)(int)di * -1L;
                t169 = far_b3b9f((int)t168);
                t170 = far_b1aff();
            }
            t171 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax65 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t171 + 0x4816);
            dx30 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t171 + 0x4814);
            loc_28 = ax65;
            loc_2a = dx30;
            t172 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), dx30, ax65);
            t173 = far_b1073(1);
            t174 = far_b1073(2);
            t175 = far_b1073(3);
            t176 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax66 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t176 + 0x481a);
            dx31 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t176 + 0x4818);
            loc_2c = ax66;
            loc_2e = dx31;
            t177 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), dx31, ax66);
            t178 = far_b1073(7);
            t179 = far_b1073(8);
            t180 = far_b1073(9);
            t181 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax67 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t181 + 0x481e);
            dx32 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t181 + 0x481c);
            loc_30 = ax67;
            loc_32 = dx32;
            t182 = L_c2373((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_26), dx32, ax67);
            t183 = far_b1ad0(4, 0);
            p712 = loc_24;
            p714 = loc_22;
            p716 = SEG_DATA;
            p718 = 0x3181;
            t184 = far_b1d48(((long)p716 << 16 | (unsigned)p718), p714, p712, loc_26);
            continue;
        case 2:
            t147 = L_c1712(loc_ba[loc_2], *(int *)0xdf8e, *(int *)0xdf90);
            di = (int)t147;
            if (di < 0) {
                t148 = far_b1af9();
                t149 = (long)(int)di * -1L;
                t150 = far_b3b9f((int)t149);
                t151 = far_b1aff();
            }
            t152 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax62 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t152 + 0x4816);
            dx27 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t152 + 0x4814);
            loc_28 = ax62;
            loc_2a = dx27;
            t153 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), dx27, ax62);
            t154 = far_b1073(1);
            t155 = far_b1073(2);
            t156 = far_b1073(3);
            t157 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax63 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t157 + 0x481a);
            dx28 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t157 + 0x4818);
            loc_2c = ax63;
            loc_2e = dx28;
            t158 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), dx28, ax63);
            t159 = far_b1073(7);
            t160 = far_b1073(8);
            t161 = far_b1073(9);
            t162 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax64 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t162 + 0x481e);
            dx29 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t162 + 0x481c);
            loc_30 = ax64;
            loc_32 = dx29;
            t163 = L_c2373((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_26), dx29, ax64);
            t164 = far_b1ad0(4, 0);
            p712 = loc_24;
            p714 = loc_22;
            p716 = SEG_DATA;
            p718 = 0x3181;
            t165 = far_b1d48(((long)p716 << 16 | (unsigned)p718), p714, p712, loc_26);
            continue;
        case 3:
            p720 = 0xbfd8;
            t128 = L_c1fec(loc_ba[loc_2], *(long *)0xdf92, *(long *)0xdf8e);
            t129 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax57 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t129 + 0x4816);
            dx23 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t129 + 0x4814);
            loc_28 = ax57;
            loc_2a = dx23;
            t130 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1a), dx23, ax57);
            t131 = far_b1073(1);
            t132 = far_b1073(2);
            t133 = far_b1073(3);
            t134 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax58 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t134 + 0x481a);
            dx24 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t134 + 0x4818);
            loc_2c = ax58;
            loc_2e = dx24;
            t135 = L_c2373((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), dx24, ax58);
            t136 = far_b1073(7);
            t137 = far_b1073(8);
            t138 = far_b1073(9);
            t139 = (long)(signed char)loc_ba[loc_2] * 36L;
            ax59 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t139 + 0x481e);
            dx25 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, (int)t139 + 0x481c);
            loc_30 = ax59;
            loc_32 = dx25;
            t140 = L_c2373((int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_26), dx25, ax59);
            t141 = far_b1ad0(4, 0);
            p712 = loc_24;
            p714 = loc_22;
            p716 = SEG_DATA;
            p718 = 0x3181;
            t142 = far_b1d48(((long)p716 << 16 | (unsigned)p718), p714, p712, loc_26);
            ax60 = *(int *)0xdf90;
            flags19 = ax60 - loc_30;
            if (!CC(">=", flags19)) {
                continue;
            }
            if (!CC(">", flags19) && (unsigned int)*(int *)0xdf8e <= loc_32) {
                continue;
            }
            ax61 = loc_30;
            dx26 = loc_32;
            *(int *)0xdf90 = ax61;
            *(int *)0xdf8e = dx26;
            p712 = dx26;
            p714 = SEG_STACK;
            p716 = (int)(unsigned)loc_14;
            p718 = 0xbfd8;
            t143 = L_c2373(((long)p714 << 16 | (unsigned)p716), p712, ax61);
            t144 = far_b1073(10);
            t145 = far_b1073(11);
            t146 = far_b1073(12);
            continue;
        case 4:
            p712 = *(int *)0xdf8e;
            p714 = *(int *)0xdf94;
            p716 = *(int *)0xdf92;
            ax56 = (int)(unsigned)(loc_ba + loc_2);
            p718 = ((char)(ax56 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(SEG_STACK, ax56));
            p720 = 0xbfd8;
            t127 = L_c1e74(p718, ((long)p714 << 16 | (unsigned)p716), p712, *(int *)0xdf90);
            continue;
        case 5:
            p712 = *(int *)0xdf8e;
            p714 = *(int *)0xdf94;
            p716 = *(int *)0xdf92;
            ax55 = (int)(unsigned)(loc_ba + loc_2);
            p718 = ((char)(ax55 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(SEG_STACK, ax55));
            p720 = 0xbfd8;
            t126 = L_c1bb4(p718, ((long)p714 << 16 | (unsigned)p716), p712, *(int *)0xdf90);
            continue;
        }
    }
    ax73 = far_cd551(MK_FP(SEG_DATA, 0x3200));
    dx34 = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)ax73);
    if ((char)ax73 >= 0) {
        dx34 = (int)(far_cd353((char)ax73, 0) >> 16);
    }
    return ((long)dx34 << 16 | (unsigned)loc_1);
}
long far L_c14a3(int p0) { return 0; }
long far L_c154c(char p0, int p1, int p2) { return 0; }
long far L_c1595(int p0, long p1, int p2, int p3) { return 0; }
long far L_c1712(char p0, int p1, int p2) { return 0; }
long far L_c1bb4(int p0, long p1, int p2, int p3) { return 0; }
long far L_c1e74(int p0, long p1, int p2, int p3) { return 0; }
long far L_c1fec(char p0, long p1, long p2) { return 0; }
long far L_c231f(void far *p0) { return 0; }
long far L_c2373(char far *p0, int p1, int p2) { return 0; }
long far L_c25ff(int p0, void far *p1) { return 0; }
long far far_fdcfb(char far *p0, char far *p1, int p2) { return 0; }
