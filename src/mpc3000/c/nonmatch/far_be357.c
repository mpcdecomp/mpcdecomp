/* differs: 308 at +5, 1698 bytes; 311 at +5, 1697 bytes; 312 at +5, 1706 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_7B8D;
extern unsigned char B_843B[];
extern char B_D5DD;
extern unsigned char B_D5DE;
extern char B_E421;
extern char FP_E40C[];
extern int W_E40E;
extern int far L_bec2b();
extern int far far_b08f7();
extern long far far_b1073();
extern int far far_b1aac();
extern int far far_b1ad0();
extern int far far_b1b05();
extern int far far_b1d48();
extern int far far_b1f96();
extern long far far_b3471();
extern long far far_b362e();
extern long far far_b3819();
extern long far far_b3b9f();
extern long far far_b6beb();
extern long far far_b6cd3();
extern long far far_b90dd();
extern long far far_c6547();
extern long far far_caade();
extern long far far_cab20();
extern long far far_cad00();
extern int far far_cad6d();
extern long far far_cb23d();
extern int far far_cb457();
extern long far far_cca70();
extern long far far_cd4d6();
extern int far far_cd551();

long far far_be357(int arg_0, int arg_2, char arg_4)
{
    char loc_2[2];
    char loc_20[30];
    char loc_36[22];
    char loc_8b6[2176];
    char loc_ab6[512];
    char loc_b36[128];
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx2;
    int bx3;
    unsigned int cx;
    int cx10;
    unsigned int cx11;
    int cx12;
    int cx13;
    int cx14;
    int cx2;
    int cx3;
    unsigned int cx4;
    int cx5;
    int cx6;
    unsigned int cx7;
    int cx8;
    int cx9;
    int di;
    int di2;
    int di3;
    int di4;
    int di5;
    int di6;
    int ds;
    int dx;
    int dx2;
    int es;
    int flags;
    int p2878;
    int p28782;
    int p2880;
    int p28802;
    int p28803;
    int si;
    int si10;
    int si11;
    int si2;
    int si3;
    int si4;
    int si5;
    int si6;
    int si7;
    int si8;
    int si9;
    int t1;
    long t10;
    int t11;
    int t12;
    long t13;
    int t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    int t21;
    int t22;
    int t23;
    int t24;
    long t25;
    int t26;
    long t27;
    long t28;
    int t29;
    int t3;
    long t30;
    long t31;
    long t4;
    long t5;
    int t6;
    long t7;
    int t8;
    int t9;

    *(int *)((char *)&loc_20 + 24) = 0;
    *(int *)((char *)&loc_20 + 22) = 0;
    if (arg_4 != 0) {
        ds = SEG_DATA;
        goto L1;
    }
    B_D5DD = (char)102;
    t1 = far_b1aac();
    t2 = far_b6cd3(MK_FP(SEG_DATA, 0x4703));
    t3 = far_b1ad0(1, 0);
    arg_4 = (char)(B_E421 + 1);
    t4 = far_b3819(MK_FP(SEG_DATA, 0x4712), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&arg_4), 2, 1, 24, 8);
    cx = ~__repne_scas1((int)*(long *)((char *)&FP_E40C + 0), 0, -1);
    cx2 = cx >> 1;
    ax = W_E40E;
    si = *(int *)((char *)&FP_E40C + 0);
    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), ((long)ax << 16 | (unsigned)si), cx2 * 2);
    si2 = si + cx2 * 2;
    di = (int)(unsigned)(loc_20 + cx2 * 2);
    cx3 = cx & 1;
    __movs1(MK_FP(SEG_STACK, di), ((long)ax << 16 | (unsigned)si2), cx3);
    si3 = si2 + cx3;
    di2 = di + cx3;
    ds = SEG_DATA;
    t5 = far_b3471(MK_FP(ds, 0x4728), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), 16);
    t6 = far_b1ad0(2, 0);
    t7 = far_b362e(MK_FP(ds, 0x472a), (unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)B_843B), MK_FP(ds, 0x46e0), 10);
    t8 = far_b1ad0(4, 0);
    t9 = far_b1b05(MK_FP(ds, 0x4749));
    t10 = far_b90dd();
    t11 = far_b1ad0(7, 0);
    p2880 = 0x4797;
    ax2 = far_b1b05(MK_FP(ds, p2880));
    for (;;) {
        ax3 = far_b08f7(2);
        if (ax3 == 0) {
            ax4 = *(char far *)MK_FP(ds, (unsigned)&B_7B8D);
            if (ax4 != 0) {
                if (ax4 != 1) {
                    continue;
                }
                ax5 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
                si4 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
                t12 = __repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), 0, -1);
                cx4 = ~t12;
                cx5 = cx4 >> 1;
                __movs2(((long)ax5 << 16 | (unsigned)si4), MK_FP(SEG_STACK, si4), cx5 * 2);
                si5 = si4 + cx5 * 2;
                di3 = si4 + cx5 * 2;
                cx6 = cx4 & 1;
                __movs1(((long)ax5 << 16 | (unsigned)di3), MK_FP(SEG_STACK, si5), cx6);
                si3 = si5 + cx6;
                di2 = di3 + cx6;
                ds = ds;
                continue;
            }
            t13 = far_c6547(arg_4 - 1);
            p2880 = (int)(unsigned)loc_20;
            t14 = __repne_scas1((int)*(long far *)MK_FP(ds, (unsigned)&FP_E40C), 0, -1);
            cx7 = ~t14;
            cx8 = cx7 >> 1;
            ax6 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
            si6 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
            __movs2(MK_FP(SEG_STACK, p2880), ((long)ax6 << 16 | (unsigned)si6), cx8 * 2);
            si7 = si6 + cx8 * 2;
            di4 = p2880 + cx8 * 2;
            cx9 = cx7 & 1;
            __movs1(MK_FP(SEG_STACK, di4), ((long)ax6 << 16 | (unsigned)si7), cx9);
            si3 = si7 + cx9;
            di2 = di4 + cx9;
            ds = ds;
            t15 = far_b1073(1);
            continue;
        }
        break;
    }
    if (ax3 != 120 && ax3 != 121) {
        return ((long)ax3 << 16 | (unsigned)ax3);
    }
    if (ax3 == 121) {
        t16 = far_cb23d();
        ax7 = (int)far_cd4d6();
    }
L1:
    t17 = far_c6547(arg_4 - 1);
    t18 = far_cad00(0);
    far_b1ad0(7, 0);
    t19 = far_b6beb(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_36));
    far_b1d48(MK_FP(ds, 0x47ac), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_36));
    far_b1f96(40);
    t20 = far_caade(*(long *)((char *)&arg_0 + 0));
    *(int *)((char *)&loc_20 + 28) = (int)t20;
    if ((int)t20 < 0) {
        return (long)MK_FP((int)(far_b3b9f((int)t20) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    t21 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_2), *(int *)((char *)&loc_20 + 28), 2);
    if (t21 < 0) {
        return (long)MK_FP((int)(far_b3b9f(t21) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    if (loc_2[0] != 7) {
        return (long)MK_FP((int)(far_b3b9f(-33) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    if (loc_2[1] != 0) {
        return (long)MK_FP((int)(far_b3b9f(-32) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    t22 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8b6), *(int *)((char *)&loc_20 + 28), 0x880);
    if (t22 != 0) {
        return (long)MK_FP((int)(far_b3b9f(t22) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    p28802 = *(int *)((char *)&loc_20 + 28);
    t23 = far_cad6d((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_ab6), p28802, 0x200);
    bx = UNDEF;
    dx = UNDEF;
    if (t23 != 0) {
        return (long)MK_FP((int)(far_b3b9f(t23) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    p2878 = SEG_STACK;
    es = p2878;
    __stos2((char far *)MK_FP(es, (unsigned int)(unsigned)loc_b36), 0, 128);
    cx10 = 0;
    si8 = 0;
    di5 = (int)(unsigned)loc_8b6;
    ax11 = (int)(unsigned)loc_ab6;
    *(int *)((char *)&loc_20 + 20) = ax11;
    do {
        if (*(char far *)MK_FP(SEG_STACK, di5) != 0) {
            p2878 = SEG_STACK;
            p28802 = di5;
            t24 = far_cd551(((long)p2878 << 16 | (unsigned)p28802));
            bx = UNDEF;
            cx10 = UNDEF;
            es = UNDEF;
            ax11 = t24;
            dx = UNDEF;
            if (ax11 >= 0) {
                if (*(char far *)MK_FP(ds, (unsigned)&B_843B) == 1) {
                    loc_b36[si8] = (char)1;
                }
            } else {
                loc_b36[si8] = (char)1;
                bx = *(int *)((char *)&loc_20 + 20);
                ax11 = *(int far *)MK_FP(SEG_STACK, bx + 2);
                dx = *(int far *)MK_FP(SEG_STACK, bx);
                *(int *)((char *)&loc_20 + 22) = *(int *)((char *)&loc_20 + 22) + dx;
                *(int *)((char *)&loc_20 + 24) = (int)(*(long *)((char *)&loc_20 + 22) + ((long)ax11 << 16 | (unsigned)dx) >> 16);
            }
        }
        di5 = di5 + 17;
        *(int *)((char *)&loc_20 + 20) = *(int *)((char *)&loc_20 + 20) + 4;
        si8 = si8 + 1;
    } while (si8 < 128);
    t25 = far_cca70();
    flags = (int)(t25 >> 16) - *(int *)((char *)&loc_20 + 24);
    if (!CC(">", flags) && (CC("<", flags) || (unsigned int)(int)t25 < (unsigned int)*(int *)((char *)&loc_20 + 22))) {
        return (long)MK_FP((int)(far_b3b9f(2) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    t26 = far_cad6d(*(long far *)MK_FP(ds, (unsigned)&FP_E40C), *(int *)((char *)&loc_20 + 28), 0x77e);
    if (t26 != 0) {
        return (long)MK_FP((int)(far_b3b9f(t26) >> 16), *(char far *)MK_FP(ds, (unsigned)&B_D5DE));
    }
    *(int *)((char *)&loc_20 + 26) = 0;
    ax12 = (int)far_b6beb(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20));
    si9 = 0;
    do {
        bx2 = (int)(unsigned)(loc_20 + si9);
        if (*(char far *)MK_FP(SEG_STACK, bx2) == 46 || *(int *)((char *)&loc_20 + 26) == 1) {
            *(char far *)MK_FP(SEG_STACK, bx2) = (char)32;
            *(int *)((char *)&loc_20 + 26) = 1;
        }
        si9 = si9 + 1;
    } while (si9 < 16);
    loc_20[16] = (char)0;
    ax13 = *(int far *)MK_FP(ds, (unsigned)&W_E40E);
    si10 = *(int far *)MK_FP(ds, (unsigned)&FP_E40C);
    cx11 = ~__repne_scas1((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20), 0, -1);
    ax14 = ds;
    dx2 = 17 - cx11;
    if (cx11 > 17) {
        cx11 = cx11 + dx2;
        dx2 = 0;
    }
    cx12 = cx11 >> 1;
    __movs2(((long)ax13 << 16 | (unsigned)si10), MK_FP(SEG_STACK, si10), cx12 * 2);
    di6 = si10 + cx12 * 2;
    cx13 = cx11 & 1;
    __movs1(((long)ax13 << 16 | (unsigned)di6), MK_FP(SEG_STACK, si10 + cx12 * 2), cx13);
    __stos1(((long)ax13 << 16 | (unsigned)(di6 + cx13)), 0, dx2);
    t27 = far_cab20(*(int *)((char *)&loc_20 + 28));
    if ((int)t27 < 0) {
        return (long)MK_FP((int)(far_b3b9f((int)t27) >> 16), *(char far *)MK_FP(ax14, (unsigned)&B_D5DE));
    }
    p28782 = SEG_STACK;
    p28803 = (int)(unsigned)loc_8b6;
    cx14 = UNDEF;
    ax15 = L_bec2b(0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_b36), ((long)p28782 << 16 | (unsigned)p28803));
    if (ax15 != 0) {
        if (ax15 < 0) {
            far_cb457(arg_4 - 1);
            return (long)MK_FP((int)(far_b3b9f(ax15) >> 16), 0);
        }
        return ((long)UNDEF << 16 | (unsigned)ax15);
    }
    si11 = 0;
    while (si11 < 64) {
        bx3 = (int)*(long far *)MK_FP(ax14, (unsigned)&FP_E40C) + si11 * 24;
        if (*(char far *)MK_FP((int)(*(long far *)MK_FP(ax14, (unsigned)&FP_E40C) >> 16), bx3 + 62) != -1) {
            t28 = (long)(int)(unsigned char)*(char far *)MK_FP(*(int far *)MK_FP(ax14, (unsigned)&W_E40E), bx3 + 62) * 17L;
            p28782 = SEG_STACK;
            p28803 = (int)(unsigned)(loc_8b6 + (int)t28);
            t29 = far_cd551(((long)p28782 << 16 | (unsigned)p28803));
            cx14 = t29;
            if (t29 >= 0) {
                t30 = (long)(int)si11 * 24L;
                *(char far *)((char far *)*(long far *)MK_FP(ax14, (unsigned)&FP_E40C) + 62 + (int)t30) = (char)cx14;
            } else {
                t31 = (long)(int)si11 * 24L;
                *(char far *)((char far *)*(long far *)MK_FP(ax14, (unsigned)&FP_E40C) + 62 + (int)t31) = (char)-1;
            }
        }
        si11 = si11 + 1;
    }
    return (long)MK_FP((int)(far_c6547(arg_4 - 1) >> 16), 0);
}
int far L_bec2b(int p0, char far *p1, long p2) { return 0; }
