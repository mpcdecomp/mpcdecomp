/* differs: 308 at +9, 153 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[628];
    int f_274;
    int f_276;
};
extern int far far_b1b05(void far *);
extern int far far_b1d48();
extern int far far_b1f96(int);
extern void far far_cd8d0(int, char far *);
extern int far far_dab37(int);

long far far_b9755(int arg_0, int arg_2, int arg_4)
{
    char loc_14[18];
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    struct s1 near *bx;
    int di;
    int dx;
    int si;
    int t1;

    di = 0;
    dx = 0;
    si = arg_0;
L1:
    if (*(char far *)MK_FP(arg_2, si) == 0) {
        goto L2;
    }
    di = di + 1;
L2:
    si = si + 1;
    dx = dx + 1;
    if (dx < 64) {
        goto L1;
    }
    if (di != 64) {
        goto L3;
    }
    far_b1b05(MK_FP(SEG_DATA, 0x359b));
    far_b1f96(30);
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x36df)));
L3:
    far_cd8d0(arg_4, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14));
    loc_2 = far_dab37(arg_4);
    bx = (struct s1 near *)(loc_2 << 2);
    far_b1d48(MK_FP(SEG_DATA, 0x36ea), arg_4, bx->f_274, bx->f_276, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14));
    far_b1f96(31);
    far_b1d48(MK_FP(SEG_DATA, 0x36f4), di);
    if (di <= 1) {
        goto L4;
    }
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x36e7)));
L4:
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x36fd)));
}
