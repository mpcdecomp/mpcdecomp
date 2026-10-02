/* differs: 308 match; 311 at +E, 2 bytes; 312 at +E, 2 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_ea926(int);

void far far_bffc9(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;

    far_b1ad0(6, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x4616));
    far_ea926(0);
    far_b1ad0(7, 0);
    return;
}
