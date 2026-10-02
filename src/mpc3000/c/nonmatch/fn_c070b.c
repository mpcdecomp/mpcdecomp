/* differs: 308 at +33, 7 bytes; 311 at +18, 11 bytes; 312 at +18, 11 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1aac();
extern int far far_b1b05();
extern int far far_d79ee();

long far fn_c070b(int arg_0, int arg_2)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;

    far_b1aac();
    far_b1b05(*(long *)((char *)&arg_0 + 0));
    far_b1b05(MK_FP(SEG_DATA, 0x46a2));
    far_b1b05(MK_FP(SEG_DATA, 0x46c4));
    far_d79ee();
    return ((long)UNDEF << 16 | (unsigned)77);
}
