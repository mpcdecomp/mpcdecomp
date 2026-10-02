/* differs: 308 at +3, 175 bytes; 311 at +3, 174 bytes; 312 at +3, 174 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern char B_CEC1;
extern char B_CEC2;
extern unsigned char B_CEC3;
extern long far far_caee6(void);

long far far_caf26(void)
{
    int ax;
    int ax2;
    int ax3;
    int dx;
    int dx2;
    int si;
    long t1;
    long t2;

    t1 = far_caee6();
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    if (CC("<u", UNDEF)) {
        goto L1;
    }
    ax2 = (B_CEC2 << 8 | (unsigned char)*(char far *)MK_FP(UNDEF, UNDEF + 24));
    ax3 = -0xc00;
    if ((char)(ax2 >> 8) != (char)ax2) {
        goto L2;
    }
    si = B_CEC3;
L3:
    t2 = far_caee6();
    ax = (int)t2;
    dx = (int)(t2 >> 16);
    if (CC("<u", UNDEF)) {
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
    B_CEC1 = (char)((char)(UNDEF >> 8) + 1);
    ax3 = 0;
    goto L2;
L1:
    ax3 = (-1 << 8 | (unsigned char)(char)(ax >> 8));
L2:
    return ((long)dx << 16 | (unsigned)ax3);
}
