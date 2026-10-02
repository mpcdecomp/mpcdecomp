/* differs: 308 at +5, 95 bytes; 311 at +5, 95 bytes; 312 at +5, 95 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
extern char TBL_F01A[];

long far fn_c3408(int arg_0, int arg_2, long arg_4)
{
    char loc_1;
    int ax;
    int ax2;
    int bx;
    int dx;
    int es;
    long t1;

    bx = (int)arg_4;
    es = (int)(arg_4 >> 16);
    t1 = *(long *)((char *)&arg_0 + 0) / *(long far *)MK_FP(es, bx + 24);
    ax = (int)t1 / 8;
    dx = (int)t1 % 8;
    ax2 = ((char)((int)t1 / 8 >> 8) << 8 | (unsigned char)(1 << (char)dx));
    loc_1 = (char)ax2;
    TBL_F01A[ax] = (char)(TBL_F01A[ax] | (char)ax2);
    return ((long)dx << 16 | (unsigned)ax2);
}
