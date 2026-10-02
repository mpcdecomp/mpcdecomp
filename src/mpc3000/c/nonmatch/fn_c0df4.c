/* differs: 308 at +2E, 39 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1f96(int);

long far fn_c0df4(int arg_0, int arg_2)
{
    int ax;
    int ax2;
    int dx;
    int t1;

    far_b1ad0(5, 24);
    if (arg_0 == 0 || arg_0 == 1 || (arg_0 == 4 || arg_0 == 5) || arg_0 >= 41) {
        arg_2 = 0;
        ax2 = far_b1f96(40);
        dx = UNDEF;
    } else {
        t1 = far_b1b05(MK_FP(SEG_DATA, 0x4982));
        dx = (int)(far_b1073(5) >> 16);
    }
    return ((long)dx << 16 | (unsigned)arg_2);
}
