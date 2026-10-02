/* differs: 308 at +3F, 10 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);

long far fn_ba62f(int arg_0, char arg_2)
{
    int ax;
    int ax2;

    far_b1ad0(2, 27);
    if (*(char *)((char *)&arg_0 + 0) != 1) {
        goto L1;
    }
    if (arg_2 != 0) {
        goto L1;
    }
    far_b1b05(MK_FP(SEG_DATA, 0x3877));
    return far_b1073(3);
L1:
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x3893)));
}
