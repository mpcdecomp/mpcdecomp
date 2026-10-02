/* differs: 308 at +0, 47 bytes; 311 at +0, 47 bytes; 312 at +0, 47 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_83B6;
extern char B_83B7;

int far fn_b9817(void)
{
    if (B_83B6 == 0) {
        return 1;
    }
    if (B_83B6 == 1 && B_83B7 != 0) {
        return 1;
    }
    if (B_83B6 == 2 && B_83B7 == 0) {
        return 1;
    }
    return 0;
}
