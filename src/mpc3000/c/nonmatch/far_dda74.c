/* differs: 308 at +3, 2080 bytes; 311 at +3, 2077 bytes; 312 at +3, 2079 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8800;
extern unsigned char B_8801;
extern unsigned char B_8803;
extern unsigned char B_8804;
extern unsigned char B_8807;
extern unsigned char B_8A9B;
extern unsigned char B_8A9D;
extern unsigned char B_8A9E;
extern unsigned char B_8C41[];
extern unsigned char B_955B;
extern unsigned char B_955C;
extern unsigned char B_956D;
extern unsigned char B_96EE;
extern unsigned char B_977D;
extern unsigned char B_977E;
extern unsigned char B_977F;
extern unsigned char B_A567;
extern unsigned char B_A568;
extern unsigned char B_A569;
extern unsigned char B_A56A;
extern unsigned char B_A56B;
extern unsigned char B_A56C;
extern unsigned char B_A56D;
extern unsigned char B_A56E;
extern unsigned char B_A570;
extern unsigned char B_A5C0;
extern unsigned char B_A5C1;
extern unsigned char B_A5C7;
extern unsigned char B_D4AC;
extern unsigned char B_D4BE;
extern unsigned char B_F77B;
extern unsigned char B_F77C;
extern unsigned char B_F77D;
extern unsigned char TBL_956E;
extern unsigned char TBL_966E;
extern unsigned char TBL_A787;
extern unsigned char TBL_A79B;
extern unsigned char TBL_A7AF;
extern unsigned char TBL_A7B0;
extern unsigned char TBL_F779[];
extern unsigned char TBL_F77A;
extern unsigned char TBL_ddecc[];
extern unsigned char W_720E;
extern unsigned char W_7210;
extern unsigned char W_7212;
extern unsigned char W_7214;
extern unsigned char W_902D;
extern unsigned char W_902F;
extern unsigned char W_9053;
extern unsigned char W_A5CB;
extern long far far_d97ca();
extern long far far_db58c();
extern long far far_dcc2e();
extern int far far_dccc4();
extern int far far_dd3c2();
extern int far far_dd9ba();
extern long far far_ddf77();
extern int far far_de95a();
extern int far far_deee8();
extern long far far_e723d();

long far far_dda74(long arg_0)
{
    unsigned int ax;
    int ax10;
    int ax11;
    int ax12;
    int ax13;
    int ax14;
    int ax15;
    int ax16;
    int ax17;
    int ax18;
    int ax19;
    int ax2;
    int ax20;
    int ax21;
    int ax22;
    int ax23;
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
    int di;
    int ds;
    int dx;
    int p10;
    int p18;
    long t1;
    int t10;
    long t11;
    int t12;
    long t13;
    int t14;
    long t15;
    int t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t3;
    long t4;
    int t5;
    long t6;
    int t7;
    int t8;
    long t9;

    for (;;) {
L1:
        di = (int)arg_0;
        ds = (int)(arg_0 >> 16);
        if (*(char far *)MK_FP(ds, di) >= 0 && *(int far *)MK_FP(ds, di + 58) == 0) {
            ax2 = *(int far *)MK_FP(ds, di + 18);
            *(int far *)MK_FP(ds, (unsigned)&W_7210) = *(int far *)MK_FP(ds, di + 20);
            *(int far *)MK_FP(ds, (unsigned)&W_720E) = ax2;
            t15 = far_d97ca(*(int far *)MK_FP(ds, di + 46), (unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F779), 0x640);
            dx = (int)(t15 >> 16);
            ax = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_F779) & 248;
            *(int far *)MK_FP(ds, (unsigned)&W_7212) = ax;
            if (ax == 136) {
                ax3 = *(int far *)MK_FP(ds, (unsigned)&TBL_F77A);
                ax4 = (unsigned int)((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 << 1)) >> 1;
                *(int far *)MK_FP(ds, di + 58) = ax4;
                ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)*(char far *)((char far *)*(long far *)MK_FP(ds, di + 18)));
                ax = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 & -8));
                if ((char)ax == -120) {
                    t1 = far_d97ca(*(int far *)MK_FP(ds, di + 46), (unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F779), 0x640);
                    dx = (int)(t1 >> 16);
                    ax6 = *(int far *)MK_FP(ds, (unsigned)&TBL_F77A);
                    ax = (unsigned int)((char)(ax6 >> 8) << 8 | (unsigned char)((char)ax6 << 1)) >> 1;
                    *(int far *)MK_FP(ds, di + 58) = *(int far *)MK_FP(ds, di + 58) + ax;
                }
                continue;
            }
            if (ax == 168) {
                t2 = far_e723d(MK_FP(ds, di), *(char far *)MK_FP(ds, (unsigned)&B_F77C), (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_F77D));
                p18 = di;
                t3 = far_dcc2e(MK_FP(ds, p18), (unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F779), (int)t15);
                ax = (int)t3;
                dx = (int)(t3 >> 16);
                continue;
            }
            if (ax == 248) {
                if ((*(char far *)MK_FP(ds, di + 1) & -128) != 0) {
                    if ((*(char far *)MK_FP(ds, di + 1) & 1) != 0) {
                        dx = *(int far *)MK_FP(ds, di + 28);
                        ax7 = *(int far *)MK_FP(ds, di + 26);
                        *(int far *)MK_FP(ds, di + 20) = dx;
                        *(int far *)MK_FP(ds, di + 18) = ax7;
                        ax = *(int far *)MK_FP(ds, di + 50);
                        *(int far *)MK_FP(ds, di + 56) = ax;
                        continue;
                    }
                    goto L2;
                }
                if (*(char far *)MK_FP(ds, (unsigned)&B_A5C0) != 0) {
                    goto L3;
                }
                if (*(char far *)MK_FP(ds, (unsigned)&B_8A9E) > 0) {
                    if (*(char far *)MK_FP(ds, di) == 2) {
                        ax8 = *(int far *)MK_FP(ds, di + 14);
                        *(int far *)MK_FP(ds, di + 20) = *(int far *)MK_FP(ds, di + 16);
                        *(int far *)MK_FP(ds, di + 18) = ax8;
                        ax9 = *(int far *)MK_FP(ds, di + 22);
                        *(int far *)MK_FP(ds, di + 16) = *(int far *)MK_FP(ds, di + 24);
                        *(int far *)MK_FP(ds, di + 14) = ax9;
                        *(char far *)MK_FP(ds, di) = (char)0;
                    }
                    *(int far *)MK_FP(ds, di + 56) = 1;
                    if (*(char far *)MK_FP(ds, (unsigned)&B_956D) != 0) {
                        *(char far *)MK_FP(ds, (unsigned)&B_955C) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_955C) | 64);
                        t4 = far_db58c();
                    }
                    t5 = far_dccc4((unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_8A9E));
                    *(char far *)MK_FP(ds, (unsigned)&B_955B) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_955B) | 64);
                    *(char far *)MK_FP(ds, (unsigned)&B_955C) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_955C) | -128);
                    t6 = far_db58c();
                    ax = (int)t6;
                    dx = (int)(t6 >> 16);
                    if (*(char far *)MK_FP(ds, (unsigned)&B_8C41) == 1) {
                        t7 = far_deee8((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)B_8C41), 1);
                        ax = t7;
                        dx = UNDEF;
                    }
                    *(char far *)MK_FP(ds, (unsigned)&B_8A9D) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_8A9D) + 1);
                    continue;
                }
                if (*(char far *)MK_FP(ds, (unsigned)&B_8800) == 0) {
                    if ((*(char far *)MK_FP(ds, di + 1) & 1) == 0) {
                        goto L4;
                    }
                    *(char far *)MK_FP(ds, (unsigned)&B_A567) = (char)0;
                    *(char far *)MK_FP(ds, (unsigned)&B_A568) = (char)0;
                    if (*(int far *)MK_FP(ds, di + 48) == 1 || *(int far *)MK_FP(ds, di + 50) != 1) {
                        t8 = far_de95a();
                        *(char far *)MK_FP(ds, (unsigned)&TBL_F779) = (char)-1;
                    }
                    p18 = di;
                    t9 = far_dcc2e(MK_FP(ds, p18), (unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F779), (int)t15);
                    ax = (int)t9;
                    dx = (int)(t9 >> 16);
                    if (*(int far *)MK_FP(ds, di + 50) == 1) {
                        *(int far *)MK_FP(ds, di + 56) = 1;
                        if (*(char far *)MK_FP(ds, (unsigned)&B_A5C1) == 8) {
                            *(char far *)MK_FP(ds, (unsigned)&B_A5C1) = (char)10;
                        }
                        continue;
                    }
                    if (*(char far *)MK_FP(ds, di) == 0) {
                        *(char far *)MK_FP(ds, di) = (char)2;
                        ax14 = *(int far *)MK_FP(ds, di + 18);
                        *(int far *)MK_FP(ds, di + 16) = *(int far *)MK_FP(ds, di + 20);
                        *(int far *)MK_FP(ds, di + 14) = ax14;
                    }
                    dx = *(int far *)MK_FP(ds, di + 28);
                    ax15 = *(int far *)MK_FP(ds, di + 26);
                    *(int far *)MK_FP(ds, di + 20) = dx;
                    *(int far *)MK_FP(ds, di + 18) = ax15;
                    ax = *(int far *)MK_FP(ds, di + 50);
                    *(int far *)MK_FP(ds, di + 56) = ax;
                    if ((unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_A5C1) >= 8) {
                        *(char far *)MK_FP(ds, (unsigned)&B_A5C1) = (char)6;
                        *(char far *)MK_FP(ds, (unsigned)&B_8A9E) = (char)-1;
                        *(char far *)MK_FP(ds, (unsigned)&B_D4BE) = (char)80;
                    }
                    continue;
                }
                ax16 = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_8804);
                if (*(char far *)MK_FP(ds, (unsigned)&B_8801) == 0) {
                    goto L5;
                }
                *(char far *)MK_FP(ds, (unsigned)&B_8801) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_8801) - 1);
                if (*(char far *)MK_FP(ds, (unsigned)&B_8801) != 1) {
                    goto L6;
                }
                for (;;) {
                    ax18 = ((ax16 - 1 << 5) - (ax16 - 1) << 2) + (ax16 - 1) << 2;
                    *(char far *)MK_FP(ds, (unsigned)&B_8803) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_8803) + 1);
                    ax19 = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_8803) << 1;
                    ax20 = ((char)(ax19 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_A7B0 + ax19 + ax18));
                    bx = ax18;
                    *(char far *)MK_FP(ds, (unsigned)&B_8801) = (char)ax20;
                    if (*(char far *)MK_FP(ds, (unsigned)&B_8801) == 0) {
                        if (*(char far *)MK_FP(ds, (unsigned)&TBL_A79B + -1 + ax16) != 0) {
                            ax21 = ((char)(ax20 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_A787 + -1 + ax16));
                            *(char far *)MK_FP(ds, (unsigned)&B_8803) = (char)((char)ax21 - 1);
                            p10 = bx;
                            bx2 = bx + ((unsigned char)((char)ax21 - 1) << 1);
                            bx = p10;
                            *(char far *)MK_FP(ds, (unsigned)&B_8801) = *(char far *)MK_FP(ds, (unsigned)&TBL_A7B0 + bx2);
                            *(int far *)MK_FP(ds, (unsigned)&W_9053) = *(int far *)MK_FP(ds, (unsigned)&W_A5CB);
L7:
                            t10 = far_dccc4((unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_A7AF + ((unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_8803) << 1) + bx));
                            if (t10 != 0) {
                                continue;
                            }
                            goto L6;
                        }
                        goto L8;
                    }
                    goto L7;
                }
            } else {
                if ((*(char far *)MK_FP(ds, di + 1) & -128) != 0) {
                    if (*(char far *)MK_FP(ds, (unsigned)&B_A56E) != 0) {
                        continue;
                    }
                    goto L9;
                }
                if (*(char far *)MK_FP(ds, (unsigned)&B_A5C1) == 8) {
                    if (*(char far *)MK_FP(ds, (unsigned)&B_A570) == 0) {
                        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_F77A));
                        if ((char)ax == *(char far *)MK_FP(ds, (unsigned)&B_8A9B)) {
L10:
                            continue;
                        }
L11:
                        *(int far *)MK_FP(ds, (unsigned)&W_7214) = 1;
                        if (*(char far *)MK_FP(ds, (unsigned)&B_A5C1) != 10) {
                            goto L12;
                        }
                        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_F77A));
                        if ((char)ax != *(char far *)MK_FP(ds, (unsigned)&B_8A9B)) {
                            goto L12;
                        }
                        ax = (unsigned char)(char)*(int far *)MK_FP(ds, (unsigned)&W_7212);
                        if (ax == 152) {
                            if (*(char far *)MK_FP(ds, (unsigned)&B_A5C7) != 0) {
                                if (*(char far *)MK_FP(ds, (unsigned)&B_96EE) != 0) {
                                    ax = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_F77B);
                                    if (*(char far *)MK_FP(ds, (unsigned)&TBL_966E + ax) != 0) {
                                        continue;
                                    }
                                    goto L13;
                                }
                                ax = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_F77B);
                                if (*(char far *)MK_FP(ds, (unsigned)&TBL_956E + ax) != 0) {
                                    continue;
                                }
L13:
                                if (*(char far *)MK_FP(ds, (unsigned)&B_D4AC) != 0 && *(char far *)MK_FP(ds, (unsigned)&B_96EE) != 0 && *(char far *)MK_FP(ds, (unsigned)&B_F77B) == *(char far *)MK_FP(ds, (unsigned)&B_977F)) {
                                    ax23 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_F779));
                                    ax = ((char)(ax23 >> 8) << 8 | (unsigned char)((char)ax23 & 3));
                                    if ((char)ax == *(char far *)MK_FP(ds, (unsigned)&B_977E)) {
                                        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_977D));
                                        *(char far *)MK_FP(ds, (unsigned)&B_F77D) = (char)ax;
                                    }
                                }
                                if (*(char far *)MK_FP(ds, (unsigned)&B_8807) != 0) {
                                    t12 = far_dd3c2();
                                    ax = t12;
                                    dx = UNDEF;
                                    *(int far *)MK_FP(ds, (unsigned)&W_7214) = 0;
                                } else {
                                    goto L14;
                                }
                                goto L12;
                            }
                            goto L13;
                        }
                        if (ax == 176) {
                            ax = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&B_F77B);
                            if (ax < 12) {
                                bx3 = ax;
                                ax = bx3;
                                switch ((unsigned int)(unsigned)(TBL_ddecc + (bx3 << 1))) {
                                case 0:
                                case 3:
                                case 5:
                                case 6:
                                case 8:
                                case 9:
                                case 10:
                                    goto L15;
                                case 1:
                                    if (*(char far *)MK_FP(ds, (unsigned)&B_A56B) != 0) {
                                        continue;
                                    }
                                    goto L15;
                                case 2:
                                    if (*(char far *)MK_FP(ds, (unsigned)&B_A56A) != 0) {
                                        continue;
                                    }
                                    goto L15;
                                case 4:
                                    if (*(char far *)MK_FP(ds, (unsigned)&B_A569) != 0) {
                                        continue;
                                    }
                                    goto L15;
                                case 7:
                                    if (*(char far *)MK_FP(ds, (unsigned)&B_A568) != 0) {
                                        continue;
                                    }
                                    goto L15;
                                case 11:
                                    if (*(char far *)MK_FP(ds, (unsigned)&B_A567) != 0) {
                                        continue;
                                    }
L15:
                                    goto L12;
                                }
                            } else {
                                goto L15;
                            }
                        } else {
                            if (ax == 208) {
                                if (*(char far *)MK_FP(ds, (unsigned)&B_A56D) >= 2) {
                                    continue;
                                }
                                goto L14;
                            }
                            if (ax == 224) {
                                if (*(char far *)MK_FP(ds, (unsigned)&B_A56C) != 0) {
                                    continue;
                                }
L14:
L12:
                                if (*(int far *)MK_FP(ds, (unsigned)&W_7214) != 0) {
                                    p18 = di;
                                    t13 = far_dcc2e(MK_FP(ds, p18), (unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F779), (int)t15);
                                    ax = (int)t13;
                                    dx = (int)(t13 >> 16);
                                }
                                if (*(char far *)MK_FP(ds, (unsigned)&B_A56E) != 0) {
                                    ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_F77A));
                                    if ((char)ax != *(char far *)MK_FP(ds, (unsigned)&B_8A9B)) {
                                        continue;
                                    }
L9:
                                    ax = (unsigned char)*(char far *)MK_FP(ds, (unsigned)&TBL_F77A);
                                    if ((*(char far *)MK_FP(ds, ax + 166 + di) & 1) != 0) {
                                        continue;
                                    }
                                    *(char far *)MK_FP(ds, (unsigned)&TBL_F77A) = (char)(*(char far *)MK_FP(ds, (unsigned)&TBL_F77A) | *(char far *)MK_FP(ds, di + 1) & -128);
                                    t14 = far_dd9ba((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F779), (int)t15);
                                    ax = t14;
                                    dx = UNDEF;
                                    continue;
                                }
                                goto L9;
                            }
                            goto L12;
                        }
                    } else {
                        goto L10;
                    }
                } else {
                    goto L11;
                }
            }
        } else {
            break;
        }
    }
    goto L16;
L2:
    dx = *(int far *)MK_FP(ds, (unsigned)&W_7210);
    ax = *(int far *)MK_FP(ds, (unsigned)&W_720E);
    *(int far *)MK_FP(ds, di + 20) = dx;
    *(int far *)MK_FP(ds, di + 18) = ax;
    goto L16;
L3:
    dx = *(int far *)MK_FP(ds, (unsigned)&W_7210);
    ax = *(int far *)MK_FP(ds, (unsigned)&W_720E);
    *(int far *)MK_FP(ds, di + 20) = dx;
    *(int far *)MK_FP(ds, di + 18) = ax;
    goto L16;
L4:
    t16 = far_de95a();
    *(char far *)MK_FP(ds, (unsigned)&TBL_F779) = (char)-1;
    ax10 = *(int far *)MK_FP(ds, (unsigned)&W_720E);
    *(int far *)MK_FP(ds, di + 20) = *(int far *)MK_FP(ds, (unsigned)&W_7210);
    *(int far *)MK_FP(ds, di + 18) = ax10;
    if (*(char far *)MK_FP(ds, di) == 0 && *(char far *)MK_FP(ds, (unsigned)&B_A5C1) == 8 && *(int far *)MK_FP(ds, di + 56) <= 0x3e7) {
        ax11 = *(int far *)MK_FP(ds, di + 56);
        *(int far *)MK_FP(ds, di + 48) = ax11;
        *(char far *)MK_FP(ds, (unsigned)&TBL_F779) = (char)-88;
        ax12 = ax11 << 1;
        ax13 = ((char)(ax12 >> 8) << 8 | (unsigned char)((unsigned int)(char)ax12 >> 1));
        *(char far *)MK_FP(ds, (unsigned)&TBL_F779 + 1) = (char)ax13;
        *(char far *)MK_FP(ds, (unsigned)&TBL_F779 + 2) = (char)(ax13 >> 8);
        *(char far *)MK_FP(ds, (unsigned)&TBL_F779 + 3) = *(char far *)MK_FP(ds, di + 60);
        *(char far *)MK_FP(ds, (unsigned)&TBL_F779 + 4) = *(char far *)MK_FP(ds, di + 61);
        dx = (int)(far_dcc2e(MK_FP(ds, di), (unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)TBL_F779), 5) >> 16);
        ax = *(int far *)MK_FP(ds, di + 62);
        *(int far *)MK_FP(ds, di + 58) = ax;
    } else {
        t17 = far_ddf77();
        ax = (int)t17;
        dx = (int)(t17 >> 16);
    }
    goto L16;
L5:
    ax17 = *(int far *)MK_FP(ds, (unsigned)&W_720E);
    *(int far *)MK_FP(ds, (unsigned)&W_902F) = *(int far *)MK_FP(ds, (unsigned)&W_7210);
    *(int far *)MK_FP(ds, (unsigned)&W_902D) = ax17;
    t18 = far_ddf77();
    ax = (int)t18;
    dx = (int)(t18 >> 16);
    goto L16;
L6:
    *(char far *)MK_FP(ds, (unsigned)&B_955B) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_955B) | 64);
    *(char far *)MK_FP(ds, (unsigned)&B_955C) = (char)(*(char far *)MK_FP(ds, (unsigned)&B_955C) | -128);
    t11 = far_db58c();
    ax = (int)t11;
    dx = (int)(t11 >> 16);
    goto L1;
L8:
    ax22 = *(int far *)MK_FP(ds, (unsigned)&W_720E);
    *(int far *)MK_FP(ds, (unsigned)&W_902F) = *(int far *)MK_FP(ds, (unsigned)&W_7210);
    *(int far *)MK_FP(ds, (unsigned)&W_902D) = ax22;
    t19 = far_ddf77();
    ax = (int)t19;
    dx = (int)(t19 >> 16);
L16:
    return ((long)dx << 16 | (unsigned)ax);
}
long far far_ddf77(void) { return 0; }
