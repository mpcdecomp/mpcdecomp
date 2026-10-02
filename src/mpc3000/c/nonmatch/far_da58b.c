/* differs: 308 at +3, 90 bytes; 311 at +3, 92 bytes; 312 at +3, 92 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[3];
    char f_3;
};

void far far_da58b(struct s1 far *arg_0, char far *arg_4, char far *arg_8, char far *arg_12)
{
    int ax;
    int ax2;
    int bx;
    int es;
    int es2;

    es = FP_SEG(arg_0);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, *(int *)((char *)&arg_0 + 0)));
    *(char far *)MK_FP(es, FP_OFF(arg_0) + 2) = (char)ax;
    *arg_4 = (char)ax;
    *arg_8 = arg_0->f_3;
    bx = FP_OFF(arg_0);
    es2 = FP_SEG(arg_0);
    if (*(int far *)MK_FP(es2, bx + 5) == 2) {
        *arg_12 = *(char far *)MK_FP(es2, bx + 4);
    } else {
        *arg_12 = (char)0;
    }
    return;
}
