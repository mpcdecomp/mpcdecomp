/* differs: 308 at +5, 1002 bytes; 311 at +5, 1001 bytes; 312 at +5, 1002 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[2];
    char f_2;
    char f_3;
};
struct s2 {
    char pad_0[1];
    char f_1;
    char pad_2[1];
    char f_3;
    char pad_4[1];
    char f_5;
    char pad_6[6];
    char f_c;
    char f_d;
};
extern int FP_E40C;
extern int W_E40E;
extern long far far_cbb70();
extern long far far_cbbd4();
extern long far fn_cbc38();

long far far_cb8a1(int arg_0, int arg_2)
{
    int loc_2;
    struct s2 far *loc_4;
    int loc_6;
    int loc_8;
    int loc_a;
    int loc_c;
    int loc_e;
    int loc_10;
    int loc_12;
    struct s1 far *loc_14;
    char loc_15;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
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
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int di;
    int dx2;
    int dx3;
    int es;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int si;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    loc_12 = arg_2;
    *(int *)((char *)&loc_14 + 0) = arg_0;
    bx = FP_OFF(loc_14);
    es = FP_SEG(loc_14);
    if ((unsigned char)*(char far *)MK_FP(es, bx + 2) >= 35) {
        if ((unsigned char)*(char far *)MK_FP(es, bx + 2) <= 98) {
            ax2 = ((char)(arg_2 >> 8) << 8 | (unsigned char)loc_14->f_2);
            si = (unsigned char)(char)ax2;
            bx2 = FP_E40C + (unsigned char)(char)ax2 * 24;
            loc_2 = W_E40E;
            *(int *)((char *)&loc_4 + 0) = bx2 - 0x30a;
            di = (unsigned char)*(char far *)MK_FP(loc_2, bx2 - 0x2fd);
            t1 = far_cbb70((unsigned char)(char)ax2);
            loc_a = (int)(t1 >> 16);
            loc_c = (int)t1;
            t2 = far_cbbd4((unsigned char)loc_14->f_2);
            arg_0 = (int)(t2 >> 16);
            loc_e = arg_0;
            loc_10 = (int)t2;
            ax3 = (unsigned char)loc_4->f_1;
            if (ax3 != 2) {
                if (ax3 == 3) {
                    arg_0 = (unsigned char)loc_4->f_c;
                    bx3 = FP_OFF(loc_14);
                    es2 = FP_SEG(loc_14);
                    if (((unsigned char)*(char far *)MK_FP(es2, bx3) & 3) == 1) {
                        arg_0 = (unsigned char)*(char far *)MK_FP(es2, bx3 + 4);
                    }
                    bx4 = FP_OFF(loc_4);
                    es3 = FP_SEG(loc_4);
                    arg_2 = (unsigned char)*(char far *)MK_FP(es3, bx4 + 4);
                    if (arg_2 < arg_0) {
                        if ((unsigned char)*(char far *)MK_FP(es3, bx4 + 5) >= 35) {
                            ax4 = ((char)(arg_2 >> 8) << 8 | (unsigned char)loc_4->f_5);
                            si = (unsigned char)(char)ax4;
                            bx5 = FP_E40C + (unsigned char)(char)ax4 * 24;
                            loc_2 = W_E40E;
                            *(int *)((char *)&loc_4 + 0) = bx5 - 0x30a;
                            goto L1;
                        }
                    } else {
                        bx6 = FP_OFF(loc_4);
                        es4 = FP_SEG(loc_4);
                        arg_2 = (unsigned char)*(char far *)MK_FP(es4, bx6 + 2);
                        if (arg_2 < arg_0) {
                            if ((unsigned char)*(char far *)MK_FP(es4, bx6 + 3) >= 35) {
                                ax5 = ((char)(arg_2 >> 8) << 8 | (unsigned char)loc_4->f_3);
                                si = (unsigned char)(char)ax5;
                                bx7 = FP_E40C + (unsigned char)(char)ax5 * 24;
                                loc_2 = W_E40E;
                                *(int *)((char *)&loc_4 + 0) = bx7 - 0x30a;
L1:
                                di = 1;
                                goto L2;
                            }
                        } else {
                            goto L1;
                        }
                    }
                } else {
                    goto L2;
                }
            } else {
                arg_2 = ((char)(ax3 >> 8) << 8 | (unsigned char)loc_14->f_3);
                loc_15 = (char)arg_2;
                bx8 = FP_OFF(loc_4);
                es5 = FP_SEG(loc_4);
                if ((unsigned char)(char)arg_2 > (unsigned char)*(char far *)MK_FP(es5, bx8 + 4)) {
                    if ((unsigned char)*(char far *)MK_FP(es5, bx8 + 5) >= 35) {
                        ax6 = ((char)(arg_2 >> 8) << 8 | (unsigned char)loc_4->f_5);
                        si = (unsigned char)(char)ax6;
                        bx9 = FP_E40C + (unsigned char)(char)ax6 * 24;
                        loc_2 = W_E40E;
                        *(int *)((char *)&loc_4 + 0) = bx9 - 0x30a;
                        goto L3;
                    }
                } else {
                    arg_2 = ((char)(arg_2 >> 8) << 8 | (unsigned char)loc_15);
                    bx10 = FP_OFF(loc_4);
                    es6 = FP_SEG(loc_4);
                    if ((unsigned char)(char)arg_2 > (unsigned char)*(char far *)MK_FP(es6, bx10 + 2)) {
                        if ((unsigned char)*(char far *)MK_FP(es6, bx10 + 3) >= 35) {
                            ax7 = ((char)(arg_2 >> 8) << 8 | (unsigned char)loc_4->f_3);
                            si = (unsigned char)(char)ax7;
                            bx11 = FP_E40C + (unsigned char)(char)ax7 * 24;
                            loc_2 = W_E40E;
                            *(int *)((char *)&loc_4 + 0) = bx11 - 0x30a;
L3:
                            di = (unsigned char)loc_4->f_d;
L2:
                            t3 = fn_cbc38(si, *(long *)((char *)&arg_0 + 0), loc_4, *(long *)((char *)&loc_c + 0), *(long *)((char *)&loc_10 + 0), di);
                            arg_2 = (int)t3;
                            arg_0 = (int)(t3 >> 16);
                            bx12 = FP_OFF(loc_4);
                            es7 = FP_SEG(loc_4);
                            if (*(char far *)MK_FP(es7, bx12 + 1) == 1) {
                                if ((unsigned char)*(char far *)MK_FP(es7, bx12 + 3) >= 35) {
                                    ax8 = ((char)(arg_2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es7, bx12 + 3));
                                    t4 = far_cbb70((unsigned char)(char)ax8);
                                    loc_a = (int)(t4 >> 16);
                                    loc_c = (int)t4;
                                    t5 = far_cbbd4((unsigned char)(char)ax8);
                                    loc_e = (int)(t5 >> 16);
                                    loc_10 = (int)t5;
                                    dx2 = W_E40E;
                                    bx13 = FP_E40C + (unsigned char)(char)ax8 * 24;
                                    loc_6 = dx2;
                                    loc_8 = bx13 - 0x30a;
                                    t6 = fn_cbc38((unsigned char)(char)ax8, *(long *)((char *)&arg_0 + 0), ((long)dx2 << 16 | (unsigned)(bx13 - 0x30a)), *(long *)((char *)&loc_c + 0), *(long *)((char *)&loc_10 + 0), di);
                                    arg_2 = (int)t6;
                                    arg_0 = (int)(t6 >> 16);
                                }
                                bx14 = FP_OFF(loc_4);
                                es8 = FP_SEG(loc_4);
                                if ((unsigned char)*(char far *)MK_FP(es8, bx14 + 5) >= 35) {
                                    ax9 = ((char)(arg_2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es8, bx14 + 5));
                                    t7 = far_cbb70((unsigned char)(char)ax9);
                                    loc_a = (int)(t7 >> 16);
                                    loc_c = (int)t7;
                                    t8 = far_cbbd4((unsigned char)(char)ax9);
                                    loc_e = (int)(t8 >> 16);
                                    loc_10 = (int)t8;
                                    dx3 = W_E40E;
                                    bx15 = FP_E40C + (unsigned char)(char)ax9 * 24;
                                    loc_6 = dx3;
                                    loc_8 = bx15 - 0x30a;
                                    t9 = fn_cbc38((unsigned char)(char)ax9, *(long *)((char *)&arg_0 + 0), ((long)dx3 << 16 | (unsigned)(bx15 - 0x30a)), *(long *)((char *)&loc_c + 0), *(long *)((char *)&loc_10 + 0), di);
                                    arg_2 = (int)t9;
                                    arg_0 = (int)(t9 >> 16);
                                }
                            }
                        }
                    } else {
                        goto L3;
                    }
                }
            }
        }
    }
    return ((long)arg_0 << 16 | (unsigned)arg_2);
}
long far far_cbb70(int p0) { return 0; }
long far far_cbbd4(int p0) { return 0; }
long far fn_cbc38(int p0, long p1, struct s2 far *p2, long p3, long p4, int p5) { return 0; }
