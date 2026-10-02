/* differs: 308 at +5, 310 bytes; 311 at +5, 308 bytes; 312 at +5, 309 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8C41[];
extern int W_8C47;
extern int W_8C49;
extern int W_8C4B;
extern int W_8C4D;
extern int W_8C53;
extern int W_8C55;
extern int W_9565;
extern int W_9567;
extern long far far_daa07(int, int, int, int);
extern int far far_deee8(unsigned char far *, int);
extern long far far_e2ce3(void);

int far fn_e45d1(void)
{
    int loc_2;
    int loc_4;
    int loc_6;
    unsigned int loc_8;
    int loc_a;
    unsigned int loc_c;
    int loc_e;
    int loc_10;
    int loc_12;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    unsigned int cx;
    int cx2;
    int dx;
    int dx2;
    int flags;
    int flags2;
    long t1;
    long t2;
    long t3;
    long t4;

    ax = W_8C55;
    dx = W_8C53;
    loc_2 = ax;
    loc_4 = dx;
    loc_6 = ax;
    loc_8 = dx;
    ax2 = W_9565 + W_9567;
    loc_12 = ax2;
    far_deee8((unsigned char far *)B_8C41, ax2);
    dx2 = W_8C53;
    loc_a = W_8C55;
    loc_c = dx2;
    W_8C55 = loc_2;
    W_8C53 = loc_4;
    ax4 = loc_a;
    flags = ax4 - loc_6;
    if (!CC(">u", flags) && (CC("<u", flags) || loc_c < loc_8)) {
        t1 = far_daa07(W_8C47, W_8C49, loc_8, loc_6);
        t2 = far_daa07(loc_c, loc_a, W_8C4B, W_8C4D);
        cx = (int)t1 + (int)t2;
        loc_e = (int)(t1 >> 16) + (int)(t2 >> 16) + (cx < (unsigned int)(int)t1);
        loc_10 = cx;
    } else {
        t3 = far_daa07(loc_c, loc_a, loc_8, loc_6);
        loc_e = (int)(t3 >> 16);
        loc_10 = (int)t3;
    }
    t4 = far_e2ce3();
    cx2 = loc_10;
    bx = (int)(((long)loc_e << 16 | (unsigned)cx2) + 0x190L >> 16);
    flags2 = (int)(t4 >> 16) - bx;
    if (!CC(">", flags2) && (CC("<", flags2) || (unsigned int)(int)t4 < (unsigned int)(cx2 + 0x190))) {
        return -3;
    }
    return 0;
}
