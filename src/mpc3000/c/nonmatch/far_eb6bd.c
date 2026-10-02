/* differs: 308 at +3, 91 bytes; 311 at +3, 91 bytes; 312 at +3, 91 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern long far far_d975a(void);
extern long far far_eb63c(void);
long far far_eb63c(void) { return 0; }

long far far_eb6bd(long arg_4)
{
    int di;
    int es;
    long t1;
    long t2;

    t1 = far_eb63c();
    di = (int)arg_4;
    es = (int)(arg_4 >> 16);
    *(int far *)MK_FP(es, di + 6) = (int)t1;
    *(int far *)MK_FP(es, di + 8) = (int)(t1 >> 16);
    *(int far *)MK_FP(es, di) = 0;
    t2 = far_d975a();
    *(int far *)MK_FP(UNDEF, di + 4) = (int)(t2 >> 16);
    *(int far *)MK_FP(UNDEF, di + 2) = (int)t2;
    return t2;
}
