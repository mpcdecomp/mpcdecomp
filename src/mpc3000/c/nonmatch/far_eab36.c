/* differs: 308 at +6, 176 bytes; 311 at +6, 176 bytes; 312 at +6, 176 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_9563;
extern int far far_b1ae0(int);
extern int far far_b1b05(char far *);
extern long far far_d7805(int, char far *, int, int);

void far far_eab36(int arg_0, int arg_2, int arg_4)
{
    char loc_8[8];
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    long t1;
    long t2;
    long t3;

    *(int *)((char *)&loc_8 + 6) = arg_2;
    *(int *)((char *)&loc_8 + 4) = arg_0;
    t1 = far_d7805(*(int far *)((char far *)*(long *)((char *)&loc_8 + 4) + 2) + W_9563, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), 3, 48);
    far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8));
    far_b1ae0(46);
    t2 = far_d7805(*(char far *)((char far *)*(long *)((char *)&loc_8 + 4) + 1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), 2, 48);
    far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8));
    far_b1ae0(46);
    if (arg_4 != 0) {
        far_b1b05(MK_FP(SEG_DATA, 0x6d48));
        return;
    }
    t3 = far_d7805((unsigned char)*(char far *)((char far *)*(long *)((char *)&loc_8 + 4)), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8), 2, 48);
    far_b1b05((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_8));
    return;
}
