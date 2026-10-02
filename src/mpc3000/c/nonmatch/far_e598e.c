/* differs: 308 at +10, 29 bytes; 311 at +10, 29 bytes; 312 at +10, 29 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8806;
extern char B_8A9F;
extern char B_8C41;
extern char B_901B;
extern char B_D612;
extern char B_F74E;
extern char B_F74F;
extern char B_F750;
extern int W_9051;
extern int W_9053;
extern int W_F746;
extern int W_F748;
extern int W_F74A;
extern int W_F74C;

void far far_e598e(void)
{
    int dx;

    B_F750 = B_901B;
    W_F74C = B_8A9F;
    dx = W_9051;
    W_F748 = W_9053;
    W_F746 = dx;
    B_F74F = B_8C41;
    W_F74A = B_8806;
    B_F74E = B_D612;
    return;
}
