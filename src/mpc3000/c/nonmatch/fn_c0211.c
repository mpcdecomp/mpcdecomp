/* differs: 308 at +1E, 21 bytes; 311 at +1E, 23 bytes; 312 at +1E, 23 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_901C;
extern char B_EFB3;
extern int W_904D;
extern int W_EFB1;
extern long far far_b1073(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);

long far fn_c0211(void)
{
    int ax;
    long t1;

    B_EFB3 = (char)(B_901C & 1);
    W_EFB1 = W_904D;
    t1 = far_b1073(6);
    if (B_EFB3 == 0) {
        far_b1ad0(2, 36);
        return ((long)UNDEF << 16 | (unsigned)far_b1b05(MK_FP(SEG_DATA, 0x4643)));
    }
    return far_b1073(7);
}
