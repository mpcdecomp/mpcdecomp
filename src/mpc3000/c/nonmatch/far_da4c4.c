/* differs: 308 at +3, 162 bytes; 311 at +3, 160 bytes; 312 at +3, 160 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char pad_0[5];
    int f_5;
};

long far far_da4c4(struct s1 far *arg_0, int arg_4, int arg_6, char arg_8)
{
    int ax;
    int ax2;
    int bx;
    int bx2;
    int dx;
    int dx2;
    int es;
    int es2;
    int es3;

    dx = ((char)(dx2 >> 8) << 8 | (unsigned char)*(char *)((char *)&arg_4 + 0));
    if ((char)dx != 0) {
        es = FP_SEG(arg_0);
        *(char far *)MK_FP(es, *(int *)((char *)&arg_0 + 0)) = (char)dx;
        *(char far *)MK_FP(es, FP_OFF(arg_0) + 1) = (char)dx;
    } else {
        bx = FP_OFF(arg_0);
        es2 = FP_SEG(arg_0);
        *(char far *)MK_FP(es2, bx) = *(char far *)MK_FP(es2, bx + 1);
    }
    bx2 = FP_OFF(arg_0);
    es3 = FP_SEG(arg_0);
    *(char far *)MK_FP(es3, bx2 + 3) = *(char *)((char *)&arg_6 + 0);
    ax = (unsigned char)*(char far *)MK_FP(es3, bx2) & 96;
    if (ax != 64) {
        *(int far *)MK_FP(es3, bx2 + 5) = 2;
        ax2 = ((char)(ax >> 8) << 8 | (unsigned char)arg_8);
        *(char far *)MK_FP(es3, bx2 + 4) = (char)ax2;
        return ((long)dx << 16 | (unsigned)ax2);
    }
    arg_0->f_5 = 1;
    return ((long)dx << 16 | (unsigned)ax);
}
