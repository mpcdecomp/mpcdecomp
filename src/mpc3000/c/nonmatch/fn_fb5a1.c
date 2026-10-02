/* differs: 308 at +0, 11 bytes; 311 at +0, 11 bytes; 312 at +0, 11 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[18];
    int f_12;
    int f_14;
};

int near fn_fb5a1(void)
{
    int ax;
    struct s1 near *di;

    ax = di->f_14;
    di->f_12 = ax;
    return ax;
}
