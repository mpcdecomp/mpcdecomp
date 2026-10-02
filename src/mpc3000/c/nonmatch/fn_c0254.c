/* differs: 308 at +0, 53 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern char B_EFA5;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);

long far fn_c0254(void)
{
    int ax;
    int dx;
    int t1;

    if (B_EFA5 == 0) {
        t1 = far_b1ad0(5, 37);
        ax = far_b1b05(MK_FP(SEG_DATA, 0x454a));
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
