/* differs: 308 at +5, 1129 bytes; 311 at +5, 1127 bytes; 312 at +5, 1126 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int FP_E40C;
extern int W_E40E;
extern int far far_b1ad0();
extern int far far_b1d48();
extern int far far_b1f96();
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

long far far_e8695(int arg_0)
{
    char loc_2[2];
    char loc_8[6];
    char loc_c[4];
    char loc_2a[30];
    char loc_40[22];
    char loc_8c0[2176];
    char loc_ac0[512];
    char loc_adc[28];
    int ax;
    int ax2;
    unsigned int ax3;
    int ax4;
    int ax5;
    int bx;
    int bx2;
    int bx3;
    int bx4;
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
    int dx3;
    int es;
    int es2;
    int p2788;
    int p27882;
    int p2790;
    int p2792;
    int p2794;
    int p2796;
    int p2798;
    int si;
    int si2;
    int si3;
    int si4;
    int t1;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    long t16;
    int t17;
    long t18;
    long t19;
    long t2;
    int t20;
    int t21;
    int t22;
    long t23;
    long t24;
    long t25;
    int t26;
    int t27;
    int t28;
    long t29;
    long t3;
    long t30;
    int t31;
    int t32;
    int t4;
    long t5;
    int t6;
    int t7;
    int t8;
    int t9;

    far_cab34(1);
    far_c6547(arg_0 - 1);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c), MK_FP(SEG_DATA, 0x6c3e), 4);
    loc_8[0] = *(char *)(0x6c42);
    p2796 = W_E40E;
    p2798 = FP_E40C;
    t2 = far_c812b(p2798, p2796, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2a));
    t3 = far_caade((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2a));
    if ((int)t3 >= 0) {
        far_cab34(0);
        return ((long)UNDEF << 16 | (unsigned)(int)t3);
    }
    t5 = far_caa9c((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2a));
    *(int *)((char *)&loc_8 + 4) = (int)t5;
    if ((int)t5 < 0) {
        far_cab34(0);
        return ((long)UNDEF << 16 | (unsigned)*(int *)((char *)&loc_8 + 4));
    }
    loc_2[0] = (char)7;
    loc_2[1] = (char)0;
    t7 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2), *(int *)((char *)&loc_8 + 4), 2);
    bx = UNDEF;
    if (t7 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_8 + 4)) >> 16), t7);
    }
    p2788 = SEG_STACK;
    es = p2788;
    __stos2((char far *)MK_FP(es, (unsigned int)(unsigned)loc_8c0), 0, 0x880);
    __stos2((char far *)MK_FP(es, (unsigned int)(unsigned)loc_ac0), 0, 0x200);
    di = (int)(unsigned)loc_8c0;
    cx = 0;
    *(int *)((char *)&loc_8 + 2) = 0;
    *(int *)((char *)&loc_2a + 28) = (int)(unsigned)loc_8c0;
    *(int *)((char *)&loc_2a + 26) = 0;
    *(int *)((char *)&loc_2a + 24) = (int)(unsigned)loc_ac0;
    ax2 = FP_E40C + 62;
    *(int *)((char *)&loc_2a + 22) = ax2;
    ds = SEG_DATA;
    for (;;) {
L1:
        dx = 0;
        si = *(int *)((char *)&loc_2a + 22);
        for (;;) {
            if (dx <= 64) {
                es = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
                ax2 = (unsigned char)*(char far *)MK_FP(es, si);
                if (ax2 == *(int *)((char *)&loc_8 + 2)) {
                    goto L2;
                }
                si = si + 24;
                dx = dx + 1;
                continue;
            }
            break;
        }
        goto L3;
    }
    goto L4;
L2:
    si2 = *(int *)((char *)&loc_2a + 28);
    t9 = __repne_scas1(MK_FP(0xa853 /* SEG_A28F */, *(int *)((char *)&loc_2a + 26) + 0x4800), 0, -1);
    cx2 = ~t9;
    cx3 = cx2 >> 1;
    p2788 = ds;
    __movs2(MK_FP(SEG_STACK, si2), MK_FP(0xa853 /* SEG_A28F */, si2), cx3 * 2);
    di2 = si2 + cx3 * 2;
    cx4 = cx2 & 1;
    __movs1(MK_FP(SEG_STACK, di2), MK_FP(0xa853 /* SEG_A28F */, si2 + cx3 * 2), cx4);
    di = di2 + cx4;
    cx = 0;
    ds = p2788;
    bx2 = *(int *)((char *)&loc_2a + 26);
    if (*(char far *)MK_FP(0xa853 /* SEG_A28F */, bx2 + 0x4813) != 0) {
        es = 0xa853 /* SEG_A28F */;
        ax3 = *(int far *)MK_FP(es, bx2 + 0x481c);
        ax2 = ax3 << 1;
        dx2 = *(int far *)MK_FP(es, bx2 + 0x481e) << 1 | ax3 >> 15 & 1;
    } else {
        bx3 = *(int *)((char *)&loc_2a + 26);
        es = 0xa853 /* SEG_A28F */;
        dx2 = *(int far *)MK_FP(es, bx3 + 0x481e);
        ax2 = *(int far *)MK_FP(es, bx3 + 0x481c);
    }
    bx = *(int *)((char *)&loc_2a + 24);
    *(int far *)MK_FP(SEG_STACK, bx + 2) = dx2;
    *(int far *)MK_FP(SEG_STACK, bx) = ax2;
L3:
    *(int *)((char *)&loc_2a + 28) = *(int *)((char *)&loc_2a + 28) + 17;
    *(int *)((char *)&loc_2a + 26) = *(int *)((char *)&loc_2a + 26) + 36;
    *(int *)((char *)&loc_2a + 24) = *(int *)((char *)&loc_2a + 24) + 4;
    *(int *)((char *)&loc_8 + 2) = *(int *)((char *)&loc_8 + 2) + 1;
    if (*(int *)((char *)&loc_8 + 2) < 128) {
        goto L1;
    }
L4:
    t10 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8c0), *(int *)((char *)&loc_8 + 4), 0x880);
    if (t10 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_8 + 4)) >> 16), t10);
    }
    t12 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_ac0), *(int *)((char *)&loc_8 + 4), 0x200);
    if (t12 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_8 + 4)) >> 16), t12);
    }
    p2790 = *(int *)((char *)&loc_8 + 4);
    p2792 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
    p2794 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
    t14 = far_cad90(((long)p2792 << 16 | (unsigned)p2794), p2790, 0x77e);
    if (t14 != 0) {
        far_cab34(0);
        return (long)MK_FP((int)(far_cab20(*(int *)((char *)&loc_8 + 4)) >> 16), t14);
    }
    t16 = far_cab20(*(int *)((char *)&loc_8 + 4));
    bx4 = UNDEF;
    ax4 = (int)t16;
    dx3 = (int)(t16 >> 16);
    si3 = ax4;
    if (ax4 < 0) {
        far_cab34(0);
        return ((long)UNDEF << 16 | (unsigned)si3);
    }
    p27882 = SEG_STACK;
    es2 = p27882;
    __movs2((char far *)MK_FP(es2, (unsigned int)(unsigned)loc_c), MK_FP(ds, 0x6c43), 4);
    cx5 = 0;
    *(char far *)MK_FP(es2, (unsigned int)(unsigned)loc_8) = *(char far *)MK_FP(ds, 0x6c47);
    si4 = 0x6c48;
    *(int *)((char *)&loc_8 + 2) = 0;
    di3 = (int)(unsigned)loc_8c0;
    for (;;) {
        if (*(char far *)MK_FP(SEG_STACK, di3) == 0) {
            goto L5;
        }
        p2796 = SEG_STACK;
        p2798 = di3;
        t18 = far_c812b(p2798, p2796, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2a));
        t19 = far_b6beb((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2a), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_40));
        t20 = far_b1ad0(7, 0);
        t21 = far_b1d48(MK_FP(ds, 0x6c48), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_40));
        t22 = far_b1f96(40);
        p27882 = SEG_STACK;
        p2790 = (int)(unsigned)loc_adc;
        p2792 = SEG_STACK;
        p2794 = (int)(unsigned)loc_2a;
        t23 = far_cac0f(((long)p2792 << 16 | (unsigned)p2794), ((long)p27882 << 16 | (unsigned)p2790));
        bx4 = UNDEF;
        cx5 = UNDEF;
        es2 = UNDEF;
        ax4 = (int)t23;
        dx3 = (int)(t23 >> 16);
        if (ax4 == 0) {
            goto L5;
        }
        for (;;) {
            t24 = far_c7e9d(*(int *)((char *)&loc_8 + 2));
            t25 = far_c80dc((int)t24);
            if ((int)t24 <= (int)t25) {
                break;
            }
            t30 = fn_e8efe();
            ax5 = (int)t30;
            if (ax5 != 120) {
                goto L6;
            }
        }
        t26 = far_b1ad0(7, 0);
        p2790 = (int)(unsigned)loc_40;
        p2792 = ds;
        p2794 = 0x6c5e;
        t27 = far_b1d48(((long)p2792 << 16 | (unsigned)p2794), MK_FP(SEG_STACK, p2790));
        t28 = far_b1f96(40);
        p27882 = *(int *)((char *)&loc_8 + 2);
        t29 = far_e9004(p27882);
        bx4 = UNDEF;
        cx5 = UNDEF;
        es2 = UNDEF;
        ax4 = (int)t29;
        dx3 = (int)(t29 >> 16);
        si4 = ax4;
        if (ax4 < 0 && si4 != -0x800) {
            break;
        }
L5:
        di3 = di3 + 17;
        *(int *)((char *)&loc_8 + 2) = *(int *)((char *)&loc_8 + 2) + 1;
        if (*(int *)((char *)&loc_8 + 2) < 128) {
            continue;
        }
        goto L7;
    }
    far_cab34(0);
    return ((long)UNDEF << 16 | (unsigned)si4);
L6:
    return ((long)ax5 << 16 | (unsigned)ax5);
L7:
    far_cab34(0);
    return ((long)UNDEF << 16 | (unsigned)0);
}
long far fn_e8efe(void) { return 0; }
