/* differs: 308 at +3, 1236 bytes; 311 at +3, 1237 bytes; 312 at +3, 1236 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FE4;
extern char B_826B;
extern char B_8807;
extern unsigned char B_8808;
extern char B_8809;
extern char B_880A;
extern char B_880B;
extern char B_8A9B;
extern char B_8A9C;
extern char B_8A9E;
extern char B_8C41;
extern unsigned char B_901B[];
extern char B_9443;
extern char B_9447;
extern char B_9457;
extern char B_955D;
extern char B_955E;
extern char B_955F;
extern char B_956A;
extern char B_956D;
extern char B_96EE;
extern char B_96F5;
extern char B_9783;
extern char B_A567;
extern char B_A568;
extern char B_A569;
extern char B_A56A;
extern char B_A56B;
extern char B_A56C;
extern char B_A56D;
extern char B_A570;
extern char B_A5C0;
extern char B_A5C1;
extern char B_A5C2;
extern char B_A5C8;
extern char B_F76C;
extern char TBL_90C1[];
extern int W_880C;
extern int W_880E;
extern int W_8810;
extern int W_8812;
extern int W_8814;
extern int W_881C;
extern int W_8C7B;
extern int W_904F;
extern char W_9051;
extern int W_9055;
extern int W_9059;
extern unsigned int W_96F6;
extern int W_96F8;
extern void far far_b1968(int);
extern long far far_d7a63(int);
extern int far far_d7b38(void);
extern int far far_d9748(void);
extern long far far_dad87(void);
extern int far far_db0a2(unsigned char far *);
extern long far far_db216(void);
extern long far far_db274(void);
extern long far far_db58c(void);
extern long far far_dca3e(void);
extern int far far_dd405(void);
extern void far far_dd4d8(void);
extern long far far_dda74(unsigned char far *);
extern long far far_ddf77(void);
extern long far far_de362(void);
extern long far far_de3fa(void);
extern long far far_de41c(void);
extern int far far_de95a(void);
extern int far far_de9ec(void);
extern long far far_e2ce3(void);
extern int far far_e931c(void);

int far fn_ec09b(int arg_0)
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
    int dx;
    int flags;
    int t1;
    long t10;
    long t11;
    long t12;
    int t13;
    int t14;
    int t15;
    long t16;
    long t17;
    long t2;
    long t3;
    long t4;
    int t5;
    int t6;
    long t7;
    long t8;
    long t9;

    ax = far_e931c();
    if (B_956A != 0) {
        goto L1;
    }
    if (B_A5C0 != 0) {
        if (B_956D != 0 && B_7FE4 != 0) {
            if (W_904F >= W_881C) {
                far_b1968(1);
                W_904F = 0;
            }
            W_904F = W_904F + 1;
        } else {
            W_904F = 0;
        }
        ax2 = far_d7b38();
        if (ax2 != 0) {
            ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)B_F76C);
            B_F76C = (char)(B_F76C - 1);
            if (((char)ax3 & 7) == 0) {
                t2 = far_d7a63(68);
            }
        } else {
            B_F76C = (char)0;
        }
        t3 = far_de362();
        return (int)far_db58c();
    }
    if (B_A5C1 == 0) {
        ax4 = ((char)(ax >> 8) << 8 | (unsigned char)B_8A9B);
        if ((char)ax4 != B_8A9C) {
            ax4 = (int)far_db216();
            if (ax4 == 0) {
                ax4 = ((char)(ax4 >> 8) << 8 | (unsigned char)B_8A9C);
                B_8A9B = (char)ax4;
            }
        }
    } else {
        if (B_96F5 != 0) {
            B_96F5 = (char)0;
            t4 = far_e2ce3();
            ax = (int)t4;
            W_96F8 = (int)(t4 >> 16);
            W_96F6 = ax;
            flags = W_96F8;
            if (!CC(">", flags) && (CC("<", flags) || W_96F6 < 0x514)) {
                B_9457 = (char)(B_9457 | 4);
            }
        }
        if (arg_0 == 0) {
            if (B_A570 == 0) {
                if (B_880A == 0) {
                    W_8812 = W_8814;
                    W_8814 = 0;
                    B_880A = (char)1;
                }
                t5 = far_de95a();
            }
            if (B_8A9E > 0) {
                B_9443 = B_8A9E;
            }
            ax = (int)far_ddf77();
            B_8A9E = (char)-1;
        }
        ax4 = ((char)(ax >> 8) << 8 | (unsigned char)B_8A9B);
        if ((char)ax4 != B_8A9C && B_880B == 0) {
            ax4 = (int)far_db216();
            if (ax4 == 0) {
                ax4 = ((char)(ax4 >> 8) << 8 | (unsigned char)B_8A9C);
                B_8A9B = (char)ax4;
            }
        }
    }
    if (B_A570 != 0) {
        ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)0);
    } else {
        ax6 = ((char)-(B_8A9B < 0) << 8 | (unsigned char)TBL_90C1[B_8A9B]);
        ax5 = ((char)(ax6 >> 8) << 8 | (unsigned char)((char)ax6 & 4));
    }
    B_96EE = (char)ax5;
    B_A5C1 = *(char *)((char *)&arg_0 + 0);
    if (*(char *)((char *)&arg_0 + 0) >= 4 && (*(char *)((char *)&arg_0 + 0) != 6 || B_826B != 0) && W_904F % W_881C == 0) {
        if (W_904F == 0) {
            ax7 = 1;
        } else {
            ax7 = 0;
        }
        far_b1968(ax7);
    }
    ax8 = (int)far_db58c();
    if (B_A5C1 >= 6) {
        if (W_9055 <= 0) {
            B_A56C = (char)0;
            B_A56D = (char)0;
            B_A567 = (char)0;
            B_A568 = (char)0;
            B_A569 = (char)0;
            B_A56A = (char)0;
            B_A56B = (char)0;
            t7 = far_dda74((unsigned char far *)B_901B);
            ax8 = (int)far_de41c();
        }
        if (B_8C41 >= 0 && W_8C7B <= 0) {
            t8 = far_dda74((char far *)&B_8C41);
            ax8 = (int)far_de41c();
        }
    }
    ax9 = ((char)(ax8 >> 8) << 8 | (unsigned char)B_955F);
    if ((char)ax9 != B_955E) {
        t9 = far_de3fa();
        ax9 = ((char)((int)t9 >> 8) << 8 | (unsigned char)B_955F);
        B_955E = (char)ax9;
    }
    ax = ((char)(ax9 >> 8) << 8 | (unsigned char)B_9783);
    if ((char)ax != B_955D) {
        t10 = far_de3fa();
        ax = ((char)((int)t10 >> 8) << 8 | (unsigned char)B_9783);
        B_955D = (char)ax;
    }
    if (B_A5C1 != 2 && B_A5C1 != 4) {
        if (B_A5C1 == 0) {
            ax = B_A5C2;
            if ((ax & 20) == 0) {
L2:
                if (B_9447 == 0) {
                    t11 = far_db274();
                }
                t12 = far_dad87();
                ax = (int)far_de41c();
            }
        } else {
            goto L2;
        }
    }
    if (B_A5C1 >= 6) {
        if (W_8810 != 0 && W_8810 != W_880C) {
            ax10 = 0;
        } else {
            ax10 = 1;
        }
        B_8807 = (char)ax10;
        if (B_A570 != 0) {
            B_880A = (char)0;
        } else {
            if (B_8807 != 0) {
                if (B_A5C8 != 0) {
                    if (B_96EE != 0) {
                        t13 = far_dd405();
                    } else {
                        far_dd4d8();
                    }
                    dx = (int)(far_de41c() >> 16);
                }
                ax10 = W_8814;
                W_8812 = ax10;
                W_8814 = 0;
                B_880A = (char)1;
            }
            if (W_880E == 0) {
                ax10 = far_de95a();
            }
            if (B_880A == 2) {
                ax10 = (int)far_dca3e();
            }
        }
        if (W_9051 == 0) {
            ax10 = far_d9748();
        }
        ax11 = ((char)(ax10 >> 8) << 8 | (unsigned char)B_8809);
        W_880E = W_880E + 1;
        if ((int)(unsigned char)(char)ax11 <= W_880E) {
            W_880E = 0;
        }
        ax12 = B_8808;
        W_8810 = W_8810 + 1;
        if (ax12 <= W_8810) {
            W_8810 = 0;
        }
        if (W_8810 != 0 && W_8810 != W_880C) {
            ax13 = 0;
        } else {
            ax13 = 1;
        }
        B_8807 = (char)ax13;
        W_8814 = W_8814 + 1;
        ax = far_db0a2((unsigned char far *)B_901B);
        if (B_8C41 >= 0) {
            ax = far_db0a2((char far *)&B_8C41);
        }
    }
    if (B_A5C1 == 4) {
        W_904F = W_904F + 1;
        ax = W_904F;
        if (ax >= W_9059) {
            W_904F = 0;
        }
    }
    if (B_A5C1 >= 6) {
        t15 = far_de9ec();
        t16 = far_de362();
        t17 = far_dda74((unsigned char far *)B_901B);
        ax = (int)far_dda74((char far *)&B_8C41);
    }
L1:
    return ax;
}
