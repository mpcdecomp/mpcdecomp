/* differs: 308 at +3, 213 bytes; 311 absent; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
extern long far far_e8278(void);
extern long far far_e82dd(void far *, int, int, int);
extern int far far_fa6e5(int, int, int, int, int, int);
extern long far fn_bac31(int, int);
long far fn_bac31(int p0, int p1) { return 0; }

long far fn_baeca(long arg_0, int arg_2)
{
    int ax;
    int bx;
    int bx2;
    int dx;
    int es;
    int es2;
    long t1;
    long t2;
    long t3;

    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es, bx + 2) = SEG_DATA;
    *(int far *)MK_FP(es, bx) = 0x3906;
    *(int far *)MK_FP(es, bx + 6) = 0;
    *(int far *)MK_FP(es, bx + 4) = 0;
    t1 = far_e8278();
    if ((int)t1 < 0) {
        return t1;
    }
    t2 = far_e82dd(MK_FP(0xa853 /* SEG_A28F */, 0), 0x43d0, 0, 0);
    if ((int)t2 != 0) {
        return (long)MK_FP((int)(t2 >> 16), -3);
    }
    t3 = fn_bac31(*(int *)((char *)&arg_0 + 0), arg_2);
    dx = (int)(t3 >> 16);
    if ((int)t3 == 0) {
        return ((long)dx << 16 | (unsigned)0);
    }
    es2 = (int)(arg_0 >> 16);
    bx2 = (int)arg_0 + ((int)t3 << 2);
    *(int far *)MK_FP(es2, bx2 + 2) = 0;
    *(int far *)MK_FP(es2, bx2) = 0;
    if ((int)t3 > 1) {
        ax = far_fa6e5(*(int *)((char *)&arg_0 + 0), arg_2, (int)t3, 4, 1, -0x3b57);
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)(int)t3);
}
