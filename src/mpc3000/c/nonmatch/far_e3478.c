/* differs: 308 at +5, 1263 bytes; 311 at +5, 1263 bytes; 312 at +5, 1262 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[4];
    int f_4;
};
struct s2 {
    char pad_0[26];
    char f_1a;
    int f_1b;
    int f_1d;
};
struct s3 {
    char pad_0[48];
    int f_30;
    int f_32;
    char pad_34[14];
    char f_42;
    char pad_43[99];
    char f_a6;
    char pad_a7[99];
    char f_10a;
    char pad_10b[99];
    char f_16e;
    char pad_16f[199];
    char f_236;
};
struct g_TBL_8A93 {
    char pad_0[4];
    char f_4;
};
extern char B_8800;
extern unsigned char B_8A88;
extern char B_8A9A;
extern unsigned char B_8A9C;
extern unsigned char B_901B[];
extern char B_D612;
extern unsigned char B_E424;
extern unsigned char TBL_882E;
extern unsigned char TBL_8830[];
extern unsigned char TBL_8832;
extern unsigned char TBL_8834;
extern struct g_TBL_8A93 TBL_8A93;
extern unsigned char TBL_905D;
extern int W_8A98;
extern unsigned char W_D610;
extern long far far_c2b07(long);
extern long far far_c2c33(void);
extern long far far_dfeec(void);
extern long far far_e1982(unsigned char far *, int);
extern long far far_e70e6(void);
extern long far far_eb6bd(int, int, long);

long far far_e3478(struct s3 far *arg_0, int arg_2)
{
    int loc_2;
    int loc_4;
    int loc_6;
    char far *loc_8;
    int loc_a;
    struct s2 far *loc_c;
    int loc_e;
    struct s1 far *loc_10;
    char loc_11;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx10;
    int bx11;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int cx;
    int di;
    int ds;
    int dx;
    int dx2;
    int dx3;
    int dx4;
    int es;
    int es10;
    int es11;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int p26;
    int si;
    int si2;
    int si3;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    bx = FP_OFF(arg_0);
    es = FP_SEG(arg_0);
    ax = *(int far *)MK_FP(es, bx + 2) | *(int far *)MK_FP(es, bx + 4);
    if (ax != 0) {
        bx2 = FP_OFF(arg_0);
        es2 = FP_SEG(arg_0);
        dx = *(int far *)MK_FP(es2, bx2 + 2);
        loc_a = *(int far *)MK_FP(es2, bx2 + 4);
        *(int *)((char *)&loc_c + 0) = dx;
        arg_0->f_30 = loc_c->f_1d;
        bx3 = FP_OFF(loc_c);
        es3 = FP_SEG(loc_c);
        dx2 = *(int far *)MK_FP(es3, bx3 + 31);
        bx4 = FP_OFF(arg_0);
        es4 = FP_SEG(arg_0);
        *(int far *)MK_FP(es4, bx4 + 36) = *(int far *)MK_FP(es3, bx3 + 33);
        *(int far *)MK_FP(es4, bx4 + 34) = dx2;
        if (B_8800 != 0) {
            ds = SEG_DATA;
        } else {
            di = *(int *)((char *)&arg_0 + 0);
            __stos2(MK_FP(es4, di + 67), -1, 98);
            *(char far *)MK_FP(es4, di + 165) = (char)-1;
            *(char far *)MK_FP(es4, bx4 + 1) = (char)(*(char far *)MK_FP(es4, bx4 + 1) & -14);
            bx5 = FP_OFF(arg_0);
            es5 = FP_SEG(arg_0);
            *(char far *)MK_FP(es5, bx5 + 1) = (char)(*(char far *)MK_FP(es5, bx5 + 1) | loc_c->f_1a & 13);
            if ((loc_c->f_1a & 8) != 0) {
                ax2 = 1;
            } else {
                ax2 = 0;
            }
            B_D612 = (char)ax2;
            arg_0->f_32 = loc_c->f_1b;
            if (arg_2 == SEG_DATA) {
                if (*(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
                    bx6 = FP_OFF(loc_c);
                    es6 = FP_SEG(loc_c);
                    W_8A98 = *(int far *)MK_FP(es6, bx6 + 35);
                    B_8A9A = *(char far *)MK_FP(es6, bx6 + 0x14e);
                    ax3 = loc_a;
                    si = *(int *)((char *)&loc_c + 0);
                    __movs2((struct g_TBL_8A93 far *)&TBL_8A93, ((long)ax3 << 16 | (unsigned)(si + 37)), 4);
                    TBL_8A93.f_4 = *(char far *)MK_FP(ax3, si + 41);
                    si2 = si + 42;
                    ds = SEG_DATA;
                    p26 = ds;
                    ax4 = (int)far_eb6bd(*(int *)((char *)&loc_c + 0) + 37, loc_a, ((long)p26 << 16 | (unsigned)-0x7577));
                } else {
                    ds = SEG_DATA;
                }
            } else {
                ds = SEG_DATA;
            }
        }
        bx7 = FP_OFF(loc_c);
        es7 = FP_SEG(loc_c);
        loc_4 = *(char far *)MK_FP(es7, bx7 + 0x14f);
        loc_2 = *(char far *)MK_FP(es7, bx7 + 0x150);
        dx3 = *(int *)((char *)&loc_c + 0) + 0x151;
        loc_6 = loc_a;
        *(int *)((char *)&loc_8 + 0) = dx3;
        __stos2((char far *)arg_0 + 166, 0, 100);
        loc_11 = (char)1;
        for (;;) {
            ax5 = loc_2;
            loc_2 = loc_2 - 1;
            if (ax5 != 0) {
                bx8 = FP_OFF(loc_8);
                es8 = FP_SEG(loc_8);
                if (*(char far *)MK_FP(es8, bx8) != -1) {
                    loc_11 = *(char far *)MK_FP(es8, bx8 + 1);
                    if (arg_2 == ds && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
                        *(char far *)((char far *)arg_0 + 66 + loc_11) = *loc_8;
                    } else {
                        *(char far *)((char far *)arg_0 + 66 + (unsigned char)*loc_8) = loc_11;
                    }
                    si2 = FP_OFF(loc_8);
                    *(char far *)((char far *)arg_0 + 266 + (unsigned char)*loc_8) = *(char far *)MK_FP(FP_SEG(loc_8), si2 + 3);
                    *(char far *)((char far *)arg_0 + 366 + (unsigned char)*loc_8) = *(char far *)MK_FP(loc_6, si2 + 4);
                    *(char far *)((char far *)arg_0 + 166 + (unsigned char)*loc_8) = *(char far *)MK_FP(loc_6, si2 + 2);
                    *(char far *)((char far *)arg_0 + 566 + (unsigned char)*loc_8) = *(char far *)MK_FP(loc_6, si2 + 21);
                    p26 = FP_SEG(arg_0);
                    *(char far *)MK_FP(p26, FP_OFF(arg_0) + (unsigned char)*loc_8 + 0x1d2) = *(char far *)MK_FP(loc_6, si2 + 22);
                }
                *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 24;
                continue;
            }
            break;
        }
        if (*(char far *)MK_FP(ds, (unsigned)&B_8800) == 0) {
            dx3 = *(int *)((char *)&loc_8 + 0);
            loc_e = loc_6;
            *(int *)((char *)&loc_10 + 0) = dx3;
            bx9 = FP_OFF(arg_0);
            es9 = FP_SEG(arg_0);
            *(int far *)MK_FP(es9, bx9 + 32) = 0;
            *(int far *)MK_FP(es9, bx9 + 30) = 0;
            if (loc_4 > 0) {
                bx10 = FP_OFF(loc_10);
                es10 = FP_SEG(loc_10);
                dx3 = *(int far *)MK_FP(es10, bx10);
                bx11 = FP_OFF(arg_0);
                es11 = FP_SEG(arg_0);
                *(int far *)MK_FP(es11, bx11 + 32) = *(int far *)MK_FP(es10, bx10 + 2);
                *(int far *)MK_FP(es11, bx11 + 30) = dx3;
            }
            if (arg_2 == ds && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
                *(int far *)MK_FP(ds, (unsigned)&W_D610) = 0x1000;
                if (loc_4 > 0 && loc_4 <= 101) {
                    *(int far *)MK_FP(ds, (unsigned)&TBL_882E) = loc_10->f_4;
                    *(int *)((char *)&loc_10 + 0) = *(int *)((char *)&loc_10 + 0) + 6;
                    t1 = (long)(int)(loc_4 - 1) * 6L;
                    dx4 = loc_e;
                    si3 = *(int *)((char *)&loc_10 + 0);
                    cx = (unsigned int)(int)t1 >> 1;
                    __movs2((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_8830), ((long)dx4 << 16 | (unsigned)si3), cx * 2);
                    __movs1((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)(TBL_8830 + cx * 2)), ((long)dx4 << 16 | (unsigned)(si3 + cx * 2)), (int)t1 & 1);
                    ds = ds;
                    loc_4 = loc_4 - 1;
                    if (loc_4 != 1 && (*(int far *)MK_FP(ds, (unsigned)&TBL_8830) | *(int far *)MK_FP(ds, (unsigned)&TBL_8832)) == 0) {
                        *(int far *)MK_FP(ds, (unsigned)&W_D610) = *(int far *)MK_FP(ds, (unsigned)&TBL_8834);
                    }
                } else {
                    *(int far *)MK_FP(ds, (unsigned)&TBL_882E) = 0x1000;
                }
                *(char far *)MK_FP(ds, (unsigned)&B_8A88) = *(char *)((char *)&loc_4 + 0);
                t2 = far_e70e6();
                dx3 = (int)(far_dfeec() >> 16);
            }
        }
        ax = ds;
        if (arg_2 == ax && *(int *)((char *)&arg_0 + 0) == (unsigned int)(unsigned)B_901B) {
            if (*(char far *)MK_FP(ds, (unsigned)&B_8A9A) <= 0) {
                *(char far *)MK_FP(ds, (unsigned)&B_8A9A) = (char)1;
            }
            ax6 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_8A9A));
            if (*(char far *)MK_FP(ds, (unsigned)&TBL_905D + (char)ax6) == -1) {
                *(char far *)MK_FP(ds, (unsigned)&B_8A9A) = loc_11;
                if (*(char far *)MK_FP(ds, (unsigned)&TBL_905D + loc_11) == -1) {
                    ax7 = loc_11;
                    *(char far *)MK_FP(ds, (unsigned)&B_8A9C) = (char)ax7;
                    t3 = far_e1982((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)B_901B), (char)ax7);
                    ax = (int)t3;
                    dx3 = (int)(t3 >> 16);
                } else {
                    ax = ((char)-(loc_11 < 0) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_905D + (char)ax6));
                    *(char far *)MK_FP(ds, (unsigned)&B_8A9C) = (char)ax;
                }
            } else {
                ax = ((char)-((char)ax6 < 0) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_905D + (char)ax6));
                *(char far *)MK_FP(ds, (unsigned)&B_8A9C) = (char)ax;
            }
            if (*(char far *)MK_FP(ds, (unsigned)&B_E424) == 1) {
                t4 = far_c2c33();
                t5 = far_c2b07(t4);
                ax = (int)t5;
                dx3 = (int)(t5 >> 16);
            }
        }
    }
    return ((long)dx3 << 16 | (unsigned)ax);
}
