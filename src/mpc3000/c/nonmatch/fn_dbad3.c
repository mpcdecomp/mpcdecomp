/* differs: 308 at +0, 82 bytes; 311 at +0, 83 bytes; 312 at +0, 83 bytes */
struct s1 {
    char pad_0[1];
    char f_1;
};
extern char B_8A9B;
extern char B_96EE;
extern long far far_cb772(struct s1 far *);
extern long far far_dcf84(struct s1 far *, int, int);

long near fn_dbad3(void)
{
    int ax;
    struct s1 near *bx;
    int cx;
    int dx;
    long t1;
    long t2;

    if (B_96EE == 0) {
        goto L1;
    }
    bx->f_1 = B_8A9B;
    t1 = far_dcf84((struct s1 far *)bx, cx, 0);
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    goto L2;
L1:
    t2 = far_cb772((struct s1 far *)bx);
    ax = (int)t2;
    dx = (int)(t2 >> 16);
L2:
    return ((long)dx << 16 | (unsigned)ax);
}
