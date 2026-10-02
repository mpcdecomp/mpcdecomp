/* differs: 308 at +0, 132 bytes; 311 at +0, 133 bytes; 312 at +0, 133 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[16973];
    int f_424d;
};

void near fn_f95ec(void)
{
    int ax;
    unsigned int bx;
    int bx2;
    struct s1 near *bx3;
    unsigned int dx;
    unsigned int dx2;
    unsigned int dx3;
    unsigned int dx4;

    dx = bx & 0xfff;
    bx2 = bx >> 1;
    bx3 = (struct s1 near *)(bx2 + bx);
    ax = bx3->f_424d;
    __insn("popf", __flags(bx2));
    if (!CC("<u", UNDEF)) {
        bx3->f_424d = ax & -0x1000 | dx;
    } else {
        dx2 = dx << 1 | dx >> 15;
        dx3 = dx2 << 1 | dx2 >> 15;
        dx4 = dx3 << 1 | dx3 >> 15;
        bx3->f_424d = ax & 15 | (dx4 << 1 | dx4 >> 15);
    }
    return;
}
