/* differs: 308 at +12, 32 bytes; 311 at +12, 30 bytes; 312 at +12, 32 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_9560;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);

long far fn_c6867(void)
{
    int ax;

    far_b1ad0(7, 6);
    if (B_9560 == 0) {
        return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x5dc0)));
    }
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x5dc4)));
}
