/* differs: 308 at +3, 400 bytes; 311 at +3, 403 bytes; 312 at +3, 403 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char TBL_79A5[];
extern unsigned char TBL_ebeb0[];

long far far_ebde1(int arg_0, int arg_2)
{
    int dx;
    int flags;
    int flags2;
    int flags3;
    int flags4;
    int flags5;
    int flags6;

    dx = 0;
    if ((TBL_79A5[arg_0] & 2) != 0) {
        return ((long)dx << 16 | (unsigned)0);
    }
    flags = arg_0 - 91;
    if (CC("!=", flags)) {
        if (!CC(">", flags)) {
            flags2 = arg_0 - 60;
            if (CC("!=", flags2)) {
                if (!CC(">", flags2)) {
                    flags3 = arg_0 - 43;
                    if (CC("!=", flags3)) {
                        if (!CC(">", flags3)) {
                            if (arg_0 != 13) {
                                if (arg_0 != 33) {
                                    goto L1;
                                }
                            }
                        } else if (arg_0 != 45 && arg_0 != 46) {
                            goto L1;
                        }
                    }
                } else {
                    flags4 = arg_0 - 72;
                    if (!CC("==", flags4)) {
                        if (!CC(">", flags4)) {
                            if (arg_0 != 62 && arg_0 != 68) {
                                goto L1;
                            }
                        } else if (arg_0 != 78) {
                            goto L1;
                        }
                    }
                }
            }
        } else {
            flags5 = arg_0 - 120;
            if (!CC("==", flags5)) {
                if (!CC(">", flags5)) {
                    flags6 = arg_0 - 100;
                    if (!CC("==", flags6)) {
                        if (!CC(">", flags6)) {
                            if (arg_0 != 93 && arg_0 != 94) {
                                goto L1;
                            }
                        } else if (arg_0 != 104) {
                            if (arg_0 != 117) {
                                goto L1;
                            }
                            if (arg_2 > 3) {
                                dx = arg_0;
                            }
                        }
                    }
                } else if ((unsigned int)(arg_0 - 121) <= 4) {
                    switch ((unsigned int)(unsigned)(TBL_ebeb0 + (arg_0 - 121 << 1))) {
                    case 0:
                        if (arg_2 > 1) {
                            dx = arg_0;
                        }
                        break;
                    case 1:
                        if (arg_2 > 2) {
                            dx = arg_0;
                        }
                        break;
                    case 2:
                    case 4:
                        break;
                    case 3:
L1:
                        dx = arg_0;
                        break;
                    }
                } else {
                    goto L1;
                }
            } else if (arg_2 != 0) {
                dx = arg_0;
            }
        }
    }
    return ((long)dx << 16 | (unsigned)dx);
}
