/* differs: 308 at +0, 4188 bytes; 311 at +0, 4191 bytes; 312 at +0, 4192 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_7FD1;
extern unsigned char B_8186;
extern unsigned char B_8270;
extern unsigned char B_8800;
extern unsigned char B_8804;
extern unsigned char B_8A9E;
extern unsigned char B_901B;
extern unsigned char B_901C;
extern unsigned char B_9457;
extern unsigned char B_9560;
extern unsigned char B_956C;
extern unsigned char B_A574;
extern unsigned char B_A5BE;
extern unsigned char B_A5C2;
extern unsigned char B_A5C3;
extern unsigned char B_A5C9;
extern unsigned char B_D4BE;
extern unsigned char B_D5EC;
extern unsigned char B_D5ED;
extern unsigned char B_D5EE;
extern unsigned char B_D608;
extern unsigned char B_D609;
extern unsigned char B_D60A;
extern unsigned char B_D60B;
extern unsigned char B_D612;
extern unsigned char B_D613;
extern unsigned char TBL_0F7F;
extern unsigned char TBL_882A;
extern unsigned char TBL_882C;
extern unsigned char TBL_882E;
extern unsigned char TBL_A5CA;
extern unsigned char TBL_A79A;
extern unsigned char TBL_D62B;
extern unsigned char TBL_d71fa[];
extern unsigned char W_8271;
extern unsigned char W_8273;
extern unsigned char W_8275;
extern unsigned char W_8277;
extern unsigned char W_8279;
extern unsigned char W_827B;
extern unsigned char W_827D;
extern unsigned char W_827F;
extern unsigned char W_87EE;
extern unsigned char W_87F6;
extern unsigned char W_87F8;
extern unsigned char W_87FA;
extern unsigned char W_87FC;
extern unsigned char W_881E;
extern unsigned char W_8820;
extern unsigned char W_8822;
extern unsigned char W_8826;
extern unsigned char W_9039;
extern unsigned char W_903B;
extern unsigned char W_903D;
extern unsigned char W_903F;
extern unsigned char W_9041;
extern unsigned char W_9043;
extern unsigned char W_9045;
extern unsigned char W_9047;
extern unsigned char W_904B;
extern unsigned char W_904D;
extern unsigned char W_9059;
extern unsigned char W_A576;
extern unsigned char W_A578;
extern unsigned char W_A57A;
extern unsigned char W_A57C;
extern unsigned char W_D5F3;
extern unsigned char W_D5F5;
extern unsigned char W_D5F7;
extern unsigned char W_D5F9;
extern unsigned char W_D5FB;
extern unsigned char W_D610;
extern unsigned char W_D617;
extern unsigned char W_D619;
extern unsigned char W_D62D;
extern unsigned char W_D62F;
extern unsigned char W_D635;
extern unsigned char W_D637;
extern unsigned char W_D639;
extern unsigned char W_D63B;
extern unsigned char W_D63D;
extern unsigned char W_D63F;
extern unsigned char W_D641;
extern unsigned char W_D64B;
extern unsigned char W_D64D;
extern unsigned char W_D64F;
extern unsigned char W_D655;
extern long far far_d5fd0(void);
extern int far far_d7903(void);
extern int far far_d7b38(void);
extern int far far_d9748(void);
extern long far far_dcca0(void);
extern long far far_dd212(void);
extern void far far_dd6dd(void);
extern void far far_dd8ff(void);
extern int far far_fb14d(void);
extern int far far_fb18a(void);
extern long far far_fb38c(void);
extern int far far_fb3a9(void);
extern int far far_fb4a2(void);

long interrupt far far_d6d98(void)
{
    unsigned int ax;
    unsigned int ax10;
    unsigned int ax11;
    int ax12;
    int ax13;
    int ax14;
    unsigned int ax15;
    int ax16;
    unsigned int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    unsigned int bx;
    unsigned int bx10;
    int bx11;
    unsigned int bx2;
    int bx3;
    int bx4;
    unsigned int bx5;
    unsigned int bx6;
    unsigned int bx7;
    unsigned int bx8;
    unsigned int bx9;
    unsigned int cx;
    unsigned int cx2;
    int di;
    int dx;
    int dx10;
    int dx2;
    int dx3;
    int dx4;
    int dx5;
    int dx6;
    int dx7;
    unsigned int dx8;
    unsigned int dx9;
    int es;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int p2;
    int p4;
    int si;
    int t1;
    long t10;
    long t11;
    int t12;
    int t13;
    long t14;
    int t15;
    long t16;
    long t2;
    long t3;
    long t4;
    int t5;
    int t6;
    int t7;
    int t8;
    int t9;

    bx = UNDEF;
    cx = UNDEF;
    dx = (int)(far_fb14d() >> 16);
    es = -0x7ff0;
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D64B) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D64B) + 1;
    if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D60A) != 0) {
        bx = ((char)(bx >> 8) << 8 | (unsigned char)*(char far *)MK_FP(-0x7ff0, (unsigned)&B_7FD1));
        if ((char)bx == 2 || (char)bx == 1 || *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) == 0) {
            bx = UNDEF;
            cx = UNDEF;
            es = UNDEF;
            dx2 = (int)(far_d5fd0() >> 16);
            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D63D) = bx;
            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D63F) = cx;
            if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_956C) != 0) {
                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_956C) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_956C) - 1);
            } else {
                bx = bx - *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D641);
                cx = (int)(((long)cx << 16 | (unsigned)bx) - *(long far *)MK_FP(-0x7ff0, (unsigned)&W_D641) >> 16);
                if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_7FD1) == 4) {
                    if (cx >= 61) {
                        goto L1;
                    }
                } else if (cx >= 6) {
L1:
                    flags = *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D60A) - 14;
                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D60A) = (char)0;
                    if (!CC("==", flags)) {
                        far_dd6dd();
                        bx = UNDEF;
                        cx = UNDEF;
                        es = UNDEF;
                        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D4BE) = (char)80;
                    }
                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D5EE) = (char)0;
                }
            }
        }
    }
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8820) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8820) + 1;
    if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) < 6) {
        if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D60A) == 16) {
            if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) == 0) {
                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) = (char)4;
                *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D639) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D639) + 1;
                *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D63B) = (int)(*(long far *)MK_FP(-0x7ff0, (unsigned)&W_D639) + 1L >> 16);
            }
            if ((*(int far *)MK_FP(-0x7ff0, (unsigned)&W_D64B) & 63) == 0) {
                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D4BE) = (char)80;
            }
            *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) - 1);
        } else {
            *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) = (char)0;
        }
    } else {
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9041) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9041) + 1;
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9043) = (int)(*(long far *)MK_FP(-0x7ff0, (unsigned)&W_9041) + 1L >> 16);
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045) + 1;
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) = (int)(*(long far *)MK_FP(-0x7ff0, (unsigned)&W_9045) + 1L >> 16);
        ax = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5F3);
        bx2 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5F5);
        ax2 = ax + *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D64D);
        bx = bx2 + *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D64F) + (ax2 < ax);
        cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5F7) + (bx < bx2);
        flags2 = cx - *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D62F);
        if (!CC("<u", flags2)) {
            if (!CC(">u", flags2)) {
                flags3 = bx - *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D62D);
                if (!CC("<u", flags3) && (CC(">u", flags3) || ax2 >= (unsigned int)*(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_D62B))) {
L2:
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5F9) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5F9) + 1;
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5FB) = (int)(*(long far *)MK_FP(-0x7ff0, (unsigned)&W_D5F9) + 1L >> 16);
                    ax2 = ax2 - *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_D62B);
                    bx = (int)(((long)bx << 16 | (unsigned)ax2) - *(long far *)MK_FP(-0x7ff0, (unsigned)&TBL_D62B) >> 16);
                    cx = (int)(((long)cx << 16 | (unsigned)bx) - *(long far *)MK_FP(-0x7ff0, (unsigned)&W_D62D) >> 16);
                }
            } else {
                goto L2;
            }
        }
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5F3) = ax2;
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5F5) = bx;
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D5F7) = cx;
        if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) == 0) {
            bx = (unsigned char)*(char far *)MK_FP(-0x7ff0, (unsigned)&B_7FD1);
            *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) = *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_0F7F + bx);
            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D639) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D639) + 1;
            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D63B) = (int)(*(long far *)MK_FP(-0x7ff0, (unsigned)&W_D639) + 1L >> 16);
        }
        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) - 1);
        *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882A) = *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882A) - 1;
        flags4 = *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882A) - 1;
        if (!CC("==", flags4)) {
            *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882C) = *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882C) - 0 - CC("<u", flags4);
        } else if (*(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882C) == 0) {
            bx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8826);
            if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D612) == 0) {
                goto L3;
            }
            if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D60A) != 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_7FD1) != 2 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_7FD1) != 1) {
                goto L3;
            }
            ax3 = *(int far *)MK_FP(-0x7ff0, bx + 4);
            if (ax3 == 0) {
                if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_8800) == 0) {
                    if ((*(char far *)MK_FP(-0x7ff0, (unsigned)&B_901C) & 1) != 0) {
                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D610) = *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882E);
                        t2 = far_dcca0();
                        cx = UNDEF;
                        es = UNDEF;
                        p2 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903B);
                        p4 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9039);
                        bx3 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8822);
                        goto L4;
                    }
                } else {
                    bx = (unsigned char)*(char far *)MK_FP(-0x7ff0, (unsigned)&B_8804);
                    if ((*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_A79A + bx) & 1) != 0) {
                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D610) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87EE);
                        t3 = far_dcca0();
                        cx = UNDEF;
                        es = UNDEF;
                        p2 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87F8);
                        p4 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87F6);
                        bx3 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8822);
                        goto L4;
                    }
                }
            } else {
                *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D610) = ax3;
                t4 = far_dcca0();
                bx = UNDEF;
                cx = UNDEF;
                es = UNDEF;
L3:
                p2 = *(int far *)MK_FP(-0x7ff0, bx + 2);
                p4 = *(int far *)MK_FP(-0x7ff0, bx);
                bx3 = bx + 6;
L4:
                *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8826) = bx3;
                ax4 = *(int far *)MK_FP(-0x7ff0, bx3);
                dx3 = *(int far *)MK_FP(-0x7ff0, bx3 + 2);
                bx = p2;
                *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882A) = ax4 - p4;
                *(int far *)MK_FP(-0x7ff0, (unsigned)&TBL_882C) = (int)(((long)dx3 << 16 | (unsigned)ax4) - ((long)bx << 16 | (unsigned)p4) >> 16);
            }
        }
    }
    ax5 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D655);
    outp(-0x3fcf, (char)ax5);
    outp(-0x3fcf, (char)(ax5 >> 8));
    _enable();
    ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C3));
    ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)((char)ax6 & 63));
    bx4 = ((char)(bx >> 8) << 8 | (unsigned char)*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613));
    if ((char)bx4 == 0) {
        if ((char)ax7 == (char)bx4) {
            goto L5;
        }
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A576) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903D);
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A578) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903F);
L6:
        if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_8800) != 0) {
            cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
            if (cx == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87FA)) {
                cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047);
                if (cx == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87FC)) {
                    bx4 = bx4;
                    if ((*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_A79A + (unsigned char)*(char far *)MK_FP(-0x7ff0, (unsigned)&B_8804)) & 1) == 0) {
                        goto L7;
                    }
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87F6);
                    cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87F8);
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) = cx;
L8:
                    goto L9;
                }
                goto L8;
            }
            goto L8;
        }
        cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
        if (cx == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A576)) {
            cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047);
            if (cx == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A578)) {
                if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_8A9E) > 0) {
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A576) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A57A);
                    cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A57C);
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A578) = cx;
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045) = 0;
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) = 0;
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9041) = 0;
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9043) = 0;
                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_8A9E) = (char)-1;
L10:
                    goto L9;
                }
                if ((*(char far *)MK_FP(-0x7ff0, (unsigned)&B_901C) & 1) != 0) {
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9039);
                    cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903B);
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) = cx;
                    if (*(int far *)MK_FP(-0x7ff0, (unsigned)&W_904D) == 1) {
                        if ((char)ax7 == 8) {
                            *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C2) = (char)16;
                            *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C3) = (char)10;
                            far_dd8ff();
                            bx4 = UNDEF;
                            cx = UNDEF;
                            es = UNDEF;
                            ax7 = UNDEF;
                        }
                    } else if ((unsigned char)(char)ax7 >= 8) {
                        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C2) = (char)1;
                        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C3) = (char)6;
                        far_dd8ff();
                        bx4 = UNDEF;
                        cx = UNDEF;
                        es = UNDEF;
                        ax7 = UNDEF;
                    }
                    goto L9;
                }
                if ((char)ax7 == 8 && (unsigned int)*(int far *)MK_FP(-0x7ff0, (unsigned)&W_904B) < 0x3e7) {
                    cx2 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9059);
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903D) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903D) + cx2;
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903F) = (int)(*(long far *)MK_FP(-0x7ff0, (unsigned)&W_903D) + (unsigned long)(unsigned int)cx2 >> 16);
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A576) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903D);
                    cx = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_903F);
                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A578) = cx;
L9:
                    if ((char)ax7 != 0) {
                        if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9457) != 0) {
                            goto L7;
                        }
L5:
                        switch ((unsigned int)(unsigned)(TBL_d71fa + (unsigned char)(char)bx4)) {
                        case 0:
                            if ((char)ax7 != 0) {
                                if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C9) != 0) {
                                    ax8 = far_d7903();
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)2;
                                } else {
                                    goto L11;
                                }
                            }
                            break;
                        case 1:
                            ax7 = far_d7b38();
                            if (ax7 != 0) {
                                t12 = far_d7903();
                                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C9) = (char)0;
                                t13 = __insn("int 0x46", 3, UNDEF, UNDEF, UNDEF, si, di, UNDEF, -0x7ff0);
                                ax7 = t12;
                                goto L12;
                            }
                            if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C9) == 0) {
L12:
L11:
                                if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9560) != 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_8270) != 2 && ((char)ax7 == 8 || (char)ax7 == 10) && (*(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045) != *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8271) || *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) != *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8273))) {
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5BE) = (char)ax7;
                                    t14 = far_fb38c();
                                    ax7 = ax7;
                                }
                                if (*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_A5CA) != 0 && (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_8186) == 0 || (char)ax7 != 6)) {
                                    ax9 = far_d9748();
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)4;
                                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_881E) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9059);
                                } else {
                                    goto L13;
                                }
                            }
                            break;
                        case 2:
                            if ((char)ax7 == 0) {
                                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)0;
                                *(int far *)MK_FP(-0x7ff0, (unsigned)&W_881E) = 0;
                            } else {
                                *(int far *)MK_FP(-0x7ff0, (unsigned)&W_881E) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_881E) - 1;
                                if (*(int far *)MK_FP(-0x7ff0, (unsigned)&W_881E) == 1) {
L13:
                                    if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5BE) != 0) {
                                        ax7 = ((char)(ax7 >> 8) << 8 | (unsigned char)6);
                                        goto L14;
                                    }
                                    bx11 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                    if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_8800) != 0) {
                                        if (bx11 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87FA) && *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_87FC)) {
                                            goto L7;
                                        }
                                        goto L15;
                                    }
                                    if (bx11 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A576) && *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A578)) {
L7:
                                        far_dd6dd();
L16:
                                        goto L17;
                                    }
L15:
                                    if ((char)ax7 == 8 || (char)ax7 == 10) {
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8279) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_827B) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047);
                                    }
L14:
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)ax7;
                                    ax10 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9041);
                                    dx8 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9043);
                                    if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_7FD1) == 4) {
                                        ax11 = (unsigned)((unsigned long)((long)dx8 << 16 | (unsigned)ax10) / 96L);
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D639) = ax11;
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D63B) = (unsigned)((unsigned long)((long)dx8 << 16 | (unsigned)ax10) % 96L);
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D635) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D635) + ax11;
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D637) = (int)(*(long far *)MK_FP(-0x7ff0, (unsigned)&W_D635) + (unsigned long)(unsigned int)ax11 >> 16);
                                    } else {
                                        dx9 = dx8 >> 1;
                                        dx10 = dx9 >> 1;
                                        ax12 = (ax10 >> 1 | (dx8 & 1) << 15) >> 1 | (dx9 & 1) << 15;
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D639) = ax12;
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D63B) = dx10;
                                        if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D608) != 0) {
                                            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D635) = ax12;
                                            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D637) = dx10;
                                        }
                                    }
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D608) = (char)0;
                                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D64B) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9041);
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D5ED) = (char)0;
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D609) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_0F7F + (unsigned char)*(char far *)MK_FP(-0x7ff0, (unsigned)&B_7FD1)) - 1);
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A574) = (char)1;
                                }
                            }
                            break;
                        case 3:
                            if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9560) != 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_8270) != 2 && (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_901B) == 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5BE) != 0)) {
                                bx9 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                bx10 = bx9 + 1;
                                dx6 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) + (bx10 < bx9);
                                if (bx10 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A576) && dx6 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A578)) {
                                    bx10 = 0;
                                    dx6 = 0;
                                }
                                if (bx10 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8271) && dx6 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8273)) {
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5BE) = (char)0;
                                    dx7 = ((char)(dx6 >> 8) << 8 | (unsigned char)7);
                                    if ((char)ax7 == 8) {
                                        dx7 = ((char)(dx7 >> 8) << 8 | (unsigned char)6);
                                    }
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)ax7;
                                    t9 = __insn("int 0x46", (1 << 8 | (unsigned char)(char)dx7), bx10, cx, dx7, si, di, es, -0x7ff0);
                                    ax7 = ax7;
                                    goto L18;
                                }
                                goto L19;
                            }
                            if ((char)ax7 == 6) {
L19:
                            } else {
                                if ((char)ax7 == 0) {
                                    goto L17;
                                }
                                if ((char)ax7 == 8) {
                                    if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9560) != 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_8270) != 2) {
                                        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5BE) = (char)ax7;
                                        t10 = far_fb38c();
                                        ax7 = ((char)((int)t10 >> 8) << 8 | (unsigned char)6);
L20:
                                        if ((char)ax7 == 10) {
                                            if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9560) != 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_8270) != 2) {
                                                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5BE) = (char)ax7;
                                                t11 = far_fb38c();
                                                ax7 = ((char)((int)t11 >> 8) << 8 | (unsigned char)6);
                                            }
L18:
                                            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8279) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                            *(int far *)MK_FP(-0x7ff0, (unsigned)&W_827B) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047);
                                        }
                                    } else {
                                        goto L18;
                                    }
                                } else {
                                    goto L20;
                                }
                                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)ax7;
                            }
                            break;
                        case 4:
                            if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9560) != 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_8270) != 1) {
                                bx7 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                bx8 = bx7 + 1;
                                dx5 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) + (bx8 < bx7);
                                if (bx8 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A576) && dx5 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A578)) {
                                    bx8 = 0;
                                    dx5 = 0;
                                }
                                if (bx8 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8275) && dx5 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8277)) {
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)6;
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C3) = (char)6;
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C2) = (char)1;
                                    t8 = __insn("int 0x46", 6, bx8, cx, dx5, si, di, es, -0x7ff0);
                                    ax7 = ((char)(ax7 >> 8) << 8 | (unsigned char)6);
                                    goto L21;
                                }
L22:
                                if ((char)ax7 != 8) {
                                    if ((char)ax7 == 0) {
                                        goto L17;
                                    }
L21:
                                    if ((char)ax7 == 6) {
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_827D) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_827F) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047);
                                    }
                                    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)ax7;
                                }
                            } else {
                                goto L22;
                            }
                            break;
                        case 5:
                            if ((char)ax7 == 10) {
                                if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9560) != 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_8270) != 1) {
                                    bx5 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                    bx6 = bx5 + 1;
                                    dx4 = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047) + (bx6 < bx5);
                                    if (bx6 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A576) && dx4 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_A578)) {
                                        bx6 = 0;
                                        dx4 = 0;
                                    }
                                    if (bx6 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8275) && dx4 == *(int far *)MK_FP(-0x7ff0, (unsigned)&W_8277)) {
                                        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)6;
                                        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C3) = (char)6;
                                        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C2) = (char)1;
                                        t7 = __insn("int 0x46", 7, bx6, cx, dx4, si, di, es, -0x7ff0);
                                        ax7 = ((char)(ax7 >> 8) << 8 | (unsigned char)6);
                                        goto L23;
                                    }
                                }
                                goto L24;
                            }
                            if ((char)ax7 == 0) {
L17:
                                if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) >= 8) {
                                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_827D) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_827F) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047);
                                }
                                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5C3) = (char)0;
                                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)0;
                                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_A5BE) = (char)0;
                            } else {
                                if ((char)ax7 == 6) {
                                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_827D) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
                                    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_827F) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047);
                                }
L23:
                                *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) = (char)ax7;
L24:
                            }
                            break;
                        }
                    } else {
                        goto L16;
                    }
                } else {
                    goto L7;
                }
            } else {
                goto L10;
            }
        } else {
            goto L10;
        }
    } else {
        goto L6;
    }
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D617) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9045);
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_D619) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9047);
    _disable();
    far_fb4a2();
    ax14 = far_fb3a9();
    if (!CC("==", UNDEF) && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) != 0) {
        *(char far *)MK_FP(-0x7ff0, (unsigned)&B_9457) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_9457) | 1);
    }
    if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D60B) != 0) {
        ax15 = 0x1a0a;
        if ((unsigned char)*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D613) >= 6 && (*(int far *)MK_FP(-0x7ff0, (unsigned)&W_D64B) & 2) == 0) {
            ax15 = ax15 >> 1;
        }
        outp(244, (char)ax15);
        outp(244, (char)(ax15 >> 8));
    }
    if ((*(int far *)MK_FP(-0x7ff0, (unsigned)&W_D64B) & 3) == 0 && *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D5ED) == 0) {
        if (*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D5EC) > 0) {
            *(char far *)MK_FP(-0x7ff0, (unsigned)&B_D5EC) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_D5EC) - 1);
        } else {
            ax16 = (int)far_dd212();
        }
    }
    _disable();
    outp(-0x3ff0, (char)97);
    outp(-0x3ff0, (char)-60);
    t16 = far_fb18a();
    return 0L;
}
