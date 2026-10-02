/* differs: 308 at +0, 335 bytes; 311 at +0, 335 bytes; 312 at +0, 335 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
int near fn_f9f5a(void)
{
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx2;
    int di;
    int flags;
    int flags2;
    char t1;
    char t2;
    int t3;

    *(int *)0x0 = 20;
    di = 10;
    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)7);
    ax = 0x68c;
L1:
    ax = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax - 1));
    flags = (char)ax;
    if (CC("!=", flags)) {
        goto L1;
    }
L2:
    if ((*(int *)0x0 & -0x8000) == 0) {
        goto L3;
    }
    *(char *)0x7 = (char)32;
    return 32;
L3:
    t3 = inpw(232);
    if (((char)t3 & -128) == 0) {
        goto L2;
    }
    flags2 = (char)t3 & 64;
    if (CC("!=", flags2)) {
        goto L4;
    }
    *(char *)0x7 = (char)32;
    return t3;
L4:
    *(char *)0x8 = (char)(t3 >> 8);
    t1 = inp(234);
    *(char far *)MK_FP(0x6dd, di) = t1;
    di = di + 1;
    ax2 = ((char)(t3 >> 8) << 8 | (unsigned char)-116);
L5:
    ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 - 1));
    flags2 = (char)ax2;
    if (CC("!=", flags2)) {
        goto L5;
    }
    t2 = inp(232);
    ax3 = ((char)(ax2 >> 8) << 8 | (unsigned char)t2);
    if (((char)ax3 & 16) == 0) {
        goto L6;
    }
    bx = ((char)(bx >> 8) << 8 | (unsigned char)((char)bx - 1));
    if ((char)bx != 0) {
        goto L2;
    }
    *(char *)0x7 = (char)32;
    return ax3;
L6:
    return ax3;
}
