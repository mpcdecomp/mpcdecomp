/* differs: 308 at +26, 91 bytes; 311 at +26, 91 bytes; 312 at +26, 91 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);
extern int far far_b1b05(char far *);
extern int far far_b1b41(int, int);
extern void far far_cd8d0(int, char far *);

long far fn_b8f7d(int arg_0, int arg_2, int arg_4, int arg_6)
{
    char loc_16[20];
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int dx;
    int t1;
    int t2;

    if (arg_6 > 20) {
        arg_6 = 20;
    }
    far_cd8d0(arg_0, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
    loc_2 = UNDEF;
    far_b1ad0(arg_2, arg_4);
    far_b1b41(32, 17);
    ax3 = far_b1ad0(arg_2, arg_4);
    dx = UNDEF;
    if (loc_2 == 0 && arg_6 > 0) {
        t2 = far_b1ae0(45);
        loc_16[arg_6] = (char)0;
        ax3 = far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax3);
}
