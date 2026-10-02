/* differs: 308 at +2, 8 bytes; 311 at +2, 8 bytes; 312 at +2, 8 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char TBL_956E[];
extern char TBL_966E[];

long far far_db216(void)
{
    int dx;
    int si;
    int si2;

    dx = 0;
    si = 0;
    do {
        dx = dx | TBL_956E[si];
        si = si + 1;
    } while (si < 128);
    si2 = 35;
    while (si2 <= 98) {
        dx = dx | TBL_966E[si2];
        si2 = si2 + 1;
    }
    return ((long)dx << 16 | (unsigned)dx);
}
