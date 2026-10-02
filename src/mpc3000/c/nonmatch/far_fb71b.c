/* differs: 308 at +0, 160 bytes; 311 at +0, 160 bytes; 312 at +0, 160 bytes */
#define UNDEF 0
extern long near fn_fb739(void);

long far far_fb71b(void)
{
    int ax;
    int ax2;
    int bp;
    int dx;
    int flags;
    int flags2;
    int flags3;
    int q0;
    int q2;
    int si;
    int si2;
    long t1;

L1:
    ax2 = ((char)(ax >> 8) - 1 << 8 | (unsigned char)(char)ax);
L2:
    dx = q0;
L3:
    __insn("popf", q2);
    return ((long)dx << 16 | (unsigned)(char)(ax2 >> 8));
L4:
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax - 1));
    flags3 = (char)ax2;
    if (CC("==", flags3)) {
        goto L5;
    }
    if (CC("s", flags3)) {
        goto L6;
    }
    dx = *(int *)(0xa + si2 * 4 + UNDEF);
    goto L3;
L6:
    goto L2;
L5:
    goto L2;
    t1 = fn_fb739();
    ax = (int)t1;
    if ((int)(t1 >> 16) == 0) {
        goto L1;
    }
    *(int *)(0x2 + UNDEF) = (int)(t1 >> 16) - 1;
    if ((int)(t1 >> 16) != 1) {
        goto L7;
    }
    ax = ((char)(ax >> 8) + 1 << 8 | (unsigned char)(char)ax);
L7:
    si = *(int *)(0x6 + UNDEF);
    flags = si;
    if (CC("!=", flags)) {
        goto L8;
    }
    si = bp;
L8:
    si2 = si - 1;
    flags2 = si2;
    *(int *)(0x6 + UNDEF) = si2;
    goto L4;
}
long near fn_fb739(void) { return 0; }
