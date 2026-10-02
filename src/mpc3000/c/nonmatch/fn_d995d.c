/* differs: 308 at +0, 98 bytes; 311 at +0, 98 bytes; 312 at +0, 98 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct s1 {
    char pad_0[6];
    int f_6;
    int f_8;
    char pad_a[2];
    int f_c;
};

long near fn_d995d(void)
{
    int ax;
    int ax2;
    struct s1 near *bx;
    int dx;
    int es;
    int flags;
    int si;

    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, si));
    dx = es;
    if (si != -1) {
        goto L1;
    }
    dx = dx + 0x1000;
L1:
    flags = dx - bx->f_8;
    if (CC("<u", flags)) {
        goto L2;
    }
    if (CC("!=", flags)) {
        goto L3;
    }
    if ((unsigned int)(si + 1) < (unsigned int)bx->f_6) {
        goto L2;
    }
L3:
    dx = bx->f_c;
L2:
    return ((long)dx << 16 | (unsigned)ax);
}
