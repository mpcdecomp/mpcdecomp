/* differs: 308 at +4, 15 bytes; 311 at +4, 15 bytes; 312 at +4, 15 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_96EF;
extern int far far_b1aff(void);

int far far_e5ff8(void)
{
    int ax;

    ax = B_96EF;
    if (ax == 0) {
        ax = far_b1aff();
    }
    return ax;
}
