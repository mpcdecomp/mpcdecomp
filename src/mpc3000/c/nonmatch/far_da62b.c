/* differs: 308 absent; 311 at +5, 62 bytes; 312 at +5, 62 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern long far far_cbb70(int);
extern int far far_dab06(int);

long far far_da62b(int arg_0)
{
    int loc_2;
    int ax;
    int dx;
    long t1;

    ax = far_dab06(arg_0);
    dx = UNDEF;
    loc_2 = ax;
    if (ax >= 35) {
        t1 = far_cbb70(ax);
        dx = (int)(t1 >> 16);
        ax = (int)t1;
        *(char far *)MK_FP(dx, (int)t1 + 1) = (char)ax;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
