/* differs: 308 at +3, 225 bytes; 311 at +3, 225 bytes; 312 at +3, 225 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_de4c2(long arg_0)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int ds;

    bx = (int)arg_0;
    ds = (int)(arg_0 >> 16);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, bx));
    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax & -8));
    if ((char)ax3 < 0) {
        if ((char)ax3 != -104) {
            if ((char)ax3 != -72) {
                if ((char)ax3 != -24) {
                    if (((char)ax3 & 8) == 0) {
L1:
                        ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((unsigned int)(char)ax3 >> 4));
                        ax3 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 & 7));
                        if ((char)ax3 == 7 && *(char far *)MK_FP(ds, bx + 2) == 71 && (*(char far *)MK_FP(ds, bx + 5) == 69 || *(char far *)MK_FP(ds, bx + 5) == 70)) {
                            ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 + *(char far *)MK_FP(ds, bx + 6)));
                            if ((unsigned char)(char)ax3 >= 12) {
L2:
                                ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)13);
                            }
                        }
                    } else {
                        goto L2;
                    }
                } else {
                    ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)12);
                }
            } else {
                ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)0);
            }
        } else {
            goto L1;
        }
    } else {
        goto L2;
    }
    return (unsigned char)(char)ax3;
}
