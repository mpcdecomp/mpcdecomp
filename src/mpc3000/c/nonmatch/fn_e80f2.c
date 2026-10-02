/* differs: 308 at +0, 147 bytes; 311 at +0, 147 bytes; 312 at +0, 147 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_743F;
extern char B_7447;
extern int W_7384;

int near fn_e80f2(void)
{
    int ax;
    int ax2;
    int ax3;
    int bx;
    int cx;
    int di;
    int es;
    char t1;
    int t2;

    W_7384 = bx;
    cx = ax;
    di = (int)(unsigned)&B_743F;
    while ((W_7384 & -0x8000) == 0) {
        t2 = inpw(232);
        ax2 = ((char)(t2 >> 8) << 8 | (unsigned char)((char)t2 & -64));
        if ((char)ax2 == -64) {
            B_7447 = (char)(ax2 >> 8);
            t1 = inp(234);
            ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)t1);
            *(char far *)MK_FP(es, di) = (char)ax3;
            di = di + 1;
            cx = cx - 1;
            if (cx == 0) {
                goto L1;
            }
            continue;
        }
    }
    return 210;
L1:
    if (ax != 1) {
        ax3 = ((char)(ax3 >> 8) << 8 | (unsigned char)B_743F);
    }
    return ax3;
}
