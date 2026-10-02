/* differs: 308 at +3, 703 bytes; 311 at +3, 704 bytes; 312 at +3, 704 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_1D71;
extern char B_7B87;
extern char B_7B88;
extern char B_7B8B;
extern char B_E55C;
extern int FP_7B55;
extern char TBL_0F85[];
extern char TBL_0FA3[];
extern char TBL_79A5[];
extern char TBL_7B5E[];
extern long far far_b0caf(void);
extern int far far_b0e80(long);
extern void far far_b1015(char);
extern int far far_b1ae0(int);
extern long far far_b2739(long);
extern long far far_d7a63(char);
extern long far far_fa248(int);
extern void far fn_b27ab(int);

long far far_b2542(char arg_0)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int di;
    int dx;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int si;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;
    long t6;
    long t7;
    int t8;

    di = 0;
    dx = arg_0;
    if ((TBL_79A5[arg_0] & 2) != 0) {
        if (B_7B88 == 0) {
            far_b1015(arg_0);
            dx = UNDEF;
        }
        return ((long)dx << 16 | (unsigned)0);
    }
    if (arg_0 == 46) {
        if (B_7B88 == 0) {
            far_b1015(45);
            dx = UNDEF;
        }
        return ((long)dx << 16 | (unsigned)0);
    }
    if (B_7B88 != 0) {
        ax = dx;
        flags = ax - 60;
        if (!CC("==", flags)) {
            if (!CC(">", flags)) {
                if (ax != 43 && ax != 45) {
                    goto L1;
                }
                t3 = far_b0e80(*(long *)((char *)&FP_7B55 + 0));
                dx = UNDEF;
                B_1D71 = TBL_7B5E[B_7B87];
            } else if (ax == 62) {
                di = 0x800;
            } else {
L1:
                di = dx;
            }
        } else {
            di = 0x400;
        }
    } else {
        ax2 = dx;
        flags2 = ax2 - 77;
        if (!CC("==", flags2)) {
            if (!CC(">", flags2)) {
                flags3 = ax2 - 45;
                if (!CC("==", flags3)) {
                    if (!CC(">", flags3)) {
                        if (ax2 == 13) {
                            goto L2;
                        }
                        if (ax2 != 43) {
                            goto L3;
                        }
                        fn_b27ab(1);
                        dx = UNDEF;
                    } else if (ax2 == 60) {
                        if (B_7B87 != 0) {
                            ax3 = far_b1ae0(8);
                            dx = UNDEF;
                            B_7B87 = (char)(B_7B87 - 1);
                        }
                        B_1D71 = TBL_7B5E[B_7B87];
                    } else {
                        if (ax2 != 62) {
                            goto L3;
                        }
                        ax4 = B_7B8B - 1;
                        dx = B_7B87;
                        if (dx < ax4) {
                            ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)B_7B87);
                            B_7B87 = (char)(B_7B87 + 1);
                            ax6 = far_b1ae0(TBL_7B5E[(char)ax5]);
                            dx = UNDEF;
                        }
                        B_1D71 = TBL_7B5E[B_7B87];
                    }
                } else {
                    fn_b27ab(-1);
                    dx = UNDEF;
                }
            } else {
                flags4 = ax2 - 120;
                if (!CC("!=", flags4)) {
                    goto L4;
                }
                if (!CC(">", flags4)) {
                    if (ax2 == 90) {
                        B_E55C = (char)((char)(0 - (B_E55C != 0)) + 1);
                    } else {
                        if (ax2 == 117) {
                            goto L4;
                        }
                        goto L3;
                    }
                } else {
                    if (ax2 == 121) {
                        goto L4;
                    }
                    if (ax2 == 122) {
L4:
                        t6 = far_d7a63(arg_0);
L2:
                        t7 = far_b0caf();
                        dx = (int)(t7 >> 16);
                        di = (int)t7;
                    } else {
L3:
                        si = 0;
                        while (TBL_0F85[si] != 0) {
                            ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_0F85[si]);
                            if ((char)ax2 != arg_0) {
                                si = si + 1;
                                continue;
                            }
                            break;
                        }
                        ax7 = ((char)(ax2 >> 8) << 8 | (unsigned char)TBL_0FA3[si]);
                        arg_0 = (char)ax7;
                        if ((char)ax7 != 0) {
                            if (B_E55C != 0) {
                                arg_0 = (char)(int)far_fa248((char)ax7);
                            }
                            far_b1015(arg_0);
                            dx = UNDEF;
                        }
                    }
                }
            }
        } else {
            dx = (int)(far_b2739(*(long *)((char *)&FP_7B55 + 0)) >> 16);
            di = arg_0;
        }
    }
    return ((long)dx << 16 | (unsigned)di);
}
long far far_b2739(long p0) { return 0; }
void far fn_b27ab(int p0) { }
