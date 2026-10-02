/* differs: 308 at +3, 105 bytes; 311 at +3, 105 bytes; 312 at +3, 105 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[1020];
    int f_3fc;
    int f_3fe;
};
extern int far far_b1ad0();
extern int far far_b1ae0();
extern int far far_b1b05();

long far fn_c0800(int arg_0, int arg_2, int arg_4)
{
    int ax;
    int ax2;
    int ax3;
    struct s1 near *bx;

    far_b1ad0(arg_2, arg_4);
    if (arg_0 > 34) {
        far_b1b05(MK_FP(SEG_DATA, 0x47c3));
        bx = (struct s1 near *)(arg_0 << 2);
        far_b1b05(*(long *)((char near *)bx + 1020));
        return ((long)UNDEF << 16 | (unsigned)far_b1ae0(41));
    }
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x47ce)));
}
