/* differs: 308 at +0, 59 bytes; 311 at +0, 58 bytes; 312 at +0, 59 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int far far_d79ee(void);

long far fn_c820c(void)
{
    int dx;
    int dx2;

    dx = ((char)(dx2 >> 8) << 8 | (unsigned char)0);
    goto L1;
L2:
    dx = ((char)(UNDEF >> 8) << 8 | (unsigned char)(char)far_d79ee());
L1:
    if ((char)dx == 122) {
        goto L3;
    }
    if ((char)dx != 117) {
        goto L2;
    }
L3:
    if ((char)dx != 117) {
        goto L4;
    }
    return ((long)dx << 16 | (unsigned)1);
L4:
    return ((long)dx << 16 | (unsigned)0);
}
