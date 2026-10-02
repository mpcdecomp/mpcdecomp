/* differs: 308 at +3, 148 bytes; 311 at +3, 148 bytes; 312 at +3, 148 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

int far far_db0a2(long arg_0)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int bx;
    int es;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es, bx + 58) = *(int far *)MK_FP(es, bx + 58) - 1;
    *(int far *)MK_FP(es, bx + 52) = *(int far *)MK_FP(es, bx + 52) + 1;
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 54));
    *(char far *)MK_FP(es, bx + 54) = (char)((char)ax + 1);
    ax3 = (unsigned char)((char)ax + 1);
    if (ax3 >= *(int far *)MK_FP(es, bx + 64)) {
        *(char far *)MK_FP(es, bx + 54) = (char)0;
        ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, bx + 55));
        ax3 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 + 1));
        *(char far *)MK_FP(es, bx + 55) = (char)ax3;
        if ((unsigned char)(char)ax3 > (unsigned char)*(char far *)MK_FP(es, bx + 60)) {
            *(char far *)MK_FP(es, bx + 55) = (char)1;
            *(int far *)MK_FP(es, bx + 52) = 0;
            *(int far *)MK_FP(es, bx + 56) = *(int far *)MK_FP(es, bx + 56) + 1;
        }
    }
    return ax3;
}
