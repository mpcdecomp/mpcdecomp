/* differs: 308 at +0, 74 bytes; 311 at +0, 74 bytes; 312 at +0, 73 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

void far far_b0524(void)
{
    int ax;
    int cx;
    char t1;
    char t2;
    char t3;

    cx = 3;
    do {
        t1 = inp(192);
        t2 = inp(200);
        t3 = inp(208);
        ax = ((char)(ax >> 8) << 8 | (unsigned char)inp(216));
        cx = cx - 1;
    } while (cx != 0);
    outp(-0x3fef, (char)(inp(-0x3fef) & -49));
    return;
}
