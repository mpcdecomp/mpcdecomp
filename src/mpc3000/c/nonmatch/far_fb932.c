/* differs: 308 at +0, 117 bytes; 311 at +0, 117 bytes; 312 at +0, 117 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_8C39;
extern int W_8C3B;
extern int W_8C3D;
extern int W_8C3F;

void far far_fb932(void)
{
    unsigned int ax;
    unsigned int ax2;
    int bx;
    int cx;
    int cx2;
    unsigned int dx;
    int dx2;
    unsigned int dx3;

    if (0) {
        ax = 0x200;
        bx = 0x6fff;
    } else {
        ax = 0x6df;
        bx = 0x7fff;
    }
    dx = 0;
    cx = 4;
    do {
        ax = ax << 1;
        dx = dx << 1 | ax >> 15 & 1;
        cx = cx - 1;
    } while (cx != 0);
    W_8C39 = ax;
    W_8C3B = dx >> 4 | dx << 12;
    dx2 = 0;
    ax2 = bx;
    cx2 = 4;
    do {
        ax2 = ax2 << 1;
        dx2 = dx2 << 1 | ax2 >> 15 & 1;
        cx2 = cx2 - 1;
    } while (cx2 != 0);
    dx3 = (int)(((long)dx2 << 16 | (unsigned)ax2) + 14L >> 16);
    W_8C3D = ax2 + 14;
    W_8C3F = dx3 >> 4 | dx3 << 12;
    return;
}
