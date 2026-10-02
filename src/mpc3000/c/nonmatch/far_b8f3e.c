/* differs: 308 at +3D, 10 bytes; 311 at +3D, 10 bytes; 312 at +3D, 10 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1ad0(int, int);
extern int far far_b1ae0(int);
extern int far far_b1b05(char far *);
extern long far far_e4d15(int, int, char far *);

long far far_b8f3e(int arg_0, int arg_2, int arg_4)
{
    char loc_14[20];
    int ax;
    int ax2;
    long t1;

    t1 = far_e4d15(arg_0, -1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14));
    far_b1ad0(arg_2, arg_4);
    far_b1ae0(45);
    return ((long)UNDEF << 16 | (unsigned)far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_14)));
}
