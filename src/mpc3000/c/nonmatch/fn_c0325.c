/* differs: 308 match; 311 at +1A, 6 bytes; 312 at +1A, 6 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8A9E;
extern char B_901B;
extern int far far_b1ad0(int, int);
extern long far far_b1d48(void far *, int);
extern long far far_ec03b(void far *);

long far fn_c0325(void)
{
    int t1;

    t1 = far_b1ad0(0, 0);
    if (B_8A9E > 0) {
        return far_b1d48(MK_FP(SEG_DATA, 0x4650), B_8A9E);
    }
    if (B_901B == 0) {
        return far_ec03b(MK_FP(SEG_DATA, 0x467a));
    }
    return far_ec03b(MK_FP(SEG_DATA, 0x4695));
}
