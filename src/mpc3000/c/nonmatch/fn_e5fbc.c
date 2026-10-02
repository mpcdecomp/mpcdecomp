/* differs: 308 at +0, 59 bytes; 311 at +0, 59 bytes; 312 at +0, 59 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_96EF;
extern int far far_b1ad0(int, int);
extern int far far_b1af9(void);
extern int far far_b1b05(void far *);
extern long far far_b1f96(int);

void far fn_e5fbc(void)
{
    int ax;
    int t1;
    int t2;
    long t3;
    int t4;

    if (B_96EF == 0) {
        t1 = far_b1af9();
        t2 = far_b1ad0(7, 0);
        t3 = far_b1f96(40);
        t4 = far_b1ad0(7, 0);
        ax = far_b1b05(MK_FP(SEG_DATA, 0x6b08));
    }
    return;
}
