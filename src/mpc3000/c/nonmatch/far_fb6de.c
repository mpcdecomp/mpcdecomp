/* differs: 308 at +0, 173 bytes; 311 at +0, 173 bytes; 312 at +0, 173 bytes */
#define UNDEF 0
extern long near fn_fb739(void);

long far far_fb6de(void)
{
    int ax;
    int ax2;
    int bp;
    int dx;
    int dx2;
    int flags;
    int flags2;
    int q0;
    int q2;
    int si;
    long t1;

L1:
    ax2 = ((char)(ax >> 8) - 1 << 8 | (unsigned char)(char)ax);
L2:
    dx2 = q0;
L3:
    __insn("popf", q2);
    return ((long)dx2 << 16 | (unsigned)(char)(ax2 >> 8));
    t1 = fn_fb739();
    ax = (int)t1;
    if ((int)(t1 >> 16) == 0) {
        goto L1;
    }
    *(int *)(0x2 + UNDEF) = (int)(t1 >> 16) - 1;
    if ((int)(t1 >> 16) != 1) {
        goto L4;
    }
    ax = ((char)(ax >> 8) + 1 << 8 | (unsigned char)(char)ax);
L4:
    si = *(int *)(0x4 + UNDEF);
    dx = si + 1;
    flags = dx - bp;
    if (CC("<u", flags)) {
        goto L5;
    }
    dx = 0;
    flags = dx;
L5:
    *(int *)(0x4 + UNDEF) = dx;
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax - 1));
    flags2 = (char)ax2;
    if (CC("==", flags2)) {
        goto L6;
    }
    if (CC("s", flags2)) {
        goto L7;
    }
    dx2 = *(int *)(0xa + si * 4 + UNDEF);
    goto L3;
L7:
    goto L2;
L6:
    goto L2;
}
long near fn_fb739(void) { return 0; }
