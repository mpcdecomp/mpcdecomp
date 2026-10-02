/* differs: 308 at +3, 105 bytes; 311 at +3, 106 bytes; 312 at +3, 106 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_E223 {
    int f_0;
};
extern struct g_TBL_E223 TBL_E223;
extern int W_E21F;
extern int W_E221;

void far far_cddc1(int arg_0, int arg_2)
{
    int bx;
    int cx;
    int flags;
    int p4;

    p4 = __flags(flags);
    bx = arg_0 << 1;
    cx = arg_2;
    _disable();
    if (W_E221 == 0) {
        W_E221 = cx;
        W_E21F = cx;
        *(int *)((char *)&TBL_E223 + 0 + bx) = cx;
    } else if (cx >= W_E21F) {
        *(int *)((char *)&TBL_E223 + 0 + bx) = cx + W_E221 - W_E21F;
    } else {
        W_E221 = W_E221 + (cx - W_E21F);
        W_E21F = cx;
        *(int *)((char *)&TBL_E223 + 0 + bx) = W_E221;
    }
    __insn("popf", p4);
    return;
}
