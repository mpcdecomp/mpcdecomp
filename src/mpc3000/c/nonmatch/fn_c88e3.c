/* differs: 308 at +18, 42 bytes; 311 at +E, 44 bytes; 312 at +E, 44 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FE7;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);

long far fn_c88e3(void)
{
    int ax;
    int ax2;
    int dx;
    int t1;

    far_b1ad0(7, 0);
    ax2 = far_b1b05(MK_FP(SEG_DATA, 0x5c8c));
    dx = UNDEF;
    if (B_7FE7 != 0) {
        t1 = far_b1ad0(7, 0);
        ax2 = far_b1b05(MK_FP(SEG_DATA, 0x5cb5));
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax2);
}
