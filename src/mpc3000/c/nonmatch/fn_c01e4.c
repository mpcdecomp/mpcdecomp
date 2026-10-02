/* differs: 308 at +12, 31 bytes; 311 at +12, 33 bytes; 312 at +12, 33 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_A56E;
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);

long far fn_c01e4(void)
{
    int ax;

    far_b1ad0(7, 18);
    if (B_A56E == 0) {
        return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x454a)));
    }
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x463f)));
}
