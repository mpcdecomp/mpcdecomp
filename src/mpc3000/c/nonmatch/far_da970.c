/* differs: 308 at +3, 105 bytes; 311 at +3, 105 bytes; 312 at +3, 105 bytes */
struct g_W_F2AE {
    long f_0;
};
extern unsigned char TBL_da9b0[];
extern struct g_W_F2AE W_F2AE;
extern int W_F2B0;
extern long far far_b1206(int, int, int);

int far far_da970(int arg_0)
{
    int ax;
    int ax2;
    int cx;
    int dx;

    ax = *(int *)((char *)&W_F2AE + 0) | W_F2B0;
    if (ax != 0) {
        goto L1;
    }
    return ax;
L1:
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)((char far *)W_F2AE.f_0));
    if ((unsigned int)(char)ax2 > 3) {
        goto L2;
    }
    switch ((unsigned int)(unsigned)(TBL_da9b0 + ((char)ax2 << 1))) {
    case 0:
        goto L3;
    case 1:
    case 2:
    case 3:
        goto L4;
    }
L3:
    dx = 4;
    cx = 124;
    goto L2;
L4:
    dx = 0;
    cx = 100;
L2:
    return (int)far_b1206(arg_0, dx, cx);
}
