/* differs: 308 at +5, 183 bytes; 311 at +5, 183 bytes; 312 at +5, 182 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0

long far fn_d8b37(int arg_0)
{
    unsigned char loc_1;
    unsigned char loc_2;
    int ax;
    int ax2;
    int ax3;
    int ax4;
    int ax5;
    int cx;
    int cx2;
    int dx;
    int dx2;

    loc_2 = (unsigned char)0;
    dx = 1;
    cx = 0;
L1:
    if ((dx & arg_0) != 0) {
        goto L2;
    }
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)loc_2);
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 + 1));
    loc_2 = (char)ax;
    dx = dx << 1;
    cx = cx + 1;
    if (cx < 16) {
        goto L1;
    }
L2:
    dx2 = dx << 1;
    ax3 = ((char)(ax >> 8) << 8 | (unsigned char)loc_2);
    ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)((char)ax3 + 1));
    loc_1 = (char)ax4;
    cx2 = cx + 1;
    goto L3;
L4:
    if ((dx2 & arg_0) != 0) {
        goto L5;
    }
    ax5 = ((char)(ax4 >> 8) << 8 | (unsigned char)loc_1);
    ax4 = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 + 1));
    loc_1 = (char)ax4;
    dx2 = dx2 << 1;
    cx2 = cx2 + 1;
L3:
    if (cx2 < 16) {
        goto L4;
    }
L5:
    if (cx2 != 16) {
        goto L6;
    }
    loc_1 = (unsigned char)-1;
L6:
    return ((long)dx2 << 16 | (unsigned)(loc_1 << 8 | loc_2));
}
