/* differs: 308 at +3, 48 bytes; 311 at +3, 48 bytes; 312 at +3, 48 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern long far far_e3478(long);
extern long far far_e37be(long);

void far far_e344a(long arg_0, int arg_2)
{
    int bx;
    int es;
    long t1;
    long t2;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    if ((*(int far *)MK_FP(es, bx + 2) | *(int far *)MK_FP(es, bx + 4)) != 0) {
        t1 = far_e3478(arg_0);
        t2 = far_e37be(arg_0);
    }
    return;
}
long far far_e3478(long p0) { return 0; }
long far far_e37be(long p0) { return 0; }
