/* differs: 308 absent; 311 at +3, 60 bytes; 312 at +3, 60 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern long far far_e07fa(long, long, int);
long far far_e07fa(long p0, long p1, int p2) { return 0; }

void far far_e09fe(long arg_0, int arg_2)
{
    int bx;
    int dx;
    int es;
    long t1;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    dx = *(int far *)MK_FP(es, bx + 8);
    *(int far *)MK_FP(es, bx + 6) = *(int far *)MK_FP(es, bx + 10);
    *(int far *)MK_FP(es, bx + 4) = dx;
    t1 = far_e07fa(((long)arg_2 << 16 | (unsigned)bx), (unsigned long)(unsigned int)*(int far *)MK_FP(es, bx + 16), 0);
    return;
}
