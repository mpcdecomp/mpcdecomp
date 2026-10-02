/* differs: 308 at +5, 2423 bytes; 311 at +5, 2415 bytes; 312 at +5, 2415 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FD0;
extern char B_7FE3;
extern char B_7FE8;
extern char B_8186;
extern char B_8800;
extern unsigned char B_8803;
extern unsigned char B_8804;
extern char B_8A9E;
extern char B_8A9F;
extern char B_901B;
extern char B_901C;
extern char B_9447;
extern char B_9457;
extern char B_955C;
extern char B_956A;
extern char B_956C;
extern char B_956D;
extern char B_A570;
extern char B_A574;
extern char B_A575;
extern char B_A5C0;
extern char B_A5C1;
extern char B_A5C2;
extern char B_A5C3;
extern char B_A5C9;
extern unsigned char B_A5CE;
extern char B_D4AB;
extern char B_D4B5;
extern char B_D4BE;
extern char B_D4C2;
extern char B_D5DD;
extern char B_D5DE;
extern char B_D60A;
extern unsigned char TBL_956E[];
extern unsigned char TBL_966E[];
extern char TBL_A5CA;
extern char TBL_A79A[];
extern unsigned char TBL_df97d[];
extern unsigned char TBL_df9c5[];
extern int W_87FE;
extern int W_9041;
extern int W_9045;
extern int W_9047;
extern int W_904B;
extern int W_904D;
extern int W_9053;
extern unsigned int W_96F6;
extern int W_96F8;
extern int W_A5CB;
extern int W_D4AF;
extern int W_D5E5;
extern int W_D5E7;
extern int W_D5E9;
extern int W_D5F9;
extern int W_D5FB;
extern long far L_ef4d3(void);
extern long far far_b059a(int);
extern long far far_c41b2(void);
extern long far far_d7b8f(int, int);
extern void far far_dd6e2(void);
extern void far far_dd970(void);
extern int far far_de88f(int, int, int);
extern int far far_deee8(char far *, int);
extern long far far_df015(void);
extern void far far_df9d3(int, int);
extern long far far_e15e2(int);
extern long far far_e2ce3(void);
extern long far far_e37be(char far *);
extern int far far_e3b75(void);
extern long far far_e4094(int, int);
extern long far far_e562e(void);
extern long far far_e57bd(void);
extern long far far_e5a99(char far *);
extern long far far_e68b0(void);
extern long far far_e6fef(void);
extern long far far_e7073(int, int);
extern long far far_e710e(int);
extern void far far_e7c91(void);
extern int far far_ea926(int);
extern long far far_eb228(long);
extern long far far_ebc0b(void);
extern long far far_fa0c8(int, int, int);
extern long far fn_dfab9(void);

long far far_df14a(char arg_0)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int loc_8;
    unsigned int loc_a;
    int loc_c;
    unsigned int loc_e;
    int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax2;
    unsigned int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int ax8;
    int ax9;
    int bx;
    unsigned int bx2;
    int cx;
    int cx2;
    unsigned int dx;
    int dx2;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int t1;
    long t10;
    int t11;
    int t12;
    long t13;
    long t14;
    int t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    int t21;
    long t22;
    long t23;
    int t24;
    long t25;
    int t26;
    long t27;
    int t28;
    int t29;
    int t3;
    int t30;
    long t31;
    long t32;
    long t33;
    long t34;
    long t35;
    int t36;
    long t37;
    long t38;
    long t39;
    long t4;
    long t40;
    long t41;
    int t42;
    long t43;
    long t44;
    int t45;
    long t46;
    long t47;
    long t5;
    int t6;
    int t7;
    long t8;
    int t9;

    ax = arg_0;
    flags = ax - 89;
    if (!CC("!=", flags)) {
        far_e7c91();
        if ((int)fn_dfab9() != 0) {
            dx = (int)(far_e6fef() >> 16);
            arg_0 = (char)0;
        } else {
            t2 = far_e2ce3();
            W_96F8 = (int)(t2 >> 16);
            W_96F6 = (int)t2;
            flags2 = W_96F8;
            if (!CC(">", flags2) && (CC("<", flags2) || W_96F6 < 0x190)) {
                B_9457 = (char)(B_9457 | 4);
                dx = (int)(far_e6fef() >> 16);
                arg_0 = (char)0;
            } else {
                if (TBL_A5CA != 0 && (B_8186 == 0 || (B_A5C2 & 1) == 0 && B_8186 != 0)) {
                    t3 = far_deee8((char far *)&B_901B, W_9053);
                    t4 = far_e562e();
                    t5 = L_ef4d3();
                    t6 = far_ea926(0);
                }
                if (B_8800 != 0) {
                    if (W_9053 > W_87FE && TBL_A79A[B_8804] != 0) {
                        t7 = far_deee8((char far *)&B_901B, W_A5CB);
                        t8 = far_e562e();
                    }
                } else if (W_9053 > W_904B && (B_901C & 1) != 0) {
                    t9 = far_deee8((char far *)&B_901B, W_904D);
                    t10 = far_e562e();
                }
                far_dd970();
                dx = UNDEF;
                if (B_D60A == 18) {
                    B_D60A = (char)20;
                }
                if (B_D60A == 10) {
                    B_D60A = (char)12;
                }
                arg_0 = (char)0;
            }
        }
    } else if (!CC(">", flags)) {
        flags3 = ax - 81;
        if (!CC("!=", flags3)) {
            far_e7c91();
            dx = UNDEF;
            if (B_D5DE == 75 && B_D5DD >= 10 && B_D5DD <= 15) {
                arg_0 = (char)0;
            } else if (B_D5DE != 83 || B_D5DD != 0) {
                if (B_D4C2 == 83) {
                    B_D4C2 = (char)77;
                }
                arg_0 = B_D4C2;
            }
        } else if (!CC(">", flags3)) {
            flags4 = ax - 67;
            if (!CC("!=", flags4)) {
                ax2 = 0 - (TBL_A5CA != 0);
                TBL_A5CA = (char)((char)ax2 + 1);
                dx = (int)(far_d7b8f(4, (signed char)((char)ax2 + 1)) >> 16);
                arg_0 = (char)0;
            } else if (!CC(">", flags4)) {
                if (ax == 35) {
                    if (B_7FD0 != 0) {
                        t13 = *(long *)((char *)&W_9041 + 0) / 24L;
                        t14 = far_fa0c8(24, (int)t13, (int)(t13 >> 16));
                        far_df9d3((int)t14, (int)(t14 >> 16));
                        W_D4AF = -1;
                        dx = (int)(L_ef4d3() >> 16);
                    }
                    arg_0 = (char)0;
                } else if (ax == 36) {
                    if (B_D5DE != 77) {
                        arg_0 = (char)0;
                    }
                } else if (ax == 64) {
                    t16 = far_e5a99((char far *)&B_901B);
                    if (B_7FD0 != 0) {
                        loc_8 = 0;
                        loc_a = 23;
                    } else {
                        loc_8 = 0;
                        loc_a = 8;
                    }
                    t17 = far_e57bd();
                    ax3 = (int)t17 + loc_a;
                    t18 = far_eb228(((long)((int)(t17 >> 16) + loc_8 + (ax3 < (unsigned int)(int)t17)) << 16 | (unsigned)ax3));
                    dx = (int)(t18 >> 16);
                    if ((int)t18 == 0) {
                        if (B_7FD0 != 0) {
                            dx2 = loc_6;
                            t19 = (((long)loc_4 << 16 | (unsigned)dx2) + 24L) / 24L;
                            t20 = far_fa0c8(24, (int)t19, (int)(t19 >> 16));
                            loc_4 = (int)(t20 >> 16);
                            loc_6 = (int)t20;
                            far_df9d3((int)t20, (int)(t20 >> 16));
                            t22 = L_ef4d3();
                            t23 = far_e68b0();
                        } else {
                            far_df9d3(loc_6, loc_4);
                        }
                        t25 = far_e57bd();
                        cx = W_D5F9;
                        cx2 = cx - (int)t25;
                        bx = (int)(((long)W_D5FB << 16 | (unsigned)cx) - t25 >> 16);
                        loc_c = bx;
                        loc_e = cx2;
                        dx = cx2;
                        if (bx >= 0 && (bx != 0 || dx >= 3)) {
                            ax4 = loc_c;
                            flags5 = ax4 - loc_8;
                            if (!CC("<", flags5) && (CC(">", flags5) || loc_e > loc_a)) {
                                loc_c = loc_8;
                                loc_e = loc_a;
                            }
                            dx = (int)(far_b059a((int)(loc_e + 2) / 3) >> 16);
                        }
                        if (B_D60A == 10) {
                            far_dd6e2();
                            dx = UNDEF;
                        }
                    }
                    B_956C = (char)0;
                    arg_0 = (char)0;
                }
            } else if (ax == 69) {
                if (B_A5C2 != 0) {
                    __stos2((unsigned char far *)TBL_956E, 0, 128);
                    if (B_D5DE != 77) {
                        arg_0 = (char)0;
                    }
                }
            } else if (ax == 80) {
                if (B_9447 == 0) {
                    if (B_D5DE == 76 && B_D5DD == 5) {
                        dx = (int)(far_c41b2() >> 16);
                        goto L1;
                    }
                    if ((B_A5C2 & 21) != 0) {
                        ax5 = far_ea926(1);
                        dx = UNDEF;
                    } else {
                        t27 = far_e7073(W_9045, W_9047);
                        ax6 = far_ea926(0);
                        dx = UNDEF;
                    }
                    if (B_D5DE == 71) {
                        dx = B_8803 + 1;
                        if (B_A5CE == dx || B_A5C2 == 0) {
L2:
                            if (B_8A9E < 0) {
                                if (B_D5DE != 77) {
                                    if (B_A570 != 0) {
                                        ax7 = far_ea926(0);
                                        dx = UNDEF;
                                    }
L3:
                                    if (B_D5DE == 74) {
                                        if (B_D5DD != 1) {
                                            if (B_D5DD != 2) {
L4:
                                                if (B_D5DE != 76 || B_D5DD != 1) {
                                                    if (B_D5DE != 115 || B_D5DD != 3) {
L1:
                                                        arg_0 = (char)0;
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        goto L4;
                                    }
                                }
                            } else {
                                goto L3;
                            }
                        }
                    } else {
                        goto L2;
                    }
                }
            }
        } else if ((unsigned int)(ax - 82) <= 6) {
            switch ((unsigned int)(unsigned)(TBL_df9c5 + (ax - 82 << 1))) {
            case 0:
                if (B_A5C2 != 0) {
                    if (B_7FE3 != 0) {
                        if (B_D5DE != 77) {
                            arg_0 = (char)0;
                        }
                    } else {
                        arg_0 = (char)0;
                    }
                }
                break;
            case 1:
            case 3:
                break;
            case 2:
                arg_0 = (char)0;
                t31 = far_ebc0b();
                dx = (int)(t31 >> 16);
                loc_2 = (int)t31;
                if ((int)t31 != 0) {
                    if (B_901B < 0) {
                        t32 = far_e15e2(B_8A9F);
                        B_D4BE = (char)80;
                        B_8A9E = (char)-1;
                    }
                    t33 = far_e710e(far_de88f(loc_2, 0, 0));
                    ax8 = far_ea926(0);
                    dx = UNDEF;
                } else {
                    if (B_D4C2 != 71) {
                        B_D4C2 = (char)77;
                    }
                    if (B_D5DE != B_D4C2) {
                        arg_0 = B_D4C2;
                    }
                }
                break;
            case 4:
            case 5:
                far_e7c91();
                dx = UNDEF;
                arg_0 = (char)87;
                break;
            case 6:
                if (B_A575 == 0) {
                    while (B_A5C1 != 0) {
                    }
                    B_956A = (char)(B_956A + 1);
                    far_e7c91();
                    far_df9d3(W_D5E7, W_D5E9);
                    dx = (int)(far_e37be((char far *)&B_901B) >> 16);
                    B_A575 = (char)1;
                    B_956A = (char)(B_956A - 1);
                }
                B_A574 = (char)0;
                arg_0 = (char)0;
                break;
            }
        }
    } else {
        ax9 = ax - 90;
        bx2 = ax9;
        if (bx2 <= 35) {
            switch ((unsigned int)(unsigned)(TBL_df97d + (bx2 << 1))) {
            case 0:
                far_e7c91();
                t46 = fn_dfab9();
                dx = (int)(t46 >> 16);
                if ((int)t46 <= 0) {
                    t47 = far_df015();
                    ax14 = far_ea926(0);
                    dx = UNDEF;
                }
                arg_0 = (char)0;
                break;
            case 1:
            case 3:
            case 33:
            case 35:
                if (B_D5DE != 83) {
                    if (B_D5DE != 77 && B_D5DE != 71 && (B_D5DE != 47 && B_A570 == 0)) {
                        goto L5;
                    }
                    if (B_A5C1 != 0) {
                        t41 = far_e6fef();
                    }
                    far_e7c91();
                    if (B_8800 != 0) {
                        t43 = fn_dfab9();
                        dx = (int)(t43 >> 16);
                        if ((int)t43 != 0) {
                            arg_0 = (char)0;
                        } else {
L6:
                            t44 = far_e4094(((char)-(B_7FE8 < 0) << 8 | (unsigned char)arg_0), B_7FE8);
                            ax13 = far_ea926(0);
                            dx = UNDEF;
                            if (B_D5DE == 71) {
                                arg_0 = (char)80;
                            } else {
L5:
                                arg_0 = (char)0;
                            }
                        }
                    } else {
                        goto L6;
                    }
                }
                break;
            case 2:
            case 4:
            case 5:
            case 6:
            case 7:
            case 9:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 18:
            case 21:
            case 22:
            case 23:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 34:
                break;
            case 8:
                __stos2((unsigned char far *)TBL_966E, 0, 128);
                if (B_D4AB != 0) {
                    B_D4AB = (char)0;
                    dx = (int)(far_d7b8f(14, 0) >> 16);
                    arg_0 = (char)0;
                }
                break;
            case 10:
                if (B_956D != 0) {
                    ax9 = far_e3b75();
                    B_956A = (char)(B_956A - 1);
                }
                ax12 = ((char)(ax9 >> 8) << 8 | (unsigned char)B_D4B5);
                B_D4B5 = (char)((char)ax12 + 16);
                if ((char)((char)ax12 + 16) >= 64) {
                    B_D4B5 = (char)0;
                }
                t37 = far_d7b8f(9, 0);
                t38 = far_d7b8f(10, 0);
                t39 = far_d7b8f(11, 0);
                t40 = far_d7b8f(12, 0);
                dx = (int)(far_d7b8f((int)((long)(signed char)B_D4B5 / 16L) + 9, 1) >> 16);
                if (B_D5DE == 74) {
                    if (B_D5DD != 1) {
                        if (B_D5DD != 2) {
L7:
                            arg_0 = (char)0;
                        }
                    }
                } else {
                    goto L7;
                }
                break;
            case 11:
                if (B_A5C2 != 0) {
                    B_955C = (char)(B_955C | 64);
                }
                if (B_D5DE != 77) {
                    arg_0 = (char)0;
                }
                break;
            case 17:
                ax11 = 0 - (B_A5C9 != 0);
                B_A5C9 = (char)((char)ax11 + 1);
                dx = (int)(far_d7b8f(3, (signed char)((char)ax11 + 1)) >> 16);
                arg_0 = (char)0;
                break;
            case 19:
                if (B_D5DE != 77 && B_D5DE != 71 || B_A5C3 != 0) {
                    arg_0 = (char)0;
                }
                break;
            case 20:
                arg_0 = (char)0;
                t34 = fn_dfab9();
                dx = (int)(t34 >> 16);
                if ((int)t34 <= 0) {
                    if (B_A5C3 == 0) {
                        if (B_A5C0 == 0) {
                            ax10 = W_D5E5;
                            t35 = far_fa0c8(24, ax10, -(ax10 < 0));
                            far_df9d3((int)t35, (int)(t35 >> 16));
                            dx = (int)(L_ef4d3() >> 16);
                            if (B_D5DE == 71) {
                                arg_0 = (char)80;
                            }
                        }
                    }
                }
                break;
            case 24:
                if (B_A5C2 != 0) {
                    B_955C = (char)(B_955C | 64);
                }
                if (B_D5DE != 77) {
                    arg_0 = (char)0;
                }
                break;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)arg_0);
}
void far far_df9d3(int p0, int p1) { }
long far fn_dfab9(void) { return 0; }
