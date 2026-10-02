/* differs: 308 match; 311 at +26, 6 bytes; 312 at +26, 6 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern int far far_b1b2b(char far *, char far *);
extern long far fn_c4174(void);

long far fn_c3ed1(void)
{
    char loc_1;
    char loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int ax7;
    int t1;

    far_b1b2b((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_1), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_2));
    far_b1ad0(3, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x4f09));
    far_b1ad0(4, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x4f32));
    far_b1ad0(5, 0);
    t1 = far_b1b05(MK_FP(SEG_DATA, 0x4f5b));
    far_b1ad0(loc_1, loc_2);
    return fn_c4174();
}
long far fn_c4174(void) { return 0; }
