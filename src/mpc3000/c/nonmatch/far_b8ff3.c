/* differs: 308 at +6, 91 bytes; 311 at +3, 94 bytes; 312 at +3, 94 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[628];
    int f_274;
    int f_276;
};
extern char B_D4BF;
extern char B_D4C0;
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);
extern int far far_b1b05(long);
extern int far far_dab37(int);

long far far_b8ff3(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    struct s1 near *bx;
    int si;

    if (B_D4C0 == arg_0) {
        si = B_D4BF;
    } else {
        si = far_dab37(arg_0);
    }
    far_b1ad0(arg_2, arg_4);
    far_b1ae0(47);
    bx = (struct s1 near *)(si << 2);
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(*(long *)((char near *)bx + 628)));
}
