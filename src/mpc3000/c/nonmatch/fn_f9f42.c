/* differs: 308 at +0, 53 bytes; 311 at +0, 53 bytes; 312 at +0, 53 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int near fn_f9f42(void)
{
    int ax;

    while ((*(int *)0x0 & -0x8000) == 0) {
        *(char *)0x9 = (char)((unsigned int)*(char *)0x9 >> 1);
        if (*(char *)0x9 & 1) {
            goto L1;
        }
    }
    *(char *)0x7 = (char)-128;
    return 128;
L1:
    return;
}
