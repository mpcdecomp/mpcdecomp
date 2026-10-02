/* differs: 308 at +0, 271 bytes; 311 at +0, 271 bytes; 312 at +0, 271 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long near fn_f9e9b(void)
{
    int ax;
    int ax2;
    int bp;
    int bx;
    int bx2;
    int cx;
    int cx2;
    unsigned int dx;
    int dx2;
    unsigned int dx3;
    unsigned int dx4;

    outp(-0x3ff1, (char)15);
    outp(-0x3fff, (char)1);
    outpw(-0x3ff8, 20);
    dx = *(int far *)MK_FP(SEG_STACK, bp + 6);
    dx2 = dx << 4 | dx >> 12;
    dx3 = dx2 & -16;
    dx4 = dx3 + *(int far *)MK_FP(SEG_STACK, bp + 8);
    cx = (((char)(cx2 >> 8) << 8 | (unsigned char)(char)dx2) & 15) + (dx4 < dx3);
    if ((char)ax != 87) {
        if ((char)ax != 86) {
            bx = ((char)(bx2 >> 8) << 8 | (unsigned char)68);
        } else {
            bx = 0;
        }
    } else {
        bx = ((char)(bx2 >> 8) << 8 | (unsigned char)72);
    }
    outpw(-0x3ffc, dx4);
    ax2 = cx | 48;
    outp(-0x3ffa, (char)ax2);
    outpw(-0x3ffe, (((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(SEG_STACK, bp)) << (unsigned char)(*(char far *)MK_FP(0xf800, *(int *)0x2 + 3) + 7)) - 1);
    outp(-0x3ff6, (char)bx);
    outpw(-0x3ff8, 16);
    outp(-0x3ff1, (char)13);
    return -0x3ff10000L;
}
