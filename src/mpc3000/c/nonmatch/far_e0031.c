/* differs: 308 at +5, 1863 bytes; 311 at +5, 1861 bytes; 312 at +5, 1864 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char f_1;
};
struct s2 {
    char pad_0[26];
    char f_1a;
    int f_1b;
    int f_1d;
    char pad_1f[305];
    char f_150;
};
struct s3 {
    char pad_0[1];
    char f_1;
    char pad_2[46];
    int f_30;
    int f_32;
    char pad_34[6];
    int f_3a;
    char pad_3c[106];
    char f_a6;
    char pad_a7[99];
    char f_10a;
    char pad_10b[99];
    char f_16e;
    char pad_16f[99];
    char f_1d2;
    char pad_1d3[99];
    char f_236;
};
struct g_TBL_8A93 {
    char pad_0[4];
    char f_4;
};
extern char B_8800;
extern char B_8802;
extern char B_8806;
extern char B_8A9A;
extern char B_8C41;
extern char B_901B;
extern char B_D612;
extern struct g_TBL_8A93 TBL_8A93;
extern int W_8814;
extern int W_8A98;
extern char far *W_8C31;
extern int W_8C33;
extern int W_8C3D;
extern int W_8C3F;
extern int W_901D;
extern int W_901F;
extern long far far_da9e4(int, int, int, int);
extern long far far_daa07(int, int, int, int);
extern long far far_dad54(int);
extern int far far_deee8(struct s3 far *, int);
extern long far far_e188c(long);
extern long far far_e2ce3(void);
extern int far far_e4e74(long, int);
extern long far far_e51be(char far *, int, int);
extern long far far_e6d33(int, int);
extern long far far_e76cd(int);
extern long far fn_e0593(int, int, int);

int far far_e0031(struct s3 far *arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int loc_6;
    long loc_8;
    char loc_e[6];
    int loc_10;
    int loc_12;
    struct s2 far *loc_14;
    int loc_16;
    struct s1 far *loc_18;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int bx10;
    int bx11;
    int bx12;
    int bx13;
    int bx14;
    int bx15;
    int bx16;
    int bx17;
    int bx18;
    int bx19;
    int bx2;
    int bx20;
    int bx21;
    int bx22;
    int bx23;
    int bx24;
    int bx25;
    int bx26;
    int bx27;
    int bx28;
    int bx29;
    int bx3;
    int bx30;
    int bx31;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int cx;
    int cx2;
    unsigned int cx3;
    int di;
    int di2;
    int di3;
    int dx;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;
    int dx5;
    unsigned int dx6;
    unsigned int dx7;
    int dx8;
    int dx9;
    int es;
    int es10;
    int es11;
    int es12;
    int es13;
    int es14;
    int es15;
    int es16;
    int es17;
    int es18;
    int es19;
    int es2;
    int es20;
    int es21;
    int es22;
    int es23;
    int es24;
    int es25;
    int es26;
    int es27;
    int es28;
    int es29;
    int es3;
    int es30;
    int es31;
    int es32;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int flags;
    int flags2;
    int p32;
    int p322;
    int p34;
    int p36;
    int p38;
    int si;
    int si2;
    long t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    int t15;
    long t16;
    long t17;
    int t18;
    long t2;
    long t3;
    long t4;
    int t5;
    long t6;
    long t7;
    long t8;
    long t9;

    if (B_8800 != 0 && arg_2 == SEG_DATA && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)&B_901B) {
        W_901F = 0;
        W_901D = 0;
        B_901B = (char)-1;
        return 0;
    }
    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    if ((*(int far *)MK_FP(es, bx + 2) | *(int far *)MK_FP(es, bx + 4)) != 0) {
        if (arg_2 == SEG_DATA) {
            if (*(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)&B_901B) {
                dx = *(int far *)MK_FP(es, bx + 2);
                loc_12 = *(int far *)MK_FP(es, bx + 4);
                *(int *)((char *)&loc_14 + 0) = dx;
                if (B_D612 != 0) {
                    *(char far *)MK_FP(es, bx + 1) = (char)(*(char far *)MK_FP(es, bx + 1) | 8);
                } else {
                    bx2 = FP_OFF(arg_0);
                    es2 = FP_SEG(arg_0);
                    *(char far *)MK_FP(es2, bx2 + 1) = (char)(*(char far *)MK_FP(es2, bx2 + 1) & -9);
                }
                loc_14->f_1a = (char)(arg_0->f_1 & 13);
                loc_14->f_1b = arg_0->f_32;
                loc_14->f_1d = arg_0->f_30;
                bx3 = FP_OFF(arg_0);
                es3 = FP_SEG(arg_0);
                dx2 = *(int far *)MK_FP(es3, bx3 + 34);
                bx4 = FP_OFF(loc_14);
                es4 = FP_SEG(loc_14);
                *(int far *)MK_FP(es4, bx4 + 33) = *(int far *)MK_FP(es3, bx3 + 36);
                *(int far *)MK_FP(es4, bx4 + 31) = dx2;
                *(char far *)MK_FP(es4, bx4 + 0x14e) = B_8A9A;
                *(int far *)MK_FP(es4, bx4 + 35) = W_8A98;
                di = *(int *)((char *)&loc_14 + 0);
                __movs2(MK_FP(es4, di + 37), (struct g_TBL_8A93 far *)&TBL_8A93, 4);
                cx = 0;
                *(char far *)MK_FP(es4, di + 41) = TBL_8A93.f_4;
                di2 = 0;
                bx5 = FP_OFF(arg_0);
                es5 = FP_SEG(arg_0);
                dx3 = *(int far *)MK_FP(es5, bx5 + 2);
                dx4 = dx3 + 0x151;
                loc_16 = *(int far *)MK_FP(es5, bx5 + 4) + (dx4 < dx3);
                *(int *)((char *)&loc_18 + 0) = dx4;
                *(int *)((char *)&loc_e + 0) = loc_14->f_150;
                for (;;) {
                    ax = *(int *)((char *)&loc_e + 0);
                    *(int *)((char *)&loc_e + 0) = *(int *)((char *)&loc_e + 0) - 1;
                    if (ax != 0) {
                        bx6 = FP_OFF(loc_18);
                        es6 = FP_SEG(loc_18);
                        if ((unsigned char)*(char far *)MK_FP(es6, bx6) <= 99 && *(char far *)MK_FP(es6, bx6) != 0) {
                            bx7 = FP_OFF(loc_18);
                            es7 = FP_SEG(loc_18);
                            *(char far *)MK_FP(es7, bx7 + 2) = *(char far *)((char far *)arg_0 + 166 + (unsigned char)loc_18->f_0);
                            bx8 = FP_OFF(loc_18);
                            es8 = FP_SEG(loc_18);
                            *(char far *)MK_FP(es8, bx8 + 3) = *(char far *)((char far *)arg_0 + 266 + (unsigned char)*(char far *)MK_FP(es7, bx7));
                            bx9 = FP_OFF(loc_18);
                            es9 = FP_SEG(loc_18);
                            *(char far *)MK_FP(es9, bx9 + 4) = *(char far *)((char far *)arg_0 + 366 + (unsigned char)*(char far *)MK_FP(es8, bx8));
                            bx10 = FP_OFF(loc_18);
                            es10 = FP_SEG(loc_18);
                            *(char far *)MK_FP(es10, bx10 + 21) = *(char far *)((char far *)arg_0 + 566 + (unsigned char)*(char far *)MK_FP(es9, bx9));
                            bx11 = FP_OFF(loc_18);
                            es11 = FP_SEG(loc_18);
                            *(char far *)MK_FP(es11, bx11 + 22) = *(char far *)((char far *)arg_0 + 466 + (unsigned char)*(char far *)MK_FP(es10, bx10));
                            es12 = FP_SEG(arg_0);
                            bx12 = FP_OFF(arg_0) + (unsigned char)*(char far *)MK_FP(es11, bx11);
                            *(char far *)MK_FP(es12, bx12 + 166) = (char)(*(char far *)MK_FP(es12, bx12 + 166) & -3);
                            p32 = (unsigned char)loc_18->f_0;
                            p34 = arg_2;
                            p36 = *(int *)((char *)&arg_0 + 0);
                            p38 = 0xe03b;
                            t1 = fn_e0593(p36, p34, p32);
                            cx = UNDEF;
                            dx4 = (int)(t1 >> 16);
                            loc_18->f_1 = (char)(int)t1;
                        } else {
                            di2 = di2 + 1;
                            loc_18->f_0 = (char)-1;
                        }
                        *(int *)((char *)&loc_18 + 0) = *(int *)((char *)&loc_18 + 0) + 24;
                        continue;
                    }
                    break;
                }
                bx13 = FP_OFF(arg_0);
                es13 = FP_SEG(arg_0);
                if (*(char far *)MK_FP(es13, bx13) == 0) {
                    W_8814 = W_8814 + *(int far *)MK_FP(es13, bx13 + 58);
                    t2 = far_dad54(1);
                    arg_0->f_3a = 0;
                    B_8802 = (char)0;
                    loc_10 = 0;
                    dx5 = 1;
                    si = *(int *)((char *)&arg_0 + 0) + 167;
                    while (dx5 < 100) {
                        if ((*(char far *)MK_FP(arg_2, si) & 2) != 0) {
                            loc_10 = loc_10 + 1;
                        }
                        si = si + 1;
                        dx5 = dx5 + 1;
                    }
                    p322 = loc_10 - di2 + 2;
                    t3 = far_e76cd(p322);
                    cx2 = UNDEF;
                    if (loc_10 != 0) {
                        bx14 = FP_OFF(arg_0);
                        es14 = FP_SEG(arg_0);
                        dx6 = *(int far *)MK_FP(es14, bx14 + 2);
                        dx7 = dx6 + 0x151;
                        loc_16 = *(int far *)MK_FP(es14, bx14 + 4) + (dx7 < dx6);
                        *(int *)((char *)&loc_18 + 0) = dx7;
                        *(int *)((char *)&loc_e + 0) = loc_14->f_150 - 2;
                        loc_10 = 0;
                        si2 = *(int *)((char *)&arg_0 + 0);
                        di3 = *(int *)((char *)&arg_0 + 0) + 166;
                        for (;;) {
                            ax2 = *(int *)((char *)&loc_e + 0);
                            *(int *)((char *)&loc_e + 0) = *(int *)((char *)&loc_e + 0) - 1;
                            if (ax2 != 0) {
                                bx15 = FP_OFF(loc_18);
                                es15 = FP_SEG(loc_18);
                                if ((unsigned char)*(char far *)MK_FP(es15, bx15) <= 99 && *(char far *)MK_FP(es15, bx15) != 0) {
                                    *(int *)((char *)&loc_18 + 0) = *(int *)((char *)&loc_18 + 0) + 24;
                                    continue;
                                }
                                dx8 = di3;
                                while ((*(char far *)MK_FP(arg_2, dx8) & 2) == 0) {
                                    dx8 = dx8 + 1;
                                    si2 = si2 + 1;
                                    di3 = di3 + 1;
                                    loc_10 = loc_10 + 1;
                                }
                                if (loc_10 > 99) {
                                    goto L1;
                                }
                                loc_18->f_0 = *(char *)((char *)&loc_10 + 0);
                                p38 = 0xe03b;
                                t4 = fn_e0593(*(int *)((char *)&arg_0 + 0), arg_2, loc_10);
                                bx16 = FP_OFF(loc_18);
                                *(char far *)MK_FP(FP_SEG(loc_18), bx16 + 1) = (char)(int)t4;
                                *(char far *)MK_FP(loc_16, bx16 + 2) = *(char far *)MK_FP(arg_2, di3);
                                *(char far *)MK_FP(loc_16, bx16 + 3) = *(char far *)MK_FP(arg_2, si2 + 0x10a);
                                es16 = loc_16;
                                *(char far *)MK_FP(es16, bx16 + 4) = *(char far *)MK_FP(arg_2, si2 + 0x16e);
                                p322 = (unsigned char)*(char far *)MK_FP(es16, bx16 + 1);
                                p34 = loc_16;
                                p36 = *(int *)((char *)&loc_18 + 0) + 5;
                                t5 = far_e4e74(((long)p34 << 16 | (unsigned)p36), p322);
                                cx2 = UNDEF;
                                dx7 = UNDEF;
                                bx17 = FP_OFF(loc_18);
                                *(char far *)MK_FP(FP_SEG(loc_18), bx17 + 21) = *(char far *)MK_FP(arg_2, si2 + 0x236);
                                es17 = loc_16;
                                *(char far *)MK_FP(es17, bx17 + 22) = *(char far *)MK_FP(arg_2, si2 + 0x1d2);
                                *(char far *)MK_FP(es17, bx17 + 23) = (char)0;
                                es18 = arg_2;
                                *(char far *)MK_FP(es18, di3) = (char)(*(char far *)MK_FP(es18, di3) & -3);
                                *(int *)((char *)&loc_18 + 0) = *(int *)((char *)&loc_18 + 0) + 24;
                                continue;
                            }
                            break;
                        }
                    }
                    goto L2;
                }
                goto L3;
            }
        }
    }
    goto L4;
L1:
L2:
    bx18 = FP_OFF(arg_0);
    es19 = FP_SEG(arg_0);
    if (*(int far *)MK_FP(es19, bx18 + 16) == *(int far *)MK_FP(es19, bx18 + 24) && *(int far *)MK_FP(es19, bx18 + 14) == *(int far *)MK_FP(es19, bx18 + 22)) {
        dx9 = *(int far *)MK_FP(es19, bx18 + 18);
        *(int far *)MK_FP(es19, bx18 + 16) = *(int far *)MK_FP(es19, bx18 + 20);
        *(int far *)MK_FP(es19, bx18 + 14) = dx9;
    }
    bx19 = FP_OFF(arg_0);
    es20 = FP_SEG(arg_0);
    t6 = far_daa07(*(int far *)MK_FP(es20, bx19 + 14), *(int far *)MK_FP(es20, bx19 + 16), *(int far *)MK_FP(es20, bx19 + 18), *(int far *)MK_FP(es20, bx19 + 20));
    loc_6 = (int)(t6 >> 16);
    *(int *)((char *)&loc_8 + 0) = (int)t6;
    bx20 = FP_OFF(arg_0);
    es21 = FP_SEG(arg_0);
    ax3 = *(int far *)MK_FP(es21, bx20 + 24);
    flags = ax3 - *(int far *)MK_FP(es21, bx20 + 20);
    if (!CC("<=u", flags)) {
        goto L5;
    }
    if (!CC("<u", flags) && (unsigned int)*(int far *)MK_FP(es21, bx20 + 22) >= (unsigned int)*(int far *)MK_FP(es21, bx20 + 18)) {
L5:
        bx21 = FP_OFF(arg_0);
        es22 = FP_SEG(arg_0);
        t7 = far_daa07(*(int far *)MK_FP(es22, bx21 + 22), *(int far *)MK_FP(es22, bx21 + 24), *(int far *)MK_FP(es22, bx21 + 18), *(int far *)MK_FP(es22, bx21 + 20));
        loc_2 = (int)(t7 >> 16);
        loc_4 = (int)t7;
    } else {
        bx22 = FP_OFF(arg_0);
        es23 = FP_SEG(arg_0);
        ax4 = *(int far *)MK_FP(es23, bx22 + 16);
        flags2 = ax4 - *(int far *)MK_FP(es23, bx22 + 20);
        if (!CC(">u", flags2) && (CC("<u", flags2) || (unsigned int)*(int far *)MK_FP(es23, bx22 + 14) < (unsigned int)*(int far *)MK_FP(es23, bx22 + 18))) {
            bx23 = FP_OFF(arg_0);
            es24 = FP_SEG(arg_0);
            t8 = far_daa07(*(int far *)MK_FP(es24, bx23 + 14), *(int far *)MK_FP(es24, bx23 + 16), *(int far *)MK_FP(es24, bx23 + 10), *(int far *)MK_FP(es24, bx23 + 12));
            loc_6 = (int)(t8 >> 16);
            *(int *)((char *)&loc_8 + 0) = (int)t8;
        } else {
            bx24 = FP_OFF(arg_0);
            es25 = FP_SEG(arg_0);
            t9 = far_daa07(*(int far *)MK_FP(es25, bx24 + 22), *(int far *)MK_FP(es25, bx24 + 24), *(int far *)MK_FP(es25, bx24 + 10), *(int far *)MK_FP(es25, bx24 + 12));
            *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + (int)t9;
            loc_6 = (int)(loc_8 + t9 >> 16);
        }
        bx25 = FP_OFF(arg_0);
        es26 = FP_SEG(arg_0);
        t10 = far_daa07(*(int far *)MK_FP(es26, bx25 + 6), *(int far *)MK_FP(es26, bx25 + 8), *(int far *)MK_FP(es26, bx25 + 18), *(int far *)MK_FP(es26, bx25 + 20));
        bx26 = FP_OFF(arg_0);
        es27 = FP_SEG(arg_0);
        t11 = far_daa07(*(int far *)MK_FP(es27, bx26 + 22), *(int far *)MK_FP(es27, bx26 + 24), *(int far *)MK_FP(es27, bx26 + 10), *(int far *)MK_FP(es27, bx26 + 12));
        cx3 = (int)t10 + (int)t11;
        loc_2 = (int)(t10 >> 16) + (int)(t11 >> 16) + (cx3 < (unsigned int)(int)t10);
        loc_4 = cx3;
    }
    bx27 = FP_OFF(loc_14);
    es28 = FP_SEG(loc_14);
    *(int far *)MK_FP(es28, bx27 + 3) = loc_2;
    *(int far *)MK_FP(es28, bx27 + 1) = loc_4;
    *(int far *)MK_FP(es28, bx27 + 7) = loc_6;
    *(int far *)MK_FP(es28, bx27 + 5) = *(int *)((char *)&loc_8 + 0);
    t12 = far_e2ce3();
    t13 = far_e6d33(W_8C3D, W_8C3F);
    t14 = far_da9e4(W_8C3D, W_8C3F, -(int)t12, -(int)(t12 >> 16) - ((int)t12 != 0));
    bx28 = FP_OFF(arg_0);
    es29 = FP_SEG(arg_0);
    *(int far *)MK_FP(es29, bx28 + 20) = (int)(t14 >> 16);
    *(int far *)MK_FP(es29, bx28 + 18) = (int)t14;
    W_8C33 = (int)(t14 >> 16);
    *(int *)((char *)&W_8C31 + 0) = (int)t14;
    *(char far *)((char far *)*(long *)((char *)&W_8C31 + 0)) = (char)-1;
    if (B_8C41 >= 0) {
        t15 = (*(int (far *)())far_e0031)((char far *)&B_8C41);
        t16 = far_e51be((char far *)&B_8C41, B_8806, 1);
    }
L3:
    bx29 = FP_OFF(loc_14);
    es30 = FP_SEG(loc_14);
    *(char far *)MK_FP(es30, bx29) = (char)(*(char far *)MK_FP(es30, bx29) & 127);
L4:
    bx30 = FP_OFF(arg_0);
    es31 = FP_SEG(arg_0);
    *(int far *)MK_FP(es31, bx30 + 4) = 0;
    *(int far *)MK_FP(es31, bx30 + 2) = 0;
    *(char far *)MK_FP(es31, bx30) = (char)-1;
    t17 = far_e188c(((long)arg_2 << 16 | (unsigned)bx30));
    t18 = far_deee8(arg_0, 1);
    bx31 = FP_OFF(arg_0);
    es32 = FP_SEG(arg_0);
    *(int far *)MK_FP(es32, bx31 + 0x29a) = -1;
    *(int far *)MK_FP(es32, bx31 + 48) = 0;
    *(int far *)MK_FP(es32, bx31 + 36) = 0;
    *(int far *)MK_FP(es32, bx31 + 34) = 0;
    return 0;
}
long far fn_e0593(int p0, int p1, int p2) { return 0; }
