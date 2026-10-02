/* differs: 308 absent; 311 at +5, 1325 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
extern char B_7B8D;
extern char B_7B8E;
extern char B_7FD3;
extern unsigned char B_7FE5;
extern char B_7FE6;
extern char B_7FE7;
extern char B_7FE8;
extern char B_7FEE;
extern char B_8807;
extern char B_8A9B;
extern char B_8A9C;
extern char B_901B;
extern char B_9457;
extern char B_956A;
extern char B_956D;
extern char B_96EE;
extern char B_A5C0;
extern char B_D4BD;
extern char B_D4C0;
extern char B_D4C2;
extern char B_D5DE;
extern char B_F77B;
extern char TBL_90C1[];
extern unsigned char TBL_F779;
extern unsigned char TBL_c88d1[];
extern int W_9051;
extern int W_9053;
extern int W_93F5;
extern int W_96F6;
extern int W_96F8;
extern int W_CEC4;
extern int W_D4A6;
extern int W_D4A8;
extern int W_F225;
extern int W_F227;
extern int W_F229;
extern void far far_b05a7(void);
extern int far far_b08f7(void);
extern int far far_b1ad0(int);
extern int far far_b1ae0(void);
extern int far far_b1b05(int);
extern int far far_b1f96(void);
extern long far far_b3b9f(void);
extern void far far_bffc9(void);
extern int far far_c8c5d(int, unsigned char near *);
extern long far far_c8d05(int, long);
extern int far far_c9197(void);
extern long far far_da8cb(int);
extern long far far_dad87(void);
extern long far far_daf5c(void);
extern int far far_db00c(void);
extern long far far_db216(void);
extern long far far_db274(void);
extern long far far_dbe67(long, int);
extern long far far_dc861(void);
extern int far far_dd9ba(long);
extern long far far_de41c(void);
extern long far far_deeab(void);
extern long far far_e2ce3(void);
extern long far far_e4094(int);
extern long far far_e49b0(void);
extern long far far_e4a1d(void);
extern long far far_e5612(int);
extern long far far_ec03b(int);
extern long far fn_c88e3(void);
extern long far fn_c891b(void);
extern long far fn_c8980(void);
extern long far fn_c8a20(void);
extern long far fn_c8a31(void);
extern long far fn_c8bea(void);
extern void far fn_c8c0a(int, int);

int far far_c842f(void)
{
    char loc_5e8[1504];
    char loc_8;
    char loc_7;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
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
    unsigned int cx;
    int cx2;
    int cx3;
    unsigned int cx4;
    int cx5;
    int cx6;
    int di;
    int di2;
    int di3;
    int dx;
    int dx2;
    int flags;
    int flags2;
    int flags3;
    int p1520;
    int p1522;
    int p1524;
    int p1526;
    int si;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    int t14;
    int t15;
    int t16;
    long t17;
    long t18;
    int t19;
    long t2;
    long t20;
    long t21;
    int t22;
    long t23;
    long t24;
    long t25;
    long t26;
    int t27;
    long t28;
    long t29;
    int t3;
    int t30;
    int t31;
    int t32;
    long t33;
    int t34;
    int t35;
    int t36;
    long t37;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_ec03b(0x62cc);
    W_D4A8 = SEG_STACK;
    W_D4A6 = (int)(unsigned)loc_5e8;
    dx = W_9051;
    W_F229 = W_9053;
    W_F227 = dx;
    if (B_901B == 0) {
        goto L1;
    }
    p1520 = (int)far_e49b0();
    if ((int)far_b3b9f() != 0) {
        return 77;
    }
L1:
    loc_8 = B_7FD3;
    B_7FD3 = (char)0;
    W_9053 = 0;
    t2 = far_deeab();
    ax = (int)far_e5612(W_F227);
    if (B_7FE8 == 0 && B_8807 == 0) {
        ax2 = (int)far_e4094(125);
    }
    B_D4C2 = B_D5DE;
    B_A5C0 = (char)1;
    B_956D = (char)0;
    loc_6 = B_7FEE;
    if (B_7FE6 != 0) {
        B_7FEE = (char)0;
    }
    p1522 = 1;
    far_b1ad0(p1522);
    far_b1ae0();
    far_bffc9();
    t4 = fn_c88e3();
    B_956A = (char)(B_956A + 1);
    B_96EE = (char)(int)far_e4a1d();
    ax5 = (int)fn_c8a20();
    B_956A = (char)(B_956A - 1);
    W_F225 = 1;
    loc_7 = (char)0;
    loc_2 = 0;
    loc_4 = 0;
    while (loc_4 == 0) {
        if (loc_2 != 120) {
            p1522 = 0xc829;
            t5 = fn_c891b();
        }
        if (loc_2 == 122) {
            B_7B8E = loc_7;
        }
        for (;;) {
            t34 = far_b08f7();
            loc_2 = t34;
            if (t34 != 0) {
                break;
            }
            t30 = far_c9197();
            if (B_7B8D != 0 || (TBL_F779 & 248) != 152) {
                continue;
            }
            far_b05a7();
            t32 = far_b1ad0(1);
            p1522 = SEG_DATA;
            p1524 = (int)(unsigned)&TBL_F779;
            p1526 = W_F225;
            t33 = far_c8d05(p1526, ((long)p1522 << 16 | (unsigned)p1524));
        }
        si = B_7FE8;
        B_956A = (char)(B_956A + 1);
        bx = loc_2;
        flags = bx - 109;
        if (!CC("!=", flags)) {
L2:
            B_956A = (char)(B_956A - 1);
            continue;
        }
        if (!CC(">", flags)) {
            flags2 = bx - 91;
            if (CC("!=", flags2)) {
                if (CC(">", flags2)) {
                    if (bx == 93) {
                        goto L3;
                    }
                    if (bx != 94) {
                        goto L4;
                    }
                    if (W_F225 > 1) {
                        W_F225 = W_F225 - 1;
                    }
                } else if (bx != 33) {
                    if (bx == 68) {
                        t6 = far_e2ce3();
                        ax6 = (int)t6;
                        W_96F8 = (int)(t6 >> 16);
                        W_96F6 = ax6;
                        flags3 = (int)(t6 >> 16);
                        if (CC(">", flags3) || !CC("<", flags3) && ax6 >= 0x190) {
                            if (W_93F5 != 1) {
                                t7 = fn_c8bea();
                            }
                            B_8A9B = B_8A9C;
                            t8 = far_db274();
                            t9 = far_dad87();
                            t10 = far_de41c();
                            B_D4C0 = B_F77B;
                            if (W_93F5 != 1) {
                                bx2 = B_8A9C;
                                TBL_90C1[bx2] = (char)(TBL_90C1[bx2] | 2);
                                if (B_7FE6 != 0) {
                                    t11 = far_db216();
                                    if ((int)t11 == 0) {
                                        if (B_D4BD != 0) {
                                            B_D4BD = (char)0;
                                            loc_2 = 125;
                                            si = 0;
L3:
                                            if (W_93F5 != 1) {
                                                t12 = fn_c8bea();
                                                goto L5;
                                            }
                                        }
                                    }
                                }
                            } else {
                                TBL_F779 = (unsigned char)-1;
                            }
                        } else {
                            B_9457 = (char)(B_9457 | 4);
                        }
                    } else {
                        if (bx == 81) {
                            loc_2 = 77;
                        }
L4:
                        loc_4 = 1;
                    }
                } else if (W_93F5 != 0) {
                    W_F225 = W_F225 + 1;
                }
            } else {
L5:
                if (W_93F5 != 0) {
                    p1524 = SEG_DATA;
                    p1526 = (int)(unsigned)&TBL_F779;
                    t13 = far_dbe67(((long)p1524 << 16 | (unsigned)p1526), W_93F5);
                }
                if (si != 0) {
                    t14 = far_b1ad0(7);
                    if (loc_2 != 123) {
                        if (loc_2 == 125) {
                            t16 = far_b1b05(0x62ff);
                        }
                    } else {
                        t15 = far_b1b05(0x62d6);
                    }
                }
                t17 = far_daf5c();
                p1522 = ((char)((int)t17 >> 8) << 8 | (unsigned char)*(char *)((char *)&loc_2 + 0));
                t18 = far_e4094(p1522);
                dx2 = W_9051;
                W_F229 = W_9053;
                W_F227 = dx2;
                if (loc_2 != 68) {
                    t19 = far_db00c();
                }
                t20 = fn_c8a20();
                W_F225 = 1;
                t21 = fn_c88e3();
            }
            goto L2;
        }
        if ((unsigned int)(bx - 117) > 8) {
            goto L4;
        }
        switch ((unsigned int)(unsigned)(TBL_c88d1 + (bx - 117 << 1))) {
        case 0:
            goto L6;
        case 1:
        case 2:
        case 7:
            goto L4;
        case 3:
            if (W_93F5 != 1) {
                if (W_9053 <= 0x3e7) {
                    t24 = fn_c8bea();
                    if (B_7FE7 == 0) {
                        t26 = fn_c8bea();
                        p1524 = B_7FE5;
                        t27 = far_c8c5d(p1524, &TBL_F779);
                        W_93F5 = t27;
                        goto L7;
                    }
                    if (W_CEC4 != 0) {
                        t25 = fn_c8bea();
                        cx4 = W_CEC4;
                        cx5 = cx4 >> 1;
                        __movs2((unsigned char far *)&TBL_F779, MK_FP(SEG_DATA, -0x31f2), cx5 * 2);
                        di3 = (int)(unsigned)(&TBL_F779 + cx5 * 2);
                        cx6 = cx4 & 1;
                        __movs1(MK_FP(SEG_DATA, di3), MK_FP(SEG_DATA, cx5 * 2 - 0x31f2), cx6);
                        di = di3 + cx6;
                        W_93F5 = W_CEC4;
L7:
                        t28 = far_dc861();
                        p1522 = 0xc829;
                        t29 = fn_c8980();
                        ax7 = B_8A9C;
                        TBL_90C1[ax7] = (char)(TBL_90C1[ax7] | 2);
                    }
                }
            }
            goto L2;
        case 4:
            if (B_7FE7 != 0) {
                cx = W_93F5;
                cx2 = cx >> 1;
                __movs2(MK_FP(SEG_DATA, -0x31f2), (unsigned char far *)&TBL_F779, cx2 * 2);
                di2 = cx2 * 2 - 0x31f2;
                cx3 = cx & 1;
                __movs1(MK_FP(SEG_DATA, di2), (unsigned char far *)(&TBL_F779 + cx2 * 2), cx3);
                di = di2 + cx3;
                W_CEC4 = W_93F5;
            }
            if (W_93F5 != 1) {
                W_93F5 = 0;
            }
            goto L2;
        case 5:
            loc_7 = B_7B8D;
            p1522 = SEG_DATA;
            p1524 = (int)(unsigned)&TBL_F779;
            t22 = far_dd9ba(((long)p1522 << 16 | (unsigned)p1524));
            t23 = far_de41c();
            goto L2;
        case 6:
            goto L5;
        case 8:
            goto L3;
        }
    }
    fn_c8c0a(W_F227, W_F229);
    B_7FEE = *(char *)((char *)&loc_6 + 0);
    t37 = far_da8cb(0);
    B_7FD3 = loc_8;
    return loc_2;
L6:
    far_b1ad0(7);
    far_b1f96();
    fn_c8c0a(W_F227, W_F229);
    B_956A = (char)(B_956A - 1);
    loc_2 = (int)fn_c8a31();
    B_7FEE = *(char *)((char *)&loc_6 + 0);
    B_7FD3 = loc_8;
    return loc_2;
}
long far fn_c88e3(void) { return 0; }
long far fn_c891b(void) { return 0; }
long far fn_c8980(void) { return 0; }
long far fn_c8a20(void) { return 0; }
long far fn_c8a31(void) { return 0; }
long far fn_c8bea(void) { return 0; }
void far fn_c8c0a(int p0, int p1) { }
