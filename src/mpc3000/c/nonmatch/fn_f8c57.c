/* differs: 308 absent; 311 at +0, 246 bytes; 312 at +0, 246 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
void near fn_f8c57(void)
{
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int ax6;
    int bx;
    int bx2;
    unsigned int cx;
    int cx2;
    int dx;
    int es;
    int p10;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)1);
    cx = *(int *)0x1e;
L1:
    *(char far *)MK_FP(es, bx) = (char)(cx2 >> 8);
    bx2 = bx + 1;
    *(char far *)MK_FP(es, bx2) = (char)(dx >> 8);
    *(char far *)MK_FP(es, bx2 + 1) = (char)cx;
    cx = cx + 1;
    if (cx <= (unsigned int)*(int *)0xd) {
        goto L2;
    }
    cx = 1;
L2:
    p10 = ax;
    ax3 = ((char)(*(int *)0x0 << 1 >> 8) << 8 | (unsigned char)0);
L3:
    ax4 = ((unsigned int)(char)(ax3 >> 8) >> 1 << 8 | (unsigned char)(char)ax3);
    if ((char)(ax4 >> 8) == 0) {
        goto L4;
    }
    ax3 = ((char)(ax4 >> 8) << 8 | (unsigned char)((char)ax4 + 1));
    goto L3;
L4:
    *(char far *)MK_FP(es, bx2 + 2) = (char)ax4;
    bx = bx2 + 3;
    ax = ((char)(p10 >> 8) << 8 | (unsigned char)((char)p10 + 1));
    if ((unsigned char)(char)ax <= (unsigned char)*(char *)0xd) {
        goto L1;
    }
    ax5 = *(int *)0x1e;
    ax6 = ax5 - 3;
    if (ax5 > 3) {
        goto L5;
    }
    ax6 = ax6 + *(int *)0xd;
L5:
    *(int *)0x1e = ax6;
    return;
}
