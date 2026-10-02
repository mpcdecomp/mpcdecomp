/* differs: 308 at +0, 1738 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
struct g_B_955C {
    int f_0;
};
struct g_TBL_9553 {
    int f_0;
};
struct g_TBL_954B {
    int f_0;
};
struct g_TBL_9543 {
    int f_0;
};
extern char B_71FB;
extern char B_7200;
extern char B_7201;
extern char B_7202;
extern char B_7207;
extern char B_7209;
extern char B_720A;
extern char B_720B;
extern char B_720C;
extern int B_7FD0;
extern char B_7FF1;
extern char B_7FF2;
extern char B_7FF3;
extern char B_807B;
extern char B_807C;
extern char B_807D;
extern unsigned char B_8A9B;
extern unsigned char B_901B[];
extern char B_9444;
extern unsigned char B_955B;
extern struct g_B_955C B_955C;
extern char B_956D;
extern char B_96EE;
extern char B_96F0;
extern unsigned char B_A5C1;
extern char B_E422;
extern char B_E423;
extern char B_E425;
extern char TBL_71EA[];
extern char TBL_90C1[];
extern char TBL_91ED[];
extern struct g_TBL_9543 TBL_9543;
extern struct g_TBL_954B TBL_954B;
extern struct g_TBL_9553 TBL_9553;
extern char TBL_956E[];
extern char TBL_966E[];
extern char TBL_A57E[];
extern int W_71D8;
extern int W_71E0;
extern int W_71E8;
extern int W_D4AF;
extern int far far_da6c1(int);
extern int far far_da6e3(int);
extern int far far_da706(int);
extern long far far_dcc2e(long, long, int);
extern int far far_dce14();
extern long far far_dcf84();
extern long far far_dcfb5(char far *, int, int, int);
extern int far far_dd0fb(void);
extern long far far_dd1c5(long, int, int);
extern void far far_dd1f5(void);
extern long far far_de41c(void);
extern int near fn_dba91(void);

long far far_db58c(void)
{
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
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
    int bx4;
    int cx;
    int cx2;
    int cx3;
    int cx4;
    int cx5;
    int cx6;
    int cx7;
    int cx8;
    int cx9;
    int di;
    int dx;
    int es;
    int p10;
    int p12;
    int p14;
    int p16;
    int p18;
    int p6;
    int p62;
    int p8;
    int si;
    int si2;
    int si3;
    int t1;
    long t10;
    int t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    int t17;
    long t18;
    long t19;
    long t2;
    int t3;
    long t4;
    int t5;
    long t6;
    int t7;
    long t8;
    int t9;

    di = B_955C.f_0 & 255;
    if (di != 0) {
        *(char *)((char *)&B_955C + 0) = (char)0;
        if ((di & 1) != 0) {
            bx = 8;
            for (;;) {
                bx = bx - 2;
                if (bx < 2) {
                    break;
                }
                ax = *(int *)((char *)&TBL_9553 + 0 + bx);
                if (ax == 0) {
                    continue;
                }
                goto L1;
            }
            goto L2;
        }
        goto L3;
    }
    goto L4;
L1:
    W_71E8 = bx;
    W_71D8 = ax;
    if (B_96EE == 0 || B_E422 != 1 || (B_A5C1 < 8 || B_E425 == 0) || (B_7FF1 & 1) == 0) {
L2:
    } else {
        W_71E0 = 1;
        si = 0;
        B_7200 = (char)1;
        do {
            ax = W_71D8;
            if ((W_71E0 & ax) != 0) {
                ax2 = (W_71E8 << 3) + si;
                B_7201 = (char)ax2;
                p6 = ax2;
                t1 = far_da6c1(p6);
                bx = UNDEF;
                es = UNDEF;
                dx = UNDEF;
                ax3 = ((char)(t1 >> 8) << 8 | (unsigned char)((char)t1 & 127));
                B_7202 = (char)ax3;
                ax = ((char)(ax3 >> 8) << 8 | (unsigned char)B_7202);
                if ((char)ax == 0 || (char)ax == 127) {
                    goto L5;
                }
                cx2 = ((char)(UNDEF >> 8) << 8 | (unsigned char)TBL_71EA[si]);
                cx = ((char)(cx2 >> 8) << 8 | (unsigned char)((char)cx2 - (char)ax));
                if ((char)cx < 0) {
                    cx = ((char)(cx >> 8) << 8 | (unsigned char)-(char)cx);
                }
                if ((char)cx >= B_807B) {
L5:
                    TBL_71EA[si] = (char)ax;
                    B_71FB = B_8A9B;
                    p6 = 9;
                    p8 = SEG_DATA;
                    p10 = 0x6a76;
                    p12 = SEG_DATA;
                    p14 = (int)(unsigned)B_901B;
                    t2 = far_dcc2e(((long)p12 << 16 | (unsigned)p14), ((long)p8 << 16 | (unsigned)p10), p6);
                    cx = UNDEF;
                    es = UNDEF;
                    ax = (int)t2;
                    dx = (int)(t2 >> 16);
                    B_71FB = (char)0;
                    bx = B_8A9B;
                    TBL_90C1[bx] = (char)(TBL_90C1[bx] | 2);
                }
            }
            W_71E0 = W_71E0 << 1;
            si = si + 1;
        } while (si < 16);
    }
    *(int *)((char *)&TBL_9553 + 0 + W_71E8) = 0;
L3:
    if ((di & 2) != 0) {
        bx2 = 8;
        for (;;) {
            bx2 = bx2 - 2;
            if (bx2 < 2) {
                break;
            }
            ax = *(int *)((char *)&TBL_954B + 0 + bx2);
            if (ax == 0) {
                continue;
            }
            goto L6;
        }
        goto L7;
    }
    goto L8;
    goto L4;
L6:
    W_71E8 = bx2;
    W_71D8 = ax;
    if (B_96EE == 0 || B_E422 != 1 || (B_A5C1 < 8 || B_E425 == 0) || (B_7FF2 & 1) == 0) {
L7:
    } else {
        W_71E0 = 1;
        si2 = 0;
        B_7200 = (char)2;
        do {
            ax = W_71D8;
            if ((W_71E0 & ax) != 0) {
                ax4 = (W_71E8 << 3) + si2;
                B_7201 = (char)ax4;
                p6 = ax4;
                t3 = far_da6e3(p6);
                bx2 = UNDEF;
                es = UNDEF;
                dx = UNDEF;
                ax5 = ((char)(t3 >> 8) << 8 | (unsigned char)((char)t3 & 127));
                B_7202 = (char)ax5;
                ax = ((char)(ax5 >> 8) << 8 | (unsigned char)B_7202);
                if ((char)ax == 0 || (char)ax == 127) {
                    goto L9;
                }
                cx3 = ((char)(UNDEF >> 8) << 8 | (unsigned char)TBL_71EA[si2]);
                cx = ((char)(cx3 >> 8) << 8 | (unsigned char)((char)cx3 - (char)ax));
                if ((char)cx < 0) {
                    cx = ((char)(cx >> 8) << 8 | (unsigned char)-(char)cx);
                }
                if ((char)cx >= B_807C) {
L9:
                    TBL_71EA[si2] = (char)ax;
                    B_71FB = B_8A9B;
                    p6 = 9;
                    p8 = SEG_DATA;
                    p10 = 0x6a76;
                    p12 = SEG_DATA;
                    p14 = (int)(unsigned)B_901B;
                    t4 = far_dcc2e(((long)p12 << 16 | (unsigned)p14), ((long)p8 << 16 | (unsigned)p10), p6);
                    cx = UNDEF;
                    es = UNDEF;
                    ax = (int)t4;
                    dx = (int)(t4 >> 16);
                    B_71FB = (char)0;
                    bx2 = B_8A9B;
                    TBL_90C1[bx2] = (char)(TBL_90C1[bx2] | 2);
                }
            }
            W_71E0 = W_71E0 << 1;
            si2 = si2 + 1;
        } while (si2 < 16);
    }
    *(int *)((char *)&TBL_954B + 0 + W_71E8) = 0;
L8:
    if ((di & 4) != 0) {
        bx3 = 8;
        for (;;) {
            bx3 = bx3 - 2;
            if (bx3 < 2) {
                break;
            }
            ax = *(int *)((char *)&TBL_9543 + 0 + bx3);
            if (ax == 0) {
                continue;
            }
            goto L10;
        }
        goto L11;
    }
    goto L12;
    goto L4;
L10:
    W_71E8 = bx3;
    W_71D8 = ax;
    if (B_96EE == 0 || B_E423 != 1 || (B_A5C1 < 8 || B_E425 == 0) || (B_7FF3 & 1) == 0) {
L11:
    } else {
        W_71E0 = 1;
        si3 = 0;
        B_7200 = (char)3;
        do {
            ax = W_71D8;
            if ((W_71E0 & ax) != 0) {
                ax6 = (W_71E8 << 3) + si3;
                B_7201 = (char)ax6;
                p6 = ax6;
                t5 = far_da706(p6);
                bx3 = UNDEF;
                es = UNDEF;
                dx = UNDEF;
                ax7 = ((char)(t5 >> 8) << 8 | (unsigned char)((char)t5 & 127));
                B_7202 = (char)ax7;
                ax = ((char)(ax7 >> 8) << 8 | (unsigned char)B_7202);
                if ((char)ax == 0 || (char)ax == 127) {
                    goto L13;
                }
                cx4 = ((char)(UNDEF >> 8) << 8 | (unsigned char)TBL_71EA[si3]);
                cx = ((char)(cx4 >> 8) << 8 | (unsigned char)((char)cx4 - (char)ax));
                if ((char)cx < 0) {
                    cx = ((char)(cx >> 8) << 8 | (unsigned char)-(char)cx);
                }
                if ((char)cx >= B_807D) {
L13:
                    TBL_71EA[si3] = (char)ax;
                    B_71FB = B_8A9B;
                    p6 = 9;
                    p8 = SEG_DATA;
                    p10 = 0x6a76;
                    p12 = SEG_DATA;
                    p14 = (int)(unsigned)B_901B;
                    t6 = far_dcc2e(((long)p12 << 16 | (unsigned)p14), ((long)p8 << 16 | (unsigned)p10), p6);
                    cx = UNDEF;
                    es = UNDEF;
                    ax = (int)t6;
                    dx = (int)(t6 >> 16);
                    B_71FB = (char)0;
                    bx3 = B_8A9B;
                    TBL_90C1[bx3] = (char)(TBL_90C1[bx3] | 2);
                }
            }
            W_71E0 = W_71E0 << 1;
            si3 = si3 + 1;
        } while (si3 < 16);
    }
    *(int *)((char *)&TBL_9543 + 0 + W_71E8) = 0;
L12:
    if ((di & 16) != 0) {
        cx5 = 64;
        do {
            B_7207 = (char)123;
            t7 = far_dce14(MK_FP(SEG_DATA, 0x6a81), 4, (-1 << 8 | (unsigned char)((char)cx5 - 1)));
            B_7207 = (char)64;
            ax8 = far_dce14();
            TBL_A57E[cx5] = (char)0;
            cx5 = cx5 - 1;
        } while (cx5 != 0);
        B_7209 = (char)-128;
        B_720A = (char)0;
        B_720C = (char)64;
        cx6 = 128;
        do {
            p62 = cx6;
            TBL_966E[cx6 + -1] = (char)0;
            TBL_956E[cx6 + -1] = (char)0;
            B_720B = (char)((char)cx6 - 1);
            cx7 = 64;
            do {
                p8 = cx7;
                p10 = (-1 << 8 | (unsigned char)((char)cx7 - 1));
                p12 = 4;
                p14 = SEG_DATA;
                p16 = (int)(unsigned)&B_7209;
                ax9 = far_dce14(((long)p14 << 16 | (unsigned)p16), p12, p10);
                cx7 = p8 - 1;
            } while (cx7 != 0);
            t8 = far_de41c();
            far_dd1f5();
            es = UNDEF;
            ax = UNDEF;
            dx = UNDEF;
            cx6 = p62 - 1;
        } while (cx6 != 0);
    }
    if ((di & 32) != 0) {
        B_7209 = (char)-14;
        ax10 = W_D4AF << 1;
        ax11 = ((char)(ax10 >> 8) << 8 | (unsigned char)((unsigned int)(char)ax10 >> 1));
        ax12 = (((char)(ax11 >> 8) & 127) << 8 | (unsigned char)(char)ax11);
        B_720A = (char)ax12;
        B_720B = (char)(ax12 >> 8);
        p8 = 3;
        p10 = SEG_DATA;
        p12 = (int)(unsigned)&B_7209;
        t10 = far_dd1c5(((long)p10 << 16 | (unsigned)p12), p8, B_7FD0);
        es = UNDEF;
        ax = (int)t10;
        dx = (int)(t10 >> 16);
        B_96F0 = (char)0;
    }
    if ((di & 64) != 0) {
        t11 = fn_dba91();
        es = UNDEF;
        ax = fn_dba91();
        dx = UNDEF;
        B_956D = (char)0;
    }
    if ((di & 128) != 0) {
        cx8 = B_955B;
        B_955B = (unsigned char)0;
        if ((cx8 & 64) != 0) {
            cx9 = 100;
            bx4 = 0;
            do {
                ax13 = ((char)(ax >> 8) << 8 | (unsigned char)TBL_90C1[bx4]);
                ax = ((char)(ax13 >> 8) << 8 | (unsigned char)((char)ax13 & 3));
                if ((char)ax == 2) {
                    ax = ((char)(ax >> 8) << 8 | (unsigned char)TBL_91ED[bx4]);
                    if ((char)ax != 0) {
                        B_7209 = (char)-64;
                        B_720B = (char)((char)ax - 1);
                        B_720A = (char)bx4;
                        p8 = bx4;
                        p10 = cx9;
                        p12 = 0;
                        p14 = 3;
                        p16 = SEG_DATA;
                        p18 = (int)(unsigned)&B_7209;
                        t12 = far_dcf84(p18, p16, p14, p12);
                        es = UNDEF;
                        ax = (int)t12;
                        dx = (int)(t12 >> 16);
                        cx9 = p10;
                        bx4 = p8;
                    }
                }
                bx4 = bx4 + 1;
                cx9 = cx9 - 1;
            } while (cx9 != 0);
        }
        if ((cx8 & 1) != 0) {
            B_7209 = (char)-80;
            B_720A = (char)0;
            B_720B = (char)124;
            B_720C = (char)0;
            t13 = far_dcf84((char far *)&B_7209, 4, 0);
        }
        if ((cx8 & 2) != 0) {
            B_7209 = (char)-80;
            B_720A = (char)0;
            B_720B = (char)125;
            B_720C = (char)0;
            t14 = far_dcf84((char far *)&B_7209, 4, 0);
        }
        if ((cx8 & 4) != 0) {
            B_7209 = (char)-80;
            B_720A = (char)0;
            B_720B = (char)126;
            B_720C = (char)0;
            t15 = far_dcf84((char far *)&B_7209, 4, 0);
        }
        if ((cx8 & 8) != 0) {
            B_7209 = (char)-80;
            B_720A = (char)0;
            B_720B = (char)127;
            B_720C = (char)0;
            t16 = far_dcf84((char far *)&B_7209, 4, 0);
        }
        if ((cx8 & 16) != 0) {
            B_7209 = (char)-64;
            B_720A = B_8A9B;
            t17 = far_dd0fb();
            B_720B = B_9444;
            t18 = far_dcfb5((char far *)&B_7209, 3, (-1 << 8 | (unsigned char)(char)t17), 0);
        }
        if ((cx8 & 32) != 0) {
            B_7209 = (char)-10;
            t19 = far_dcf84((char far *)&B_7209, 1, 0);
        }
    }
L4:
    return far_de41c();
}
int near fn_dba91(void) { return 0; }
