/* differs: 308 at +3, 149 bytes; 311 at +3, 149 bytes; 312 at +3, 149 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern long near fn_d995d(void);
long near fn_d995d(void) { return 0; }

void far far_d99a2(long arg_0, long arg_4, unsigned int arg_8)
{
    int ax;
    int bx;
    int bx2;
    int di;
    int ds;
    int dx;
    int es;
    int p12;
    int p14;
    int si;
    long t1;
    long t2;

    bx = (int)arg_0;
    ds = (int)(arg_0 >> 16);
    p12 = *(int far *)MK_FP(ds, bx + 20);
    p14 = *(int far *)MK_FP(ds, bx + 18);
    si = (int)*(long far *)MK_FP(ds, bx + 18);
    t1 = fn_d995d();
    bx2 = UNDEF;
    ax = (int)t1;
    dx = (int)(t1 >> 16);
    di = (int)arg_4;
    es = (int)(arg_4 >> 16);
    do {
        *(int far *)MK_FP(ds, bx2 + 18) = si;
        *(int far *)MK_FP(ds, bx2 + 20) = dx;
        *(char far *)MK_FP(es, di) = (char)ax;
        di = di + 1;
        t2 = fn_d995d();
        bx2 = UNDEF;
        ax = (int)t2;
        dx = (int)(t2 >> 16);
        es = es;
    } while (((char)ax & -128) == 0 && (unsigned int)UNDEF < arg_8);
    *(int far *)MK_FP(ds, bx2 + 18) = p14;
    *(int far *)MK_FP(ds, bx2 + 20) = p12;
    return;
}
