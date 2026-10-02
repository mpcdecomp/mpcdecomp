/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_A7AD {
    char f_0;
    char f_1;
};
struct g_TBL_E56A {
    char pad_0[4];
    char f_4;
};
extern char B_7B8D;
extern char B_7FCB;
extern char B_7FCC;
extern char B_8800;
extern char B_8802;
extern unsigned char B_8803;
extern unsigned char B_8804;
extern unsigned char B_901B[];
extern unsigned char B_A5CE;
extern char B_D4B1;
extern char B_D4C2;
extern char B_D5DD;
extern char B_D5DE;
extern char B_D612;
extern unsigned char B_E56B;
extern unsigned char B_E56C[];
extern unsigned char B_E56D[];
extern unsigned char B_E56E[];
extern char TBL_1EB1[];
extern char TBL_A787[];
extern char TBL_A79B[];
extern struct g_TBL_A7AD TBL_A7AD;
extern char TBL_A7B0[];
extern char TBL_A9A2[];
extern struct g_TBL_E56A TBL_E56A;
extern unsigned char TBL_b4769[];
extern unsigned char TBL_b4785[];
extern unsigned char TBL_b479f[];
extern long far L_d280a(void);
extern long far L_ef4d3(void);
extern int far far_b08f7(void);
extern long far far_b1073(void);
extern int far far_b1ad0(int);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern long far far_b3471(void far *, char far *);
extern long far far_b362e(void far *, char far *, void far *);
extern long far far_b3819();
extern void far far_bffc9(void);
extern int far far_d78b2(void);
extern int far far_deee8(unsigned char far *);
extern long far far_e562e(void);
extern int far far_e5796(void);
extern long far far_e57c8(int, int, char near *);
extern long far far_e5a99(int);
extern long far far_e65be(int, char near *);
extern int far far_e664d(int, char near *);
extern long far far_e6715(void);
extern long far far_e6fef(void);
extern int far far_ea926(void);
extern long far fn_b47bb(int);
extern int far fn_b484b(void);
extern long far fn_b4873(int, int, char near *);
extern int far fn_b48a4(void);
extern long far fn_b48da(void);
extern long far fn_b4927(void);
extern int far fn_b498e(void);
extern long far fn_b4a03(void);
extern long far fn_b4e71(void);

long far far_b3efe(void)
{
    char loc_3a[18];
    char loc_28[18];
    char loc_16;
    char loc_15;
    int loc_14;
    int loc_12;
    int loc_10;
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
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    unsigned int bx2;
    int bx3;
    unsigned int bx4;
    int cx;
    int di;
    int dx;
    int p68;
    int p70;
    int p72;
    int p74;
    int si;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    int t17;
    int t18;
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
    long t28;
    long t29;
    long t3;
    long t30;
    long t31;
    int t32;
    long t33;
    int t34;
    long t35;
    long t36;
    int t37;
    long t38;
    long t39;
    long t4;
    long t40;
    long t41;
    long t42;
    int t43;
    long t44;
    long t45;
    long t46;
    long t47;
    long t48;
    int t49;
    int t5;
    int t50;
    long t51;
    long t52;
    long t53;
    int t54;
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
    long t64;
    long t65;
    long t66;
    long t67;
    long t68;
    long t69;
    long t7;
    int t70;
    int t71;
    long t72;
    long t73;
    long t74;
    int t75;
    long t76;
    long t77;
    long t78;
    int t79;
    long t8;
    long t80;
    long t81;
    long t82;
    int t83;
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

    B_D4C2 = B_D5DE;
    loc_14 = B_D612;
    if (B_7FCC == 0) {
        B_D612 = (char)0;
    }
    if (B_8800 == 0) {
        ax = (int)far_e6715();
    }
    B_A5CE = (unsigned char)(B_8803 + 1);
    loc_10 = B_8804;
    t1 = far_b3819(MK_FP(SEG_DATA, 0x1e3d), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_10), 2, 1, 20);
    t2 = far_e65be(loc_10 - 1, loc_3a);
    si = B_8804 - 1;
    loc_15 = TBL_A79B[si];
    far_b1ad0(1);
    t3 = far_b362e(MK_FP(SEG_DATA, 0x1e45), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_15), MK_FP(SEG_DATA, 0x1e06));
    ax3 = (unsigned char)TBL_A787[si];
    loc_8 = ax3;
    if (ax3 <= 0) {
        TBL_A787[si] = (char)1;
        loc_8 = 1;
    }
    t4 = far_b3819(MK_FP(SEG_DATA, 0x1e26), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_8), 3, 1, 250);
    if (loc_15 == 0) {
        t5 = far_b1ad0(1);
        ax4 = far_b1b05(0x1e4b);
    }
    fn_b48a4();
    far_b1ad0(2);
    t6 = far_b3819(MK_FP(SEG_DATA, 0x1e4f), (unsigned char far *)B_E56E, 2, 0, 99);
    t7 = far_b3819(MK_FP(SEG_DATA, 0x1e41), (unsigned char far *)B_E56D, 2, 0, 59);
    t8 = far_b3819(MK_FP(SEG_DATA, 0x1e41), (unsigned char far *)B_E56C, 2, 0, 59);
    t9 = far_b3819(MK_FP(SEG_DATA, 0x1e41), (unsigned char far *)&B_E56B, 2, 0, 29);
    t10 = far_b3819(MK_FP(SEG_DATA, 0x1e5c), (struct g_TBL_E56A far *)&TBL_E56A, 2, 0, 99);
    far_b1ad0(3);
    t11 = far_b3819(MK_FP(SEG_DATA, 0x1e5e), (unsigned char far *)&B_A5CE, 3, 1, 250);
    ax8 = si * 0x1f4 + (B_A5CE << 1);
    di = ax8;
    loc_6 = (unsigned char)*(char *)((char *)&TBL_A7AD + 0 + ax8);
    if (loc_6 == 0) {
        loc_6 = 1;
        *(char *)((char *)&TBL_A7AD + 0 + di) = (char)1;
    }
    loc_e = (unsigned char)*(char *)((char *)&TBL_A7AD + 1 + (B_A5CE << 1) + si * 0x1f4);
    t12 = far_b3819(MK_FP(SEG_DATA, 0x1e85), (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 2, 1, 99);
    t13 = fn_b4873(loc_6, loc_e, loc_28);
    t14 = far_b3471(MK_FP(SEG_DATA, 0x1e43), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_28));
    far_b1f96();
    p72 = 2;
    p74 = SEG_STACK;
    t15 = far_b3819(MK_FP(SEG_DATA, 0x1e8b), &loc_e, p74, p72, 0, 99);
    p70 = 0xbae8;
    t16 = fn_b47bb(loc_6);
    far_bffc9();
    p68 = 0x1e99;
    ax10 = far_b1b05(p68);
    dx = UNDEF;
    loc_4 = 0;
    while (loc_4 == 0) {
        ax11 = far_b08f7();
        dx = UNDEF;
        loc_2 = ax11;
        loc_12 = 0;
        if (ax11 == 71) {
            continue;
        }
        if (ax11 == 80) {
            ax16 = B_A5CE;
            dx = B_8803 + 1;
            if (ax16 == dx) {
                continue;
            }
            ax17 = ((char)(ax16 >> 8) << 8 | (unsigned char)B_8803);
            ax18 = ((char)(ax17 >> 8) << 8 | (unsigned char)((char)ax17 + 1));
            B_A5CE = (char)ax18;
            t80 = (long)(int)si * 0x1f4L;
            ax19 = (int)t80 + ((unsigned char)(char)ax18 << 1);
            di = ax19;
            loc_6 = (unsigned char)*(char *)((char *)&TBL_A7AD + 0 + ax19);
            loc_e = (unsigned char)*(char *)((char *)&TBL_A7AD + 1 + di);
            p72 = loc_6;
            p74 = 0xbae8;
            t81 = fn_b4873(p72, loc_e, loc_28);
            t82 = far_e65be(si, loc_3a);
            t83 = fn_b48a4();
            t84 = far_b1073();
            t85 = far_b1073();
            t86 = far_b1073();
            t87 = far_b1073();
            t88 = far_b1073();
            t89 = far_b1073();
            t90 = far_b1073();
            t91 = far_b1073();
            t92 = far_b1073();
            t93 = far_b1073();
            p68 = loc_6;
            p70 = 0xbae8;
            t94 = fn_b47bb(p68);
            dx = (int)(t94 >> 16);
            continue;
        }
        loc_a = B_7B8D;
        p68 = 0xbae8;
        t18 = fn_b484b();
        dx = UNDEF;
        loc_c = t18;
        bx = loc_2 - 109;
        if (bx <= 13) {
            switch ((unsigned int)(unsigned)(TBL_b479f + (bx << 1))) {
            case 0:
                loc_10 = B_D4B1;
                if (loc_10 < 1) {
                    loc_10 = 1;
                }
                if (loc_10 > 20) {
                    loc_10 = 20;
                }
                loc_2 = 0;
                loc_a = 0;
                break;
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 9:
            case 10:
                break;
            case 8:
            case 13:
                if (loc_2 != 117) {
                    if (B_A5CE > 1) {
                        B_A5CE = (unsigned char)(B_A5CE - 1);
                    }
                } else {
                    B_A5CE = (unsigned char)(B_A5CE + 1);
                }
                loc_2 = 0;
                loc_a = 9;
                break;
            case 11:
                B_D5DD = (char)1;
                t20 = fn_b4a03();
                dx = (int)(t20 >> 16);
                loc_2 = (int)t20;
                break;
            case 12:
                B_D5DD = (char)4;
                t19 = fn_b4e71();
                dx = (int)(t19 >> 16);
                loc_2 = (int)t19;
                break;
            }
        }
        if (loc_2 != 0) {
            goto L1;
        }
        t21 = far_e6fef();
        t22 = far_d78b2();
        ax12 = t22;
        dx = UNDEF;
        bx2 = loc_a;
        if (bx2 <= 12) {
            switch ((unsigned int)(unsigned)(TBL_b4785 + (bx2 << 1))) {
            case 0:
                B_A5CE = (unsigned char)1;
                break;
            case 1:
                t37 = far_e664d(si, loc_3a);
                p68 = (int)(unsigned)loc_3a;
                p70 = si;
                t38 = far_e65be(p70, p68);
                loc_16 = (char)(int)t38;
                t39 = far_b1073();
                dx = (int)(t39 >> 16);
                if (loc_16 == 0) {
                    t40 = (long)(int)si * 0x1f4L;
                    TBL_A7B0[(int)t40] = (char)1;
                    bx3 = (int)t40 + (B_A5CE << 1);
                    di = bx3;
                    *(char *)((char *)&TBL_A7AD + 0 + bx3) = *(char *)((char *)&loc_6 + 0);
                    loc_e = (unsigned char)*(char *)((char *)&TBL_A7AD + 1 + di);
                    p72 = loc_6;
                    p74 = 0xbae8;
                    t41 = fn_b4873(p72, loc_e, loc_28);
                    t42 = far_e65be(si, loc_3a);
                    t43 = fn_b498e();
                    B_8802 = (char)0;
                    t44 = far_b1073();
                    t45 = far_b1073();
                    t46 = far_b1073();
                    t47 = fn_b4927();
                    p68 = loc_6;
                    p70 = 0xbae8;
                    t48 = fn_b47bb(p68);
                    t49 = far_ea926();
                    dx = UNDEF;
                }
                break;
            case 2:
                break;
            case 3:
                B_8802 = (char)0;
                break;
            case 4:
            case 5:
            case 6:
            case 8:
                goto L2;
            case 7:
                ax13 = ((char)(ax12 >> 8) << 8 | (unsigned char)B_7FCB);
                di = (char)ax13;
                ax14 = ((char)-((char)ax13 < 0) << 8 | (unsigned char)TBL_1EB1[(char)ax13]);
                if ((unsigned char)(char)ax14 < B_E56B) {
                    B_E56B = (char)ax14;
                    t35 = far_b1073();
                }
L2:
                p68 = 0xbae8;
                t36 = fn_b48da();
                dx = (int)(t36 >> 16);
                break;
            case 9:
                p68 = (int)(unsigned)B_901B;
                t33 = far_e5a99(p68);
                t34 = far_e5796();
                dx = UNDEF;
                loc_12 = t34;
                break;
            case 10:
                t26 = fn_b498e();
                B_8802 = (char)0;
                t27 = (long)(int)si * 0x1f4L;
                *(char *)((char *)&TBL_A7AD + 0 + (B_A5CE << 1) + (int)t27) = *(char *)((char *)&loc_6 + 0);
                p72 = loc_6;
                p74 = 0xbae8;
                t28 = fn_b4873(p72, loc_e, loc_28);
                t29 = far_b1073();
L3:
                t30 = fn_b4927();
                p68 = loc_6;
                p70 = 0xbae8;
                t31 = fn_b47bb(p68);
                t32 = far_ea926();
                dx = UNDEF;
                break;
            case 11:
                if (loc_e != 0) {
                    t23 = far_e57c8(loc_6, -1, loc_28);
                }
                p68 = (int)(unsigned)loc_28;
                p70 = loc_e;
                p72 = loc_6;
                p74 = 0xbae8;
                t24 = fn_b4873(p72, p70, p68);
                t25 = far_b1073();
                dx = (int)(t25 >> 16);
                break;
            case 12:
                goto L3;
            }
        }
        bx4 = loc_a;
        if (bx4 > 13) {
            continue;
        }
        switch ((unsigned int)(unsigned)(TBL_b4769 + (bx4 << 1))) {
        case 0:
        case 9:
        case 13:
            goto L4;
        case 1:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 11:
            continue;
        case 2:
            goto L5;
        case 3:
            goto L6;
        case 10:
            if (loc_e != 0) {
                continue;
            }
            loc_e = 1;
L7:
            t50 = fn_b498e();
            B_8802 = (char)0;
            t51 = (long)(int)si * 0x1f4L;
            *(char *)((char *)&TBL_A7AD + 1 + (B_A5CE << 1) + (int)t51) = *(char *)((char *)&loc_e + 0);
            if (loc_e == 0 && B_A5CE == 1) {
                __stos2((struct g_TBL_E56A far *)&TBL_E56A, 0, 4);
                TBL_E56A.f_4 = (char)0;
                t52 = fn_b48da();
            }
L4:
            si = loc_10 - 1;
            t53 = far_e65be(si, loc_3a);
            t54 = fn_b48a4();
            t55 = fn_b484b();
            loc_c = t55;
            if ((int)B_A5CE > loc_c) {
                B_A5CE = *(char *)((char *)&loc_c + 0);
            }
            t56 = far_b1073();
            t57 = far_b1073();
            t58 = far_b1073();
            t59 = far_b1073();
            t60 = far_b1073();
            t61 = far_b1073();
            t62 = far_b1073();
            t63 = far_b1073();
            t64 = (long)(int)si * 0x1f4L;
            cx = (int)t64;
            ax15 = (int)t64 + (B_A5CE << 1);
            di = ax15;
            loc_6 = (unsigned char)*(char *)((char *)&TBL_A7AD + 0 + ax15);
            if (loc_6 == 0) {
                loc_6 = 1;
                *(char *)((char *)&TBL_A7AD + 0 + di) = (char)1;
            }
            TBL_A9A2[cx] = (char)0;
            loc_e = (unsigned char)*(char *)((char *)&TBL_A7AD + 1 + di);
            t65 = far_b1073();
            t66 = far_b1073();
            p72 = loc_6;
            p74 = 0xbae8;
            t67 = fn_b4873(p72, loc_e, loc_28);
            t68 = far_b1073();
            loc_15 = TBL_A79B[si];
            t69 = far_b1073();
            loc_8 = (unsigned char)TBL_A787[si];
L5:
            TBL_A79B[si] = loc_15;
L6:
            if (loc_8 >= loc_c) {
                loc_8 = loc_c - 1;
            }
            if (loc_8 < 1) {
                loc_8 = 1;
            }
            TBL_A787[si] = *(char *)((char *)&loc_8 + 0);
            if (loc_15 != 0) {
                t72 = far_b1073();
            } else {
                t70 = far_b1ad0(1);
                t71 = far_b1b05(0x1e4b);
            }
            if (loc_a != 0 && loc_a != 3) {
                t73 = L_d280a();
            }
            if (B_8804 != loc_10) {
                t74 = far_e6715();
            }
            if (loc_12 != 0) {
                t75 = far_deee8((unsigned char far *)B_901B);
                t76 = far_e562e();
            }
            t77 = L_ef4d3();
            p68 = loc_6;
            p70 = 0xbae8;
            t78 = fn_b47bb(p68);
            t79 = far_ea926();
            dx = UNDEF;
            continue;
        case 12:
            goto L7;
        }
    }
    goto L8;
L1:
L8:
    B_D612 = *(char *)((char *)&loc_14 + 0);
    return ((long)dx << 16 | (unsigned)loc_2);
}
long far fn_b47bb(int p0) { return 0; }
int far fn_b484b(void) { return 0; }
long far fn_b4873(int p0, int p1, char near *p2) { return 0; }
int far fn_b48a4(void) { return 0; }
long far fn_b48da(void) { return 0; }
long far fn_b4927(void) { return 0; }
int far fn_b498e(void) { return 0; }
long far fn_b4a03(void) { return 0; }
long far fn_b4e71(void) { return 0; }
