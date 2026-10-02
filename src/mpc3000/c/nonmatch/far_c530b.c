/* differs: 308 absent; 311 at +3, 54 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);

long far far_c530b(int arg_0, int arg_2, char arg_4)
{
    int ax;
    int dx;
    int t1;

    if (*(char *)((char *)&arg_0 + 0) < 35) {
        t1 = far_b1ad0(*(char *)((char *)&arg_2 + 0), arg_4);
        ax = far_b1b05(MK_FP(SEG_DATA, 0x5ae4));
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
