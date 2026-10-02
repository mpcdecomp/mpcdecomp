/* differs: 308 at +0, 199 bytes; 311 at +0, 199 bytes; 312 at +0, 198 bytes */
extern char B_744A;
extern int W_7384;
extern int W_7448;

int near fn_e80bc(void)
{
    char near *ax;
    int ax2;
    int ax3;
    int bx;
    int cx;
    int flags;
    char near *si;

    W_7384 = bx;
    si = ax + 1;
    cx = *ax;
    ax2 = *(int *)(si);
    W_7448 = ax2;
    B_744A = (char)0;
L1:
    if ((W_7384 & -0x8000) == 0) {
        goto L2;
    }
    return 209;
L2:
    ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)(inp(232) & -64));
    flags = (char)ax2 - -128;
    if (CC("!=", flags)) {
        goto L1;
    }
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)*si);
    si = si + 1;
    outp(234, (char)ax3);
    ax2 = ((char)(ax3 >> 8) << 8 | (unsigned char)10);
L3:
    ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 - 1));
    flags = (char)ax2;
    if (CC("!=", flags)) {
        goto L3;
    }
    cx = cx - 1;
    if (cx != 0) {
        goto L1;
    }
    return ax2;
}
