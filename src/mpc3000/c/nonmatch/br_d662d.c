/* differs: 308 at +0, 82 bytes; 311 at +0, 82 bytes; 312 at +0, 82 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int TBL_7144[];
extern int far far_dac9a(void);
extern long far far_fb6de(void);
extern long near fn_d699c(void);
extern long near tgt_d651f();
long near tgt_d651f(void) { return 0; }

long near br_d662d(void)
{
    int ax;
    int bx;
    int dx;
    int si;
    long t1;
    int t2;
    long t3;

    ax = far_dac9a();
    dx = UNDEF;
    if (!CC("ns", UNDEF)) {
        t1 = far_fb6de();
        t2 = far_dac9a();
        t3 = fn_d699c();
        ax = (int)t3;
        dx = (int)(t3 >> 16);
        bx = (int)(unsigned)tgt_d651f;
    } else {
        bx = (int)(unsigned)br_d662d;
    }
    TBL_7144[si] = bx;
    return ((long)dx << 16 | (unsigned)ax);
}
