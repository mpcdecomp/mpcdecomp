/* differs: 308 at +6, 37 bytes; 311 at +6, 37 bytes; 312 at +6, 37 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FCC;
extern int W_7FC8;
extern int W_8A98;
extern int W_D651;
extern int W_D653;
extern long far far_de78c(void);
extern long far far_de7ae(int, int, int);

long far far_e70e6(void)
{
    int ax;

    if (B_7FCC != 0) {
        ax = W_8A98;
    } else {
        ax = W_7FC8;
    }
    W_D651 = ax;
    W_D653 = (int)far_de7ae(ax, 0, 0);
    return far_de78c();
}
