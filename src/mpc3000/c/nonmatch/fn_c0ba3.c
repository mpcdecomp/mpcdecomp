/* differs: 308 at +0, 53 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern char B_8188;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);

long far fn_c0ba3(void)
{
    int ax;
    int dx;
    int t1;

    if (B_8188 == 0) {
        t1 = far_b1ad0(1, 29);
        ax = far_b1b05(MK_FP(SEG_DATA, 0x490e));
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
