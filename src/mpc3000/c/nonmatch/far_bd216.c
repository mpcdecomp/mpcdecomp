/* differs: 308 at +3, 65 bytes; 311 at +3, 65 bytes; 312 at +3, 65 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern long far far_fa70d(long, long);

long far far_bd216(long arg_0, long arg_4)
{
    int bx;
    int bx2;
    int es;
    int es2;

    bx = (int)arg_4;
    es = (int)(arg_4 >> 16);
    bx2 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    return far_fa70d(*(long far *)MK_FP(es2, bx2), *(long far *)MK_FP(es, bx));
}
