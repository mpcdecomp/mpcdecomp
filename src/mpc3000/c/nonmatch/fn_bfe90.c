/* differs: 308 at +5, 81 bytes; 311 at +5, 81 bytes; 312 at +5, 81 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern long far far_b1073(int);
extern long far far_e15e2(int);
extern int far far_e4ee4(long, int);
extern int far far_ea926(int);
extern long far fn_bfee6(int);

long far fn_bfe90(int arg_0, int arg_2, int arg_4, int arg_6)
{
    int ax;
    int dx;
    int dx2;
    long t1;
    int t2;
    long t3;

    t1 = far_e15e2(arg_0);
    dx = (int)(t1 >> 16);
    if ((int)t1 == 0) {
        dx2 = (int)(fn_bfee6(arg_2) >> 16);
        if ((arg_4 | arg_6) != 0) {
            t2 = far_e4ee4(*(long *)((char *)&arg_4 + 0), arg_0);
        }
        t3 = far_b1073(1);
        ax = far_ea926(0);
        dx = UNDEF;
    }
    return ((long)dx << 16 | (unsigned)(int)t1);
}
long far fn_bfee6(int p0) { return 0; }
