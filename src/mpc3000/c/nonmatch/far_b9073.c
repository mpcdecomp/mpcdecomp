/* differs: 308 at +7, 113 bytes; 311 at +7, 113 bytes; 312 at +7, 113 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1ad0();
extern int far far_b1ae0();
extern int far far_b1b05();
extern long far far_e4d15();
extern long far far_e7309();

long far far_b9073(int arg_0, int arg_2, int arg_4, int arg_6)
{
    char loc_16[22];
    int ax2;
    int ax3;
    long t1;

    if (arg_2 == 0) {
        __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16), MK_FP(SEG_DATA, 0x3333), 16);
        loc_16[16] = *(char *)(0x3343);
    } else {
        *(int *)((char *)&loc_16 + 20) = (int)far_e7309(arg_0, arg_2);
        t1 = far_e4d15(arg_0, loc_16[20], (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16));
    }
    far_b1ad0(arg_4, arg_6);
    far_b1ae0(45);
    return ((long)UNDEF << 16 | (unsigned)far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_16)));
}
