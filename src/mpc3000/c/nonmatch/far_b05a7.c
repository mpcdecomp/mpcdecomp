/* differs: 308 at +E, 18 bytes; 311 at +E, 18 bytes; 312 at +E, 18 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7B88;
extern char B_7B8E;
extern char B_7B93;
extern char B_7B94;
extern int FP_7B8F;
extern int W_7B91;

void far far_b05a7(void)
{
    B_7B93 = (char)0;
    B_7B94 = (char)0;
    W_7B91 = SEG_DATA;
    FP_7B8F = (int)(unsigned)&B_7B93;
    FP_7B8F = FP_7B8F + 1;
    B_7B8E = (char)0;
    B_7B88 = (char)1;
    return;
}
