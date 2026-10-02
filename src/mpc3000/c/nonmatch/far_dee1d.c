/* differs: 308 at +5, 121 bytes; 311 at +5, 121 bytes; 312 at +5, 121 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_901B;
extern int W_8814;
extern int W_9051;
extern int W_9053;
extern int W_9055;
extern long far far_e5612(int, int);
extern void far fn_dec8e(char far *);
void far fn_dec8e(char far *p0) { }

void far far_dee1d(void)
{
    int ax;
    int ax2;
    int ax3;
    int t1;
    int t2;

    if (B_901B != 0) {
        return;
    }
    if (W_8814 == 0) {
        ax = (int)far_e5612(W_9051, W_9053);
    }
    if (W_9053 == 1 && W_9051 == 0x100) {
        return;
    }
    if (W_8814 == 0) {
        fn_dec8e((char far *)&B_901B);
        ax2 = (int)far_e5612(W_9051, W_9053);
        if (W_9055 == 0) {
            return;
        }
L1:
        if (W_8814 != 0) {
            while (W_8814 != 0) {
                fn_dec8e((char far *)&B_901B);
            }
            ax3 = (int)far_e5612(W_9051, W_9053);
        }
        return;
    }
    goto L1;
}
