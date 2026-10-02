/* differs: 308 at +5, 22 bytes; 311 at +5, 22 bytes; 312 at +5, 22 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_E21F;
extern long far far_fb38c(void);

void far far_cddaa(void)
{
    long t1;

    if (W_E21F <= 0) {
        return;
    }
    W_E21F = W_E21F - 1;
    if (W_E21F != 1) {
        return;
    }
    t1 = far_fb38c();
    return;
}
