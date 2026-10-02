/* differs: 308 at +3, 235 bytes; 311 at +3, 235 bytes; 312 at +3, 235 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern int far far_cb566(int, int, long, long, int);
extern long far fn_c3408(int, int, long);
extern long far fn_c3485(int, int, long);
extern long far fn_c352d(long, long);
long far fn_c3408(int p0, int p1, long p2) { return 0; }
long far fn_c3485(int p0, int p1, long p2) { return 0; }
long far fn_c352d(long p0, long p1) { return 0; }

int far fn_c35f3(int arg_0, int arg_2, unsigned int arg_4, int arg_6, int arg_8, int arg_10, int arg_12, int arg_14, long arg_16, long arg_20, int arg_24, int arg_26)
{
    int ax;
    int bx;
    int bx2;
    int es;
    int es2;
    int flags;
    long t1;
    int t2;
    long t3;

    t1 = fn_c352d(*(long *)((char *)&arg_4 + 0), *(long *)((char *)&arg_24 + 0));
    bx = (int)arg_20;
    es = (int)(arg_20 >> 16);
    *(int far *)MK_FP(es, bx + 2) = (int)(t1 >> 16);
    *(int far *)MK_FP(es, bx) = (int)t1;
    ax = (int)t1 | (int)(t1 >> 16);
    if (ax != 0) {
        t2 = far_cb566(arg_12, arg_14, *(long *)((char *)&arg_4 + 0), *(long far *)MK_FP(es, bx), 1);
        t3 = fn_c3485(arg_4, arg_6, *(long *)((char *)&arg_24 + 0));
        bx2 = (int)arg_16;
        es2 = (int)(arg_16 >> 16);
        *(int far *)MK_FP(es2, bx2 + 2) = (int)(t3 >> 16);
        *(int far *)MK_FP(es2, bx2) = (int)t3;
        ax = (int)fn_c3408(arg_4, arg_6, *(long *)((char *)&arg_24 + 0));
    }
    flags = arg_6;
    if (!CC("<", flags) && (CC("!=", flags) || arg_4 >= 0)) {
        ax = far_cb566(arg_0, arg_2, *(long *)((char *)&arg_4 + 0), *(long *)((char *)&arg_8 + 0), 0);
    }
    return ax;
}
