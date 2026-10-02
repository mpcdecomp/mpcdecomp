/* differs: 308 at +C, 58 bytes; 311 at +C, 57 bytes; 312 at +C, 58 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_901B;
extern int W_902D;
extern int W_902F;
extern int W_9055;
extern long far far_dda74(char far *);
extern long far far_de41c(void);

void far far_dade6(void)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int dx;
    long t1;
    long t2;

    if (B_901B == 0) {
        B_901B = (char)1;
        dx = W_902D;
        loc_2 = W_902F;
        loc_4 = dx;
        loc_6 = W_9055;
        t1 = far_dda74((char far *)&B_901B);
        t2 = far_de41c();
        W_9055 = loc_6;
        W_902F = loc_2;
        W_902D = loc_4;
        B_901B = (char)0;
    }
    return;
}
