/* differs: 308 at +3, 649 bytes; 311 at +3, 656 bytes; 312 at +3, 655 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_71A8;
extern int W_71AA;
extern int W_71AC;
extern int W_71AE;
extern int W_71B0;
extern int W_71B2;
extern int W_71B4;
extern int W_71B6;
extern int W_71B8;
extern int W_71BA;
extern int W_71BC;
extern int W_71BE;
extern int W_71C0;
extern int W_71C2;
extern int W_71C4;
extern int W_71C6;
extern int W_71C8;
extern int W_71CA;
extern int W_71CC;
extern int W_71CE;
extern int W_71D0;

void far far_d9cb4(int arg_0)
{
    int ax;

    outpw(96, 31);
    outpw(102, W_71A8);
    outpw(100, W_71AA);
    outpw(98, W_71AC);
    outpw(96, 0x11f);
    outpw(102, W_71B2);
    outpw(100, W_71B4);
    outpw(98, 0x1000);
    outpw(96, 0x21f);
    outpw(100, W_71AE);
    outpw(98, W_71B0);
    outpw(96, 0x41f);
    outpw(100, -1);
    outpw(98, 0x2e1);
    outpw(96, 0x61f);
    outpw(100, 0x7ff0);
    outpw(98, 0x147);
    outpw(96, 0x51f);
    outpw(100, 0x3fff);
    outpw(98, -1);
    outpw(96, 0x31f);
    outpw(100, 0);
    outpw(98, 0);
    outpw(96, 0x71f);
    outpw(100, 0);
    if (arg_0 == 2) {
        outpw(98, 0x5000);
    } else {
        outpw(98, 0x5050);
    }
    if (arg_0 == 2) {
        outpw(96, 31);
        outpw(102, W_71B6);
        outpw(100, W_71B8);
        outpw(98, W_71BA);
        outpw(96, 0x11f);
        outpw(102, W_71C0);
        outpw(100, W_71C2);
        outpw(98, 0x1000);
        outpw(96, 0x21f);
        outpw(100, W_71BC);
        outpw(98, W_71BE);
        outpw(96, 3);
        outpw(102, W_71C4);
        outpw(100, W_71C6);
        outpw(98, W_71C8);
        outpw(96, 0x103);
        outpw(102, W_71CE);
        outpw(100, W_71D0);
        outpw(98, 0x1000);
        outpw(96, 0x203);
        outpw(100, W_71CA);
        outpw(98, W_71CC);
        outpw(96, 0x403);
        outpw(100, -1);
        outpw(98, 0x2e1);
        outpw(96, 0x603);
        outpw(100, 0x7ff0);
        outpw(98, 0x147);
        outpw(96, 0x503);
        outpw(100, 0x3fff);
        outpw(98, -1);
        outpw(96, 0x703);
        outpw(98, 80);
        outpw(100, 0);
        outpw(96, 0x303);
        outpw(100, 0);
        outpw(98, 0);
    }
    ax = (1 << 8 | (unsigned char)inp(104)) & -129;
    outpw(104, ax);
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)inp(104));
    } while (((char)ax & -128) != 0);
    return;
}
