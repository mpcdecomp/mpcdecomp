/* differs: 308 at +3, 322 bytes; 311 at +3, 322 bytes; 312 at +3, 322 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
long far far_b2436(long arg_0, long arg_4, long arg_8)
{
    unsigned int ax;
    unsigned int ax2;
    int bx;
    int bx2;
    unsigned int bx3;
    unsigned int cx;
    unsigned int cx2;
    int di;
    unsigned int di2;
    int ds;
    int ds2;
    int dx;
    int dx2;
    int dx3;
    int es;
    long t1;
    long t2;
    long t3;
    long t4;

    bx = (int)arg_0;
    ds = (int)(arg_0 >> 16);
    dx = *(int far *)MK_FP(ds, bx + 2);
    di = (int)arg_8;
    ds2 = (int)(arg_8 >> 16);
    *(int far *)MK_FP(ds2, di) = *(int far *)MK_FP(ds, bx);
    *(int far *)MK_FP(ds2, di + 2) = dx;
    bx2 = (int)arg_4;
    es = (int)(arg_4 >> 16);
    dx2 = *(int far *)MK_FP(es, bx2 + 2);
    *(int far *)MK_FP(ds2, di + 4) = *(int far *)MK_FP(es, bx2);
    *(int far *)MK_FP(ds2, di + 6) = dx2;
    di2 = *(int far *)MK_FP(ds2, di + 4);
    t1 = (unsigned long)(unsigned int)*(int far *)MK_FP(ds2, di) * (unsigned long)(unsigned int)di2;
    *(int far *)MK_FP(ds2, di) = (int)t1;
    t2 = (unsigned long)(unsigned int)*(int far *)MK_FP(ds2, di) * (unsigned long)(unsigned int)*(int far *)MK_FP(ds2, di + 6);
    bx3 = (int)(t1 >> 16) + (int)t2;
    cx = (int)(t2 >> 16) + (bx3 < (unsigned int)(int)(t1 >> 16));
    t3 = (unsigned long)(unsigned int)*(int far *)MK_FP(ds2, di + 2) * (unsigned long)(unsigned int)di2;
    ax = (int)t3 + bx3;
    cx2 = cx + (int)(t3 >> 16) + (ax < (unsigned int)(int)t3);
    *(int far *)MK_FP(ds2, di + 2) = ax;
    t4 = (unsigned long)(unsigned int)*(int far *)MK_FP(ds2, di + 2) * (unsigned long)(unsigned int)*(int far *)MK_FP(ds2, di + 6);
    ax2 = (int)t4 + cx2;
    dx3 = (int)(t4 >> 16) + (cx2 < cx) + (ax2 < (unsigned int)(int)t4);
    *(int far *)MK_FP(ds2, di + 4) = ax2;
    *(int far *)MK_FP(ds2, di + 6) = dx3;
    return ((long)dx3 << 16 | (unsigned)ax2);
}
