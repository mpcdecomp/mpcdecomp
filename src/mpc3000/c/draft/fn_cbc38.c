/* draft: does not compile */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[16];
    char f_11;
    char f_12;
    char f_13;
};
struct s2 {
    char f_0;
    char pad_1[2];
    char f_3;
    char f_4;
};
struct s3 {
    char f_0;
    char pad_1[5];
    char f_6;
    char pad_7[8];
    char f_f;
    char f_10;
    char pad_11[1];
    char f_12;
    char f_13;
    char f_14;
    char f_15;
    char f_16;
};
struct s4 {
    char pad_0[3];
    char f_3;
};
struct g_FP_E40C {
    long f_0;
};
extern char B_E54C;
extern struct g_FP_E40C FP_E40C;
extern int TBL_6CA0[];
extern int TBL_6E82[];
extern int TBL_6F4C[];
extern int TBL_7016[];
extern char TBL_70E0[];
extern unsigned char TBL_cc3bf[];
extern int far far_cdc6d(void);
extern long far far_fa0c8(int, int, int);
extern void far fn_cc3c7(char far *, unsigned char far *, int, int, int);

long far fn_cbc38(int arg_0, struct s2 far *arg_2, struct s3 far *arg_6, char far *arg_10, struct s4 far *arg_14, int arg_18)
{
    unsigned char loc_5a;
    char loc_59;
    char loc_58;
    char loc_57;
    int loc_56;
    unsigned int loc_54;
    int loc_52;
    int loc_50;
    int loc_4e;
    int loc_4c;
    char loc_4a[1];
    long loc_49;
    int loc_47;
    int loc_45;
    unsigned int loc_43;
    unsigned int loc_41;
    int loc_3f;
    int loc_3d;
    int loc_3b;
    int loc_39;
    char loc_37;
    char loc_36;
    unsigned char loc_35;
    char loc_34[2];
    int loc_32;
    int loc_30;
    int loc_2e;
    unsigned int loc_2c;
    int loc_2a;
    int loc_28;
    int loc_26;
    int loc_24;
    int loc_22;
    int loc_20;
    char loc_1d;
    unsigned int loc_1c;
    int loc_1a;
    long loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    unsigned int loc_10;
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    struct s1 far *loc_4;
    int loc_2;
    int ax;
    int ax10;
    int ax11;
    unsigned int ax12;
    int ax13;
    int ax14;
    int ax15;
    unsigned int ax16;
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
    int ax3;
    unsigned int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    int bx10;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int cx;
    int cx2;
    int di;
    int di2;
    int di3;
    unsigned int di4;
    int dx;
    int dx10;
    int dx11;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    unsigned int dx5;
    unsigned int dx6;
    unsigned int dx7;
    int dx8;
    int dx9;
    int es;
    int es10;
    int es11;
    int es12;
    int es13;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int flags6;
    int flags7;
    unsigned int si;
    unsigned int si2;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    int t26;
    int t27;
    int t28;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)arg_6->f_0);
    loc_5a = (char)ax;
    if (loc_5a == -1) {
        return ((long)dx << 16 | (unsigned)ax);
    }
    t1 = (long)(int)loc_5a * 36L;
    loc_2 = 0xa853 /* SEG_A28F */;
    *(int *)((char *)&loc_4 + 0) = (int)t1 + 0x4800;
    if (loc_4->f_0 == 0) {
        return (long)((char far *)t1 + 0x4800);
    }
    ax3 = ((char)((int)t1 + 0x4800 >> 8) << 8 | (unsigned char)-1);
    loc_58 = (char)ax3;
    loc_59 = (char)ax3;
    bx = FP_OFF(arg_6);
    es = FP_SEG(arg_6);
    if ((unsigned char)*(char far *)MK_FP(es, bx + 7) >= 35) {
        loc_59 = *(char far *)((char far *)FP_E40C.f_0 + -778 + (unsigned char)*(char far *)MK_FP(es, bx + 7) * 24);
    }
    bx2 = FP_OFF(arg_6);
    es2 = FP_SEG(arg_6);
    if ((unsigned char)*(char far *)MK_FP(es2, bx2 + 8) >= 35) {
        loc_58 = *(char far *)((char far *)FP_E40C.f_0 + -778 + (unsigned char)*(char far *)MK_FP(es2, bx2 + 8) * 24);
    }
    bx3 = FP_OFF(arg_6);
    es3 = FP_SEG(arg_6);
    loc_6 = loc_4->f_12 + *(int far *)MK_FP(es3, bx3 + 9);
    loc_8 = (unsigned char)*(char far *)MK_FP(es3, bx3 + 11);
    loc_a = (unsigned char)*(char far *)MK_FP(es3, bx3 + 12);
    di = (unsigned char)*(char far *)MK_FP(es3, bx3 + 14);
    ax4 = (unsigned char)arg_2->f_0 & 3;
    if (ax4 <= 3) {
        switch ((unsigned int)(unsigned)(TBL_cc3bf + (ax4 << 1))) {
        case 0:
            loc_6 = loc_6 + (((unsigned char)arg_2->f_4 << 1) - 128);
            break;
        case 1:
            loc_a = (unsigned char)arg_2->f_4;
            arg_18 = 1;
            break;
        case 2:
            loc_8 = (unsigned char)arg_2->f_4;
            break;
        case 3:
            di = di + ((unsigned char)arg_2->f_4 - 50);
            break;
        }
    }
    di2 = di + (int)((unsigned char)arg_2->f_3 * (unsigned char)arg_6->f_16) / 127;
    if (di2 < 0) {
        di2 = 0;
    }
    if (di2 > 100) {
        di2 = 100;
    }
    loc_3d = TBL_7016[di2];
    loc_3f = 0;
    cx = di2 + (unsigned char)arg_6->f_12;
    if (cx > 100) {
        cx = 100;
    }
    loc_3b = (TBL_7016[cx] << 1 & 0x7ff0) + (unsigned char)arg_6->f_f;
    ax5 = cx - di2;
    loc_c = ax5;
    if (ax5 != 0) {
        ax6 = loc_c;
        t2 = far_fa0c8(0x447, ax6, -(ax6 < 0));
        t3 = t2 / 2L;
        loc_26 = (int)(t3 >> 16);
        loc_28 = (int)t3;
        si = TBL_6E82[(unsigned char)arg_6->f_10];
        if (si == 0) {
            si = 1;
        }
        t4 = *(long *)((char *)&loc_28 + 0) / (unsigned long)(unsigned int)si;
        loc_2a = (int)(t4 >> 16);
        loc_2c = (int)t4;
        flags = loc_2a;
        if (!CC("<", flags) && (CC(">", flags) || loc_2c > 0x7fff)) {
            loc_2a = 0;
            loc_2c = 0x7fff;
        }
        loc_39 = loc_2c;
        loc_52 = si / 10 + 2;
        es4 = FP_SEG(arg_6);
        loc_4c = (TBL_7016[di2] << 1 & 0x7ff0) + (unsigned char)*(char far *)MK_FP(es4, FP_OFF(arg_6) + 15);
        di3 = TBL_6E82[(unsigned char)*(char far *)MK_FP(es4, *(int *)((char *)&arg_6 + 0) + 17)];
        if (di3 == 0) {
            di3 = 1;
        }
        dx2 = loc_28;
        t5 = ((long)(-loc_26 - (dx2 != 0)) << 16 | (unsigned)-dx2) / (unsigned long)(unsigned int)di3;
        loc_2a = (int)(t5 >> 16);
        loc_2c = (int)t5;
        flags2 = loc_2a + 1;
        if (!CC(">", flags2) && (CC("<", flags2) || loc_2c < 0x8001)) {
            loc_2a = -1;
            loc_2c = -0x7fff;
        }
        loc_4e = loc_2c;
    } else {
        loc_39 = 0;
    }
    ax7 = TBL_6E82[(int)((128 - (unsigned char)arg_2->f_3) * (unsigned char)arg_6->f_15) / 127];
    loc_12 = -(ax7 < 0);
    loc_14 = ax7;
    t6 = far_fa0c8(0x1b9, loc_14, loc_12);
    t7 = t6 / 10L;
    loc_16 = (int)(t7 >> 16);
    *(int *)((char *)&loc_18 + 0) = (int)t7;
    bx4 = FP_OFF(loc_4);
    es5 = FP_SEG(loc_4);
    ax8 = *(int far *)MK_FP(es5, bx4 + 24);
    ax9 = ax8 - *(int far *)MK_FP(es5, bx4 + 20);
    t8 = far_fa0c8(10, ax9 - *(int *)((char *)&loc_18 + 0), FP_SEG(MK_FP((int)(((long)*(int far *)MK_FP(es5, bx4 + 26) << 16 | (unsigned)ax8) - *(long far *)MK_FP(es5, bx4 + 20) >> 16), ax9) - loc_18));
    t9 = t8 / 0x1b9L;
    ax10 = (int)t9 - 30;
    dx3 = (int)(t9 - 30L >> 16);
    loc_e = dx3;
    loc_10 = ax10;
    flags3 = loc_e;
    if (!CC(">=", flags3)) {
L1:
        return ((long)dx3 << 16 | (unsigned)ax10);
    }
    if (!CC(">", flags3) && loc_10 == 0) {
        goto L1;
    }
    bx5 = FP_OFF(loc_4);
    es6 = FP_SEG(loc_4);
    dx4 = *(int far *)MK_FP(es6, bx5 + 20);
    dx3 = dx4 + *(int *)((char *)&loc_18 + 0);
    ax10 = *(int far *)MK_FP(es6, bx5 + 22) + loc_16 + (dx3 < dx4);
    flags4 = ax10 - *(int far *)MK_FP(es6, bx5 + 26);
    if (CC("<u", flags4)) {
        goto L2;
    }
    if (!CC("<=u", flags4)) {
        goto L1;
    }
    if (dx3 > (unsigned int)*(int far *)MK_FP(es6, bx5 + 24)) {
        return ((long)dx3 << 16 | (unsigned)ax10);
    }
L2:
    bx6 = FP_OFF(loc_4);
    es7 = FP_SEG(loc_4);
    dx5 = *(int far *)MK_FP(es7, bx6 + 32);
    dx6 = dx5 + *(int far *)MK_FP(es7, bx6 + 20);
    dx7 = dx6 + *(int *)((char *)&loc_18 + 0);
    loc_47 = *(int far *)MK_FP(es7, bx6 + 34) + *(int far *)MK_FP(es7, bx6 + 22) + (dx6 < dx5) + loc_16 + (dx7 < dx6);
    *(int *)((char *)&loc_49 + 0) = dx7;
    if (loc_6 > 240) {
        loc_6 = 240;
    }
    if (loc_6 < -240) {
        loc_6 = -240;
    }
    loc_45 = TBL_6CA0[loc_6];
    t10 = (long)(int)((int)(0x319c - (127 - (unsigned char)arg_2->f_3) * (unsigned char)arg_6->f_13) / 100) * (long)(int)(unsigned char)loc_4->f_11;
    if ((int)t10 == 0) {
        return t10;
    }
    loc_43 = (int)(((long)(int)t10 << 16 | (unsigned)0) / 0xc671L);
    si2 = TBL_6E82[loc_8] + TBL_6E82[(int)((128 - (unsigned char)arg_2->f_3) * (unsigned char)arg_6->f_14) / 127];
    di4 = TBL_6E82[loc_a];
    if (arg_18 != 0) {
        ax12 = si2 + di4;
        loc_2e = ax12;
        flags7 = 0 - loc_e;
        if (!CC(">", flags7) && (CC("<", flags7) || ax12 < loc_10)) {
            ax13 = loc_2e;
            loc_e = 0;
            loc_10 = ax13;
        }
        ax14 = loc_45;
        t13 = (unsigned long)(unsigned int)si2 << 12;
        t14 = t13 / (long)(int)ax14;
        cx2 = UNDEF;
        loc_54 = (int)(t14 / 10L);
    } else {
        dx8 = loc_10;
        loc_1a = (int)(((long)loc_e << 16 | (unsigned)dx8) - (unsigned long)(unsigned int)di4 >> 16);
        loc_1c = dx8 - di4;
        flags5 = loc_1a;
        if (!CC(">", flags5) && (CC("<", flags5) || loc_1c < 0)) {
            loc_1a = 0;
            loc_1c = 0;
            di4 = loc_10;
        }
        flags6 = 0 - loc_1a;
        if (!CC("<", flags6) && (CC(">", flags6) || si2 > loc_1c)) {
            si2 = loc_1c;
        }
        ax11 = loc_45;
        t11 = *(long *)((char *)&loc_1c + 0) << 12;
        t12 = t11 / (long)(int)ax11;
        cx2 = UNDEF;
        loc_54 = (int)(t12 / 10L);
    }
    if (loc_54 <= 1) {
        loc_54 = 2;
    }
    ax15 = loc_45;
    t15 = *(long *)((char *)&loc_10 + 0) << 12;
    t16 = t15 / (long)(int)ax15;
    loc_56 = (int)(t16 / 10L);
    if (loc_56 == 0) {
        loc_56 = 1;
    }
    ax16 = loc_43;
    loc_22 = ax16 >> 15 & 1;
    loc_24 = ax16 << 1;
    if (si2 != 0) {
        t17 = far_fa0c8(loc_45, si2, 0);
        t18 = t17 / 0x174L;
        loc_41 = (int)(*(long *)((char *)&loc_24 + 0) / t18);
        if (loc_41 == 0) {
            loc_41 = 1;
        }
        if (loc_41 > loc_43) {
            loc_41 = loc_43;
        }
    } else {
        loc_41 = loc_43;
    }
    if (di4 != 0) {
        t19 = far_fa0c8(80, loc_43, 0);
        t20 = t19 / 0x1b9L;
        t21 = ((long)(-(int)(t20 >> 16) - ((int)t20 != 0)) << 16 | (unsigned)-(int)t20) / (unsigned long)(unsigned int)di4;
        loc_50 = (int)t21;
        t22 = far_fa0c8(loc_45, (int)t21, -((int)t21 < 0));
        loc_50 = (int)(t22 / 0x1000L);
        if (loc_50 == 0) {
            loc_50 = -1;
        }
    } else {
        loc_50 = -0x7fff;
    }
    es8 = FP_SEG(arg_14);
    t23 = (long)(int)(unsigned char)*(char far *)MK_FP(es8, FP_OFF(arg_14) + 2) * 127L;
    ax17 = (int)t23 / 100;
    dx9 = ((char)((int)t23 % 100 >> 8) << 8 | (unsigned char)(char)ax17);
    if ((*(char far *)MK_FP(es8, *(int *)((char *)&arg_14 + 0) + 3) & -128) != 0) {
        t24 = (long)(signed char)(char)ax17 * (long)(int)(unsigned char)*arg_10;
        dx9 = ((char)((int)t24 % 128 >> 8) << 8 | (unsigned char)(char)((int)t24 / 128));
    }
    ax18 = ((char)-((char)dx9 < 0) << 8 | (unsigned char)B_E54C);
    loc_32 = (char)ax18;
    t25 = (long)(signed char)(char)dx9 * (long)(signed char)(char)ax18;
    dx10 = ((char)((int)t25 % 127 >> 8) << 8 | (unsigned char)(char)((int)t25 / 127));
    loc_1d = (char)(arg_14->f_3 & 15);
    if (loc_1d == 0) {
        dx10 = ((char)(dx10 >> 8) << 8 | (unsigned char)0);
    }
    loc_37 = TBL_70E0[loc_1d];
    loc_36 = -(char)dx10;
    es9 = FP_SEG(arg_10);
    ax19 = (int)((unsigned char)*(char far *)MK_FP(es9, FP_OFF(arg_10)) * loc_32) / 127;
    loc_20 = (unsigned char)*(char far *)MK_FP(es9, *(int *)((char *)&arg_10 + 0) + 1);
    loc_30 = (char)ax19;
    loc_35 = (char)((char)ax19 * TBL_6F4C[loc_20] >> 8);
    ax20 = loc_30 * TBL_6F4C[100 - loc_20] >> 8;
    loc_34[0] = (char)ax20;
    ax21 = ((char)(ax20 >> 8) << 8 | (unsigned char)arg_6->f_6);
    loc_57 = (char)ax21;
    if (loc_4->f_13 != 0) {
        if (loc_1d > 0 && loc_1d < 9) {
            ax22 = ((char)(ax21 >> 8) << 8 | (unsigned char)loc_1d);
            ax23 = ((char)(ax22 >> 8) << 8 | (unsigned char)((char)ax22 - 1));
            ax24 = ((char)(ax23 >> 8) << 8 | (unsigned char)((char)ax23 & -2));
            ax25 = ((char)(ax24 >> 8) << 8 | (unsigned char)((char)ax24 + 1));
            loc_1d = (char)ax25;
            loc_37 = TBL_70E0[(char)ax25];
            loc_1d = (char)(loc_1d + 1);
        }
        loc_20 = loc_35;
        loc_35 = (unsigned char)0;
        bx8 = FP_OFF(arg_6);
        es11 = FP_SEG(arg_6);
        fn_cc3c7((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4a), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5a), arg_0, (unsigned char)*(char far *)MK_FP(es11, bx8 + 7), (unsigned char)*(char far *)MK_FP(es11, bx8 + 8));
        loc_37 = TBL_70E0[loc_1d];
        loc_35 = *(char *)((char *)&loc_20 + 0);
        loc_34[0] = (char)0;
        bx9 = FP_OFF(loc_4);
        es12 = FP_SEG(loc_4);
        ax26 = *(int far *)MK_FP(es12, bx9 + 30);
        dx11 = *(int far *)MK_FP(es12, bx9 + 28);
        *(int *)((char *)&loc_49 + 0) = *(int *)((char *)&loc_49 + 0) + dx11;
        loc_47 = (int)(loc_49 + ((long)ax26 << 16 | (unsigned)dx11) >> 16);
        if (loc_57 == 1) {
            loc_57 = (char)0;
        }
        bx10 = FP_OFF(arg_6);
        es13 = FP_SEG(arg_6);
        fn_cc3c7((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4a), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5a), arg_0, (unsigned char)*(char far *)MK_FP(es13, bx10 + 7), (unsigned char)*(char far *)MK_FP(es13, bx10 + 8));
    } else {
        bx7 = FP_OFF(arg_6);
        es10 = FP_SEG(arg_6);
        fn_cc3c7((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_4a), (unsigned char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_5a), arg_0, (unsigned char)*(char far *)MK_FP(es10, bx7 + 7), (unsigned char)*(char far *)MK_FP(es10, bx7 + 8));
    }
    ax10 = far_cdc6d();
    dx3 = UNDEF;
    goto L1;
}
void far fn_cc3c7(char far *p0, unsigned char far *p1, int p2, int p3, int p4) { }
