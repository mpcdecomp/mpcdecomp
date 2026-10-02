/* differs: 308 absent; 311 at +0, 89 bytes; 312 at +0, 89 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
int near fn_f8ec8(void)
{
    int ax;
    int ax2;
    int bx;
    int cx;
    int si;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)1);
    bx = 0x317;
    cx = 4;
L1:
    if (si == *(int far *)MK_FP(0xf800, bx)) {
        goto L2;
    }
    bx = bx + 2;
    ax = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax + 1));
    cx = cx - 1;
    if (cx != 0) {
        goto L1;
    }
    ax = ((char)(ax >> 8) << 8 | (unsigned char)-1);
L2:
    return ax;
}
