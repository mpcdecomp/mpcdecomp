/* differs: 308 at +3, 125 bytes; 311 at +3, 125 bytes; 312 at +3, 125 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char TBL_d5da6[];

void far far_d5d2d(int arg_0)
{
    int flags;
    int flags2;

    if (arg_0 != 0) {
        flags = arg_0 - 0x302;
        if (!CC("==", flags)) {
            if (!CC(">", flags)) {
                flags2 = arg_0 - 0x104;
                if (!CC("==", flags2)) {
                    if (!CC(">", flags2)) {
                        if (arg_0 != 0x101) {
                            if (arg_0 != 0x102) {
                                if (arg_0 != 0x103) {
                                    goto L1;
                                }
                                goto L2;
                            }
                            goto L3;
                        }
                        goto L4;
                    }
                    if (arg_0 != 0x106) {
                        if (arg_0 != 0x301) {
                            goto L1;
                        }
                    } else {
                        goto L4;
                    }
                } else {
                    goto L5;
                }
            } else if ((unsigned int)(arg_0 - 0x303) <= 8) {
                switch ((unsigned int)(unsigned)(TBL_d5da6 + (arg_0 - 0x303 << 1))) {
                case 0:
L2:
                    break;
                case 1:
L3:
                    break;
                case 2:
L5:
                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 5:
                case 6:
                case 7:
L1:
                    break;
                case 8:
L4:
                    break;
                }
            } else {
                goto L1;
            }
        } else {
            goto L4;
        }
    }
    return;
}
