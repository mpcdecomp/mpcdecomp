/* differs: 308 at +5, 985 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define UNDEF 0
struct s1 {
    char pad_0[4];
    int f_4;
};
struct g_W_8C35 {
    long f_0;
};
struct g_TBL_8458 {
    int f_0;
};
struct g_TBL_8456 {
    int f_0;
};
struct g_TBL_845A {
    int f_0;
};
extern char B_7FCC;
extern unsigned char B_8455;
extern struct g_TBL_8456 TBL_8456;
extern struct g_TBL_8458 TBL_8458;
extern struct g_TBL_845A TBL_845A;
extern char TBL_A787[];
extern char TBL_A7AF[];
extern char TBL_A7B0[];
extern int W_87EE;
extern int W_87F0;
extern int W_87F6;
extern int W_87F8;
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern long far far_e259f(int);
extern long far far_fa0c8(int, int, int);

int far far_e1a2c(int arg_0)
{
    int loc_2c;
    struct s1 far *loc_2a;
    int loc_28;
    int loc_26;
    int loc_24;
    int loc_22;
    int loc_20;
    int loc_1e;
    int loc_1c;
    int loc_1a;
    int loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    unsigned int loc_c;
    int loc_a;
    long loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    unsigned int bx3;
    unsigned int bx4;
    int bx5;
    int bx6;
    int cx;
    int di;
    int dx;
    unsigned int dx2;
    unsigned int dx3;
    int dx4;
    int es;
    int es2;
    int es3;
    int es4;
    int flags;
    int flags2;
    int p52;
    int p54;
    int p56;
    int p58;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;

    loc_a = 0;
    loc_c = 0x1000;
    loc_1e = 0;
    loc_20 = 0;
    loc_12 = 0;
    loc_14 = 0;
    loc_6 = 0;
    *(int *)((char *)&loc_8 + 0) = 0;
    TBL_8458.f_0 = 0;
    TBL_8456.f_0 = 0;
    TBL_845A.f_0 = 0x1000;
    B_8455 = (unsigned char)1;
    loc_24 = (unsigned char)TBL_A787[arg_0];
    ax = arg_0 * 0x1f4;
    loc_2c = ax;
    for (;;) {
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)TBL_A7B0[loc_2c]);
        loc_22 = (unsigned char)(char)ax2;
        if ((char)ax2 == 0) {
            break;
        }
        ax3 = (unsigned char)TBL_A7AF[loc_2c];
        loc_2c = loc_2c + 2;
        loc_1e = loc_1e + 1;
        p52 = (unsigned char)(char)ax3;
        cx = UNDEF;
        loc_26 = (int)far_e259f(p52);
        if (loc_1e == loc_24) {
            W_87F8 = loc_6;
            W_87F6 = *(int *)((char *)&loc_8 + 0);
        }
        if (loc_26 == 0) {
            loc_e = 0;
            loc_10 = 0;
            for (;;) {
                ax4 = loc_22;
                loc_22 = loc_22 - 1;
                if (ax4 == 0) {
                    break;
                }
                bx = (int)W_8C35.f_0;
                es = (int)(W_8C35.f_0 >> 16);
                dx = *(int far *)MK_FP(es, bx + 31);
                loc_2 = *(int far *)MK_FP(es, bx + 33);
                loc_4 = dx;
                ax5 = *(int far *)MK_FP(es, bx + 35);
                loc_16 = -(ax5 < 0);
                loc_18 = ax5;
                if ((loc_14 | loc_12) == 0) {
                    loc_12 = loc_16;
                    loc_14 = loc_18;
                }
                if (B_7FCC == 0) {
                    loc_16 = loc_12;
                    loc_18 = loc_14;
                }
                bx2 = (int)W_8C35.f_0;
                es2 = (int)(W_8C35.f_0 >> 16);
                loc_1c = *(char far *)MK_FP(es2, bx2 + 0x14f);
                t1 = (long)(signed char)*(char far *)MK_FP(es2, bx2 + 0x150) * 24L;
                bx3 = *(int *)((char *)&W_8C35 + 0);
                bx4 = bx3 + (int)t1;
                loc_28 = W_8C37 + (bx4 < bx3) + (bx4 + 0x151 < bx4);
                *(int *)((char *)&loc_2a + 0) = bx4 + 0x151;
                *(int *)((char *)&loc_2a + 0) = *(int *)((char *)&loc_2a + 0) + 6;
                if (loc_1c <= 1) {
                    goto L1;
                }
                bx5 = FP_OFF(loc_2a);
                es3 = FP_SEG(loc_2a);
                if ((*(int far *)MK_FP(es3, bx5) | *(int far *)MK_FP(es3, bx5 + 2)) != 0) {
L1:
                    p52 = loc_12;
                    p54 = loc_14;
                    t5 = *(long *)((char *)&loc_18 + 0) << 12;
                    p56 = (int)(t5 >> 16);
                    p58 = (int)t5;
                    t6 = ((long)p56 << 16 | (unsigned)p58) / ((long)p52 << 16 | (unsigned)p54);
                    cx = UNDEF;
                    loc_a = (int)(t6 >> 16);
                    loc_c = (int)t6;
                    if ((loc_10 | loc_e) == 0) {
                        loc_e = loc_a;
                        loc_10 = loc_c;
                    }
                    t7 = (long)(int)B_8455 * 6L;
                    di = (int)t7;
                    ax7 = *(int *)(0x782a + (int)t7);
                    if (loc_a != 0 || ax7 != loc_c) {
                        if (B_8455 >= 99) {
                            loc_20 = -18;
                        } else {
                            *(int *)((char *)&TBL_8458 + 0 + di) = loc_6;
                            *(int *)((char *)&TBL_8456 + 0 + di) = *(int *)((char *)&loc_8 + 0);
                            *(int *)((char *)&TBL_845A + 0 + di) = loc_c;
                            B_8455 = (unsigned char)(B_8455 + 1);
                        }
                    }
                } else {
                    loc_1a = 1;
                    if (loc_1a < loc_1c) {
                        do {
                            p52 = loc_12;
                            p54 = loc_14;
                            t2 = far_fa0c8(loc_18, loc_2a->f_4, 0);
                            p56 = (int)(t2 >> 16);
                            p58 = (int)t2;
                            t3 = ((long)p56 << 16 | (unsigned)p58) / ((long)p52 << 16 | (unsigned)p54);
                            cx = UNDEF;
                            loc_a = (int)(t3 >> 16);
                            loc_c = (int)t3;
                            if ((loc_10 | loc_e) == 0) {
                                loc_e = loc_a;
                                loc_10 = loc_c;
                            }
                            flags = loc_a;
                            if (!CC("<", flags) && (CC(">", flags) || loc_c > 0xa000)) {
                                loc_a = 0;
                                loc_c = -0x6000;
                            }
                            flags2 = loc_a;
                            if (!CC(">", flags2) && (CC("<", flags2) || loc_c < 0x19a)) {
                                loc_a = 0;
                                loc_c = 0x19a;
                            }
                            t4 = (long)(int)B_8455 * 6L;
                            di = (int)t4;
                            ax6 = *(int *)(0x782a + (int)t4);
                            if (loc_a != 0 || ax6 != loc_c) {
                                if (B_8455 >= 99) {
                                    loc_20 = -18;
                                } else {
                                    bx6 = FP_OFF(loc_2a);
                                    es4 = FP_SEG(loc_2a);
                                    dx2 = *(int far *)MK_FP(es4, bx6);
                                    dx3 = dx2 + *(int *)((char *)&loc_8 + 0);
                                    *(int *)((char *)&TBL_8458 + 0 + di) = *(int far *)MK_FP(es4, bx6 + 2) + loc_6 + (dx3 < dx2);
                                    *(int *)((char *)&TBL_8456 + 0 + di) = dx3;
                                    *(int *)((char *)&TBL_845A + 0 + di) = loc_c;
                                    B_8455 = (unsigned char)(B_8455 + 1);
                                }
                            }
                            *(int *)((char *)&loc_2a + 0) = *(int *)((char *)&loc_2a + 0) + 6;
                            loc_1a = loc_1a + 1;
                        } while (loc_1a < loc_1c);
                    }
                }
                dx4 = loc_4;
                *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + dx4;
                loc_6 = (int)(loc_8 + ((long)loc_2 << 16 | (unsigned)dx4) >> 16);
            }
        }
        ax = loc_1e;
        if (ax != loc_24) {
            continue;
        }
        if (loc_26 != 0) {
            loc_24 = loc_24 + 1;
            continue;
        }
        ax = loc_e;
        W_87F0 = ax;
        W_87EE = loc_10;
    }
    t8 = (long)(int)B_8455 * 6L;
    *(int *)((char *)&TBL_8458 + 0 + (int)t8) = loc_6;
    *(int *)((char *)&TBL_8456 + 0 + (int)t8) = *(int *)((char *)&loc_8 + 0);
    *(int *)((char *)&TBL_845A + 0 + (int)t8) = 0;
    if ((loc_14 | loc_12) == 0) {
        if (loc_1e == 0) {
            loc_20 = -14;
        } else {
            loc_20 = -19;
        }
    }
    return loc_20;
}
