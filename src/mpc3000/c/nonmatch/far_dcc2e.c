/* differs: 308 at +3, 85 bytes; 311 at +3, 85 bytes; 312 at +3, 84 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern unsigned char B_880A;
extern long far far_dad54(int);
extern long far far_dea12(int, long, int);

long far far_dcc2e(long arg_0, long arg_4, int arg_8)
{
    int ax;
    int di;
    int ds;
    int dx;
    long t1;
    long t2;

    ds = (int)(arg_0 >> 16);
    if (*(char far *)MK_FP(ds, (int)arg_0) == 0) {
        di = 1;
        if (*(char far *)MK_FP(ds, (unsigned)&B_880A) != 0) {
            di = 4;
        }
        t1 = far_dad54(di);
        t2 = far_dea12(di, arg_4, arg_8);
        ax = (int)t2;
        dx = (int)(t2 >> 16);
    }
    return ((long)dx << 16 | (unsigned)ax);
}
