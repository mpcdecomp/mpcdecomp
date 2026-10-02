/* differs: 308 at +3, 346 bytes; 311 at +3, 348 bytes; 312 at +3, 348 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char W_d4053[];

int far far_d4dcd(int arg_0, int arg_2, char arg_4)
{
    int ax;
    unsigned int ax2;
    int ax3;
    int ax4;
    int bx;
    unsigned int cx;
    int di;
    int es;
    int es2;
    int p12;
    int si;
    int si2;
    int si3;

    ax = 0xd724;
    es = ax;
    si = 2;
    for (;;) {
        bx = si;
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
        si2 = si + 1;
        if ((char)ax == *(char *)((char *)&arg_0 + 0)) {
            ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si2));
            if ((char)ax == *(char *)((char *)&arg_2 + 0)) {
                ax = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si2 + 1));
                if ((char)ax != arg_4) {
L1:
                    si = bx + 5;
                    if (*(char far *)MK_FP(es, si) != 0) {
                        continue;
                    }
                    goto L2;
                }
                break;
            }
            goto L1;
        }
        goto L1;
    }
    si = *(int far *)MK_FP(es, si2 + 2);
L2:
    ax2 = -0x7ff0;
    es2 = ax2;
    di = -0x3128;
    cx = 0;
    for (;;) {
        ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
        si = si + 1;
        if ((char)ax2 != 0) {
            if (((char)ax2 & -128) == 0) {
                if ((char)ax2 != 27) {
                    if ((char)ax2 == 10) {
                        ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)13);
                        *(char far *)MK_FP(es2, di) = (char)ax3;
                        di = di + 1;
                        cx = cx + 1;
                        if (cx != 0x118) {
                            ax2 = ((char)(ax3 >> 8) << 8 | (unsigned char)10);
L3:
                            *(char far *)MK_FP(es2, di) = (char)ax2;
                            di = di + 1;
                            cx = cx + 1;
                            if (cx != 0x118) {
                                continue;
                            }
                            break;
                        }
                        break;
                    }
                    goto L3;
                }
                ax4 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
                si = si + 1;
                ax2 = (unsigned char)(char)ax4 + 128;
                goto L4;
            }
            ax2 = ax2 & 127;
L4:
            p12 = si;
            if (ax2 <= (unsigned int)*(int far *)MK_FP(0xd724, (unsigned int)(unsigned)(W_d4053 + -144))) {
                ax2 = ax2 * 2;
                si3 = *(int far *)MK_FP(0xd724, (unsigned int)(unsigned)(W_d4053 + -144 + ax2));
                for (;;) {
                    ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si3));
                    si3 = si3 + 1;
                    if ((char)ax2 != 0) {
                        *(char far *)MK_FP(es2, di) = (char)ax2;
                        di = di + 1;
                        cx = cx + 1;
                        if (cx >= 0x118) {
                            goto L5;
                        }
                        continue;
                    }
                    break;
                }
L6:
                si = p12;
                continue;
            }
            goto L6;
        }
        break;
    }
    goto L7;
L5:
L7:
    *(char far *)MK_FP(es2, di) = (char)0;
    return cx;
}
