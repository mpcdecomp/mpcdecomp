/* differs: 308 at +5, 1247 bytes; 311 at +5, 1233 bytes; 312 at +5, 1235 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B5D;
extern char B_7B88;
extern char B_7B8C;
extern char B_7B8D;
extern char B_7B8E;
extern char B_D4B4;
extern char B_D4BB;
extern char B_D4BF;
extern char B_D4C0;
extern char B_D5DD;
extern char B_D5DE;
extern char far *FP_7B8F;
extern char TBL_79A5[];
extern char TBL_83F3[];
extern unsigned char TBL_b0c9b[];
extern long far far_b0caf(void);
extern long far far_b1073(char);
extern long far far_b129e(void);
extern int far far_b1ab2(int);
extern int far far_b1af9(void);
extern int far far_b1aff(void);
extern long far far_b2542(char);
extern void far far_b284a(void);
extern long far far_b2850(char);
extern long far far_b292f(char);
extern long far far_b2cd7(char);
extern long far far_b2e3a(int);
extern long far far_b30df(int, int);
extern long far far_ba0a7(int);
extern int far far_d79ee(void);
extern int far far_dab37(int);
extern long far fn_b0605(int);
extern int far fn_b0763(int);
extern long far fn_b07b6(void);
extern long far fn_b0829(int, int);
extern long far fn_b0870(int, int);
long far fn_b0605(int p0) { return 0; }
int far fn_b0763(int p0) { return 0; }
long far fn_b07b6(void) { return 0; }
long far fn_b0829(int p0, int p1) { return 0; }
long far fn_b0870(int p0, int p1) { return 0; }

int far far_b08f7(int arg_0)
{
    char loc_1;
    char loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    unsigned int ax5;
    int ax6;
    int di;
    int dx;
    int dx2;
    int dx3;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int flags6;
    int p14;
    int si;
    long t1;
    int t10;
    long t11;
    int t12;
    long t13;
    int t14;
    long t15;
    long t16;
    long t17;
    long t18;
    long t19;
    long t2;
    long t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    int t26;
    long t27;
    int t3;
    int t4;
    int t5;
    int t6;
    long t7;
    int t8;
    long t9;

    t1 = fn_b0829(B_D5DE, B_D5DD);
    if ((int)t1 >= 0) {
        B_7B8E = TBL_83F3[(int)t1];
    }
    B_D4BB = (char)0;
    si = 0;
    for (;;) {
        if ((si & -0x8000) == 0) {
            si = 0;
            B_7B8C = (char)-1;
            p14 = 0xb05a;
            t25 = fn_b0605(B_7B8E);
            if (*(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) != 0) {
                t2 = fn_b07b6();
            }
            loc_2 = (char)1;
            far_b284a();
            for (;;) {
                if (si == 0) {
                    if (*(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) != 0 && B_D4BB == 0) {
                        if (B_7B88 != 0) {
                            t3 = far_b1ab2(3);
                        } else {
                            t4 = far_b1ab2(2);
                        }
                    } else {
                        t5 = far_b1ab2(0);
                    }
                    if (B_7B5D != 0) {
                        t6 = far_d79ee();
                        loc_1 = (char)t6;
                    } else {
                        t7 = far_ba0a7(0);
                        loc_1 = (char)(int)t7;
                    }
                    t8 = far_b1ab2(0);
                    dx = UNDEF;
                    if (loc_1 == 72) {
                        if (B_D4BB != 0) {
                            continue;
                        }
                        if (B_7B88 == 0) {
                            p14 = 0xb05a;
                            t9 = far_b1073(B_7B8D);
                        }
                        t10 = far_b1af9();
                        t11 = far_b129e();
                        B_D4BB = (char)1;
                        continue;
                    }
                    if (B_D4BB != 0) {
                        t12 = far_b1aff();
                        dx = UNDEF;
                        B_D4BB = (char)0;
                        if (*(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) != 0) {
                            goto L1;
                        }
L2:
                        if (B_7B5D != 0) {
                            t13 = far_b2542(loc_1);
                            si = (int)t13;
                            continue;
                        }
                        dx2 = ((char)(dx >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_0 + 0));
                        dx3 = ((char)(dx2 >> 8) << 8 | (unsigned char)((char)dx2 & 7));
                        ax = loc_1;
                        flags = ax - 120;
                        if (!CC("==", flags)) {
                            if (!CC(">", flags)) {
                                if (ax != 68 && ax != 78) {
                                    if (ax != 117) {
                                        goto L3;
                                    }
                                    if ((char)dx3 < 4) {
                                        continue;
                                    }
                                    goto L3;
                                }
                                if ((arg_0 & 192) == 0 && B_7B8C != 0) {
                                    continue;
                                }
                                if (loc_1 == 78) {
                                    t14 = far_dab37(B_D4C0);
                                    B_D4BF = (char)t14;
                                }
                                goto L3;
                            }
                            if (ax != 121) {
                                if (ax != 122) {
                                    goto L3;
                                }
                                if ((char)dx3 < 3) {
                                    continue;
                                }
                                goto L3;
                            }
                            if ((char)dx3 < 2) {
                                continue;
                            }
                            goto L3;
                        }
                        if ((char)dx3 < 1) {
                            continue;
                        }
L3:
                        if ((arg_0 & 16) == 0) {
                            ax2 = loc_1;
                            flags2 = ax2 - 123;
                            if (!CC("!=", flags2)) {
                                continue;
                            }
                            if (!CC(">", flags2)) {
                                if (ax2 == 91) {
                                    continue;
                                }
                                if (ax2 == 93) {
                                    continue;
                                }
                                goto L4;
                            }
                            if (ax2 == 125) {
                                continue;
                            }
L4:
                            if (*(char far *)((char far *)*(long *)((char *)&FP_7B8F + 0)) == 0) {
                                ax3 = loc_1;
                                di = ax3;
                                flags3 = ax3 - 46;
                                if (!CC("!=", flags3)) {
                                    continue;
                                }
                                if (!CC(">", flags3)) {
                                    flags4 = ax3 - 43;
                                    if (!CC("!=", flags4)) {
                                        continue;
                                    }
                                    if (!CC(">", flags4)) {
                                        if (ax3 == 13) {
                                            continue;
                                        }
                                        if (ax3 != 33) {
                                            goto L5;
                                        }
                                        goto L6;
                                    }
                                    if (ax3 == 45) {
                                        continue;
                                    }
                                    goto L5;
                                }
                                flags5 = ax3 - 94;
                                if (!CC("==", flags5)) {
                                    if (!CC(">", flags5)) {
                                        if (ax3 == 60) {
                                            continue;
                                        }
                                        if (ax3 == 62) {
                                            continue;
                                        }
                                        goto L5;
                                    }
                                    if (ax3 == 104) {
                                        continue;
                                    }
L5:
                                    if ((TBL_79A5[di] & 2) != 0) {
                                        continue;
                                    }
                                    si = di;
                                    continue;
                                }
L6:
                                if ((arg_0 & 32) == 0) {
                                    continue;
                                }
                                si = di;
                                continue;
                            }
                            ax4 = loc_1;
                            di = ax4;
                            flags6 = ax4 - 94;
                            if (!CC("==", flags6)) {
                                if (!CC(">", flags6)) {
                                    if (ax4 != 13) {
                                        if (ax4 != 33) {
                                            goto L7;
                                        }
                                        if ((arg_0 & 32) != 0) {
                                            si = di;
                                            continue;
                                        }
                                        t15 = far_b0caf();
                                        si = (int)t15 + 0x200;
                                        continue;
                                    }
                                    si = 0x800;
                                    t16 = far_b0caf();
                                    if ((int)t16 == 0) {
                                        continue;
                                    }
                                    si = -0x8000;
                                    continue;
                                }
                                if (ax4 == 104) {
                                    continue;
                                }
L7:
                                ax5 = B_7B8C & 15;
                                if (ax5 <= 9) {
                                    switch ((unsigned int)(unsigned)(TBL_b0c9b + (ax5 << 1))) {
                                    case 0:
                                        p14 = ((char)(ax5 >> 8) << 8 | (unsigned char)loc_1);
                                        t23 = far_b30df(p14, arg_0);
                                        si = (int)t23;
                                        continue;
                                    case 1:
                                        t22 = far_b2542(loc_1);
                                        si = (int)t22;
                                        continue;
                                    case 2:
                                    case 6:
                                    case 9:
                                        if (loc_2 != 0) {
                                            t20 = far_b2e3a(0);
                                            loc_2 = (char)0;
                                        }
                                        t21 = far_b2e3a(loc_1);
                                        si = (int)t21;
                                        continue;
                                    case 3:
                                    case 4:
                                        t19 = far_b2cd7(loc_1);
                                        si = (int)t19;
                                        continue;
                                    case 5:
                                        t18 = far_b292f(loc_1);
                                        si = (int)t18;
                                        continue;
                                    case 7:
                                        continue;
                                    case 8:
                                        t17 = far_b2850(loc_1);
                                        si = (int)t17;
                                        continue;
                                    }
                                } else {
                                    continue;
                                }
                            } else {
                                if ((arg_0 & 32) != 0) {
                                    si = di;
                                    continue;
                                }
                                t24 = far_b0caf();
                                si = (int)t24 + 0x100;
                                continue;
                            }
                        } else {
                            goto L4;
                        }
                    } else {
                        goto L2;
                    }
                } else {
                    break;
                }
            }
            if ((si & 255) != 0) {
                goto L8;
            }
            ax6 = fn_b0763(si);
            if ((int)t1 >= 0) {
                TBL_83F3[(int)t1] = B_7B8E;
                B_D4B4 = (char)1;
                continue;
            }
            continue;
        }
        break;
    }
    goto L9;
L1:
    return 0;
L8:
L9:
    t27 = fn_b0870(si, arg_0);
    if (((int)t27 & -0x8000) != 0) {
        return 0;
    }
    return (int)t27;
}
long far far_b0caf(void) { return 0; }
long far far_b1073(char p0) { return 0; }
long far far_b129e(void) { return 0; }
