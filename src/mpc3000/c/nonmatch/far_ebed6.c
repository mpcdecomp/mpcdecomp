/* differs: 308 absent; 311 at +5, 123 bytes; 312 at +5, 123 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern unsigned char B_75AC;

void far far_ebed6(long arg_0, int arg_4, int arg_6)
{
    int loc_4;
    int loc_2;
    int bx;
    int bx2;
    int es;
    int es2;
    long t1;
    long t2;

    loc_2 = 0;
    loc_4 = arg_4;
    __stos2(arg_0, 0, 16);
    t1 = *(long *)((char *)&loc_4 + 0) << B_75AC;
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es, bx + 2) = (int)(t1 >> 16);
    *(int far *)MK_FP(es, bx) = (int)t1;
    t2 = *(long far *)MK_FP(es, bx) / (unsigned long)(unsigned int)arg_6;
    bx2 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es2, bx2 + 2) = (int)(t2 >> 16);
    *(int far *)MK_FP(es2, bx2) = (int)t2;
    *(int far *)MK_FP(es2, bx2 + 4) = arg_4;
    *(int far *)MK_FP(es2, bx2 + 6) = arg_6;
    return;
}
