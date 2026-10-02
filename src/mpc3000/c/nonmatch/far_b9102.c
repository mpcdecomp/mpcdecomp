/* differs: 308 at +6, 11 bytes; 311 at +10, 9 bytes; 312 at +10, 9 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_b1b05(void far *);
extern long far far_b90dd(void);
long far far_b90dd(void) { return 0; }

long far far_b9102(void)
{
    long t1;

    t1 = far_b90dd();
    return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x3091)));
}
