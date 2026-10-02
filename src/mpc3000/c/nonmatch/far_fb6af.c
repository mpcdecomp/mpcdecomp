/* differs: 308 at +0, 182 bytes; 311 at +0, 182 bytes; 312 at +0, 182 bytes */
#define UNDEF 0
struct s1 {
    char pad_0[8];
    int f_8;
    int f_a;
};
extern long near fn_fb739(void);

int far far_fb6af(void)
{
    int ax;
    int ax2;
    unsigned int bp;
    int dx;
    int flags;
    int flags2;
    int q0;
    int q2;
    char near *si;
    struct s1 near *si2;
    long t1;

L1:
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax - 1));
    flags2 = (char)ax2;
    if (CC("==", flags2)) {
        goto L2;
    }
    if (CC("s", flags2)) {
        goto L3;
    }
    si2 = (struct s1 near *)((unsigned int)(unsigned)si * 4);
    *(int *)((char near *)si2 + 10 + UNDEF) = q0;
    *(int *)((char near *)si2 + 8 + UNDEF) = UNDEF;
    goto L4;
L3:
    si[UNDEF + 8] = (char)UNDEF;
    goto L5;
L2:
    *(int *)(0x8 + (unsigned int)(unsigned)si * 2 + UNDEF) = UNDEF;
    goto L5;
    t1 = fn_fb739();
    ax = (int)t1;
    if ((unsigned int)(int)(t1 >> 16) >= bp) {
        goto L6;
    }
    *(int *)(0x2 + UNDEF) = (int)(t1 >> 16) + 1;
    if ((unsigned int)((int)(t1 >> 16) + 1) < bp) {
        goto L7;
    }
    ax = ((char)(ax >> 8) + 1 << 8 | (unsigned char)(char)ax);
L7:
    si = (char near *)*(int *)(0x6 + UNDEF);
    dx = (int)(unsigned)(si + 1);
    flags = dx - bp;
    if (CC("<u", flags)) {
        goto L8;
    }
    dx = 0;
    flags = dx;
L8:
    *(int *)(0x6 + UNDEF) = dx;
    goto L1;
L6:
    ax2 = ((char)(ax >> 8) - 1 << 8 | (unsigned char)(char)ax);
L5:
L4:
    __insn("popf", q2);
    return (char)(ax2 >> 8);
}
long near fn_fb739(void) { return 0; }
