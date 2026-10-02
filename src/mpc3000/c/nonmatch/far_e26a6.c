/* differs: 308 at +0, 35 bytes; 311 at +0, 35 bytes; 312 at +0, 34 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8AA0;
extern unsigned char TBL_8AA1[];
extern long far far_e259f(int);
long far far_e259f(int p0) { return 0; }

void far far_e26a6(void)
{
    long t1;

    if (B_8AA0 == 0) {
        __stos2((unsigned char far *)TBL_8AA1, 0, 0x190);
        t1 = far_e259f(99);
        B_8AA0 = (char)1;
    }
    return;
}
