/* differs: 308 at +5, 1006 bytes; 311 at +5, 1008 bytes; 312 at +5, 1008 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[13];
    char f_d;
};
struct g_W_D4AD {
    int f_0;
};
extern char B_7B8C;
extern char B_D4B4;
extern int FP_7B8F;
extern char TBL_79A5[];
extern int W_7B91;
extern struct g_W_D4AD W_D4AD;
extern int W_E568;
extern long far far_b2739(long);

long far far_b2e3a(char arg_0)
{
    int loc_2;
    long loc_4;
    int loc_6;
    long loc_8;
    int loc_a;
    struct s1 far *loc_c;
    int ax;
    int ax10;
    int ax11;
    int ax2;
    int ax3;
    int ax4;
    unsigned int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
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
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int cx;
    int dx;
    int dx2;
    int dx3;
    int dx4;
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
    int es33;
    int es34;
    int es35;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    int flags;

    ax = W_7B91;
    dx = FP_7B8F;
    loc_6 = ax;
    *(int *)((char *)&loc_8 + 0) = dx;
    loc_2 = ax;
    *(int *)((char *)&loc_4 + 0) = dx;
    loc_a = ax;
    *(int *)((char *)&loc_c + 0) = dx;
    ax2 = B_7B8C & 15;
    if (ax2 == 6) {
        cx = 1 << (unsigned char)loc_c->f_d;
    }
    ax3 = arg_0;
    if (ax3 == 0) {
        W_E568 = 0;
        if (ax2 == 9) {
            dx2 = 0;
            for (;;) {
                es = (int)(loc_4 >> 16);
                bx = (int)*(long far *)MK_FP(es, (int)loc_4 + 6);
                es2 = (int)(*(long far *)MK_FP(es, bx + 6) >> 16);
                bx2 = bx + dx2;
                if ((*(int far *)MK_FP(es2, bx2) | *(int far *)MK_FP(es2, bx2 + 2)) == 0) {
                    break;
                }
                dx2 = dx2 + 4;
                W_E568 = W_E568 + 1;
            }
        } else {
            dx2 = W_E568 << 2;
            for (;;) {
                es3 = (int)(loc_8 >> 16);
                bx3 = (int)*(long far *)MK_FP(es3, (int)loc_8 + 9);
                es4 = (int)(*(long far *)MK_FP(es3, bx3 + 9) >> 16);
                bx4 = bx3 + dx2;
                if ((*(int far *)MK_FP(es4, bx4) | *(int far *)MK_FP(es4, bx4 + 2)) == 0) {
                    break;
                }
                dx2 = dx2 + 4;
                W_E568 = W_E568 + 1;
            }
        }
        return ((long)dx2 << 16 | (unsigned)0);
    }
    dx3 = 0;
    if ((TBL_79A5[ax3] & 2) != 0) {
        return ((long)dx3 << 16 | (unsigned)0);
    }
    flags = ax3 - 46;
    if (CC("!=", flags)) {
        if (!CC(">", flags)) {
            if (ax3 != 43) {
                if (ax3 == 45) {
                    if (ax2 == 6) {
                        es5 = FP_SEG(loc_c);
                        bx5 = (int)*(long far *)MK_FP(es5, FP_OFF(loc_c) + 5);
                        es6 = (int)(*(long far *)MK_FP(es5, bx5 + 5) >> 16);
                        *(char far *)MK_FP(es6, bx5) = (char)(*(char far *)MK_FP(es6, bx5) & ~(char)cx);
                        es7 = FP_SEG(loc_c);
                        bx6 = (int)*(long far *)MK_FP(es7, FP_OFF(loc_c) + 9);
                        es8 = (int)(*(long far *)MK_FP(es7, bx6 + 9) >> 16);
                        ax4 = (int)far_b2739(*(long far *)MK_FP(es8, bx6));
                    } else if (ax2 == 9) {
                        es9 = (int)(loc_4 >> 16);
                        bx7 = (int)*(long far *)MK_FP(es9, (int)loc_4 + 11);
                        ax5 = *(int far *)MK_FP((int)(*(long far *)MK_FP(es9, bx7 + 11) >> 16), bx7);
                        if (ax5 < (unsigned int)W_D4AD.f_0) {
                            W_D4AD.f_0 = ax5;
                        }
                        es10 = (int)(loc_4 >> 16);
                        bx8 = (int)*(long far *)MK_FP(es10, (int)loc_4 + 11);
                        es11 = (int)(*(long far *)MK_FP(es10, bx8 + 11) >> 16);
                        *(int far *)MK_FP(es11, bx8) = *(int far *)MK_FP(es11, bx8) - W_D4AD.f_0;
                        es12 = (int)(loc_4 >> 16);
                        bx9 = (int)*(long far *)MK_FP(es12, (int)loc_4 + 6);
                        es13 = (int)(*(long far *)MK_FP(es12, bx9 + 6) >> 16);
                        bx10 = bx9 + (*(int far *)MK_FP(es11, bx8) << 2);
                        ax6 = (int)far_b2739(*(long far *)MK_FP(es13, bx10));
                    } else {
                        es14 = (int)(loc_8 >> 16);
                        bx11 = (int)*(long far *)MK_FP(es14, (int)loc_8 + 5);
                        es15 = (int)(*(long far *)MK_FP(es14, bx11 + 5) >> 16);
                        if ((int)(unsigned char)*(char far *)MK_FP(es15, bx11) < W_D4AD.f_0) {
                            W_D4AD.f_0 = (unsigned char)*(char far *)MK_FP(es15, bx11);
                        }
                        es16 = (int)(loc_8 >> 16);
                        bx12 = (int)*(long far *)MK_FP(es16, (int)loc_8 + 5);
                        es17 = (int)(*(long far *)MK_FP(es16, bx12 + 5) >> 16);
                        *(char far *)MK_FP(es17, bx12) = (char)(*(char far *)MK_FP(es17, bx12) - *(char *)((char *)&W_D4AD + 0));
                        es18 = (int)(loc_8 >> 16);
                        bx13 = (int)*(long far *)MK_FP(es18, (int)loc_8 + 9);
                        es19 = (int)(*(long far *)MK_FP(es18, bx13 + 9) >> 16);
                        bx14 = bx13 + ((unsigned char)*(char far *)MK_FP(es17, bx12) << 2);
                        ax7 = (int)far_b2739(*(long far *)MK_FP(es19, bx14));
                    }
                    B_D4B4 = (char)1;
                    dx3 = -0x8000;
                } else {
                    goto L1;
                }
            } else {
                if (ax2 == 6) {
                    es20 = FP_SEG(loc_c);
                    bx15 = (int)*(long far *)MK_FP(es20, FP_OFF(loc_c) + 5);
                    es21 = (int)(*(long far *)MK_FP(es20, bx15 + 5) >> 16);
                    *(char far *)MK_FP(es21, bx15) = (char)(*(char far *)MK_FP(es21, bx15) | (char)cx);
                    es22 = FP_SEG(loc_c);
                    bx16 = (int)*(long far *)MK_FP(es22, FP_OFF(loc_c) + 9);
                    es23 = (int)(*(long far *)MK_FP(es22, bx16 + 9) >> 16);
                    ax8 = (int)far_b2739(*(long far *)MK_FP(es23, bx16 + 4));
                } else if (ax2 == 9) {
                    ax9 = W_E568;
                    es24 = (int)(loc_4 >> 16);
                    bx17 = (int)*(long far *)MK_FP(es24, (int)loc_4 + 11);
                    es25 = (int)(*(long far *)MK_FP(es24, bx17 + 11) >> 16);
                    if ((unsigned int)(ax9 - 1 - *(int far *)MK_FP(es25, bx17)) < (unsigned int)W_D4AD.f_0) {
                        W_D4AD.f_0 = ax9 - 1 - *(int far *)MK_FP(es25, bx17);
                    }
                    es26 = (int)(loc_4 >> 16);
                    bx18 = (int)*(long far *)MK_FP(es26, (int)loc_4 + 11);
                    es27 = (int)(*(long far *)MK_FP(es26, bx18 + 11) >> 16);
                    *(int far *)MK_FP(es27, bx18) = *(int far *)MK_FP(es27, bx18) + W_D4AD.f_0;
                    es28 = (int)(loc_4 >> 16);
                    bx19 = (int)*(long far *)MK_FP(es28, (int)loc_4 + 6);
                    es29 = (int)(*(long far *)MK_FP(es28, bx19 + 6) >> 16);
                    bx20 = bx19 + (*(int far *)MK_FP(es27, bx18) << 2);
                    ax10 = (int)far_b2739(*(long far *)MK_FP(es29, bx20));
                } else {
                    es30 = (int)(loc_8 >> 16);
                    bx21 = (int)*(long far *)MK_FP(es30, (int)loc_8 + 5);
                    es31 = (int)(*(long far *)MK_FP(es30, bx21 + 5) >> 16);
                    dx4 = W_E568;
                    if ((int)(dx4 - 1 - (unsigned char)*(char far *)MK_FP(es31, bx21)) < W_D4AD.f_0) {
                        W_D4AD.f_0 = dx4 - 1 - (unsigned char)*(char far *)MK_FP(es31, bx21);
                    }
                    es32 = (int)(loc_8 >> 16);
                    bx22 = (int)*(long far *)MK_FP(es32, (int)loc_8 + 5);
                    es33 = (int)(*(long far *)MK_FP(es32, bx22 + 5) >> 16);
                    *(char far *)MK_FP(es33, bx22) = (char)(*(char far *)MK_FP(es33, bx22) + *(char *)((char *)&W_D4AD + 0));
                    es34 = (int)(loc_8 >> 16);
                    bx23 = (int)*(long far *)MK_FP(es34, (int)loc_8 + 9);
                    es35 = (int)(*(long far *)MK_FP(es34, bx23 + 9) >> 16);
                    bx24 = bx23 + ((unsigned char)*(char far *)MK_FP(es33, bx22) << 2);
                    ax11 = (int)far_b2739(*(long far *)MK_FP(es35, bx24));
                }
                B_D4B4 = (char)1;
                dx3 = -0x8000;
            }
        } else if (ax3 == 60) {
            dx3 = 0x400;
        } else if (ax3 == 62) {
            dx3 = 0x800;
        } else {
L1:
            dx3 = ax3;
        }
    }
    return ((long)dx3 << 16 | (unsigned)dx3);
}
