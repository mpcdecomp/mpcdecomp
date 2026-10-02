/* differs: 308 at +3, 370 bytes; 311 at +3, 368 bytes; 312 at +3, 368 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char TBL_A57E[];
extern long far far_dd270(void far *, int, int);

int far far_dce14(long arg_0, int arg_4, int arg_6)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int bx;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int cx;
    int es;
    int p12;
    int si;
    int si2;
    long t1;

    si = (int)arg_0;
    es = (int)(arg_0 >> 16);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si + 1));
    ax3 = arg_6;
    if (((char)ax3 & -128) != 0) {
        ax3 = ((char)ax3 << 8 | (unsigned char)(char)ax3);
    } else {
L1:
        bx2 = ((char)(bx >> 8) << 8 | (unsigned char)(char)ax3) & 63;
        TBL_A57E[bx2] = (char)1;
        p12 = (-1 << 8 | (unsigned char)(char)(ax3 >> 8));
        bx3 = ((char)bx2 << 8 | (unsigned char)((char)bx2 & 15));
        bx4 = ((unsigned int)(char)(bx3 >> 8) >> 4 << 8 | (unsigned char)(char)bx3);
        bx5 = ((char)(bx4 >> 8) + 1 << 8 | (unsigned char)(char)bx4);
        cx = arg_4;
        ax4 = (-1 << 8 | (unsigned char)*(char far *)MK_FP(es, si));
        ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 & -8));
        if ((char)ax5 == -16) {
            si2 = si + cx;
            *(char far *)MK_FP(es, si2) = (char)-9;
            si = si2 - cx;
            *(char far *)MK_FP(es, si + 1) = (char)-16;
            if (*(char far *)MK_FP(es, si + 2) == 71) {
                *(char far *)MK_FP(es, si + 3) = (char)bx5;
            }
        } else if ((char)ax5 == -24) {
            *(char far *)MK_FP(es, si + 1) = (char)-10;
            cx = cx - 1;
        } else {
            ax6 = ((char)(ax5 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
            ax7 = ((char)(ax6 >> 8) << 8 | (unsigned char)((char)ax6 & -16));
            if ((char)ax7 == -112) {
                cx = cx - 1;
            }
            *(char far *)MK_FP(es, si + 1) = (char)((char)ax7 + (char)bx5);
            cx = cx - 1;
        }
        t1 = far_dd270(MK_FP(es, si + 1), cx, (unsigned char)(char)(bx5 >> 8));
        bx = UNDEF;
        es = UNDEF;
        ax3 = p12;
    }
    if (((char)ax3 & -128) == 0) {
        goto L1;
    }
    *(char far *)MK_FP(es, si + 1) = (char)ax;
    return ax;
}
