/* differs: 308 at +5, 906 bytes; 311 at +5, 906 bytes; 312 at +5, 907 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8800;
extern char B_8A9F;
extern char B_901B;
extern char B_956A;
extern char B_96EF;
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern unsigned char TBL_F779;
extern unsigned char TBL_F77A[];
extern int W_8814;
extern int W_9029;
extern int W_902B;
extern int W_902D;
extern int W_902F;
extern int W_903D;
extern int W_903F;
extern int W_904B;
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1b05(void far *);
extern int far far_b1f96(int);
extern long far far_d97ca(int, unsigned char far *, int);
extern long far far_d9b6e(int, unsigned char far *, int);
extern int far far_daa8e(int far *);
extern int far far_daabc(int);
extern long far far_dad54(int);
extern int far far_e0031(char far *);
extern long far far_e51be(char far *, int, int);
extern int far far_e5ff8(void);

long far far_e270b(void)
{
    int loc_2;
    long loc_4;
    int loc_6;
    unsigned long loc_8;
    int loc_a;
    int loc_c;
    int far *loc_e;
    int loc_10;
    int loc_12;
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    int ax5;
    unsigned int ax6;
    int ax7;
    int ax8;
    int bx;
    unsigned int cx;
    unsigned int cx2;
    int di;
    int dx;
    int dx2;
    int dx3;
    int flags;
    int si;
    int t1;
    int t10;
    long t11;
    unsigned long t12;
    long t13;
    long t14;
    int t15;
    long t16;
    unsigned long t17;
    int t18;
    int t19;
    int t2;
    long t20;
    int t3;
    int t4;
    int t5;
    int t6;
    long t7;
    long t8;
    long t9;

    if (B_8800 == 0) {
        if (B_901B != -1) {
            if (B_96EF == 0) {
                t1 = far_b1af9();
                t2 = far_b1ad0(7, 0);
                t3 = far_b1f96(40);
                t4 = far_b1ad0(7, 0);
                t5 = far_b1b05(MK_FP(SEG_DATA, 0x6abc));
            }
            t6 = far_e0031((char far *)&B_901B);
            t7 = far_e51be((char far *)&B_901B, B_8A9F, 0);
            loc_a = 1;
            si = 1;
            loc_c = SEG_DATA;
            *(int *)((char *)&loc_e + 0) = (int)(unsigned)TBL_F77A;
            loc_6 = 0;
            *(int *)((char *)&loc_8 + 0) = 0;
            loc_2 = 0;
            *(int *)((char *)&loc_4 + 0) = 0;
            B_956A = (char)(B_956A + 1);
            loc_12 = 0;
            for (;;) {
                if (loc_12 == 0) {
                    di = (int)far_d97ca(1, (unsigned char far *)&TBL_F779, 0x640);
                    ax = TBL_F779 & 248;
                    ax2 = loc_a;
                    if (ax2 != 0) {
                        if (ax2 == 1) {
                            if (ax != 168) {
                                if (TBL_F779 == -1) {
                                    if (loc_2 != loc_6 || *(int *)((char *)&loc_4 + 0) != *(int *)((char *)&loc_8 + 0)) {
                                        W_8814 = *(int *)((char *)&loc_8 + 0) - *(int *)((char *)&loc_4 + 0);
                                        t8 = far_dad54(1);
                                        loc_2 = loc_6;
                                        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_8 + 0);
                                    }
                                    W_904B = si - 1;
                                    W_903F = loc_6;
                                    W_903D = *(int *)((char *)&loc_8 + 0);
                                    di = 1;
                                    loc_12 = 1;
                                    goto L1;
                                }
                                continue;
                            }
                            if (loc_2 != loc_6 || *(int *)((char *)&loc_4 + 0) != *(int *)((char *)&loc_8 + 0)) {
                                W_8814 = *(int *)((char *)&loc_8 + 0) - *(int *)((char *)&loc_4 + 0);
                                t9 = far_dad54(1);
                                loc_2 = loc_6;
                                *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_8 + 0);
                            }
                            if (si > W_904B) {
                                TBL_F779 = (unsigned char)-1;
                                di = 1;
                                dx = W_9029;
                                W_902F = W_902B;
                                W_902D = dx;
                                W_903F = loc_6;
                                W_903D = *(int *)((char *)&loc_8 + 0);
                                loc_12 = 1;
                            } else {
                                ax3 = si;
                                si = si + 1;
                                t10 = far_daabc(ax3);
                                *loc_e = t10;
                                t11 = (long)(int)B_F77C * 0x180L;
                                t12 = (unsigned long)(unsigned int)(int)t11;
                                ax4 = (unsigned)(t12 / (unsigned long)(unsigned char)B_F77D);
                                *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + ax4;
                                loc_6 = (int)(loc_8 + (unsigned long)(unsigned int)ax4 >> 16);
                                loc_a = 0;
                            }
                            goto L1;
                        }
                        goto L1;
                    }
                    if (ax != 136) {
                        if (ax != 168) {
                            if (ax == 248) {
                                if (loc_2 != loc_6 || *(int *)((char *)&loc_4 + 0) != *(int *)((char *)&loc_8 + 0)) {
                                    W_8814 = *(int *)((char *)&loc_8 + 0) - *(int *)((char *)&loc_4 + 0);
                                    t13 = far_dad54(1);
                                    loc_2 = loc_6;
                                    *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_8 + 0);
                                }
                                W_904B = si - 1;
                                W_903F = loc_6;
                                W_903D = *(int *)((char *)&loc_8 + 0);
                                TBL_F779 = (unsigned char)-1;
                                di = 1;
                                loc_12 = 1;
                            }
                        } else {
                            if (loc_2 != loc_6 || *(int *)((char *)&loc_4 + 0) != *(int *)((char *)&loc_8 + 0)) {
                                W_8814 = *(int *)((char *)&loc_8 + 0) - *(int *)((char *)&loc_4 + 0);
                                t14 = far_dad54(1);
                                loc_2 = loc_6;
                                *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_8 + 0);
                            }
                            if (si > W_904B) {
                                TBL_F779 = (unsigned char)-1;
                                di = 1;
                                dx2 = W_9029;
                                W_902F = W_902B;
                                W_902D = dx2;
                                W_903F = loc_6;
                                W_903D = *(int *)((char *)&loc_8 + 0);
                                loc_12 = 1;
                            } else {
                                ax5 = si;
                                si = si + 1;
                                t15 = far_daabc(ax5);
                                *loc_e = t15;
                                t16 = (long)(int)B_F77C * 0x180L;
                                t17 = (unsigned long)(unsigned int)(int)t16;
                                ax6 = (unsigned)(t17 / (unsigned long)(unsigned char)B_F77D);
                                *(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + ax6;
                                loc_6 = (int)(loc_8 + (unsigned long)(unsigned int)ax6 >> 16);
                            }
                        }
                    } else {
                        t18 = far_daa8e(loc_e);
                        loc_10 = t18;
                        cx = *(int *)((char *)&loc_4 + 0);
                        cx2 = cx + t18;
                        bx = loc_2 + -(t18 < 0) + (cx2 < cx);
                        flags = bx - loc_6;
                        if (!CC("<", flags) && (CC("!=", flags) || cx2 >= (unsigned int)*(int *)((char *)&loc_8 + 0))) {
                            loc_10 = *(int *)((char *)&loc_8 + 0) - *(int *)((char *)&loc_4 + 0);
                            loc_a = 0;
                        }
                        t19 = far_daabc(loc_10);
                        *loc_e = t19;
                        ax7 = loc_10;
                        *(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + ax7;
                        loc_2 = (int)(loc_4 + (long)(int)ax7 >> 16);
                    }
L1:
                    t20 = far_d9b6e(1, (unsigned char far *)&TBL_F779, di);
                    continue;
                }
                break;
            }
            ax8 = far_e5ff8();
            dx3 = UNDEF;
            B_956A = (char)(B_956A - 1);
        }
    }
    return ((long)dx3 << 16 | (unsigned)ax8);
}
