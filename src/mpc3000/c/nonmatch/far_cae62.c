/* differs: 308 at +3, 223 bytes; 311 at +3, 222 bytes; 312 at +3, 222 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern char B_CEC2;
extern unsigned char B_CEC3;
extern long far far_caee6(void);

long far far_cae62(int arg_4)
{
    int ax;
    int ax2;
    int ax3;
    unsigned int ax4;
    int ax5;
    int ax6;
    int dx;
    int dx2;
    int si;
    long t1;
    long t2;

    t1 = far_caee6();
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    if ((char)(ax >> 8) != 0) {
        goto L1;
    }
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(UNDEF, UNDEF + 24));
    B_CEC2 = (char)ax2;
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 << 1));
    ax4 = arg_4;
    ax5 = ((char)(ax4 % (unsigned char)(char)ax3) << 8 | (unsigned char)(char)(ax4 / (unsigned char)(char)ax3));
    if (B_CEC3 <= (unsigned char)(char)ax5) {
        goto L2;
    }
    B_CEC3 = (char)ax5;
L2:
    si = B_CEC3;
L3:
    t2 = far_caee6();
    ax = (int)t2;
    dx = (int)(t2 >> 16);
    if ((char)(ax >> 8) != 0) {
        goto L1;
    }
    dx2 = ((char)(dx >> 8) + 1 << 8 | (unsigned char)(char)dx);
    if ((char)(dx2 >> 8) != 2) {
        goto L3;
    }
    dx = (unsigned char)(char)dx2;
    si = si - 1;
    if (si != 0) {
        goto L3;
    }
    ax6 = 0;
    goto L4;
L1:
    ax6 = (-1 << 8 | (unsigned char)(char)(ax >> 8));
L4:
    return ((long)dx << 16 | (unsigned)ax6);
}
long far far_caee6(void) { return 0; }
