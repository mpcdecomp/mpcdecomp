/* differs: 308 at +5, 1238 bytes; 311 at +5, 1230 bytes; 312 at +5, 1228 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_E410[];
extern unsigned char B_E421;
extern unsigned char FP_E40C;
extern int far far_b1ad0();
extern int far far_b1d48();
extern int far far_b1f96();
extern long far far_b3b9f();
extern long far far_b6beb();
extern int far far_c6547();
extern long far far_c7e9d();
extern long far far_c80dc();
extern long far far_c812b();
extern long far far_caa9c();
extern long far far_caade();
extern long far far_cab20();
extern void far far_cab34();
extern long far far_cac0f();
extern int far far_cad90();
extern long far far_e9004();
extern long far fn_e8efe();

long far far_e8a9f(void)
{
    char loc_2[2];
    unsigned char loc_3;
    long loc_e;
    char loc_10[2];
    char loc_14[4];
    char loc_34[32];
    char loc_4a[22];
    char loc_60[22];
    char loc_8e0[2176];
    unsigned int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    int bx3;
    int cx;
    unsigned int cx2;
    int cx3;
    int cx4;
    int cx5;
    int di;
    int di2;
    int di3;
    int ds;
    int dx;
    int dx2;
    int es;
    int p2280;
    int p22802;
    int p2282;
    int p2284;
    int p2286;
    int p2288;
    int p2290;
    int si;
    int si2;
    int si3;
    int si4;
    int si5;
    long t1;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    int t16;
    long t17;
    int t18;
    long t19;
    long t2;
    long t20;
    int t21;
    int t22;
    int t23;
    long t24;
    long t25;
    long t26;
    int t27;
    int t28;
    int t29;
    int t3;
    long t30;
    long t31;
    int t32;
    int t33;
    int t34;
    int t35;
    long t4;
    int t5;
    int t6;
    int t7;
    int t8;
    int t9;

    loc_3 = (unsigned char)24;
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14), MK_FP(SEG_DATA, 0x6c6d), 4);
    loc_10[0] = *(char *)(0x6c71);
    p2288 = SEG_DATA;
    p2290 = (int)(unsigned)B_E410;
    t1 = far_c812b(p2290, p2288, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4a));
    t2 = far_caade((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4a));
    if ((int)t2 >= 0) {
        return (long)MK_FP((int)(far_b3b9f((int)t2) >> 16), (int)t2);
    }
    far_cab34(1);
    t4 = far_caa9c((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4a));
    *(int *)((char *)&loc_e + 8) = (int)t4;
    if ((int)t4 < 0) {
        far_cab34(0);
        return ((long)UNDEF << 16 | (unsigned)*(int *)((char *)&loc_e + 8));
    }
    loc_2[0] = (char)10;
    loc_2[1] = (char)0;
    t6 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2), *(int *)((char *)&loc_e + 8), 2);
    if (t6 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_e + 8)) >> 16), t6);
    }
    t8 = far_cad90((unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_3), *(int *)((char *)&loc_e + 8), 1);
    dx = UNDEF;
    si = t8;
    if (t8 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_e + 8)) >> 16), si);
    }
    *(int *)((char *)&loc_e + 2) = 0;
    *(int *)((char *)&loc_e + 0) = 0;
    p2280 = SEG_STACK;
    __stos2(((long)p2280 << 16 | (unsigned)(unsigned int)(unsigned)loc_8e0), 0, 0x880);
    di = (int)(unsigned)loc_60;
    cx = 0;
    *(int *)((char *)&loc_e + 6) = 0;
    *(int *)((char *)&loc_34 + 30) = 0;
    *(int *)((char *)&loc_34 + 28) = (int)(unsigned)loc_8e0;
    ds = SEG_DATA;
    do {
        if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, *(int *)((char *)&loc_34 + 30) + 0x4800) != 0) {
            si2 = *(int *)((char *)&loc_34 + 28);
            t10 = __repne_scas1(MK_FP(0xa853 /* SEG_A28F */, *(int *)((char *)&loc_34 + 30) + 0x4800), 0, -1);
            cx2 = ~t10;
            cx3 = cx2 >> 1;
            p2280 = ds;
            __movs2(MK_FP(SEG_STACK, si2), MK_FP(0xa853 /* SEG_A28F */, si2), cx3 * 2);
            si3 = si2 + cx3 * 2;
            di2 = si2 + cx3 * 2;
            cx4 = cx2 & 1;
            __movs1(MK_FP(SEG_STACK, di2), MK_FP(0xa853 /* SEG_A28F */, si3), cx4);
            si = si3 + cx4;
            di = di2 + cx4;
            cx = 0;
            ds = p2280;
            bx = *(int *)((char *)&loc_34 + 30);
            if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, bx + 0x4813) != 0) {
                ax = *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx + 0x481c);
                ax2 = ax << 1;
                dx = *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx + 0x481e) << 1 | ax >> 15 & 1;
            } else {
                bx2 = *(int *)((char *)&loc_34 + 30);
                dx = *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx2 + 0x481e);
                ax2 = *(int far *)MK_FP(0xa853 /* SEG_A28F */, bx2 + 0x481c);
            }
            *(int *)((char *)&loc_e + 0) = *(int *)((char *)&loc_e + 0) + ax2;
            *(int *)((char *)&loc_e + 2) = (int)(loc_e + ((long)dx << 16 | (unsigned)ax2) >> 16);
        }
        *(int *)((char *)&loc_34 + 30) = *(int *)((char *)&loc_34 + 30) + 36;
        *(int *)((char *)&loc_34 + 28) = *(int *)((char *)&loc_34 + 28) + 17;
        *(int *)((char *)&loc_e + 6) = *(int *)((char *)&loc_e + 6) + 1;
    } while (*(int *)((char *)&loc_34 + 30) != 0x1200);
    t11 = far_cad90((long far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_e), *(int *)((char *)&loc_e + 8), 4);
    if (t11 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_e + 8)) >> 16), t11);
    }
    t13 = far_cad90((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)B_E410), *(int *)((char *)&loc_e + 8), 0x13c);
    if (t13 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_e + 8)) >> 16), t13);
    }
    *(int *)((char *)&loc_e + 4) = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_E421);
    *(int *)((char *)&loc_e + 6) = 0;
    while ((int)loc_3 > *(int *)((char *)&loc_e + 6)) {
        t34 = far_c6547(*(int *)((char *)&loc_e + 6));
        ax6 = far_cad90(*(long far *)MK_FP(ds, (unsigned)&FP_E40C), *(int *)((char *)&loc_e + 8), 0x77e);
        if (ax6 != 0) {
            goto L1;
        }
        *(int *)((char *)&loc_e + 6) = *(int *)((char *)&loc_e + 6) + 1;
    }
    far_c6547(*(int *)((char *)&loc_e + 4));
    p2282 = *(int *)((char *)&loc_e + 8);
    p2284 = SEG_STACK;
    p2286 = (int)(unsigned)loc_8e0;
    t15 = far_cad90(((long)p2284 << 16 | (unsigned)p2286), p2282, 0x880);
    if (t15 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_e + 8)) >> 16), t15);
    }
    t17 = far_cab20(*(int *)((char *)&loc_e + 8));
    bx3 = UNDEF;
    ax4 = (int)t17;
    dx2 = (int)(t17 >> 16);
    si4 = ax4;
    if (ax4 < 0) {
        far_cab34(0);
        return ((long)UNDEF << 16 | (unsigned)si4);
    }
    p22802 = SEG_STACK;
    es = p22802;
    __movs2((char far *)MK_FP(es, (unsigned int)(unsigned)loc_14), MK_FP(ds, 0x6c43), 4);
    cx5 = 0;
    *(char far *)MK_FP(es, (unsigned int)(unsigned)loc_10) = *(char far *)MK_FP(ds, 0x6c47);
    si5 = 0x6c48;
    *(int *)((char *)&loc_e + 6) = 0;
    di3 = (int)(unsigned)loc_8e0;
    for (;;) {
        if (*(char far *)MK_FP(SEG_STACK, di3) == 0) {
            goto L2;
        }
        p2288 = SEG_STACK;
        p2290 = di3;
        t19 = far_c812b(p2290, p2288, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4a));
        t20 = far_b6beb((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_60));
        t21 = far_b1ad0(7, 0);
        t22 = far_b1d48(MK_FP(ds, 0x6c48), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_60));
        t23 = far_b1f96(40);
        p22802 = SEG_STACK;
        p2282 = (int)(unsigned)loc_34;
        p2284 = SEG_STACK;
        p2286 = (int)(unsigned)loc_4a;
        t24 = far_cac0f(((long)p2284 << 16 | (unsigned)p2286), ((long)p22802 << 16 | (unsigned)p2282));
        bx3 = UNDEF;
        cx5 = UNDEF;
        es = UNDEF;
        ax4 = (int)t24;
        dx2 = (int)(t24 >> 16);
        if (ax4 == 0) {
            goto L2;
        }
        for (;;) {
            t25 = far_c7e9d(*(int *)((char *)&loc_e + 6));
            t26 = far_c80dc((int)t25);
            if ((int)t25 <= (int)t26) {
                break;
            }
            t31 = fn_e8efe();
            ax5 = (int)t31;
            if (ax5 != 120) {
                goto L3;
            }
        }
        t27 = far_b1ad0(7, 0);
        p2282 = (int)(unsigned)loc_60;
        p2284 = ds;
        p2286 = 0x6c5e;
        t28 = far_b1d48(((long)p2284 << 16 | (unsigned)p2286), MK_FP(SEG_STACK, p2282));
        t29 = far_b1f96(40);
        p22802 = *(int *)((char *)&loc_e + 6);
        t30 = far_e9004(p22802);
        bx3 = UNDEF;
        cx5 = UNDEF;
        es = UNDEF;
        ax4 = (int)t30;
        dx2 = (int)(t30 >> 16);
        si5 = ax4;
        if (ax4 < 0 && si5 != -0x800) {
            break;
        }
L2:
        di3 = di3 + 17;
        *(int *)((char *)&loc_e + 6) = *(int *)((char *)&loc_e + 6) + 1;
        if (*(int *)((char *)&loc_e + 6) < 128) {
            continue;
        }
        goto L4;
    }
    far_cab34(0);
    return ((long)UNDEF << 16 | (unsigned)si5);
L1:
    far_cab34(0);
    return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_e + 8)) >> 16), ax6);
L3:
    return ((long)ax5 << 16 | (unsigned)ax5);
L4:
    far_cab34(0);
    return ((long)UNDEF << 16 | (unsigned)0);
}
long far fn_e8efe(void) { return 0; }
